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

    // SRAM wires
    wire  [7:0] sram_R0_addr;
    wire        sram_R0_clk;
    wire        sram_R0_en;
    wire [31:0] sram_R0_data;
    wire  [7:0] sram_W0_addr;
    wire        sram_W0_en;
    wire        sram_W0_clk;
    wire [31:0] sram_W0_data;

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
user_proj_example mprj (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif

    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),

    // Logic Analyzer

    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads

    .io_in (io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),

    // IRQ
    .irq(user_irq),

    // SRAM
    .R0_addr(sram_R0_addr),    // [7:0]
    .R0_clk(sram_R0_clk),
    .R0_en(sram_R0_en),
    .R0_data(sram_R0_data),    // [31:0]
    .W0_addr(sram_W0_addr),    // [7:0]
    .W0_en(sram_W0_en),
    .W0_clk(sram_W0_clk),
    .W0_data(sram_W0_data)     // [31:0]
);

// verilator lint_off BLKANDNBLK
    reg  [31:0] r0_data_temp;
    reg r_R0_en;

    reg  [31:0] r_R0_data;
    wire [31:0] w_R0_data;

    assign sram_R0_data = r0_data_temp;
// SRAM
  always @(posedge sram_R0_clk) begin
    r_R0_en <= sram_R0_en;
    if (r_R0_en == 1'b1) r_R0_data <= w_R0_data;
  end

  always @(*) begin
    if (r_R0_en == 1'b0) r0_data_temp = r_R0_data;
    else r0_data_temp = w_R0_data;
  end

  sky130_sram_1kbyte_1rw1r_32x256_8 #(.VERBOSE(0)) sram (
    .clk0  (sram_W0_clk),    // input  - clock
    .csb0  (!sram_W0_en),    // input  - active low chip select
    .web0  (!sram_W0_en),    // input  - active low write control
    .wmask0(4'b1111),        // input  - write mask
    .addr0 (sram_W0_addr),   // input  - addr
    .din0  (sram_W0_data),   // input  - data
    .dout0 (),               // output - data
    .clk1  (sram_R0_clk),    // input  - clock
    .csb1  (!sram_R0_en),    // input  - active low chip select
    .addr1 (sram_R0_addr),   // input  - addr
    .dout1 (w_R0_data)       // output - data
  );
// verilator lint_on BLKANDNBLK

endmodule	// user_project_wrapper

`default_nettype wire
