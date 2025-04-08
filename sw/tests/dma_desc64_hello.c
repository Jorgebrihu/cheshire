// Copyright 2023 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nicole Narr <narrn@student.ethz.ch>
// Christopher Reinwardt <creinwar@student.ethz.ch>
//
// Simple payload to test iDMA with desc64 frontend

#include "regs/cheshire.h"
#include "dif/clint.h"
#include "dif/uart.h"
#include "params.h"
#include "util.h"
#include "regs/idma_desc64.h"
#include "dif/idma_desc64.h"
#include "dif/artico3_reg.h"

#define DEBUG
#include "debug.h"

////////////////////////////////////////////////////////////////////////
////////////////       DEFINES ARTICO3     /////////////////////////////
////////////////////////////////////////////////////////////////////////

#define SHUFFLER_BASE         0x40000000  // control artico3 address

#define SHUFFLER_A3_ID_REG_LOW         (SHUFFLER_BASE + A3_ID_REG_LOW)
#define SHUFFLER_A3_ID_REG_HIGH        (SHUFFLER_BASE + A3_ID_REG_HIGH)
#define SHUFFLER_A3_TMR_REG_LOW        (SHUFFLER_BASE + A3_TMR_REG_LOW)
#define SHUFFLER_A3_TMR_REG_HIGH       (SHUFFLER_BASE + A3_TMR_REG_HIGH)
#define SHUFFLER_A3_DMR_REG_LOW        (SHUFFLER_BASE + A3_DMR_REG_LOW)
#define SHUFFLER_A3_DMR_REG_HIGH       (SHUFFLER_BASE + A3_DMR_REG_HIGH)
#define SHUFFLER_A3_BLOCK_SIZE_REG     (SHUFFLER_BASE + A3_BLOCK_SIZE_REG)

#define SHUFFLER_A3_CLOCK_GATE_REG     (SHUFFLER_BASE + A3_CLOCK_GATE_REG)
#define SHUFFLER_A3_NSLOTS_REG         (SHUFFLER_BASE + A3_NSLOTS_REG)
#define SHUFFLER_A3_READY_REG          (SHUFFLER_BASE + A3_READY_REG)
#define SHUFFLER_A3_PMC_CYCLES_REG     (SHUFFLER_BASE + A3_PMC_CYCLES_REG)
#define SHUFFLER_A3_PMC_ERRORS_REG     (SHUFFLER_BASE + A3_PMC_ERRORS_REG)

#define ARTICO3_DATA            0x50010000              // Beginning of data of ID 1
#define OUTPUT_SLOT_MATMUL      0x50018000


#define DMA_TRANSFER_MATMUL_SIZE 4096*2
////////////////////////////////////////////////////////////////////////
////////////////      OTHER  DEFINES      /////////////////////////////
////////////////////////////////////////////////////////////////////////

#define FLUSH_D_CACHE() ({__asm__ volatile("csrwi 0x7C1, 0x00"); \
                          __asm__ volatile("csrwi 0x7C1, 0x01");})
                          
#define DISABLE_CACHE() ({__asm__ volatile("csrwi 0x7C1, 0x00");})

struct descriptor descriptors[10] __attribute__((section(".descriptors")));
bool tx_done;


void setup_transfer(uint64_t src, uint64_t dst, uint32_t len, bool do_irq, bool decouple_rw,
                    struct descriptor *desc) {
    // make sure that bools are only one bit
    do_irq = do_irq ? 1 : 0;
    decouple_rw = decouple_rw ? 1 : 0;

    desc->length = len;
    desc->next = ~0;
    desc->src = src;
    desc->dst = dst;

    // flags: id: 0xff, cache: 0, deburst: 0, serialize: 1,
    // decouple_rw: 1bit, incr (src/dst): 0101, irq: 1bit
    desc->flags = 0xff << 16 | (1 << 6) | (decouple_rw << 5) | (0x5 << 1) | do_irq;
}

