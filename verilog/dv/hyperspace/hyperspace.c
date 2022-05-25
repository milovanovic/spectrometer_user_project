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

/*
    IO Test:
        - Configures MPRJ lower 8-IO pins as outputs
        - Observes counter value through the MPRJ lower 8 IO pins (in the testbench)
*/

#define _AC(X,Y) (X##Y)

#define _REG32(p, i) (*(volatile uint32_t *) ((p) + (i)))

#define BEATBYTES 4

// Base addresses
#define FFT_BASE  _AC(0x30000000,UL)
#define MAG_BASE  _AC(0x30000100,UL)
#define CFAR_BASE _AC(0x30000200,UL)

// REGISTERS
#define FFT_REG(offset)  _REG32(FFT_BASE, offset)
#define MAG_REG(offset)  _REG32(MAG_BASE, offset)
#define CFAR_REG(offset) _REG32(CFAR_BASE, offset)

void main()
{
    // Enable wishbone
    reg_wb_enable = 1;

    // Write to registers
    MAG_REG (0x0 * BEATBYTES) = 2; // set magnitude
    CFAR_REG(0x0 * BEATBYTES) = 512;
    CFAR_REG(0x1 * BEATBYTES) = 2867;
    CFAR_REG(0x2 * BEATBYTES) = 0;
    CFAR_REG(0x3 * BEATBYTES) = 0;
    CFAR_REG(0x5 * BEATBYTES) = 8;
    CFAR_REG(0x4 * BEATBYTES) = 64;
    CFAR_REG(0x6 * BEATBYTES) = 6;

    reg_wb_enable = 1;

    // Configure IO pins for in and out AXI4-Stream
    reg_mprj_io_0  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_1  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_2  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_3  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_4  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_5  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_6  =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_7  =  GPIO_MODE_USER_STD_OUTPUT;
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
    reg_mprj_io_18 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;

    reg_mprj_io_27 =  GPIO_MODE_USER_STD_OUTPUT;
    reg_mprj_io_28 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_29 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_30 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_31 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_32 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_33 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_34 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_35 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_36 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;
    reg_mprj_io_37 =  GPIO_MODE_USER_STD_INPUT_PULLDOWN;


    /* Apply configuration */
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1);


}

