// verilator lint_off BLKANDNBLK
module SRAM_depth_256_width_32_mem_ext(
  input  [7:0]  R0_addr,
  input         R0_clk,
  input         R0_en,
  output [31:0] R0_data,
  input  [7:0]  W0_addr,
  input         W0_en,
  input         W0_clk,
  input  [31:0] W0_data
);

  wire  [7:0] w_R0_addr;
  wire        w_R0_clk;
  wire        w_R0_en;
  wire [31:0] w_R0_data;
  wire  [7:0] w_W0_addr;
  wire        w_W0_en;
  wire        w_W0_clk;
  wire [31:0] w_W0_data;

  assign w_R0_addr = R0_addr;
  assign w_R0_clk  = R0_clk;
  assign w_R0_en   = R0_en;
  assign R0_data   = w_R0_data;
  assign w_W0_addr = W0_addr;
  assign w_W0_en   = W0_en;
  assign w_W0_clk  = W0_clk;
  assign w_W0_data = W0_data;

  sky130_sram_1kbyte_1rw1r_32x256_8 #(.VERBOSE(0)) sram (
    .clk0  (w_W0_clk),  // input  - clock
    .csb0  (!w_W0_en),  // input  - active low chip select
    .web0  (!w_W0_en),  // input  - active low write control
    .wmask0(4'b1111),   // input  - write mask
    .addr0 (w_W0_addr), // input  - addr
    .din0  (w_W0_data), // input  - data
    .dout0 (),          // output - data
    .clk1  (w_R0_clk),  // input  - clock
    .csb1  (!w_R0_en),  // input  - active low chip select
    .addr1 (w_R0_addr), // input  - addr
    .dout1 (w_R0_data)  // output - data
  );
endmodule
// verilator lint_off BLKANDNBLK
