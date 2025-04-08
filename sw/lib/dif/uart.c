// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Nils Wistoff <nwistoff@iis.ee.ethz.ch>
// Paul Scheffler <paulsc@iis.ee.ethz.ch>

#include "dif/uart.h"
#include "util.h"
#include "params.h"

void uart_init(void *uart_base, uint64_t freq, uint64_t baud) {
    uint64_t divisor = freq / (baud << 4);
    uint8_t dlo = (uint8_t)(divisor);
    uint8_t dhi = (uint8_t)(divisor >> 8);
    *reg8(uart_base, UART_INTR_ENABLE_REG_OFFSET) = 0x00;   // Disable all interrupts
    *reg8(uart_base, UART_LINE_CONTROL_REG_OFFSET) = 0x80;  // Enable DLAB (set baud rate divisor)
    *reg8(uart_base, UART_DLAB_LSB_REG_OFFSET) = dlo;       // divisor (lo byte)
    *reg8(uart_base, UART_DLAB_MSB_REG_OFFSET) = dhi;       // divisor (hi byte)
    *reg8(uart_base, UART_LINE_CONTROL_REG_OFFSET) = 0x03;  // 8 bits, no parity, one stop bit
    *reg8(uart_base, UART_FIFO_CONTROL_REG_OFFSET) = 0xC7;  // Enable & clear FIFO, 14B threshold
    *reg8(uart_base, UART_MODEM_CONTROL_REG_OFFSET) = 0x20; // Autoflow mode
}

int uart_read_ready(void *uart_base) {
    return *reg8(uart_base, UART_LINE_STATUS_REG_OFFSET) & (1 << UART_LINE_STATUS_DATA_READY_BIT);
}

static inline int __uart_write_ready(void *uart_base) {
    return *reg8(uart_base, UART_LINE_STATUS_REG_OFFSET) & (1 << UART_LINE_STATUS_THR_EMPTY_BIT);
}

static inline int __uart_write_idle(void *uart_base) {
    return __uart_write_ready(uart_base) &&
           *reg8(uart_base, UART_LINE_STATUS_REG_OFFSET) & (1 << UART_LINE_STATUS_TMIT_EMPTY_BIT);
}

void uart_write(void *uart_base, uint8_t byte) {
    while (!__uart_write_ready(uart_base))
        ;
    *reg8(uart_base, UART_THR_REG_OFFSET) = byte;
}

void uart_write_str(void *uart_base, void *src, uint64_t len) {
    for (uint64_t i = 0; i < len; ++i) uart_write(uart_base, ((uint8_t *)src)[i]);
}

void uart_write_flush(void *uart_base) {
    // Ensure our read comes after any prior writes only
    // TODO: CVA6 likely violates inter-read-write ordering; double-check!
    fence();
    while (!__uart_write_idle(uart_base))
        ;
}

uint8_t uart_read(void *uart_base) {
    while (!uart_read_ready(uart_base))
        ;
    return *reg8(uart_base, UART_RBR_REG_OFFSET);
}

void uart_read_str(void *uart_base, void *dst, uint64_t len) {
    for (uint64_t i = 0; i < len; ++i) ((uint8_t *)dst)[i] = uart_read(uart_base);
}

// Default UART provides console
void _putchar(char byte) {
    uart_write(&__base_uart, byte);
}

char _getchar() {
    return uart_read(&__base_uart);
}

//Added by user

void uart_wait_for_keypress(void *uart_base) {
    while (!uart_read_ready(uart_base))
        ;  // Wait until a key is pressed
}

void print_uart(const char *str) {
    while (*str) {
        uart_write(&__base_uart, (uint8_t)*str);
        str++;
    }
}

void bin_to_hex(uint8_t value, uint8_t *hex) {
    const char hex_chars[] = "0123456789ABCDEF";
    hex[0] = hex_chars[(value >> 4) & 0xF];  // Extrae el nibble alto
    hex[1] = hex_chars[value & 0xF];         // Extrae el nibble bajo
}

void print_uart_int(uint32_t value) {
    for (int i = 3; i >= 0; i--) {
        uint8_t cur = (value >> (i * 8)) & 0xFF;
        uint8_t hex[2];
        bin_to_hex(cur, hex);
        uart_write(&__base_uart, hex[0]);
        uart_write(&__base_uart, hex[1]);
    }
}

void print_uart_int_64(uint64_t value) {
    for (int i = 7; i >= 0; i--) {
        uint8_t cur = (value >> (i * 8)) & 0xFF;
        uint8_t hex[2];
        bin_to_hex(cur, hex);
        uart_write(&__base_uart, hex[0]);
        uart_write(&__base_uart, hex[1]);
    }
}

void print_uart_addr(uint64_t addr) {
    for (int i = 7; i >= 0; i--) {
        uint8_t cur = (addr >> (i * 8)) & 0xFF;
        uint8_t hex[2];
        bin_to_hex(cur, hex);
        uart_write(&__base_uart, hex[0]);
        uart_write(&__base_uart, hex[1]);
    }
}