void submit_transfer(struct descriptor *desc) {
    tx_done = false;
    debugf("Just before fence\n");
    asm volatile("fence");
    struct descriptor *volatile *desc_reg = (struct descriptor**)DMA_BASE;
    debugf("Writing...\n");
    *desc_reg = desc;
    //*reg32((void *)DMA_BASE, 0x0) = (uint32_t)desc;
    debugf("After writing\n");
}

void wait_for_transfer(volatile struct descriptor *desc) {
    volatile bool *p_tx_done = &tx_done;
    asm volatile("fence");
    debugf("Pre wait for transfer\n");
    if (!*p_tx_done) {
        do {
            asm volatile("nop\n"
                    "nop\n"
                    "nop\n"
                    "nop\n");
            asm volatile("fence");
        } while (!*p_tx_done && desc->length != 0xFFFFFFFF);
    }
    // debugf("Post wait for transfer\n");
}
void setup_interrupts(void) {
    // set source 8 priority to 3
    ((volatile uint32_t *)0x0c000000)[8] = 3;
    // enable m-mode interrupt 8
    *(volatile uint32_t *)0x0c002000 |= (1 << 8);
    // set interrupt threshold to 0
    *(volatile uint32_t *)0x0c200000 = 0;
}

void trap_handler(uint64_t interrupt_cause) {
    debugf("Got interrupt %ld\n", interrupt_cause);
    uint32_t plic_interrupt = *(volatile uint32_t *)0x0c200004;
    if (plic_interrupt == 8) {
        debugf("Claiming interrupt\n");
        // claim interrupt
        *(volatile uint32_t *)0x0c200004 = 8;
        tx_done = true;
    } else {
        debugf("PLIC interrupt %d\n", plic_interrupt);
    }
}

