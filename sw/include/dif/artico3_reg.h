// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
//Author: Andreas Kuster <kustera@ethz.ch>
//


#ifndef _A3_REG_DEFS_
#define _A3_REG_DEFS_

#ifdef __cplusplus
extern "C" {
#endif


#define A3_ID_REG_LOW     0x00000000                           // ID register low
#define A3_ID_REG_HIGH    0x00000004                           // ID register high
#define A3_TMR_REG_LOW    0x00000008                           // TMR register low
#define A3_TMR_REG_HIGH   0x0000000c                           // TMR register high
#define A3_DMR_REG_LOW    0x00000010                           // DMR register low
#define A3_DMR_REG_HIGH   0x00000014                           // DMR register high
#define A3_BLOCK_SIZE_REG 0x00000018                           // Block size register
#define A3_CLOCK_GATE_REG 0x0000001c                           // Clock gating register
#define A3_NSLOTS_REG     0x00000028                           // Firmware info : number of slots
#define A3_READY_REG      0x0000002c                           // Ready register
#define A3_PMC_CYCLES_REG 0x00000030                           // PMC (cycles
#define A3_PMC_ERRORS_REG A3_PMC_CYCLES_REG + shuffler.nslots      // PMC (errors


#ifdef __cplusplus
}  // extern "C"
#endif
#endif  // _DMA_FRONTEND_REG_DEFS_
