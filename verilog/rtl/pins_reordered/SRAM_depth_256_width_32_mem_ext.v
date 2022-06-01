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
  
  reg  [31:0] r0_data_temp;
  reg r_R0_en;

  reg  [31:0] r_R0_data;
  wire [31:0] w_R0_data;

  assign R0_data = r0_data_temp;

  always @(posedge R0_clk) begin
    r_R0_en <= R0_en;
    if (r_R0_en == 1'b1) r_R0_data <= w_R0_data;
  end

  always @(*) begin
    if (r_R0_en == 1'b0) r0_data_temp = r_R0_data;
    else r0_data_temp = w_R0_data;
  end

  sky130_sram_1kbyte_1rw1r_32x256_8 #(.VERBOSE(0)) sram (
    .clk0  (W0_clk),    // input  - clock
    .csb0  (!W0_en),    // input  - active low chip select
    .web0  (!W0_en),    // input  - active low write control
    .wmask0(4'b1111),   // input  - write mask
    .addr0 (W0_addr),   // input  - addr
    .din0  (W0_data),   // input  - data
    .dout0 (),          // output - data
    .clk1  (R0_clk),    // input  - clock
    .csb1  (!R0_en),    // input  - active low chip select
    .addr1 (R0_addr),   // input  - addr
    .dout1 (w_R0_data)  // output - data
  );
endmodule
// verilator lint_off BLKANDNBLK
