// Copyright 2022 ETH Zurich and University of Bologna.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Alessandro Ottaviano <aottaviano@iis.ee.ethz.ch>
// Thomas Benz <tbenz@iis.ee.ethz.ch>

#pragma once

#include <stdint.h>
#include <stdbool.h>

// Base address of DMA the registers
#define DMA_BASE &__base_dma_desc64

struct descriptor {
    uint32_t length;
    uint32_t flags;
    uint64_t next;
    uint64_t src;
    uint64_t dst;
};

/// Flags for this request. Currently, the following are defined:
/// bit  0         set to trigger an irq on completion, unset to not be notified
/// bits 2:1       burst type for source, fixed: 00, incr: 01, wrap: 10
/// bits 4:3       burst type for destination, fixed: 00, incr: 01, wrap: 10
///                for a description of these modes, check AXI-Pulp documentation
/// bit  5         set to decouple reads and writes in the backend
/// bit  6         set to serialize requests. Not setting might violate AXI spec
/// bit  7         set to deburst (each burst is split into own transfer)
///                for a more thorough description, refer to the iDMA backend documentation
/// bits 11:8      Bitfield for AXI cache attributes for the source
/// bits 15:12     Bitfield for AXI cache attributes for the destination
///                bits of the bitfield (refer to AXI-Pulp for a description):
///                bit 0: cache bufferable
///                bit 1: cache modifiable
///                bit 2: cache read alloc
///                bit 3: cache write alloc
/// bits 23:16     AXI ID used for the transfer
/// bits 31:24     unused/reserved

extern struct descriptor descriptors[10];
extern bool tx_done;

void setup_transfer(uint64_t src, uint64_t dst, uint32_t len, bool do_irq, bool decouple_rw,
                    struct descriptor *desc);
void submit_transfer(struct descriptor *desc);
void wait_for_transfer(volatile struct descriptor *desc);

void setup_interrupts(void);

