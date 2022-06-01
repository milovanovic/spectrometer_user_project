// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif
    
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    reg reg_wbs_ack_o;
    reg [23:0] addr_reg;
    reg [`MPRJ_IO_PADS-1:0] input_reg;
    reg [127:0] la_reg;

    reg [2:0] reg_user_irq;
    reg [2:0] reg_cnt;

    assign user_irq = reg_user_irq;
    always @(posedge user_clock2) begin
        reg_user_irq <= reg_cnt;
        reg_cnt <= reg_cnt + 1;
    end

    assign io_out = input_reg;
    assign la_data_out = la_reg;
    assign wbs_ack_o = reg_wbs_ack_o;
    assign io_oeb[37:32] = la_reg[5:0];

    always @(posedge wb_clk_i) begin
        if (wb_rst_i == 0) begin
            reg_wbs_ack_o <= 0;
            input_reg <= 0;
            la_reg <= 0;
            addr_reg <= 0;
        end
        else begin
            addr_reg <= wbs_adr_i[31:8];
            input_reg <= io_in;
            la_reg <= la_data_in;
        end
        if (addr_reg == 0 && la_oenb > 100) begin
            reg_wbs_ack_o <= 1;
        end
        else begin
            reg_wbs_ack_o <= 0;
        end
    end

    


/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

sky130_sram_1kbyte_1rw1r_32x256_8 #(.VERBOSE(0)) sram (
    .clk0  (wb_clk_i),  // input  - clock
    .csb0  (!wbs_we_i),  // input  - active low chip select
    .web0  (!wbs_cyc_i),  // input  - active low write control
    .wmask0(wbs_sel_i),   // input  - write mask
    .addr0 (wbs_adr_i[7:0]), // input  - addr
    .din0  (wbs_dat_i[BITS-1:0]), // input  - data
    .dout0 (io_oeb[31:0]),// output - data
    .clk1  (wb_clk_i),  // input  - clock
    .csb1  (!wbs_stb_i),  // input  - active low chip select
    .addr1 (wbs_adr_i[7:0]), // input  - addr
    .dout1 (wbs_dat_o)  // output - data
  );


endmodule	// user_project_wrapper

`default_nettype wire