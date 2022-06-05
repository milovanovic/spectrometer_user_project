/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

// REGISTERS
#define reg_fft_0  (*(volatile uint32_t*)0x30000000)
#define reg_mag_0  (*(volatile uint32_t*)0x30000100)
#define reg_cfar_0 (*(volatile uint32_t*)0x30000200)
#define reg_cfar_1 (*(volatile uint32_t*)0x30000204)
#define reg_cfar_2 (*(volatile uint32_t*)0x30000208)
#define reg_cfar_3 (*(volatile uint32_t*)0x3000020C)
#define reg_cfar_4 (*(volatile uint32_t*)0x30000210)
#define reg_cfar_5 (*(volatile uint32_t*)0x30000214)
#define reg_cfar_6 (*(volatile uint32_t*)0x30000218)
#define reg_cfar_7 (*(volatile uint32_t*)0x3000021C)
#define reg_cfar_8 (*(volatile uint32_t*)0x30000220)

void main()
{
    // Enable wishbone
    reg_wb_enable = 1;

    // Write to registers
    reg_mag_0 = 2; // set magnitude
    reg_cfar_0 = 512;
    reg_cfar_1 = 2867;
    reg_cfar_2 = 0;
    reg_cfar_3 = 0;
    reg_cfar_5 = 8;
    reg_cfar_4 = 64;
    reg_cfar_6 = 6;

    volatile int count = 0;
    while (count < 200) {
        count = count + 1;
    }

    // Configure IO pins for in and out AXI4-Stream
    reg_mprj_io_8  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_9  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_10 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_11 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_12 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_13 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_14 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_15 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_16 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_17 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_18 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_19 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_20 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_21 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_22 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_23 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_24 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_25 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_26 =  GPIO_MODE_USER_STD_INPUT_NOPULL;

    reg_mprj_io_27 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_28 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_29 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_30 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_31 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_32 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_33 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_34 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_35 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_36 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
    reg_mprj_io_37 =  GPIO_MODE_USER_STD_INPUT_NOPULL;

    /* Apply configuration */
    reg_mprj_xfer = 1;

    count = 0;
    while (count < 1000) {
        count = count + 1;
    }

    while (reg_mprj_xfer == 1);
}