int main(void) {
    // char str[] = "Hello DMA!\r\n";
    // uint32_t rtc_freq = *reg32(&__base_regs, CHESHIRE_RTC_FREQ_REG_OFFSET);
    // uint64_t reset_freq = clint_get_core_freq(rtc_freq, 2500);
    // uart_init(&__base_uart, reset_freq, __BOOT_BAUDRATE);
    // uart_write_str(&__base_uart, str, sizeof(str));
    // uart_write_flush(&__base_uart);

    /*
     * Relevant ARTICO3 registers
     */
    volatile uint32_t *shuffler_a3_id_reg_low = (volatile uint32_t *) SHUFFLER_A3_ID_REG_LOW;
    volatile uint32_t *shuffler_a3_id_reg_high = (volatile uint32_t *) SHUFFLER_A3_ID_REG_HIGH;
    volatile uint32_t *shuffler_a3_tmr_reg_low = (volatile uint32_t *) SHUFFLER_A3_TMR_REG_LOW;
    volatile uint32_t *shuffler_a3_tmr_reg_high = (volatile uint32_t *) SHUFFLER_A3_TMR_REG_HIGH;
    volatile uint32_t *shuffler_a3_dmr_reg_low = (volatile uint32_t *) SHUFFLER_A3_DMR_REG_LOW;
    volatile uint32_t *shuffler_a3_dmr_reg_high = (volatile uint32_t *) SHUFFLER_A3_DMR_REG_HIGH;
    volatile uint32_t *shuffler_a3_block_size_reg = (volatile uint32_t *) SHUFFLER_A3_BLOCK_SIZE_REG;

    volatile uint32_t *shuffler_a3_clock_gate_reg = (volatile uint32_t *) SHUFFLER_A3_CLOCK_GATE_REG;
    volatile uint32_t *shuffler_a3_nslots_reg = (volatile uint32_t *) SHUFFLER_A3_NSLOTS_REG;
    volatile uint32_t *shuffler_a3_ready_reg = (volatile uint32_t *) SHUFFLER_A3_READY_REG;

    volatile uint32_t *shuffler_a3_pmc_cycles_reg = (volatile uint32_t *) SHUFFLER_A3_PMC_CYCLES_REG;


    print_uart("\n\rHello DMA!");


    uint32_t src[DMA_TRANSFER_MATMUL_SIZE];
    uint32_t resultado[4096*2];
    // uint64_t dst[1000];

    for (size_t j = 0; j < 2; j++) {
        for (size_t i = 0; i < DMA_TRANSFER_MATMUL_SIZE / 2; i++) {
            src[j*(DMA_TRANSFER_MATMUL_SIZE / 2) + i] = ((j+1)%2)*2 +j; 
        }
    }

    // volatile uint32_t src[8];
    // src[0]  = 0x1111;
    // src[1]  = 0x2222;   
    // src[2]  = 0b0; 
    // src[3]  = 0b0; 
    // src[4]  = 0b0; 
    // src[5]  = 0b0; 
    // src[6]  = 4096*2; 
    // src[7]  = 0b1111; 

    print_uart("\n\rDireccion de src: "); print_uart_int((uint32_t)src);

    print_uart("\n\rSize of src: ");
    print_uart_int_64(sizeof(src));

    volatile uint32_t (*artico_reg) = (volatile uint32_t (*)) SHUFFLER_BASE; 
    volatile uint32_t (*artico_data) = (volatile uint32_t (*)) ARTICO3_DATA;
    volatile uint32_t (*matmul) = (volatile uint32_t (*)) OUTPUT_SLOT_MATMUL;

    *shuffler_a3_id_reg_low  = 0x0001;
    *shuffler_a3_block_size_reg  = 4096*2; 
    *shuffler_a3_clock_gate_reg  = 0b0001; 

    for (int i = 0; i<8; i++){
        print_uart("\n\rValue of artico_reg["); print_uart_int((uint32_t)*(artico_reg+i)); print_uart("]: ");
        print_uart_int_64(*(artico_reg+i));
    }

    print_uart("\n\r\n\r Start DMA transfer  \n\r\n\r");

    // print_uart("\n\rValue of src: ");
    // print_uart_int_64(src);

    // print_uart("\n\rValue of destination: ");
    // print_uart_int_64(dst);

    struct descriptor desc;
  
    // setup_transfer((uint64_t)&src, (uint64_t)&dst, (uint32_t)sizeof(src), 1, 1, &desc);
    // submit_transfer(&desc);
    // wait_for_transfer(&desc);

    setup_transfer((uint64_t)&src, (uint64_t)artico_data, (uint32_t)4096*2*4, 1, 1, &desc);
    submit_transfer(&desc);
    wait_for_transfer(&desc);

    do {
        print_uart("Ready register: ");
        print_uart_int(*shuffler_a3_ready_reg);
        print_uart("\r\n");
        
    } while (*shuffler_a3_ready_reg != 0x1);

    FLUSH_D_CACHE();

    // for (int i = 0; i<100; i++){
    //     print_uart("\n\rValue of artico_data["); print_uart_int((uint32_t)artico_data+i); print_uart("]: ");
    //     print_uart_int_64(*(artico_data+i));
    // }

    setup_transfer((uint64_t)matmul, (uint64_t)&resultado, (uint32_t)4096*2*4, 1, 1, &desc);
    submit_transfer(&desc);
    wait_for_transfer(&desc);

    // print_uart("\n\rAdd delay\r\n");
    // print_uart("\n\rAdd delay\r\n");
    // print_uart("\n\rAdd delay\r\n");
    // print_uart("\n\rAdd delay\r\n");

    // for (int i = 0; i<100; i++){
    //     print_uart("\n\rValue of matmul["); print_uart_int((uint32_t)matmul+i); print_uart("]: ");
    //     print_uart_int_64(*(matmul+i));
    // } 

    for (int i = 0; i<DMA_TRANSFER_MATMUL_SIZE/2; i++){
        //print_uart("\n\rValue of resultado["); print_uart_int((uint32_t)&resultado[i]); print_uart("]: ");
        print_uart_int(resultado[i]);print_uart("     ");
    } 

    print_uart("\n\rAll done, spin-loop.\r\n");
    while (1) {
        // do nothing
    }

    return 0;
}
