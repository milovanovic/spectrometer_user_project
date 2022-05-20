`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT

module AXI4StreamWidthAdapater_4_to_1(
  input         clock,
  input         reset,
  output        auto_in_ready,
  input         auto_in_valid,
  input  [7:0]  auto_in_bits_data,
  input         auto_in_bits_last,
  input         auto_out_ready,
  output        auto_out_valid,
  output [31:0] auto_out_bits_data,
  output        auto_out_bits_last
);
  reg [7:0] _T_1; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_0;
  reg [7:0] _T_3; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_1;
  reg [7:0] _T_5; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_2;
  reg [1:0] _T_6; // @[WidthAdapter.scala 103:22]
  reg [31:0] _RAND_3;
  wire  _T_7; // @[WidthAdapter.scala 104:14]
  wire  _T_8; // @[WidthAdapter.scala 104:38]
  wire [2:0] _T_9; // @[WidthAdapter.scala 104:60]
  wire [2:0] _T_10; // @[WidthAdapter.scala 104:33]
  wire [2:0] _GEN_0; // @[WidthAdapter.scala 104:21]
  wire  _T_12; // @[WidthAdapter.scala 107:29]
  wire  _T_13; // @[WidthAdapter.scala 107:22]
  wire  _T_15; // @[WidthAdapter.scala 107:29]
  wire  _T_16; // @[WidthAdapter.scala 107:22]
  wire  _T_18; // @[WidthAdapter.scala 107:29]
  wire  _T_19; // @[WidthAdapter.scala 107:22]
  wire [23:0] _T_21; // @[Cat.scala 29:58]
  wire  ov0; // @[WidthAdapter.scala 113:32]
  reg  _T_24; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_4;
  reg  _T_26; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_5;
  reg  _T_28; // @[WidthAdapter.scala 102:41]
  reg [31:0] _RAND_6;
  reg [1:0] _T_29; // @[WidthAdapter.scala 103:22]
  reg [31:0] _RAND_7;
  wire  _T_31; // @[WidthAdapter.scala 104:38]
  wire [2:0] _T_32; // @[WidthAdapter.scala 104:60]
  wire [2:0] _T_33; // @[WidthAdapter.scala 104:33]
  wire [2:0] _GEN_4; // @[WidthAdapter.scala 104:21]
  wire  _T_35; // @[WidthAdapter.scala 107:29]
  wire  _T_36; // @[WidthAdapter.scala 107:22]
  wire  _T_38; // @[WidthAdapter.scala 107:29]
  wire  _T_39; // @[WidthAdapter.scala 107:22]
  wire  _T_41; // @[WidthAdapter.scala 107:29]
  wire  _T_42; // @[WidthAdapter.scala 107:22]
  wire [3:0] _T_45; // @[Cat.scala 29:58]
  wire  ov1; // @[WidthAdapter.scala 113:32]
  reg [1:0] _T_53; // @[WidthAdapter.scala 103:22]
  reg [31:0] _RAND_8;
  wire  _T_55; // @[WidthAdapter.scala 104:38]
  wire [2:0] _T_56; // @[WidthAdapter.scala 104:60]
  wire [2:0] _T_57; // @[WidthAdapter.scala 104:33]
  wire [2:0] _GEN_8; // @[WidthAdapter.scala 104:21]
  wire  ov2; // @[WidthAdapter.scala 113:32]
  reg [1:0] _T_76; // @[WidthAdapter.scala 103:22]
  reg [31:0] _RAND_9;
  wire  _T_78; // @[WidthAdapter.scala 104:38]
  wire [2:0] _T_79; // @[WidthAdapter.scala 104:60]
  wire [2:0] _T_80; // @[WidthAdapter.scala 104:33]
  wire [2:0] _GEN_12; // @[WidthAdapter.scala 104:21]
  wire  ov3; // @[WidthAdapter.scala 113:32]
  reg [1:0] _T_99; // @[WidthAdapter.scala 103:22]
  reg [31:0] _RAND_10;
  wire  _T_101; // @[WidthAdapter.scala 104:38]
  wire [2:0] _T_102; // @[WidthAdapter.scala 104:60]
  wire [2:0] _T_103; // @[WidthAdapter.scala 104:33]
  wire [2:0] _GEN_16; // @[WidthAdapter.scala 104:21]
  wire  ov4; // @[WidthAdapter.scala 113:32]
  wire  _T_116; // @[WidthAdapter.scala 43:16]
  wire  _T_118; // @[WidthAdapter.scala 43:11]
  wire  _T_119; // @[WidthAdapter.scala 43:11]
  wire  _T_120; // @[WidthAdapter.scala 44:16]
  wire  _T_122; // @[WidthAdapter.scala 44:11]
  wire  _T_123; // @[WidthAdapter.scala 44:11]
  wire  _T_124; // @[WidthAdapter.scala 45:16]
  wire  _T_126; // @[WidthAdapter.scala 45:11]
  wire  _T_127; // @[WidthAdapter.scala 45:11]
  wire  _T_128; // @[WidthAdapter.scala 46:16]
  wire  _T_130; // @[WidthAdapter.scala 46:11]
  wire  _T_131; // @[WidthAdapter.scala 46:11]
  assign _T_7 = auto_in_valid & auto_out_ready; // @[WidthAdapter.scala 104:14]
  assign _T_8 = _T_6 == 2'h3; // @[WidthAdapter.scala 104:38]
  assign _T_9 = _T_6 + 2'h1; // @[WidthAdapter.scala 104:60]
  assign _T_10 = _T_8 ? 3'h0 : _T_9; // @[WidthAdapter.scala 104:33]
  assign _GEN_0 = _T_7 ? _T_10 : {{1'd0}, _T_6}; // @[WidthAdapter.scala 104:21]
  assign _T_12 = _T_6 == 2'h0; // @[WidthAdapter.scala 107:29]
  assign _T_13 = _T_7 & _T_12; // @[WidthAdapter.scala 107:22]
  assign _T_15 = _T_6 == 2'h1; // @[WidthAdapter.scala 107:29]
  assign _T_16 = _T_7 & _T_15; // @[WidthAdapter.scala 107:22]
  assign _T_18 = _T_6 == 2'h2; // @[WidthAdapter.scala 107:29]
  assign _T_19 = _T_7 & _T_18; // @[WidthAdapter.scala 107:22]
  assign _T_21 = {auto_in_bits_data,_T_5,_T_3}; // @[Cat.scala 29:58]
  assign ov0 = _T_8 & auto_in_valid; // @[WidthAdapter.scala 113:32]
  assign _T_31 = _T_29 == 2'h3; // @[WidthAdapter.scala 104:38]
  assign _T_32 = _T_29 + 2'h1; // @[WidthAdapter.scala 104:60]
  assign _T_33 = _T_31 ? 3'h0 : _T_32; // @[WidthAdapter.scala 104:33]
  assign _GEN_4 = _T_7 ? _T_33 : {{1'd0}, _T_29}; // @[WidthAdapter.scala 104:21]
  assign _T_35 = _T_29 == 2'h0; // @[WidthAdapter.scala 107:29]
  assign _T_36 = _T_7 & _T_35; // @[WidthAdapter.scala 107:22]
  assign _T_38 = _T_29 == 2'h1; // @[WidthAdapter.scala 107:29]
  assign _T_39 = _T_7 & _T_38; // @[WidthAdapter.scala 107:22]
  assign _T_41 = _T_29 == 2'h2; // @[WidthAdapter.scala 107:29]
  assign _T_42 = _T_7 & _T_41; // @[WidthAdapter.scala 107:22]
  assign _T_45 = {auto_in_bits_last,_T_28,_T_26,_T_24}; // @[Cat.scala 29:58]
  assign ov1 = _T_31 & auto_in_valid; // @[WidthAdapter.scala 113:32]
  assign _T_55 = _T_53 == 2'h3; // @[WidthAdapter.scala 104:38]
  assign _T_56 = _T_53 + 2'h1; // @[WidthAdapter.scala 104:60]
  assign _T_57 = _T_55 ? 3'h0 : _T_56; // @[WidthAdapter.scala 104:33]
  assign _GEN_8 = _T_7 ? _T_57 : {{1'd0}, _T_53}; // @[WidthAdapter.scala 104:21]
  assign ov2 = _T_55 & auto_in_valid; // @[WidthAdapter.scala 113:32]
  assign _T_78 = _T_76 == 2'h3; // @[WidthAdapter.scala 104:38]
  assign _T_79 = _T_76 + 2'h1; // @[WidthAdapter.scala 104:60]
  assign _T_80 = _T_78 ? 3'h0 : _T_79; // @[WidthAdapter.scala 104:33]
  assign _GEN_12 = _T_7 ? _T_80 : {{1'd0}, _T_76}; // @[WidthAdapter.scala 104:21]
  assign ov3 = _T_78 & auto_in_valid; // @[WidthAdapter.scala 113:32]
  assign _T_101 = _T_99 == 2'h3; // @[WidthAdapter.scala 104:38]
  assign _T_102 = _T_99 + 2'h1; // @[WidthAdapter.scala 104:60]
  assign _T_103 = _T_101 ? 3'h0 : _T_102; // @[WidthAdapter.scala 104:33]
  assign _GEN_16 = _T_7 ? _T_103 : {{1'd0}, _T_99}; // @[WidthAdapter.scala 104:21]
  assign ov4 = _T_101 & auto_in_valid; // @[WidthAdapter.scala 113:32]
  assign _T_116 = ov0 == ov1; // @[WidthAdapter.scala 43:16]
  assign _T_118 = _T_116 | reset; // @[WidthAdapter.scala 43:11]
  assign _T_119 = ~_T_118; // @[WidthAdapter.scala 43:11]
  assign _T_120 = ov0 == ov2; // @[WidthAdapter.scala 44:16]
  assign _T_122 = _T_120 | reset; // @[WidthAdapter.scala 44:11]
  assign _T_123 = ~_T_122; // @[WidthAdapter.scala 44:11]
  assign _T_124 = ov0 == ov3; // @[WidthAdapter.scala 45:16]
  assign _T_126 = _T_124 | reset; // @[WidthAdapter.scala 45:11]
  assign _T_127 = ~_T_126; // @[WidthAdapter.scala 45:11]
  assign _T_128 = ov0 == ov4; // @[WidthAdapter.scala 46:16]
  assign _T_130 = _T_128 | reset; // @[WidthAdapter.scala 46:11]
  assign _T_131 = ~_T_130; // @[WidthAdapter.scala 46:11]
  assign auto_in_ready = auto_out_ready; // @[LazyModule.scala 173:31]
  assign auto_out_valid = _T_8 & auto_in_valid; // @[LazyModule.scala 173:49]
  assign auto_out_bits_data = {_T_21,_T_1}; // @[LazyModule.scala 173:49]
  assign auto_out_bits_last = _T_45 != 4'h0; // @[LazyModule.scala 173:49]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_1 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_3 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_5 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_6 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_26 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_28 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_29 = _RAND_7[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_53 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_76 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_99 = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      _T_1 <= 8'h0;
    end else if (_T_13) begin
      _T_1 <= auto_in_bits_data;
    end
    if (reset) begin
      _T_3 <= 8'h0;
    end else if (_T_16) begin
      _T_3 <= auto_in_bits_data;
    end
    if (reset) begin
      _T_5 <= 8'h0;
    end else if (_T_19) begin
      _T_5 <= auto_in_bits_data;
    end
    if (reset) begin
      _T_6 <= 2'h0;
    end else begin
      _T_6 <= _GEN_0[1:0];
    end
    if (reset) begin
      _T_24 <= 1'h0;
    end else if (_T_36) begin
      _T_24 <= auto_in_bits_last;
    end
    if (reset) begin
      _T_26 <= 1'h0;
    end else if (_T_39) begin
      _T_26 <= auto_in_bits_last;
    end
    if (reset) begin
      _T_28 <= 1'h0;
    end else if (_T_42) begin
      _T_28 <= auto_in_bits_last;
    end
    if (reset) begin
      _T_29 <= 2'h0;
    end else begin
      _T_29 <= _GEN_4[1:0];
    end
    if (reset) begin
      _T_53 <= 2'h0;
    end else begin
      _T_53 <= _GEN_8[1:0];
    end
    if (reset) begin
      _T_76 <= 2'h0;
    end else begin
      _T_76 <= _GEN_12[1:0];
    end
    if (reset) begin
      _T_99 <= 2'h0;
    end else begin
      _T_99 <= _GEN_16[1:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_119) begin
          $fwrite(32'h80000002,"Assertion failed\n    at WidthAdapter.scala:43 assert(ov0 === ov1)\n"); // @[WidthAdapter.scala 43:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_119) begin
          $fatal; // @[WidthAdapter.scala 43:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_123) begin
          $fwrite(32'h80000002,"Assertion failed\n    at WidthAdapter.scala:44 assert(ov0 === ov2)\n"); // @[WidthAdapter.scala 44:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_123) begin
          $fatal; // @[WidthAdapter.scala 44:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_127) begin
          $fwrite(32'h80000002,"Assertion failed\n    at WidthAdapter.scala:45 assert(ov0 === ov3)\n"); // @[WidthAdapter.scala 45:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_127) begin
          $fatal; // @[WidthAdapter.scala 45:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_131) begin
          $fwrite(32'h80000002,"Assertion failed\n    at WidthAdapter.scala:46 assert(ov0 === ov4)\n"); // @[WidthAdapter.scala 46:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_131) begin
          $fatal; // @[WidthAdapter.scala 46:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module SDFStageRadix22(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_47; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_49; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_52; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_54; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_56; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_59; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_30; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_32; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_35; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_37; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_39; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_42; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h1; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_47 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_49 = _T_47[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_52 = $signed(_T_49) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_52[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_54 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_56 = _T_54[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_59 = $signed(_T_56) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_59[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_30 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_32 = _T_30[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_35 = $signed(_T_32) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_35[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_37 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_39 = _T_37[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_42 = $signed(_T_39) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_42[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      if (load_input) begin
        feedback_real <= io_in_real;
      end else begin
        feedback_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        feedback_imag <= io_in_imag;
      end else begin
        feedback_imag <= butterfly_outputs_1_imag;
      end
    end
  end
endmodule
module SDFStageRadix22_1(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_50; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_52; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_55; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_57; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_59; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_62; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_33; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_35; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_38; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_40; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_42; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_45; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h2; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_50 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_52 = _T_50[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_55 = $signed(_T_52) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_55[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_57 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_59 = _T_57[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_62 = $signed(_T_59) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_62[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_33 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_35 = _T_33[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_38 = $signed(_T_35) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_38[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_40 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_42 = _T_40[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_45 = $signed(_T_42) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_45[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_21_real;
    end
    if (io_en) begin
      feedback_imag <= _T_21_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
  end
endmodule
module SDFStageRadix22_2(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_56; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_58; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_61; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_63; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_65; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_68; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_39; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_41; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_44; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_46; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_48; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_51; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h4; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_56 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_58 = _T_56[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_61 = $signed(_T_58) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_61[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_63 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_65 = _T_63[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_68 = $signed(_T_65) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_68[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_39 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_41 = _T_39[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_44 = $signed(_T_41) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_44[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_46 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_48 = _T_46[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_51 = $signed(_T_48) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_51[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_27_real;
    end
    if (io_en) begin
      feedback_imag <= _T_27_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
  end
endmodule
module SDFStageRadix22_3(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_68; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_70; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_73; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_75; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_77; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_80; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [15:0] _T_30_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [15:0] _T_30_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg [15:0] _T_33_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_10;
  reg [15:0] _T_33_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_11;
  reg [15:0] _T_36_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_12;
  reg [15:0] _T_36_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg [15:0] _T_39_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [15:0] _T_39_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_15;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_51; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_53; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_56; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_58; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_60; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_63; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h8; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_68 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_70 = _T_68[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_73 = $signed(_T_70) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_73[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_75 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_77 = _T_75[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_80 = $signed(_T_77) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_80[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_51 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_53 = _T_51[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_56 = $signed(_T_53) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_56[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_58 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_60 = _T_58[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_63 = $signed(_T_60) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_63[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_30_real = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_30_imag = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_33_real = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_33_imag = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_36_real = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_36_imag = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_39_real = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_39_imag = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_39_real;
    end
    if (io_en) begin
      feedback_imag <= _T_39_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
    if (io_en) begin
      _T_30_real <= _T_27_real;
    end
    if (io_en) begin
      _T_30_imag <= _T_27_imag;
    end
    if (io_en) begin
      _T_33_real <= _T_30_real;
    end
    if (io_en) begin
      _T_33_imag <= _T_30_imag;
    end
    if (io_en) begin
      _T_36_real <= _T_33_real;
    end
    if (io_en) begin
      _T_36_imag <= _T_33_imag;
    end
    if (io_en) begin
      _T_39_real <= _T_36_real;
    end
    if (io_en) begin
      _T_39_imag <= _T_36_imag;
    end
  end
endmodule
module SDFStageRadix22_4(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_92; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_94; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_97; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_99; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_101; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_104; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [15:0] _T_30_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [15:0] _T_30_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg [15:0] _T_33_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_10;
  reg [15:0] _T_33_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_11;
  reg [15:0] _T_36_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_12;
  reg [15:0] _T_36_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg [15:0] _T_39_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [15:0] _T_39_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_15;
  reg [15:0] _T_42_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_16;
  reg [15:0] _T_42_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_17;
  reg [15:0] _T_45_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_18;
  reg [15:0] _T_45_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_19;
  reg [15:0] _T_48_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_20;
  reg [15:0] _T_48_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_21;
  reg [15:0] _T_51_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_22;
  reg [15:0] _T_51_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_23;
  reg [15:0] _T_54_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_24;
  reg [15:0] _T_54_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_25;
  reg [15:0] _T_57_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_26;
  reg [15:0] _T_57_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_27;
  reg [15:0] _T_60_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_28;
  reg [15:0] _T_60_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_29;
  reg [15:0] _T_63_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_30;
  reg [15:0] _T_63_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_31;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_75; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_77; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_80; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_82; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_84; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_87; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h10; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_92 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_94 = _T_92[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_97 = $signed(_T_94) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_97[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_99 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_101 = _T_99[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_104 = $signed(_T_101) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_104[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_75 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_77 = _T_75[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_80 = $signed(_T_77) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_80[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_82 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_84 = _T_82[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_87 = $signed(_T_84) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_87[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_30_real = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_30_imag = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_33_real = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_33_imag = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_36_real = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_36_imag = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_39_real = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_39_imag = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_42_real = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_42_imag = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_45_real = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_45_imag = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_48_real = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_48_imag = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_51_real = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_51_imag = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_54_real = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_54_imag = _RAND_25[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_57_real = _RAND_26[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_57_imag = _RAND_27[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_60_real = _RAND_28[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_60_imag = _RAND_29[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_63_real = _RAND_30[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_63_imag = _RAND_31[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_63_real;
    end
    if (io_en) begin
      feedback_imag <= _T_63_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
    if (io_en) begin
      _T_30_real <= _T_27_real;
    end
    if (io_en) begin
      _T_30_imag <= _T_27_imag;
    end
    if (io_en) begin
      _T_33_real <= _T_30_real;
    end
    if (io_en) begin
      _T_33_imag <= _T_30_imag;
    end
    if (io_en) begin
      _T_36_real <= _T_33_real;
    end
    if (io_en) begin
      _T_36_imag <= _T_33_imag;
    end
    if (io_en) begin
      _T_39_real <= _T_36_real;
    end
    if (io_en) begin
      _T_39_imag <= _T_36_imag;
    end
    if (io_en) begin
      _T_42_real <= _T_39_real;
    end
    if (io_en) begin
      _T_42_imag <= _T_39_imag;
    end
    if (io_en) begin
      _T_45_real <= _T_42_real;
    end
    if (io_en) begin
      _T_45_imag <= _T_42_imag;
    end
    if (io_en) begin
      _T_48_real <= _T_45_real;
    end
    if (io_en) begin
      _T_48_imag <= _T_45_imag;
    end
    if (io_en) begin
      _T_51_real <= _T_48_real;
    end
    if (io_en) begin
      _T_51_imag <= _T_48_imag;
    end
    if (io_en) begin
      _T_54_real <= _T_51_real;
    end
    if (io_en) begin
      _T_54_imag <= _T_51_imag;
    end
    if (io_en) begin
      _T_57_real <= _T_54_real;
    end
    if (io_en) begin
      _T_57_imag <= _T_54_imag;
    end
    if (io_en) begin
      _T_60_real <= _T_57_real;
    end
    if (io_en) begin
      _T_60_imag <= _T_57_imag;
    end
    if (io_en) begin
      _T_63_real <= _T_60_real;
    end
    if (io_en) begin
      _T_63_imag <= _T_60_imag;
    end
  end
endmodule
module SDFStageRadix22_5(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_140; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_142; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_145; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_147; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_149; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_152; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [15:0] _T_30_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [15:0] _T_30_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg [15:0] _T_33_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_10;
  reg [15:0] _T_33_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_11;
  reg [15:0] _T_36_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_12;
  reg [15:0] _T_36_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg [15:0] _T_39_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [15:0] _T_39_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_15;
  reg [15:0] _T_42_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_16;
  reg [15:0] _T_42_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_17;
  reg [15:0] _T_45_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_18;
  reg [15:0] _T_45_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_19;
  reg [15:0] _T_48_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_20;
  reg [15:0] _T_48_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_21;
  reg [15:0] _T_51_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_22;
  reg [15:0] _T_51_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_23;
  reg [15:0] _T_54_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_24;
  reg [15:0] _T_54_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_25;
  reg [15:0] _T_57_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_26;
  reg [15:0] _T_57_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_27;
  reg [15:0] _T_60_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_28;
  reg [15:0] _T_60_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_29;
  reg [15:0] _T_63_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_30;
  reg [15:0] _T_63_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_31;
  reg [15:0] _T_66_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_32;
  reg [15:0] _T_66_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_33;
  reg [15:0] _T_69_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_34;
  reg [15:0] _T_69_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_35;
  reg [15:0] _T_72_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_36;
  reg [15:0] _T_72_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_37;
  reg [15:0] _T_75_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_38;
  reg [15:0] _T_75_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_39;
  reg [15:0] _T_78_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_40;
  reg [15:0] _T_78_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_41;
  reg [15:0] _T_81_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_42;
  reg [15:0] _T_81_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_43;
  reg [15:0] _T_84_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_44;
  reg [15:0] _T_84_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_45;
  reg [15:0] _T_87_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_46;
  reg [15:0] _T_87_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_47;
  reg [15:0] _T_90_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_48;
  reg [15:0] _T_90_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_49;
  reg [15:0] _T_93_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_50;
  reg [15:0] _T_93_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_51;
  reg [15:0] _T_96_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_52;
  reg [15:0] _T_96_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_53;
  reg [15:0] _T_99_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_54;
  reg [15:0] _T_99_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_55;
  reg [15:0] _T_102_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_56;
  reg [15:0] _T_102_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_57;
  reg [15:0] _T_105_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_58;
  reg [15:0] _T_105_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_59;
  reg [15:0] _T_108_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_60;
  reg [15:0] _T_108_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_61;
  reg [15:0] _T_111_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_62;
  reg [15:0] _T_111_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_63;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_123; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_125; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_128; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_130; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_132; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_135; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h20; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_140 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_142 = _T_140[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_145 = $signed(_T_142) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_145[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_147 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_149 = _T_147[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_152 = $signed(_T_149) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_152[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_123 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_125 = _T_123[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_128 = $signed(_T_125) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_128[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_130 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_132 = _T_130[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_135 = $signed(_T_132) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_135[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_30_real = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_30_imag = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_33_real = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_33_imag = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_36_real = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_36_imag = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_39_real = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_39_imag = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_42_real = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_42_imag = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_45_real = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_45_imag = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_48_real = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_48_imag = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_51_real = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_51_imag = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_54_real = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_54_imag = _RAND_25[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_57_real = _RAND_26[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_57_imag = _RAND_27[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_60_real = _RAND_28[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_60_imag = _RAND_29[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_63_real = _RAND_30[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_63_imag = _RAND_31[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_66_real = _RAND_32[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_66_imag = _RAND_33[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_69_real = _RAND_34[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_69_imag = _RAND_35[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_72_real = _RAND_36[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_72_imag = _RAND_37[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_75_real = _RAND_38[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_75_imag = _RAND_39[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_78_real = _RAND_40[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_78_imag = _RAND_41[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_81_real = _RAND_42[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_81_imag = _RAND_43[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_84_real = _RAND_44[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_84_imag = _RAND_45[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_87_real = _RAND_46[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_87_imag = _RAND_47[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_90_real = _RAND_48[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_90_imag = _RAND_49[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_93_real = _RAND_50[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_93_imag = _RAND_51[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_96_real = _RAND_52[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_96_imag = _RAND_53[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_99_real = _RAND_54[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_99_imag = _RAND_55[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_102_real = _RAND_56[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_102_imag = _RAND_57[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  _T_105_real = _RAND_58[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  _T_105_imag = _RAND_59[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  _T_108_real = _RAND_60[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  _T_108_imag = _RAND_61[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  _T_111_real = _RAND_62[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_111_imag = _RAND_63[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_111_real;
    end
    if (io_en) begin
      feedback_imag <= _T_111_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
    if (io_en) begin
      _T_30_real <= _T_27_real;
    end
    if (io_en) begin
      _T_30_imag <= _T_27_imag;
    end
    if (io_en) begin
      _T_33_real <= _T_30_real;
    end
    if (io_en) begin
      _T_33_imag <= _T_30_imag;
    end
    if (io_en) begin
      _T_36_real <= _T_33_real;
    end
    if (io_en) begin
      _T_36_imag <= _T_33_imag;
    end
    if (io_en) begin
      _T_39_real <= _T_36_real;
    end
    if (io_en) begin
      _T_39_imag <= _T_36_imag;
    end
    if (io_en) begin
      _T_42_real <= _T_39_real;
    end
    if (io_en) begin
      _T_42_imag <= _T_39_imag;
    end
    if (io_en) begin
      _T_45_real <= _T_42_real;
    end
    if (io_en) begin
      _T_45_imag <= _T_42_imag;
    end
    if (io_en) begin
      _T_48_real <= _T_45_real;
    end
    if (io_en) begin
      _T_48_imag <= _T_45_imag;
    end
    if (io_en) begin
      _T_51_real <= _T_48_real;
    end
    if (io_en) begin
      _T_51_imag <= _T_48_imag;
    end
    if (io_en) begin
      _T_54_real <= _T_51_real;
    end
    if (io_en) begin
      _T_54_imag <= _T_51_imag;
    end
    if (io_en) begin
      _T_57_real <= _T_54_real;
    end
    if (io_en) begin
      _T_57_imag <= _T_54_imag;
    end
    if (io_en) begin
      _T_60_real <= _T_57_real;
    end
    if (io_en) begin
      _T_60_imag <= _T_57_imag;
    end
    if (io_en) begin
      _T_63_real <= _T_60_real;
    end
    if (io_en) begin
      _T_63_imag <= _T_60_imag;
    end
    if (io_en) begin
      _T_66_real <= _T_63_real;
    end
    if (io_en) begin
      _T_66_imag <= _T_63_imag;
    end
    if (io_en) begin
      _T_69_real <= _T_66_real;
    end
    if (io_en) begin
      _T_69_imag <= _T_66_imag;
    end
    if (io_en) begin
      _T_72_real <= _T_69_real;
    end
    if (io_en) begin
      _T_72_imag <= _T_69_imag;
    end
    if (io_en) begin
      _T_75_real <= _T_72_real;
    end
    if (io_en) begin
      _T_75_imag <= _T_72_imag;
    end
    if (io_en) begin
      _T_78_real <= _T_75_real;
    end
    if (io_en) begin
      _T_78_imag <= _T_75_imag;
    end
    if (io_en) begin
      _T_81_real <= _T_78_real;
    end
    if (io_en) begin
      _T_81_imag <= _T_78_imag;
    end
    if (io_en) begin
      _T_84_real <= _T_81_real;
    end
    if (io_en) begin
      _T_84_imag <= _T_81_imag;
    end
    if (io_en) begin
      _T_87_real <= _T_84_real;
    end
    if (io_en) begin
      _T_87_imag <= _T_84_imag;
    end
    if (io_en) begin
      _T_90_real <= _T_87_real;
    end
    if (io_en) begin
      _T_90_imag <= _T_87_imag;
    end
    if (io_en) begin
      _T_93_real <= _T_90_real;
    end
    if (io_en) begin
      _T_93_imag <= _T_90_imag;
    end
    if (io_en) begin
      _T_96_real <= _T_93_real;
    end
    if (io_en) begin
      _T_96_imag <= _T_93_imag;
    end
    if (io_en) begin
      _T_99_real <= _T_96_real;
    end
    if (io_en) begin
      _T_99_imag <= _T_96_imag;
    end
    if (io_en) begin
      _T_102_real <= _T_99_real;
    end
    if (io_en) begin
      _T_102_imag <= _T_99_imag;
    end
    if (io_en) begin
      _T_105_real <= _T_102_real;
    end
    if (io_en) begin
      _T_105_imag <= _T_102_imag;
    end
    if (io_en) begin
      _T_108_real <= _T_105_real;
    end
    if (io_en) begin
      _T_108_imag <= _T_105_imag;
    end
    if (io_en) begin
      _T_111_real <= _T_108_real;
    end
    if (io_en) begin
      _T_111_imag <= _T_108_imag;
    end
  end
endmodule
module SDFStageRadix22_6(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_236; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_238; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_241; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_243; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_245; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_248; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [15:0] _T_30_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [15:0] _T_30_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg [15:0] _T_33_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_10;
  reg [15:0] _T_33_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_11;
  reg [15:0] _T_36_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_12;
  reg [15:0] _T_36_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg [15:0] _T_39_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [15:0] _T_39_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_15;
  reg [15:0] _T_42_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_16;
  reg [15:0] _T_42_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_17;
  reg [15:0] _T_45_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_18;
  reg [15:0] _T_45_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_19;
  reg [15:0] _T_48_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_20;
  reg [15:0] _T_48_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_21;
  reg [15:0] _T_51_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_22;
  reg [15:0] _T_51_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_23;
  reg [15:0] _T_54_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_24;
  reg [15:0] _T_54_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_25;
  reg [15:0] _T_57_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_26;
  reg [15:0] _T_57_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_27;
  reg [15:0] _T_60_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_28;
  reg [15:0] _T_60_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_29;
  reg [15:0] _T_63_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_30;
  reg [15:0] _T_63_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_31;
  reg [15:0] _T_66_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_32;
  reg [15:0] _T_66_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_33;
  reg [15:0] _T_69_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_34;
  reg [15:0] _T_69_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_35;
  reg [15:0] _T_72_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_36;
  reg [15:0] _T_72_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_37;
  reg [15:0] _T_75_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_38;
  reg [15:0] _T_75_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_39;
  reg [15:0] _T_78_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_40;
  reg [15:0] _T_78_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_41;
  reg [15:0] _T_81_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_42;
  reg [15:0] _T_81_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_43;
  reg [15:0] _T_84_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_44;
  reg [15:0] _T_84_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_45;
  reg [15:0] _T_87_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_46;
  reg [15:0] _T_87_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_47;
  reg [15:0] _T_90_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_48;
  reg [15:0] _T_90_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_49;
  reg [15:0] _T_93_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_50;
  reg [15:0] _T_93_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_51;
  reg [15:0] _T_96_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_52;
  reg [15:0] _T_96_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_53;
  reg [15:0] _T_99_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_54;
  reg [15:0] _T_99_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_55;
  reg [15:0] _T_102_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_56;
  reg [15:0] _T_102_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_57;
  reg [15:0] _T_105_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_58;
  reg [15:0] _T_105_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_59;
  reg [15:0] _T_108_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_60;
  reg [15:0] _T_108_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_61;
  reg [15:0] _T_111_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_62;
  reg [15:0] _T_111_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_63;
  reg [15:0] _T_114_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_64;
  reg [15:0] _T_114_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_65;
  reg [15:0] _T_117_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_66;
  reg [15:0] _T_117_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_67;
  reg [15:0] _T_120_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_68;
  reg [15:0] _T_120_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_69;
  reg [15:0] _T_123_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_70;
  reg [15:0] _T_123_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_71;
  reg [15:0] _T_126_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_72;
  reg [15:0] _T_126_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_73;
  reg [15:0] _T_129_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_74;
  reg [15:0] _T_129_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_75;
  reg [15:0] _T_132_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_76;
  reg [15:0] _T_132_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_77;
  reg [15:0] _T_135_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_78;
  reg [15:0] _T_135_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_79;
  reg [15:0] _T_138_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_80;
  reg [15:0] _T_138_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_81;
  reg [15:0] _T_141_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_82;
  reg [15:0] _T_141_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_83;
  reg [15:0] _T_144_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_84;
  reg [15:0] _T_144_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_85;
  reg [15:0] _T_147_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_86;
  reg [15:0] _T_147_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_87;
  reg [15:0] _T_150_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_88;
  reg [15:0] _T_150_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_89;
  reg [15:0] _T_153_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_90;
  reg [15:0] _T_153_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_91;
  reg [15:0] _T_156_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_92;
  reg [15:0] _T_156_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_93;
  reg [15:0] _T_159_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_94;
  reg [15:0] _T_159_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_95;
  reg [15:0] _T_162_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_96;
  reg [15:0] _T_162_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_97;
  reg [15:0] _T_165_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_98;
  reg [15:0] _T_165_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_99;
  reg [15:0] _T_168_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_100;
  reg [15:0] _T_168_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_101;
  reg [15:0] _T_171_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_102;
  reg [15:0] _T_171_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_103;
  reg [15:0] _T_174_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_104;
  reg [15:0] _T_174_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_105;
  reg [15:0] _T_177_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_106;
  reg [15:0] _T_177_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_107;
  reg [15:0] _T_180_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_108;
  reg [15:0] _T_180_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_109;
  reg [15:0] _T_183_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_110;
  reg [15:0] _T_183_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_111;
  reg [15:0] _T_186_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_112;
  reg [15:0] _T_186_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_113;
  reg [15:0] _T_189_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_114;
  reg [15:0] _T_189_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_115;
  reg [15:0] _T_192_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_116;
  reg [15:0] _T_192_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_117;
  reg [15:0] _T_195_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_118;
  reg [15:0] _T_195_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_119;
  reg [15:0] _T_198_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_120;
  reg [15:0] _T_198_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_121;
  reg [15:0] _T_201_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_122;
  reg [15:0] _T_201_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_123;
  reg [15:0] _T_204_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_124;
  reg [15:0] _T_204_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_125;
  reg [15:0] _T_207_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_126;
  reg [15:0] _T_207_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_127;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_219; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_221; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_224; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_226; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_228; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_231; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h40; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_236 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_238 = _T_236[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_241 = $signed(_T_238) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_241[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_243 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_245 = _T_243[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_248 = $signed(_T_245) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_248[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_219 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_221 = _T_219[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_224 = $signed(_T_221) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_224[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_226 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_228 = _T_226[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_231 = $signed(_T_228) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_231[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_30_real = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_30_imag = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_33_real = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_33_imag = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_36_real = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_36_imag = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_39_real = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_39_imag = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_42_real = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_42_imag = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_45_real = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_45_imag = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_48_real = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_48_imag = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_51_real = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_51_imag = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_54_real = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_54_imag = _RAND_25[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_57_real = _RAND_26[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_57_imag = _RAND_27[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_60_real = _RAND_28[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_60_imag = _RAND_29[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_63_real = _RAND_30[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_63_imag = _RAND_31[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_66_real = _RAND_32[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_66_imag = _RAND_33[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_69_real = _RAND_34[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_69_imag = _RAND_35[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_72_real = _RAND_36[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_72_imag = _RAND_37[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_75_real = _RAND_38[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_75_imag = _RAND_39[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_78_real = _RAND_40[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_78_imag = _RAND_41[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_81_real = _RAND_42[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_81_imag = _RAND_43[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_84_real = _RAND_44[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_84_imag = _RAND_45[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_87_real = _RAND_46[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_87_imag = _RAND_47[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_90_real = _RAND_48[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_90_imag = _RAND_49[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_93_real = _RAND_50[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_93_imag = _RAND_51[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_96_real = _RAND_52[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_96_imag = _RAND_53[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_99_real = _RAND_54[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_99_imag = _RAND_55[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_102_real = _RAND_56[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_102_imag = _RAND_57[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  _T_105_real = _RAND_58[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  _T_105_imag = _RAND_59[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  _T_108_real = _RAND_60[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  _T_108_imag = _RAND_61[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  _T_111_real = _RAND_62[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_111_imag = _RAND_63[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  _T_114_real = _RAND_64[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  _T_114_imag = _RAND_65[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  _T_117_real = _RAND_66[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  _T_117_imag = _RAND_67[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  _T_120_real = _RAND_68[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  _T_120_imag = _RAND_69[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  _T_123_real = _RAND_70[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  _T_123_imag = _RAND_71[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  _T_126_real = _RAND_72[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  _T_126_imag = _RAND_73[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  _T_129_real = _RAND_74[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  _T_129_imag = _RAND_75[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  _T_132_real = _RAND_76[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  _T_132_imag = _RAND_77[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  _T_135_real = _RAND_78[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  _T_135_imag = _RAND_79[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  _T_138_real = _RAND_80[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  _T_138_imag = _RAND_81[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  _T_141_real = _RAND_82[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  _T_141_imag = _RAND_83[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  _T_144_real = _RAND_84[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  _T_144_imag = _RAND_85[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  _T_147_real = _RAND_86[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  _T_147_imag = _RAND_87[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  _T_150_real = _RAND_88[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  _T_150_imag = _RAND_89[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {1{`RANDOM}};
  _T_153_real = _RAND_90[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {1{`RANDOM}};
  _T_153_imag = _RAND_91[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {1{`RANDOM}};
  _T_156_real = _RAND_92[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {1{`RANDOM}};
  _T_156_imag = _RAND_93[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  _T_159_real = _RAND_94[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  _T_159_imag = _RAND_95[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {1{`RANDOM}};
  _T_162_real = _RAND_96[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {1{`RANDOM}};
  _T_162_imag = _RAND_97[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {1{`RANDOM}};
  _T_165_real = _RAND_98[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_99 = {1{`RANDOM}};
  _T_165_imag = _RAND_99[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_100 = {1{`RANDOM}};
  _T_168_real = _RAND_100[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_101 = {1{`RANDOM}};
  _T_168_imag = _RAND_101[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_102 = {1{`RANDOM}};
  _T_171_real = _RAND_102[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_103 = {1{`RANDOM}};
  _T_171_imag = _RAND_103[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_104 = {1{`RANDOM}};
  _T_174_real = _RAND_104[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_105 = {1{`RANDOM}};
  _T_174_imag = _RAND_105[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_106 = {1{`RANDOM}};
  _T_177_real = _RAND_106[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_107 = {1{`RANDOM}};
  _T_177_imag = _RAND_107[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_108 = {1{`RANDOM}};
  _T_180_real = _RAND_108[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_109 = {1{`RANDOM}};
  _T_180_imag = _RAND_109[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_110 = {1{`RANDOM}};
  _T_183_real = _RAND_110[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_111 = {1{`RANDOM}};
  _T_183_imag = _RAND_111[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_112 = {1{`RANDOM}};
  _T_186_real = _RAND_112[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_113 = {1{`RANDOM}};
  _T_186_imag = _RAND_113[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_114 = {1{`RANDOM}};
  _T_189_real = _RAND_114[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_115 = {1{`RANDOM}};
  _T_189_imag = _RAND_115[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_116 = {1{`RANDOM}};
  _T_192_real = _RAND_116[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_117 = {1{`RANDOM}};
  _T_192_imag = _RAND_117[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_118 = {1{`RANDOM}};
  _T_195_real = _RAND_118[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_119 = {1{`RANDOM}};
  _T_195_imag = _RAND_119[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_120 = {1{`RANDOM}};
  _T_198_real = _RAND_120[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_121 = {1{`RANDOM}};
  _T_198_imag = _RAND_121[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_122 = {1{`RANDOM}};
  _T_201_real = _RAND_122[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_123 = {1{`RANDOM}};
  _T_201_imag = _RAND_123[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_124 = {1{`RANDOM}};
  _T_204_real = _RAND_124[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_125 = {1{`RANDOM}};
  _T_204_imag = _RAND_125[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_126 = {1{`RANDOM}};
  _T_207_real = _RAND_126[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_127 = {1{`RANDOM}};
  _T_207_imag = _RAND_127[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_207_real;
    end
    if (io_en) begin
      feedback_imag <= _T_207_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
    if (io_en) begin
      _T_30_real <= _T_27_real;
    end
    if (io_en) begin
      _T_30_imag <= _T_27_imag;
    end
    if (io_en) begin
      _T_33_real <= _T_30_real;
    end
    if (io_en) begin
      _T_33_imag <= _T_30_imag;
    end
    if (io_en) begin
      _T_36_real <= _T_33_real;
    end
    if (io_en) begin
      _T_36_imag <= _T_33_imag;
    end
    if (io_en) begin
      _T_39_real <= _T_36_real;
    end
    if (io_en) begin
      _T_39_imag <= _T_36_imag;
    end
    if (io_en) begin
      _T_42_real <= _T_39_real;
    end
    if (io_en) begin
      _T_42_imag <= _T_39_imag;
    end
    if (io_en) begin
      _T_45_real <= _T_42_real;
    end
    if (io_en) begin
      _T_45_imag <= _T_42_imag;
    end
    if (io_en) begin
      _T_48_real <= _T_45_real;
    end
    if (io_en) begin
      _T_48_imag <= _T_45_imag;
    end
    if (io_en) begin
      _T_51_real <= _T_48_real;
    end
    if (io_en) begin
      _T_51_imag <= _T_48_imag;
    end
    if (io_en) begin
      _T_54_real <= _T_51_real;
    end
    if (io_en) begin
      _T_54_imag <= _T_51_imag;
    end
    if (io_en) begin
      _T_57_real <= _T_54_real;
    end
    if (io_en) begin
      _T_57_imag <= _T_54_imag;
    end
    if (io_en) begin
      _T_60_real <= _T_57_real;
    end
    if (io_en) begin
      _T_60_imag <= _T_57_imag;
    end
    if (io_en) begin
      _T_63_real <= _T_60_real;
    end
    if (io_en) begin
      _T_63_imag <= _T_60_imag;
    end
    if (io_en) begin
      _T_66_real <= _T_63_real;
    end
    if (io_en) begin
      _T_66_imag <= _T_63_imag;
    end
    if (io_en) begin
      _T_69_real <= _T_66_real;
    end
    if (io_en) begin
      _T_69_imag <= _T_66_imag;
    end
    if (io_en) begin
      _T_72_real <= _T_69_real;
    end
    if (io_en) begin
      _T_72_imag <= _T_69_imag;
    end
    if (io_en) begin
      _T_75_real <= _T_72_real;
    end
    if (io_en) begin
      _T_75_imag <= _T_72_imag;
    end
    if (io_en) begin
      _T_78_real <= _T_75_real;
    end
    if (io_en) begin
      _T_78_imag <= _T_75_imag;
    end
    if (io_en) begin
      _T_81_real <= _T_78_real;
    end
    if (io_en) begin
      _T_81_imag <= _T_78_imag;
    end
    if (io_en) begin
      _T_84_real <= _T_81_real;
    end
    if (io_en) begin
      _T_84_imag <= _T_81_imag;
    end
    if (io_en) begin
      _T_87_real <= _T_84_real;
    end
    if (io_en) begin
      _T_87_imag <= _T_84_imag;
    end
    if (io_en) begin
      _T_90_real <= _T_87_real;
    end
    if (io_en) begin
      _T_90_imag <= _T_87_imag;
    end
    if (io_en) begin
      _T_93_real <= _T_90_real;
    end
    if (io_en) begin
      _T_93_imag <= _T_90_imag;
    end
    if (io_en) begin
      _T_96_real <= _T_93_real;
    end
    if (io_en) begin
      _T_96_imag <= _T_93_imag;
    end
    if (io_en) begin
      _T_99_real <= _T_96_real;
    end
    if (io_en) begin
      _T_99_imag <= _T_96_imag;
    end
    if (io_en) begin
      _T_102_real <= _T_99_real;
    end
    if (io_en) begin
      _T_102_imag <= _T_99_imag;
    end
    if (io_en) begin
      _T_105_real <= _T_102_real;
    end
    if (io_en) begin
      _T_105_imag <= _T_102_imag;
    end
    if (io_en) begin
      _T_108_real <= _T_105_real;
    end
    if (io_en) begin
      _T_108_imag <= _T_105_imag;
    end
    if (io_en) begin
      _T_111_real <= _T_108_real;
    end
    if (io_en) begin
      _T_111_imag <= _T_108_imag;
    end
    if (io_en) begin
      _T_114_real <= _T_111_real;
    end
    if (io_en) begin
      _T_114_imag <= _T_111_imag;
    end
    if (io_en) begin
      _T_117_real <= _T_114_real;
    end
    if (io_en) begin
      _T_117_imag <= _T_114_imag;
    end
    if (io_en) begin
      _T_120_real <= _T_117_real;
    end
    if (io_en) begin
      _T_120_imag <= _T_117_imag;
    end
    if (io_en) begin
      _T_123_real <= _T_120_real;
    end
    if (io_en) begin
      _T_123_imag <= _T_120_imag;
    end
    if (io_en) begin
      _T_126_real <= _T_123_real;
    end
    if (io_en) begin
      _T_126_imag <= _T_123_imag;
    end
    if (io_en) begin
      _T_129_real <= _T_126_real;
    end
    if (io_en) begin
      _T_129_imag <= _T_126_imag;
    end
    if (io_en) begin
      _T_132_real <= _T_129_real;
    end
    if (io_en) begin
      _T_132_imag <= _T_129_imag;
    end
    if (io_en) begin
      _T_135_real <= _T_132_real;
    end
    if (io_en) begin
      _T_135_imag <= _T_132_imag;
    end
    if (io_en) begin
      _T_138_real <= _T_135_real;
    end
    if (io_en) begin
      _T_138_imag <= _T_135_imag;
    end
    if (io_en) begin
      _T_141_real <= _T_138_real;
    end
    if (io_en) begin
      _T_141_imag <= _T_138_imag;
    end
    if (io_en) begin
      _T_144_real <= _T_141_real;
    end
    if (io_en) begin
      _T_144_imag <= _T_141_imag;
    end
    if (io_en) begin
      _T_147_real <= _T_144_real;
    end
    if (io_en) begin
      _T_147_imag <= _T_144_imag;
    end
    if (io_en) begin
      _T_150_real <= _T_147_real;
    end
    if (io_en) begin
      _T_150_imag <= _T_147_imag;
    end
    if (io_en) begin
      _T_153_real <= _T_150_real;
    end
    if (io_en) begin
      _T_153_imag <= _T_150_imag;
    end
    if (io_en) begin
      _T_156_real <= _T_153_real;
    end
    if (io_en) begin
      _T_156_imag <= _T_153_imag;
    end
    if (io_en) begin
      _T_159_real <= _T_156_real;
    end
    if (io_en) begin
      _T_159_imag <= _T_156_imag;
    end
    if (io_en) begin
      _T_162_real <= _T_159_real;
    end
    if (io_en) begin
      _T_162_imag <= _T_159_imag;
    end
    if (io_en) begin
      _T_165_real <= _T_162_real;
    end
    if (io_en) begin
      _T_165_imag <= _T_162_imag;
    end
    if (io_en) begin
      _T_168_real <= _T_165_real;
    end
    if (io_en) begin
      _T_168_imag <= _T_165_imag;
    end
    if (io_en) begin
      _T_171_real <= _T_168_real;
    end
    if (io_en) begin
      _T_171_imag <= _T_168_imag;
    end
    if (io_en) begin
      _T_174_real <= _T_171_real;
    end
    if (io_en) begin
      _T_174_imag <= _T_171_imag;
    end
    if (io_en) begin
      _T_177_real <= _T_174_real;
    end
    if (io_en) begin
      _T_177_imag <= _T_174_imag;
    end
    if (io_en) begin
      _T_180_real <= _T_177_real;
    end
    if (io_en) begin
      _T_180_imag <= _T_177_imag;
    end
    if (io_en) begin
      _T_183_real <= _T_180_real;
    end
    if (io_en) begin
      _T_183_imag <= _T_180_imag;
    end
    if (io_en) begin
      _T_186_real <= _T_183_real;
    end
    if (io_en) begin
      _T_186_imag <= _T_183_imag;
    end
    if (io_en) begin
      _T_189_real <= _T_186_real;
    end
    if (io_en) begin
      _T_189_imag <= _T_186_imag;
    end
    if (io_en) begin
      _T_192_real <= _T_189_real;
    end
    if (io_en) begin
      _T_192_imag <= _T_189_imag;
    end
    if (io_en) begin
      _T_195_real <= _T_192_real;
    end
    if (io_en) begin
      _T_195_imag <= _T_192_imag;
    end
    if (io_en) begin
      _T_198_real <= _T_195_real;
    end
    if (io_en) begin
      _T_198_imag <= _T_195_imag;
    end
    if (io_en) begin
      _T_201_real <= _T_198_real;
    end
    if (io_en) begin
      _T_201_imag <= _T_198_imag;
    end
    if (io_en) begin
      _T_204_real <= _T_201_real;
    end
    if (io_en) begin
      _T_204_imag <= _T_201_imag;
    end
    if (io_en) begin
      _T_207_real <= _T_204_real;
    end
    if (io_en) begin
      _T_207_imag <= _T_204_imag;
    end
  end
endmodule
module SDFStageRadix22_7(
  input         clock,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  reg [15:0] feedback_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_428; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_430; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_433; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] feedback_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_435; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_437; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_440; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [15:0] _T_21_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [15:0] _T_21_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [15:0] _T_24_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [15:0] _T_24_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg [15:0] _T_27_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg [15:0] _T_27_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [15:0] _T_30_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [15:0] _T_30_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg [15:0] _T_33_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_10;
  reg [15:0] _T_33_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_11;
  reg [15:0] _T_36_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_12;
  reg [15:0] _T_36_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg [15:0] _T_39_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [15:0] _T_39_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_15;
  reg [15:0] _T_42_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_16;
  reg [15:0] _T_42_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_17;
  reg [15:0] _T_45_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_18;
  reg [15:0] _T_45_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_19;
  reg [15:0] _T_48_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_20;
  reg [15:0] _T_48_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_21;
  reg [15:0] _T_51_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_22;
  reg [15:0] _T_51_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_23;
  reg [15:0] _T_54_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_24;
  reg [15:0] _T_54_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_25;
  reg [15:0] _T_57_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_26;
  reg [15:0] _T_57_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_27;
  reg [15:0] _T_60_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_28;
  reg [15:0] _T_60_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_29;
  reg [15:0] _T_63_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_30;
  reg [15:0] _T_63_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_31;
  reg [15:0] _T_66_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_32;
  reg [15:0] _T_66_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_33;
  reg [15:0] _T_69_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_34;
  reg [15:0] _T_69_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_35;
  reg [15:0] _T_72_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_36;
  reg [15:0] _T_72_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_37;
  reg [15:0] _T_75_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_38;
  reg [15:0] _T_75_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_39;
  reg [15:0] _T_78_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_40;
  reg [15:0] _T_78_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_41;
  reg [15:0] _T_81_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_42;
  reg [15:0] _T_81_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_43;
  reg [15:0] _T_84_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_44;
  reg [15:0] _T_84_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_45;
  reg [15:0] _T_87_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_46;
  reg [15:0] _T_87_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_47;
  reg [15:0] _T_90_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_48;
  reg [15:0] _T_90_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_49;
  reg [15:0] _T_93_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_50;
  reg [15:0] _T_93_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_51;
  reg [15:0] _T_96_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_52;
  reg [15:0] _T_96_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_53;
  reg [15:0] _T_99_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_54;
  reg [15:0] _T_99_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_55;
  reg [15:0] _T_102_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_56;
  reg [15:0] _T_102_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_57;
  reg [15:0] _T_105_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_58;
  reg [15:0] _T_105_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_59;
  reg [15:0] _T_108_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_60;
  reg [15:0] _T_108_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_61;
  reg [15:0] _T_111_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_62;
  reg [15:0] _T_111_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_63;
  reg [15:0] _T_114_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_64;
  reg [15:0] _T_114_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_65;
  reg [15:0] _T_117_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_66;
  reg [15:0] _T_117_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_67;
  reg [15:0] _T_120_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_68;
  reg [15:0] _T_120_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_69;
  reg [15:0] _T_123_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_70;
  reg [15:0] _T_123_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_71;
  reg [15:0] _T_126_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_72;
  reg [15:0] _T_126_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_73;
  reg [15:0] _T_129_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_74;
  reg [15:0] _T_129_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_75;
  reg [15:0] _T_132_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_76;
  reg [15:0] _T_132_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_77;
  reg [15:0] _T_135_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_78;
  reg [15:0] _T_135_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_79;
  reg [15:0] _T_138_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_80;
  reg [15:0] _T_138_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_81;
  reg [15:0] _T_141_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_82;
  reg [15:0] _T_141_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_83;
  reg [15:0] _T_144_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_84;
  reg [15:0] _T_144_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_85;
  reg [15:0] _T_147_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_86;
  reg [15:0] _T_147_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_87;
  reg [15:0] _T_150_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_88;
  reg [15:0] _T_150_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_89;
  reg [15:0] _T_153_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_90;
  reg [15:0] _T_153_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_91;
  reg [15:0] _T_156_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_92;
  reg [15:0] _T_156_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_93;
  reg [15:0] _T_159_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_94;
  reg [15:0] _T_159_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_95;
  reg [15:0] _T_162_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_96;
  reg [15:0] _T_162_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_97;
  reg [15:0] _T_165_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_98;
  reg [15:0] _T_165_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_99;
  reg [15:0] _T_168_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_100;
  reg [15:0] _T_168_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_101;
  reg [15:0] _T_171_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_102;
  reg [15:0] _T_171_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_103;
  reg [15:0] _T_174_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_104;
  reg [15:0] _T_174_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_105;
  reg [15:0] _T_177_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_106;
  reg [15:0] _T_177_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_107;
  reg [15:0] _T_180_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_108;
  reg [15:0] _T_180_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_109;
  reg [15:0] _T_183_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_110;
  reg [15:0] _T_183_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_111;
  reg [15:0] _T_186_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_112;
  reg [15:0] _T_186_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_113;
  reg [15:0] _T_189_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_114;
  reg [15:0] _T_189_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_115;
  reg [15:0] _T_192_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_116;
  reg [15:0] _T_192_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_117;
  reg [15:0] _T_195_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_118;
  reg [15:0] _T_195_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_119;
  reg [15:0] _T_198_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_120;
  reg [15:0] _T_198_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_121;
  reg [15:0] _T_201_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_122;
  reg [15:0] _T_201_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_123;
  reg [15:0] _T_204_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_124;
  reg [15:0] _T_204_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_125;
  reg [15:0] _T_207_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_126;
  reg [15:0] _T_207_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_127;
  reg [15:0] _T_210_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_128;
  reg [15:0] _T_210_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_129;
  reg [15:0] _T_213_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_130;
  reg [15:0] _T_213_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_131;
  reg [15:0] _T_216_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_132;
  reg [15:0] _T_216_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_133;
  reg [15:0] _T_219_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_134;
  reg [15:0] _T_219_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_135;
  reg [15:0] _T_222_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_136;
  reg [15:0] _T_222_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_137;
  reg [15:0] _T_225_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_138;
  reg [15:0] _T_225_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_139;
  reg [15:0] _T_228_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_140;
  reg [15:0] _T_228_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_141;
  reg [15:0] _T_231_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_142;
  reg [15:0] _T_231_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_143;
  reg [15:0] _T_234_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_144;
  reg [15:0] _T_234_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_145;
  reg [15:0] _T_237_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_146;
  reg [15:0] _T_237_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_147;
  reg [15:0] _T_240_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_148;
  reg [15:0] _T_240_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_149;
  reg [15:0] _T_243_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_150;
  reg [15:0] _T_243_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_151;
  reg [15:0] _T_246_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_152;
  reg [15:0] _T_246_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_153;
  reg [15:0] _T_249_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_154;
  reg [15:0] _T_249_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_155;
  reg [15:0] _T_252_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_156;
  reg [15:0] _T_252_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_157;
  reg [15:0] _T_255_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_158;
  reg [15:0] _T_255_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_159;
  reg [15:0] _T_258_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_160;
  reg [15:0] _T_258_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_161;
  reg [15:0] _T_261_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_162;
  reg [15:0] _T_261_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_163;
  reg [15:0] _T_264_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_164;
  reg [15:0] _T_264_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_165;
  reg [15:0] _T_267_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_166;
  reg [15:0] _T_267_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_167;
  reg [15:0] _T_270_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_168;
  reg [15:0] _T_270_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_169;
  reg [15:0] _T_273_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_170;
  reg [15:0] _T_273_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_171;
  reg [15:0] _T_276_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_172;
  reg [15:0] _T_276_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_173;
  reg [15:0] _T_279_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_174;
  reg [15:0] _T_279_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_175;
  reg [15:0] _T_282_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_176;
  reg [15:0] _T_282_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_177;
  reg [15:0] _T_285_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_178;
  reg [15:0] _T_285_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_179;
  reg [15:0] _T_288_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_180;
  reg [15:0] _T_288_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_181;
  reg [15:0] _T_291_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_182;
  reg [15:0] _T_291_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_183;
  reg [15:0] _T_294_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_184;
  reg [15:0] _T_294_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_185;
  reg [15:0] _T_297_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_186;
  reg [15:0] _T_297_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_187;
  reg [15:0] _T_300_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_188;
  reg [15:0] _T_300_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_189;
  reg [15:0] _T_303_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_190;
  reg [15:0] _T_303_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_191;
  reg [15:0] _T_306_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_192;
  reg [15:0] _T_306_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_193;
  reg [15:0] _T_309_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_194;
  reg [15:0] _T_309_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_195;
  reg [15:0] _T_312_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_196;
  reg [15:0] _T_312_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_197;
  reg [15:0] _T_315_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_198;
  reg [15:0] _T_315_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_199;
  reg [15:0] _T_318_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_200;
  reg [15:0] _T_318_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_201;
  reg [15:0] _T_321_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_202;
  reg [15:0] _T_321_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_203;
  reg [15:0] _T_324_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_204;
  reg [15:0] _T_324_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_205;
  reg [15:0] _T_327_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_206;
  reg [15:0] _T_327_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_207;
  reg [15:0] _T_330_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_208;
  reg [15:0] _T_330_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_209;
  reg [15:0] _T_333_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_210;
  reg [15:0] _T_333_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_211;
  reg [15:0] _T_336_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_212;
  reg [15:0] _T_336_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_213;
  reg [15:0] _T_339_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_214;
  reg [15:0] _T_339_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_215;
  reg [15:0] _T_342_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_216;
  reg [15:0] _T_342_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_217;
  reg [15:0] _T_345_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_218;
  reg [15:0] _T_345_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_219;
  reg [15:0] _T_348_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_220;
  reg [15:0] _T_348_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_221;
  reg [15:0] _T_351_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_222;
  reg [15:0] _T_351_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_223;
  reg [15:0] _T_354_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_224;
  reg [15:0] _T_354_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_225;
  reg [15:0] _T_357_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_226;
  reg [15:0] _T_357_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_227;
  reg [15:0] _T_360_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_228;
  reg [15:0] _T_360_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_229;
  reg [15:0] _T_363_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_230;
  reg [15:0] _T_363_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_231;
  reg [15:0] _T_366_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_232;
  reg [15:0] _T_366_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_233;
  reg [15:0] _T_369_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_234;
  reg [15:0] _T_369_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_235;
  reg [15:0] _T_372_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_236;
  reg [15:0] _T_372_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_237;
  reg [15:0] _T_375_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_238;
  reg [15:0] _T_375_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_239;
  reg [15:0] _T_378_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_240;
  reg [15:0] _T_378_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_241;
  reg [15:0] _T_381_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_242;
  reg [15:0] _T_381_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_243;
  reg [15:0] _T_384_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_244;
  reg [15:0] _T_384_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_245;
  reg [15:0] _T_387_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_246;
  reg [15:0] _T_387_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_247;
  reg [15:0] _T_390_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_248;
  reg [15:0] _T_390_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_249;
  reg [15:0] _T_393_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_250;
  reg [15:0] _T_393_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_251;
  reg [15:0] _T_396_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_252;
  reg [15:0] _T_396_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_253;
  reg [15:0] _T_399_real; // @[Reg.scala 15:16]
  reg [31:0] _RAND_254;
  reg [15:0] _T_399_imag; // @[Reg.scala 15:16]
  reg [31:0] _RAND_255;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_411; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_413; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_416; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_418; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_420; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_423; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  assign load_input = io_cntr < 9'h80; // @[UIntTypeClass.scala 52:47]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_428 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_430 = _T_428[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_433 = $signed(_T_430) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_433[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_435 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_437 = _T_435[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_440 = $signed(_T_437) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_440[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_411 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_413 = _T_411[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_416 = $signed(_T_413) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_416[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_418 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_420 = _T_418[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_423 = $signed(_T_420) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_423[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  feedback_real = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  feedback_imag = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_21_real = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21_imag = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_24_real = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_24_imag = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_27_real = _RAND_6[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_27_imag = _RAND_7[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_30_real = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_30_imag = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_33_real = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_33_imag = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_36_real = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_36_imag = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_39_real = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_39_imag = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_42_real = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_42_imag = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_45_real = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_45_imag = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_48_real = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_48_imag = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_51_real = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_51_imag = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_54_real = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_54_imag = _RAND_25[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_57_real = _RAND_26[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_57_imag = _RAND_27[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_60_real = _RAND_28[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_60_imag = _RAND_29[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_63_real = _RAND_30[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  _T_63_imag = _RAND_31[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  _T_66_real = _RAND_32[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  _T_66_imag = _RAND_33[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  _T_69_real = _RAND_34[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  _T_69_imag = _RAND_35[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  _T_72_real = _RAND_36[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  _T_72_imag = _RAND_37[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  _T_75_real = _RAND_38[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  _T_75_imag = _RAND_39[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  _T_78_real = _RAND_40[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  _T_78_imag = _RAND_41[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  _T_81_real = _RAND_42[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  _T_81_imag = _RAND_43[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  _T_84_real = _RAND_44[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  _T_84_imag = _RAND_45[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  _T_87_real = _RAND_46[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_87_imag = _RAND_47[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  _T_90_real = _RAND_48[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  _T_90_imag = _RAND_49[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  _T_93_real = _RAND_50[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  _T_93_imag = _RAND_51[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  _T_96_real = _RAND_52[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  _T_96_imag = _RAND_53[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  _T_99_real = _RAND_54[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  _T_99_imag = _RAND_55[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_102_real = _RAND_56[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  _T_102_imag = _RAND_57[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  _T_105_real = _RAND_58[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  _T_105_imag = _RAND_59[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  _T_108_real = _RAND_60[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  _T_108_imag = _RAND_61[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  _T_111_real = _RAND_62[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_111_imag = _RAND_63[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  _T_114_real = _RAND_64[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  _T_114_imag = _RAND_65[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  _T_117_real = _RAND_66[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  _T_117_imag = _RAND_67[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  _T_120_real = _RAND_68[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  _T_120_imag = _RAND_69[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  _T_123_real = _RAND_70[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  _T_123_imag = _RAND_71[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  _T_126_real = _RAND_72[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  _T_126_imag = _RAND_73[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  _T_129_real = _RAND_74[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  _T_129_imag = _RAND_75[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  _T_132_real = _RAND_76[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  _T_132_imag = _RAND_77[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  _T_135_real = _RAND_78[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  _T_135_imag = _RAND_79[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  _T_138_real = _RAND_80[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  _T_138_imag = _RAND_81[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  _T_141_real = _RAND_82[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  _T_141_imag = _RAND_83[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  _T_144_real = _RAND_84[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  _T_144_imag = _RAND_85[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  _T_147_real = _RAND_86[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  _T_147_imag = _RAND_87[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  _T_150_real = _RAND_88[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  _T_150_imag = _RAND_89[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {1{`RANDOM}};
  _T_153_real = _RAND_90[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {1{`RANDOM}};
  _T_153_imag = _RAND_91[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {1{`RANDOM}};
  _T_156_real = _RAND_92[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {1{`RANDOM}};
  _T_156_imag = _RAND_93[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  _T_159_real = _RAND_94[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  _T_159_imag = _RAND_95[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {1{`RANDOM}};
  _T_162_real = _RAND_96[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {1{`RANDOM}};
  _T_162_imag = _RAND_97[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {1{`RANDOM}};
  _T_165_real = _RAND_98[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_99 = {1{`RANDOM}};
  _T_165_imag = _RAND_99[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_100 = {1{`RANDOM}};
  _T_168_real = _RAND_100[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_101 = {1{`RANDOM}};
  _T_168_imag = _RAND_101[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_102 = {1{`RANDOM}};
  _T_171_real = _RAND_102[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_103 = {1{`RANDOM}};
  _T_171_imag = _RAND_103[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_104 = {1{`RANDOM}};
  _T_174_real = _RAND_104[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_105 = {1{`RANDOM}};
  _T_174_imag = _RAND_105[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_106 = {1{`RANDOM}};
  _T_177_real = _RAND_106[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_107 = {1{`RANDOM}};
  _T_177_imag = _RAND_107[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_108 = {1{`RANDOM}};
  _T_180_real = _RAND_108[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_109 = {1{`RANDOM}};
  _T_180_imag = _RAND_109[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_110 = {1{`RANDOM}};
  _T_183_real = _RAND_110[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_111 = {1{`RANDOM}};
  _T_183_imag = _RAND_111[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_112 = {1{`RANDOM}};
  _T_186_real = _RAND_112[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_113 = {1{`RANDOM}};
  _T_186_imag = _RAND_113[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_114 = {1{`RANDOM}};
  _T_189_real = _RAND_114[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_115 = {1{`RANDOM}};
  _T_189_imag = _RAND_115[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_116 = {1{`RANDOM}};
  _T_192_real = _RAND_116[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_117 = {1{`RANDOM}};
  _T_192_imag = _RAND_117[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_118 = {1{`RANDOM}};
  _T_195_real = _RAND_118[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_119 = {1{`RANDOM}};
  _T_195_imag = _RAND_119[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_120 = {1{`RANDOM}};
  _T_198_real = _RAND_120[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_121 = {1{`RANDOM}};
  _T_198_imag = _RAND_121[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_122 = {1{`RANDOM}};
  _T_201_real = _RAND_122[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_123 = {1{`RANDOM}};
  _T_201_imag = _RAND_123[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_124 = {1{`RANDOM}};
  _T_204_real = _RAND_124[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_125 = {1{`RANDOM}};
  _T_204_imag = _RAND_125[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_126 = {1{`RANDOM}};
  _T_207_real = _RAND_126[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_127 = {1{`RANDOM}};
  _T_207_imag = _RAND_127[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_128 = {1{`RANDOM}};
  _T_210_real = _RAND_128[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_129 = {1{`RANDOM}};
  _T_210_imag = _RAND_129[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_130 = {1{`RANDOM}};
  _T_213_real = _RAND_130[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_131 = {1{`RANDOM}};
  _T_213_imag = _RAND_131[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_132 = {1{`RANDOM}};
  _T_216_real = _RAND_132[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_133 = {1{`RANDOM}};
  _T_216_imag = _RAND_133[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_134 = {1{`RANDOM}};
  _T_219_real = _RAND_134[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_135 = {1{`RANDOM}};
  _T_219_imag = _RAND_135[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_136 = {1{`RANDOM}};
  _T_222_real = _RAND_136[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_137 = {1{`RANDOM}};
  _T_222_imag = _RAND_137[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_138 = {1{`RANDOM}};
  _T_225_real = _RAND_138[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_139 = {1{`RANDOM}};
  _T_225_imag = _RAND_139[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_140 = {1{`RANDOM}};
  _T_228_real = _RAND_140[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_141 = {1{`RANDOM}};
  _T_228_imag = _RAND_141[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_142 = {1{`RANDOM}};
  _T_231_real = _RAND_142[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_143 = {1{`RANDOM}};
  _T_231_imag = _RAND_143[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_144 = {1{`RANDOM}};
  _T_234_real = _RAND_144[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_145 = {1{`RANDOM}};
  _T_234_imag = _RAND_145[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_146 = {1{`RANDOM}};
  _T_237_real = _RAND_146[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_147 = {1{`RANDOM}};
  _T_237_imag = _RAND_147[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_148 = {1{`RANDOM}};
  _T_240_real = _RAND_148[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_149 = {1{`RANDOM}};
  _T_240_imag = _RAND_149[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_150 = {1{`RANDOM}};
  _T_243_real = _RAND_150[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_151 = {1{`RANDOM}};
  _T_243_imag = _RAND_151[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_152 = {1{`RANDOM}};
  _T_246_real = _RAND_152[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_153 = {1{`RANDOM}};
  _T_246_imag = _RAND_153[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_154 = {1{`RANDOM}};
  _T_249_real = _RAND_154[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_155 = {1{`RANDOM}};
  _T_249_imag = _RAND_155[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_156 = {1{`RANDOM}};
  _T_252_real = _RAND_156[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_157 = {1{`RANDOM}};
  _T_252_imag = _RAND_157[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_158 = {1{`RANDOM}};
  _T_255_real = _RAND_158[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_159 = {1{`RANDOM}};
  _T_255_imag = _RAND_159[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_160 = {1{`RANDOM}};
  _T_258_real = _RAND_160[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_161 = {1{`RANDOM}};
  _T_258_imag = _RAND_161[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_162 = {1{`RANDOM}};
  _T_261_real = _RAND_162[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_163 = {1{`RANDOM}};
  _T_261_imag = _RAND_163[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_164 = {1{`RANDOM}};
  _T_264_real = _RAND_164[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_165 = {1{`RANDOM}};
  _T_264_imag = _RAND_165[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_166 = {1{`RANDOM}};
  _T_267_real = _RAND_166[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_167 = {1{`RANDOM}};
  _T_267_imag = _RAND_167[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_168 = {1{`RANDOM}};
  _T_270_real = _RAND_168[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_169 = {1{`RANDOM}};
  _T_270_imag = _RAND_169[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_170 = {1{`RANDOM}};
  _T_273_real = _RAND_170[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_171 = {1{`RANDOM}};
  _T_273_imag = _RAND_171[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_172 = {1{`RANDOM}};
  _T_276_real = _RAND_172[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_173 = {1{`RANDOM}};
  _T_276_imag = _RAND_173[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_174 = {1{`RANDOM}};
  _T_279_real = _RAND_174[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_175 = {1{`RANDOM}};
  _T_279_imag = _RAND_175[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_176 = {1{`RANDOM}};
  _T_282_real = _RAND_176[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_177 = {1{`RANDOM}};
  _T_282_imag = _RAND_177[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_178 = {1{`RANDOM}};
  _T_285_real = _RAND_178[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_179 = {1{`RANDOM}};
  _T_285_imag = _RAND_179[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_180 = {1{`RANDOM}};
  _T_288_real = _RAND_180[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_181 = {1{`RANDOM}};
  _T_288_imag = _RAND_181[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_182 = {1{`RANDOM}};
  _T_291_real = _RAND_182[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_183 = {1{`RANDOM}};
  _T_291_imag = _RAND_183[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_184 = {1{`RANDOM}};
  _T_294_real = _RAND_184[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_185 = {1{`RANDOM}};
  _T_294_imag = _RAND_185[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_186 = {1{`RANDOM}};
  _T_297_real = _RAND_186[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_187 = {1{`RANDOM}};
  _T_297_imag = _RAND_187[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_188 = {1{`RANDOM}};
  _T_300_real = _RAND_188[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_189 = {1{`RANDOM}};
  _T_300_imag = _RAND_189[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_190 = {1{`RANDOM}};
  _T_303_real = _RAND_190[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_191 = {1{`RANDOM}};
  _T_303_imag = _RAND_191[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_192 = {1{`RANDOM}};
  _T_306_real = _RAND_192[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_193 = {1{`RANDOM}};
  _T_306_imag = _RAND_193[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_194 = {1{`RANDOM}};
  _T_309_real = _RAND_194[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_195 = {1{`RANDOM}};
  _T_309_imag = _RAND_195[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_196 = {1{`RANDOM}};
  _T_312_real = _RAND_196[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_197 = {1{`RANDOM}};
  _T_312_imag = _RAND_197[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_198 = {1{`RANDOM}};
  _T_315_real = _RAND_198[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_199 = {1{`RANDOM}};
  _T_315_imag = _RAND_199[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_200 = {1{`RANDOM}};
  _T_318_real = _RAND_200[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_201 = {1{`RANDOM}};
  _T_318_imag = _RAND_201[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_202 = {1{`RANDOM}};
  _T_321_real = _RAND_202[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_203 = {1{`RANDOM}};
  _T_321_imag = _RAND_203[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_204 = {1{`RANDOM}};
  _T_324_real = _RAND_204[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_205 = {1{`RANDOM}};
  _T_324_imag = _RAND_205[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_206 = {1{`RANDOM}};
  _T_327_real = _RAND_206[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_207 = {1{`RANDOM}};
  _T_327_imag = _RAND_207[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_208 = {1{`RANDOM}};
  _T_330_real = _RAND_208[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_209 = {1{`RANDOM}};
  _T_330_imag = _RAND_209[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_210 = {1{`RANDOM}};
  _T_333_real = _RAND_210[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_211 = {1{`RANDOM}};
  _T_333_imag = _RAND_211[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_212 = {1{`RANDOM}};
  _T_336_real = _RAND_212[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_213 = {1{`RANDOM}};
  _T_336_imag = _RAND_213[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_214 = {1{`RANDOM}};
  _T_339_real = _RAND_214[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_215 = {1{`RANDOM}};
  _T_339_imag = _RAND_215[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_216 = {1{`RANDOM}};
  _T_342_real = _RAND_216[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_217 = {1{`RANDOM}};
  _T_342_imag = _RAND_217[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_218 = {1{`RANDOM}};
  _T_345_real = _RAND_218[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_219 = {1{`RANDOM}};
  _T_345_imag = _RAND_219[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_220 = {1{`RANDOM}};
  _T_348_real = _RAND_220[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_221 = {1{`RANDOM}};
  _T_348_imag = _RAND_221[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_222 = {1{`RANDOM}};
  _T_351_real = _RAND_222[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_223 = {1{`RANDOM}};
  _T_351_imag = _RAND_223[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_224 = {1{`RANDOM}};
  _T_354_real = _RAND_224[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_225 = {1{`RANDOM}};
  _T_354_imag = _RAND_225[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_226 = {1{`RANDOM}};
  _T_357_real = _RAND_226[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_227 = {1{`RANDOM}};
  _T_357_imag = _RAND_227[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_228 = {1{`RANDOM}};
  _T_360_real = _RAND_228[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_229 = {1{`RANDOM}};
  _T_360_imag = _RAND_229[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_230 = {1{`RANDOM}};
  _T_363_real = _RAND_230[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_231 = {1{`RANDOM}};
  _T_363_imag = _RAND_231[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_232 = {1{`RANDOM}};
  _T_366_real = _RAND_232[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_233 = {1{`RANDOM}};
  _T_366_imag = _RAND_233[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_234 = {1{`RANDOM}};
  _T_369_real = _RAND_234[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_235 = {1{`RANDOM}};
  _T_369_imag = _RAND_235[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_236 = {1{`RANDOM}};
  _T_372_real = _RAND_236[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_237 = {1{`RANDOM}};
  _T_372_imag = _RAND_237[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_238 = {1{`RANDOM}};
  _T_375_real = _RAND_238[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_239 = {1{`RANDOM}};
  _T_375_imag = _RAND_239[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_240 = {1{`RANDOM}};
  _T_378_real = _RAND_240[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_241 = {1{`RANDOM}};
  _T_378_imag = _RAND_241[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_242 = {1{`RANDOM}};
  _T_381_real = _RAND_242[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_243 = {1{`RANDOM}};
  _T_381_imag = _RAND_243[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_244 = {1{`RANDOM}};
  _T_384_real = _RAND_244[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_245 = {1{`RANDOM}};
  _T_384_imag = _RAND_245[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_246 = {1{`RANDOM}};
  _T_387_real = _RAND_246[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_247 = {1{`RANDOM}};
  _T_387_imag = _RAND_247[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_248 = {1{`RANDOM}};
  _T_390_real = _RAND_248[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_249 = {1{`RANDOM}};
  _T_390_imag = _RAND_249[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_250 = {1{`RANDOM}};
  _T_393_real = _RAND_250[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_251 = {1{`RANDOM}};
  _T_393_imag = _RAND_251[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_252 = {1{`RANDOM}};
  _T_396_real = _RAND_252[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_253 = {1{`RANDOM}};
  _T_396_imag = _RAND_253[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_254 = {1{`RANDOM}};
  _T_399_real = _RAND_254[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_255 = {1{`RANDOM}};
  _T_399_imag = _RAND_255[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (io_en) begin
      feedback_real <= _T_399_real;
    end
    if (io_en) begin
      feedback_imag <= _T_399_imag;
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_real <= io_in_real;
      end else begin
        _T_21_real <= butterfly_outputs_1_real;
      end
    end
    if (io_en) begin
      if (load_input) begin
        _T_21_imag <= io_in_imag;
      end else begin
        _T_21_imag <= butterfly_outputs_1_imag;
      end
    end
    if (io_en) begin
      _T_24_real <= _T_21_real;
    end
    if (io_en) begin
      _T_24_imag <= _T_21_imag;
    end
    if (io_en) begin
      _T_27_real <= _T_24_real;
    end
    if (io_en) begin
      _T_27_imag <= _T_24_imag;
    end
    if (io_en) begin
      _T_30_real <= _T_27_real;
    end
    if (io_en) begin
      _T_30_imag <= _T_27_imag;
    end
    if (io_en) begin
      _T_33_real <= _T_30_real;
    end
    if (io_en) begin
      _T_33_imag <= _T_30_imag;
    end
    if (io_en) begin
      _T_36_real <= _T_33_real;
    end
    if (io_en) begin
      _T_36_imag <= _T_33_imag;
    end
    if (io_en) begin
      _T_39_real <= _T_36_real;
    end
    if (io_en) begin
      _T_39_imag <= _T_36_imag;
    end
    if (io_en) begin
      _T_42_real <= _T_39_real;
    end
    if (io_en) begin
      _T_42_imag <= _T_39_imag;
    end
    if (io_en) begin
      _T_45_real <= _T_42_real;
    end
    if (io_en) begin
      _T_45_imag <= _T_42_imag;
    end
    if (io_en) begin
      _T_48_real <= _T_45_real;
    end
    if (io_en) begin
      _T_48_imag <= _T_45_imag;
    end
    if (io_en) begin
      _T_51_real <= _T_48_real;
    end
    if (io_en) begin
      _T_51_imag <= _T_48_imag;
    end
    if (io_en) begin
      _T_54_real <= _T_51_real;
    end
    if (io_en) begin
      _T_54_imag <= _T_51_imag;
    end
    if (io_en) begin
      _T_57_real <= _T_54_real;
    end
    if (io_en) begin
      _T_57_imag <= _T_54_imag;
    end
    if (io_en) begin
      _T_60_real <= _T_57_real;
    end
    if (io_en) begin
      _T_60_imag <= _T_57_imag;
    end
    if (io_en) begin
      _T_63_real <= _T_60_real;
    end
    if (io_en) begin
      _T_63_imag <= _T_60_imag;
    end
    if (io_en) begin
      _T_66_real <= _T_63_real;
    end
    if (io_en) begin
      _T_66_imag <= _T_63_imag;
    end
    if (io_en) begin
      _T_69_real <= _T_66_real;
    end
    if (io_en) begin
      _T_69_imag <= _T_66_imag;
    end
    if (io_en) begin
      _T_72_real <= _T_69_real;
    end
    if (io_en) begin
      _T_72_imag <= _T_69_imag;
    end
    if (io_en) begin
      _T_75_real <= _T_72_real;
    end
    if (io_en) begin
      _T_75_imag <= _T_72_imag;
    end
    if (io_en) begin
      _T_78_real <= _T_75_real;
    end
    if (io_en) begin
      _T_78_imag <= _T_75_imag;
    end
    if (io_en) begin
      _T_81_real <= _T_78_real;
    end
    if (io_en) begin
      _T_81_imag <= _T_78_imag;
    end
    if (io_en) begin
      _T_84_real <= _T_81_real;
    end
    if (io_en) begin
      _T_84_imag <= _T_81_imag;
    end
    if (io_en) begin
      _T_87_real <= _T_84_real;
    end
    if (io_en) begin
      _T_87_imag <= _T_84_imag;
    end
    if (io_en) begin
      _T_90_real <= _T_87_real;
    end
    if (io_en) begin
      _T_90_imag <= _T_87_imag;
    end
    if (io_en) begin
      _T_93_real <= _T_90_real;
    end
    if (io_en) begin
      _T_93_imag <= _T_90_imag;
    end
    if (io_en) begin
      _T_96_real <= _T_93_real;
    end
    if (io_en) begin
      _T_96_imag <= _T_93_imag;
    end
    if (io_en) begin
      _T_99_real <= _T_96_real;
    end
    if (io_en) begin
      _T_99_imag <= _T_96_imag;
    end
    if (io_en) begin
      _T_102_real <= _T_99_real;
    end
    if (io_en) begin
      _T_102_imag <= _T_99_imag;
    end
    if (io_en) begin
      _T_105_real <= _T_102_real;
    end
    if (io_en) begin
      _T_105_imag <= _T_102_imag;
    end
    if (io_en) begin
      _T_108_real <= _T_105_real;
    end
    if (io_en) begin
      _T_108_imag <= _T_105_imag;
    end
    if (io_en) begin
      _T_111_real <= _T_108_real;
    end
    if (io_en) begin
      _T_111_imag <= _T_108_imag;
    end
    if (io_en) begin
      _T_114_real <= _T_111_real;
    end
    if (io_en) begin
      _T_114_imag <= _T_111_imag;
    end
    if (io_en) begin
      _T_117_real <= _T_114_real;
    end
    if (io_en) begin
      _T_117_imag <= _T_114_imag;
    end
    if (io_en) begin
      _T_120_real <= _T_117_real;
    end
    if (io_en) begin
      _T_120_imag <= _T_117_imag;
    end
    if (io_en) begin
      _T_123_real <= _T_120_real;
    end
    if (io_en) begin
      _T_123_imag <= _T_120_imag;
    end
    if (io_en) begin
      _T_126_real <= _T_123_real;
    end
    if (io_en) begin
      _T_126_imag <= _T_123_imag;
    end
    if (io_en) begin
      _T_129_real <= _T_126_real;
    end
    if (io_en) begin
      _T_129_imag <= _T_126_imag;
    end
    if (io_en) begin
      _T_132_real <= _T_129_real;
    end
    if (io_en) begin
      _T_132_imag <= _T_129_imag;
    end
    if (io_en) begin
      _T_135_real <= _T_132_real;
    end
    if (io_en) begin
      _T_135_imag <= _T_132_imag;
    end
    if (io_en) begin
      _T_138_real <= _T_135_real;
    end
    if (io_en) begin
      _T_138_imag <= _T_135_imag;
    end
    if (io_en) begin
      _T_141_real <= _T_138_real;
    end
    if (io_en) begin
      _T_141_imag <= _T_138_imag;
    end
    if (io_en) begin
      _T_144_real <= _T_141_real;
    end
    if (io_en) begin
      _T_144_imag <= _T_141_imag;
    end
    if (io_en) begin
      _T_147_real <= _T_144_real;
    end
    if (io_en) begin
      _T_147_imag <= _T_144_imag;
    end
    if (io_en) begin
      _T_150_real <= _T_147_real;
    end
    if (io_en) begin
      _T_150_imag <= _T_147_imag;
    end
    if (io_en) begin
      _T_153_real <= _T_150_real;
    end
    if (io_en) begin
      _T_153_imag <= _T_150_imag;
    end
    if (io_en) begin
      _T_156_real <= _T_153_real;
    end
    if (io_en) begin
      _T_156_imag <= _T_153_imag;
    end
    if (io_en) begin
      _T_159_real <= _T_156_real;
    end
    if (io_en) begin
      _T_159_imag <= _T_156_imag;
    end
    if (io_en) begin
      _T_162_real <= _T_159_real;
    end
    if (io_en) begin
      _T_162_imag <= _T_159_imag;
    end
    if (io_en) begin
      _T_165_real <= _T_162_real;
    end
    if (io_en) begin
      _T_165_imag <= _T_162_imag;
    end
    if (io_en) begin
      _T_168_real <= _T_165_real;
    end
    if (io_en) begin
      _T_168_imag <= _T_165_imag;
    end
    if (io_en) begin
      _T_171_real <= _T_168_real;
    end
    if (io_en) begin
      _T_171_imag <= _T_168_imag;
    end
    if (io_en) begin
      _T_174_real <= _T_171_real;
    end
    if (io_en) begin
      _T_174_imag <= _T_171_imag;
    end
    if (io_en) begin
      _T_177_real <= _T_174_real;
    end
    if (io_en) begin
      _T_177_imag <= _T_174_imag;
    end
    if (io_en) begin
      _T_180_real <= _T_177_real;
    end
    if (io_en) begin
      _T_180_imag <= _T_177_imag;
    end
    if (io_en) begin
      _T_183_real <= _T_180_real;
    end
    if (io_en) begin
      _T_183_imag <= _T_180_imag;
    end
    if (io_en) begin
      _T_186_real <= _T_183_real;
    end
    if (io_en) begin
      _T_186_imag <= _T_183_imag;
    end
    if (io_en) begin
      _T_189_real <= _T_186_real;
    end
    if (io_en) begin
      _T_189_imag <= _T_186_imag;
    end
    if (io_en) begin
      _T_192_real <= _T_189_real;
    end
    if (io_en) begin
      _T_192_imag <= _T_189_imag;
    end
    if (io_en) begin
      _T_195_real <= _T_192_real;
    end
    if (io_en) begin
      _T_195_imag <= _T_192_imag;
    end
    if (io_en) begin
      _T_198_real <= _T_195_real;
    end
    if (io_en) begin
      _T_198_imag <= _T_195_imag;
    end
    if (io_en) begin
      _T_201_real <= _T_198_real;
    end
    if (io_en) begin
      _T_201_imag <= _T_198_imag;
    end
    if (io_en) begin
      _T_204_real <= _T_201_real;
    end
    if (io_en) begin
      _T_204_imag <= _T_201_imag;
    end
    if (io_en) begin
      _T_207_real <= _T_204_real;
    end
    if (io_en) begin
      _T_207_imag <= _T_204_imag;
    end
    if (io_en) begin
      _T_210_real <= _T_207_real;
    end
    if (io_en) begin
      _T_210_imag <= _T_207_imag;
    end
    if (io_en) begin
      _T_213_real <= _T_210_real;
    end
    if (io_en) begin
      _T_213_imag <= _T_210_imag;
    end
    if (io_en) begin
      _T_216_real <= _T_213_real;
    end
    if (io_en) begin
      _T_216_imag <= _T_213_imag;
    end
    if (io_en) begin
      _T_219_real <= _T_216_real;
    end
    if (io_en) begin
      _T_219_imag <= _T_216_imag;
    end
    if (io_en) begin
      _T_222_real <= _T_219_real;
    end
    if (io_en) begin
      _T_222_imag <= _T_219_imag;
    end
    if (io_en) begin
      _T_225_real <= _T_222_real;
    end
    if (io_en) begin
      _T_225_imag <= _T_222_imag;
    end
    if (io_en) begin
      _T_228_real <= _T_225_real;
    end
    if (io_en) begin
      _T_228_imag <= _T_225_imag;
    end
    if (io_en) begin
      _T_231_real <= _T_228_real;
    end
    if (io_en) begin
      _T_231_imag <= _T_228_imag;
    end
    if (io_en) begin
      _T_234_real <= _T_231_real;
    end
    if (io_en) begin
      _T_234_imag <= _T_231_imag;
    end
    if (io_en) begin
      _T_237_real <= _T_234_real;
    end
    if (io_en) begin
      _T_237_imag <= _T_234_imag;
    end
    if (io_en) begin
      _T_240_real <= _T_237_real;
    end
    if (io_en) begin
      _T_240_imag <= _T_237_imag;
    end
    if (io_en) begin
      _T_243_real <= _T_240_real;
    end
    if (io_en) begin
      _T_243_imag <= _T_240_imag;
    end
    if (io_en) begin
      _T_246_real <= _T_243_real;
    end
    if (io_en) begin
      _T_246_imag <= _T_243_imag;
    end
    if (io_en) begin
      _T_249_real <= _T_246_real;
    end
    if (io_en) begin
      _T_249_imag <= _T_246_imag;
    end
    if (io_en) begin
      _T_252_real <= _T_249_real;
    end
    if (io_en) begin
      _T_252_imag <= _T_249_imag;
    end
    if (io_en) begin
      _T_255_real <= _T_252_real;
    end
    if (io_en) begin
      _T_255_imag <= _T_252_imag;
    end
    if (io_en) begin
      _T_258_real <= _T_255_real;
    end
    if (io_en) begin
      _T_258_imag <= _T_255_imag;
    end
    if (io_en) begin
      _T_261_real <= _T_258_real;
    end
    if (io_en) begin
      _T_261_imag <= _T_258_imag;
    end
    if (io_en) begin
      _T_264_real <= _T_261_real;
    end
    if (io_en) begin
      _T_264_imag <= _T_261_imag;
    end
    if (io_en) begin
      _T_267_real <= _T_264_real;
    end
    if (io_en) begin
      _T_267_imag <= _T_264_imag;
    end
    if (io_en) begin
      _T_270_real <= _T_267_real;
    end
    if (io_en) begin
      _T_270_imag <= _T_267_imag;
    end
    if (io_en) begin
      _T_273_real <= _T_270_real;
    end
    if (io_en) begin
      _T_273_imag <= _T_270_imag;
    end
    if (io_en) begin
      _T_276_real <= _T_273_real;
    end
    if (io_en) begin
      _T_276_imag <= _T_273_imag;
    end
    if (io_en) begin
      _T_279_real <= _T_276_real;
    end
    if (io_en) begin
      _T_279_imag <= _T_276_imag;
    end
    if (io_en) begin
      _T_282_real <= _T_279_real;
    end
    if (io_en) begin
      _T_282_imag <= _T_279_imag;
    end
    if (io_en) begin
      _T_285_real <= _T_282_real;
    end
    if (io_en) begin
      _T_285_imag <= _T_282_imag;
    end
    if (io_en) begin
      _T_288_real <= _T_285_real;
    end
    if (io_en) begin
      _T_288_imag <= _T_285_imag;
    end
    if (io_en) begin
      _T_291_real <= _T_288_real;
    end
    if (io_en) begin
      _T_291_imag <= _T_288_imag;
    end
    if (io_en) begin
      _T_294_real <= _T_291_real;
    end
    if (io_en) begin
      _T_294_imag <= _T_291_imag;
    end
    if (io_en) begin
      _T_297_real <= _T_294_real;
    end
    if (io_en) begin
      _T_297_imag <= _T_294_imag;
    end
    if (io_en) begin
      _T_300_real <= _T_297_real;
    end
    if (io_en) begin
      _T_300_imag <= _T_297_imag;
    end
    if (io_en) begin
      _T_303_real <= _T_300_real;
    end
    if (io_en) begin
      _T_303_imag <= _T_300_imag;
    end
    if (io_en) begin
      _T_306_real <= _T_303_real;
    end
    if (io_en) begin
      _T_306_imag <= _T_303_imag;
    end
    if (io_en) begin
      _T_309_real <= _T_306_real;
    end
    if (io_en) begin
      _T_309_imag <= _T_306_imag;
    end
    if (io_en) begin
      _T_312_real <= _T_309_real;
    end
    if (io_en) begin
      _T_312_imag <= _T_309_imag;
    end
    if (io_en) begin
      _T_315_real <= _T_312_real;
    end
    if (io_en) begin
      _T_315_imag <= _T_312_imag;
    end
    if (io_en) begin
      _T_318_real <= _T_315_real;
    end
    if (io_en) begin
      _T_318_imag <= _T_315_imag;
    end
    if (io_en) begin
      _T_321_real <= _T_318_real;
    end
    if (io_en) begin
      _T_321_imag <= _T_318_imag;
    end
    if (io_en) begin
      _T_324_real <= _T_321_real;
    end
    if (io_en) begin
      _T_324_imag <= _T_321_imag;
    end
    if (io_en) begin
      _T_327_real <= _T_324_real;
    end
    if (io_en) begin
      _T_327_imag <= _T_324_imag;
    end
    if (io_en) begin
      _T_330_real <= _T_327_real;
    end
    if (io_en) begin
      _T_330_imag <= _T_327_imag;
    end
    if (io_en) begin
      _T_333_real <= _T_330_real;
    end
    if (io_en) begin
      _T_333_imag <= _T_330_imag;
    end
    if (io_en) begin
      _T_336_real <= _T_333_real;
    end
    if (io_en) begin
      _T_336_imag <= _T_333_imag;
    end
    if (io_en) begin
      _T_339_real <= _T_336_real;
    end
    if (io_en) begin
      _T_339_imag <= _T_336_imag;
    end
    if (io_en) begin
      _T_342_real <= _T_339_real;
    end
    if (io_en) begin
      _T_342_imag <= _T_339_imag;
    end
    if (io_en) begin
      _T_345_real <= _T_342_real;
    end
    if (io_en) begin
      _T_345_imag <= _T_342_imag;
    end
    if (io_en) begin
      _T_348_real <= _T_345_real;
    end
    if (io_en) begin
      _T_348_imag <= _T_345_imag;
    end
    if (io_en) begin
      _T_351_real <= _T_348_real;
    end
    if (io_en) begin
      _T_351_imag <= _T_348_imag;
    end
    if (io_en) begin
      _T_354_real <= _T_351_real;
    end
    if (io_en) begin
      _T_354_imag <= _T_351_imag;
    end
    if (io_en) begin
      _T_357_real <= _T_354_real;
    end
    if (io_en) begin
      _T_357_imag <= _T_354_imag;
    end
    if (io_en) begin
      _T_360_real <= _T_357_real;
    end
    if (io_en) begin
      _T_360_imag <= _T_357_imag;
    end
    if (io_en) begin
      _T_363_real <= _T_360_real;
    end
    if (io_en) begin
      _T_363_imag <= _T_360_imag;
    end
    if (io_en) begin
      _T_366_real <= _T_363_real;
    end
    if (io_en) begin
      _T_366_imag <= _T_363_imag;
    end
    if (io_en) begin
      _T_369_real <= _T_366_real;
    end
    if (io_en) begin
      _T_369_imag <= _T_366_imag;
    end
    if (io_en) begin
      _T_372_real <= _T_369_real;
    end
    if (io_en) begin
      _T_372_imag <= _T_369_imag;
    end
    if (io_en) begin
      _T_375_real <= _T_372_real;
    end
    if (io_en) begin
      _T_375_imag <= _T_372_imag;
    end
    if (io_en) begin
      _T_378_real <= _T_375_real;
    end
    if (io_en) begin
      _T_378_imag <= _T_375_imag;
    end
    if (io_en) begin
      _T_381_real <= _T_378_real;
    end
    if (io_en) begin
      _T_381_imag <= _T_378_imag;
    end
    if (io_en) begin
      _T_384_real <= _T_381_real;
    end
    if (io_en) begin
      _T_384_imag <= _T_381_imag;
    end
    if (io_en) begin
      _T_387_real <= _T_384_real;
    end
    if (io_en) begin
      _T_387_imag <= _T_384_imag;
    end
    if (io_en) begin
      _T_390_real <= _T_387_real;
    end
    if (io_en) begin
      _T_390_imag <= _T_387_imag;
    end
    if (io_en) begin
      _T_393_real <= _T_390_real;
    end
    if (io_en) begin
      _T_393_imag <= _T_390_imag;
    end
    if (io_en) begin
      _T_396_real <= _T_393_real;
    end
    if (io_en) begin
      _T_396_imag <= _T_393_imag;
    end
    if (io_en) begin
      _T_399_real <= _T_396_real;
    end
    if (io_en) begin
      _T_399_imag <= _T_396_imag;
    end
  end
endmodule
module SDFStageRadix22_8(
  input         clock,
  input         reset,
  input  [15:0] io_in_real,
  input  [15:0] io_in_imag,
  output [15:0] io_out_real,
  output [15:0] io_out_imag,
  input  [8:0]  io_cntr,
  input         io_en
);
  wire [7:0] SRAM_depth_256_width_32_mem_R0_addr; // @[ShiftRegisterMem.scala 48:28]
  wire  SRAM_depth_256_width_32_mem_R0_en; // @[ShiftRegisterMem.scala 48:28]
  wire  SRAM_depth_256_width_32_mem_R0_clk; // @[ShiftRegisterMem.scala 48:28]
  wire [15:0] SRAM_depth_256_width_32_mem_R0_data_real; // @[ShiftRegisterMem.scala 48:28]
  wire [15:0] SRAM_depth_256_width_32_mem_R0_data_imag; // @[ShiftRegisterMem.scala 48:28]
  wire [7:0] SRAM_depth_256_width_32_mem_W0_addr; // @[ShiftRegisterMem.scala 48:28]
  wire  SRAM_depth_256_width_32_mem_W0_en; // @[ShiftRegisterMem.scala 48:28]
  wire  SRAM_depth_256_width_32_mem_W0_clk; // @[ShiftRegisterMem.scala 48:28]
  wire [15:0] SRAM_depth_256_width_32_mem_W0_data_real; // @[ShiftRegisterMem.scala 48:28]
  wire [15:0] SRAM_depth_256_width_32_mem_W0_data_imag; // @[ShiftRegisterMem.scala 48:28]
  wire  load_input; // @[UIntTypeClass.scala 52:47]
  wire [15:0] feedback_real; // @[SDFChainRadix22.scala 470:23 SDFChainRadix22.scala 483:17]
  wire [16:0] butt_outputs_1_real; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_57; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_59; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_62; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_real; // @[FixedPointTypeClass.scala 176:41]
  wire [15:0] feedback_imag; // @[SDFChainRadix22.scala 470:23 SDFChainRadix22.scala 483:17]
  wire [16:0] butt_outputs_1_imag; // @[FixedPointTypeClass.scala 33:22]
  wire [17:0] _T_64; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_66; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_69; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butterfly_outputs_1_imag; // @[FixedPointTypeClass.scala 176:41]
  reg [7:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_0;
  wire [7:0] _T_22; // @[Counter.scala 39:22]
  reg [7:0] _T_26; // @[Reg.scala 27:20]
  reg [31:0] _RAND_1;
  wire [16:0] butt_outputs_0_real; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] butt_outputs_0_imag; // @[FixedPointTypeClass.scala 24:22]
  wire [17:0] _T_40; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_42; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_45; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_real; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _T_47; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [16:0] _T_49; // @[FixedPointTypeClass.scala 133:23]
  wire [16:0] _T_52; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] butt_out_0_imag; // @[FixedPointTypeClass.scala 176:41]
  SRAM_depth_256_width_32_mem SRAM_depth_256_width_32_mem ( // @[ShiftRegisterMem.scala 48:28]
    .R0_addr(SRAM_depth_256_width_32_mem_R0_addr),
    .R0_en(SRAM_depth_256_width_32_mem_R0_en),
    .R0_clk(SRAM_depth_256_width_32_mem_R0_clk),
    .R0_data_real(SRAM_depth_256_width_32_mem_R0_data_real),
    .R0_data_imag(SRAM_depth_256_width_32_mem_R0_data_imag),
    .W0_addr(SRAM_depth_256_width_32_mem_W0_addr),
    .W0_en(SRAM_depth_256_width_32_mem_W0_en),
    .W0_clk(SRAM_depth_256_width_32_mem_W0_clk),
    .W0_data_real(SRAM_depth_256_width_32_mem_W0_data_real),
    .W0_data_imag(SRAM_depth_256_width_32_mem_W0_data_imag)
  );
  assign load_input = io_cntr < 9'h100; // @[UIntTypeClass.scala 52:47]
  assign feedback_real = SRAM_depth_256_width_32_mem_R0_data_real; // @[SDFChainRadix22.scala 470:23 SDFChainRadix22.scala 483:17]
  assign butt_outputs_1_real = $signed(feedback_real) - $signed(io_in_real); // @[FixedPointTypeClass.scala 33:22]
  assign _T_57 = {$signed(butt_outputs_1_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_59 = _T_57[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_62 = $signed(_T_59) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_real = _T_62[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign feedback_imag = SRAM_depth_256_width_32_mem_R0_data_imag; // @[SDFChainRadix22.scala 470:23 SDFChainRadix22.scala 483:17]
  assign butt_outputs_1_imag = $signed(feedback_imag) - $signed(io_in_imag); // @[FixedPointTypeClass.scala 33:22]
  assign _T_64 = {$signed(butt_outputs_1_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_66 = _T_64[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_69 = $signed(_T_66) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butterfly_outputs_1_imag = _T_69[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_22 = value + 8'h1; // @[Counter.scala 39:22]
  assign butt_outputs_0_real = $signed(feedback_real) + $signed(io_in_real); // @[FixedPointTypeClass.scala 24:22]
  assign butt_outputs_0_imag = $signed(feedback_imag) + $signed(io_in_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_40 = {$signed(butt_outputs_0_real), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_42 = _T_40[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_45 = $signed(_T_42) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_real = _T_45[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_47 = {$signed(butt_outputs_0_imag), 1'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_49 = _T_47[17:1]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_52 = $signed(_T_49) + 17'sh1; // @[FixedPointTypeClass.scala 20:58]
  assign butt_out_0_imag = _T_52[16:1]; // @[FixedPointTypeClass.scala 176:41]
  assign io_out_real = load_input ? $signed(feedback_real) : $signed(butt_out_0_real); // @[SDFChainRadix22.scala 463:10]
  assign io_out_imag = load_input ? $signed(feedback_imag) : $signed(butt_out_0_imag); // @[SDFChainRadix22.scala 463:10]
  assign SRAM_depth_256_width_32_mem_R0_addr = value; // @[ShiftRegisterMem.scala 53:25]
  assign SRAM_depth_256_width_32_mem_R0_en = io_en; // @[ShiftRegisterMem.scala 48:28 Counter.scala 39:13]
  assign SRAM_depth_256_width_32_mem_R0_clk = clock; // @[ShiftRegisterMem.scala 53:25]
  assign SRAM_depth_256_width_32_mem_W0_addr = _T_26;
  assign SRAM_depth_256_width_32_mem_W0_en = io_en; // @[ShiftRegisterMem.scala 48:28]
  assign SRAM_depth_256_width_32_mem_W0_clk = clock;
  assign SRAM_depth_256_width_32_mem_W0_data_real = load_input ? $signed(io_in_real) : $signed(butterfly_outputs_1_real);
  assign SRAM_depth_256_width_32_mem_W0_data_imag = load_input ? $signed(io_in_imag) : $signed(butterfly_outputs_1_imag);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  value = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_26 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      value <= 8'h0;
    end else if (io_en) begin
      value <= _T_22;
    end
    if (reset) begin
      _T_26 <= 8'hff;
    end else if (io_en) begin
      _T_26 <= value;
    end
  end
endmodule
module SDFChainRadix22(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_real,
  input  [15:0] io_in_bits_imag,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_real,
  output [15:0] io_out_bits_imag,
  output        io_lastOut,
  input         io_lastIn,
  output        io_busy
);
  wire  sdf_stages_0_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_0_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_0_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_0_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_0_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_0_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_0_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_1_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_1_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_1_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_1_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_1_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_1_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_1_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_2_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_2_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_2_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_2_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_2_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_2_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_2_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_3_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_3_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_3_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_3_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_3_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_3_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_3_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_4_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_4_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_4_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_4_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_4_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_4_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_4_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_5_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_5_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_5_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_5_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_5_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_5_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_5_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_6_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_6_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_6_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_6_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_6_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_6_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_6_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_7_clock; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_7_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_7_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_7_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_7_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_7_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_7_io_en; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_8_clock; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_8_reset; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_8_io_in_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_8_io_in_imag; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_8_io_out_real; // @[SDFChainRadix22.scala 164:25]
  wire [15:0] sdf_stages_8_io_out_imag; // @[SDFChainRadix22.scala 164:25]
  wire [8:0] sdf_stages_8_io_cntr; // @[SDFChainRadix22.scala 164:25]
  wire  sdf_stages_8_io_en; // @[SDFChainRadix22.scala 164:25]
  reg [1:0] state; // @[SDFChainRadix22.scala 56:22]
  reg [31:0] _RAND_0;
  reg  initialOutDone; // @[SDFChainRadix22.scala 59:31]
  reg [31:0] _RAND_1;
  reg [9:0] cnt; // @[SDFChainRadix22.scala 60:20]
  reg [31:0] _RAND_2;
  wire  _T_46; // @[Decoupled.scala 40:37]
  wire  fireLast; // @[SDFChainRadix22.scala 79:28]
  wire [8:0] _T_48; // @[SDFChainRadix22.scala 81:45]
  wire  _T_53; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_0; // @[SDFChainRadix22.scala 90:27]
  wire  _T_56; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_1; // @[SDFChainRadix22.scala 93:23]
  wire  _T_57; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_2; // @[SDFChainRadix22.scala 98:25]
  wire [1:0] _GEN_3; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_4; // @[Conditional.scala 39:67]
  wire [1:0] state_next; // @[Conditional.scala 40:58]
  reg [8:0] cntValidOut; // @[SDFChainRadix22.scala 106:28]
  reg [31:0] _RAND_3;
  wire [9:0] _T_59; // @[SDFChainRadix22.scala 111:44]
  wire [9:0] _GEN_2109; // @[SDFChainRadix22.scala 111:29]
  wire  _T_60; // @[SDFChainRadix22.scala 111:29]
  wire  _T_61; // @[Decoupled.scala 40:37]
  wire  pktEnd; // @[SDFChainRadix22.scala 111:52]
  wire  _T_62; // @[SDFChainRadix22.scala 114:20]
  wire [8:0] cntr_wires_0; // @[SDFChainRadix22.scala 52:24 SDFChainRadix22.scala 185:29]
  wire [8:0] _GEN_20; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_21; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_22; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_23; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_24; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_25; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_26; // @[SDFChainRadix22.scala 126:79]
  wire [8:0] _GEN_27; // @[SDFChainRadix22.scala 126:79]
  wire [9:0] _GEN_2110; // @[SDFChainRadix22.scala 126:79]
  wire  _T_76; // @[SDFChainRadix22.scala 130:31]
  wire  _T_77; // @[SDFChainRadix22.scala 130:42]
  wire [8:0] _T_80; // @[SDFChainRadix22.scala 134:32]
  wire  _T_83; // @[SDFChainRadix22.scala 144:90]
  wire  _T_122; // @[SDFChainRadix22.scala 173:54]
  wire  enableInit; // @[SDFChainRadix22.scala 173:33]
  wire [9:0] _T_125; // @[SDFChainRadix22.scala 179:16]
  wire [9:0] _T_145; // @[SDFChainRadix22.scala 193:37]
  wire  _T_146; // @[SDFChainRadix22.scala 193:22]
  wire  _T_147; // @[SDFChainRadix22.scala 193:44]
  wire  _GEN_45; // @[SDFChainRadix22.scala 196:36]
  wire  _GEN_46; // @[SDFChainRadix22.scala 193:60]
  wire [8:0] _T_166; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_171; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_173; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_178; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_180; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_185; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_187; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_192; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_194; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_199; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_201; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_206; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_208; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_213; // @[SDFChainRadix22.scala 224:68]
  wire [8:0] _T_215; // @[SDFChainRadix22.scala 224:38]
  wire [8:0] _T_220; // @[SDFChainRadix22.scala 224:68]
  wire [1:0] _GEN_52; // @[SDFChainRadix22.scala 291:27]
  wire [1:0] _GEN_53; // @[SDFChainRadix22.scala 291:27]
  wire [1:0] _GEN_54; // @[SDFChainRadix22.scala 291:27]
  wire [1:0] _GEN_55; // @[SDFChainRadix22.scala 291:27]
  wire [1:0] _GEN_56; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_59; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_60; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_61; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_62; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_63; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] twiddles_1_imag; // @[SDFChainRadix22.scala 291:27]
  wire [16:0] _T_261; // @[FixedPointTypeClass.scala 24:22]
  wire [15:0] outputWires_0_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 348:32]
  wire [15:0] outputWires_0_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 348:32]
  wire [16:0] _T_262; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] _T_263; // @[FixedPointTypeClass.scala 33:22]
  wire [16:0] _GEN_2112; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_264; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2113; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_265; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2114; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_266; // @[FixedPointTypeClass.scala 211:35]
  wire [33:0] _T_267; // @[FixedPointTypeClass.scala 33:22]
  wire [33:0] _T_268; // @[FixedPointTypeClass.scala 24:22]
  wire [33:0] _T_274; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_275; // @[FixedPointTypeClass.scala 176:41]
  wire [33:0] _T_278; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_279; // @[FixedPointTypeClass.scala 176:41]
  wire  _T_286; // @[SDFChainRadix22.scala 328:32]
  wire  _T_287; // @[SDFChainRadix22.scala 328:78]
  wire  _T_288; // @[SDFChainRadix22.scala 328:65]
  wire  _T_289; // @[SDFChainRadix22.scala 328:19]
  wire [15:0] outputWires_1_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [15:0] _T_295; // @[FixedPointTypeClass.scala 39:43]
  wire [15:0] outputWires_1_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [3:0] _GEN_82; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_83; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_84; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_85; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_86; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_87; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_88; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_89; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_90; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_91; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_92; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_93; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_94; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_95; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_96; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_97; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_98; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_99; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_100; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_101; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_102; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_103; // @[SDFChainRadix22.scala 291:27]
  wire [3:0] _GEN_104; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_107; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_108; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_109; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_110; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_111; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_112; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_113; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_114; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_115; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_116; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_117; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_118; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_119; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_120; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_121; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_122; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_123; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_124; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_125; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_126; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_127; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_128; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_129; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_130; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_131; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_132; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_133; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_134; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_135; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] twiddles_3_imag; // @[SDFChainRadix22.scala 291:27]
  wire [16:0] _T_393; // @[FixedPointTypeClass.scala 24:22]
  wire [15:0] outputWires_2_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [15:0] outputWires_2_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [16:0] _T_394; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] _T_395; // @[FixedPointTypeClass.scala 33:22]
  wire [16:0] _GEN_2115; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_396; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2116; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_397; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2117; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_398; // @[FixedPointTypeClass.scala 211:35]
  wire [33:0] _T_399; // @[FixedPointTypeClass.scala 33:22]
  wire [33:0] _T_400; // @[FixedPointTypeClass.scala 24:22]
  wire [33:0] _T_406; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_407; // @[FixedPointTypeClass.scala 176:41]
  wire [33:0] _T_410; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_411; // @[FixedPointTypeClass.scala 176:41]
  wire  _T_418; // @[SDFChainRadix22.scala 328:32]
  wire  _T_419; // @[SDFChainRadix22.scala 328:78]
  wire  _T_420; // @[SDFChainRadix22.scala 328:65]
  wire  _T_421; // @[SDFChainRadix22.scala 328:19]
  wire [15:0] outputWires_3_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [15:0] _T_427; // @[FixedPointTypeClass.scala 39:43]
  wire [15:0] outputWires_3_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [5:0] _GEN_202; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_203; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_204; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_205; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_206; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_207; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_208; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_209; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_210; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_211; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_212; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_213; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_214; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_215; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_216; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_217; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_218; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_219; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_220; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_221; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_222; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_223; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_224; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_225; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_226; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_227; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_228; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_229; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_230; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_231; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_232; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_233; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_234; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_235; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_236; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_237; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_238; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_239; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_240; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_241; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_242; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_243; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_244; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_245; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_246; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_247; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_248; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_249; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_250; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_251; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_252; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_253; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_254; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_255; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_256; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_257; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_258; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_259; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_260; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_261; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_262; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_263; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_264; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_265; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_266; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_267; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_268; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_269; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_270; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_271; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_272; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_273; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_274; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_275; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_276; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_277; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_278; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_279; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_280; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_281; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_282; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_283; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_284; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_285; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_286; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_287; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_288; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_289; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_290; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_291; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_292; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_293; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_294; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_295; // @[SDFChainRadix22.scala 291:27]
  wire [5:0] _GEN_296; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_299; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_300; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_301; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_302; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_303; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_304; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_305; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_306; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_307; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_308; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_309; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_310; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_311; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_312; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_313; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_314; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_315; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_316; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_317; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_318; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_319; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_320; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_321; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_322; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_323; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_324; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_325; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_326; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_327; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_328; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_329; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_330; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_331; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_332; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_333; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_334; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_335; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_336; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_337; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_338; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_339; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_340; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_341; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_342; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_343; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_344; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_345; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_346; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_347; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_348; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_349; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_350; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_351; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_352; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_353; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_354; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_355; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_356; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_357; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_358; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_359; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_360; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_361; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_362; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_363; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_364; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_365; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_366; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_367; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_368; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_369; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_370; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_371; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_372; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_373; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_374; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_375; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_376; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_377; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_378; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_379; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_380; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_381; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_382; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_383; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_384; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_385; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_386; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_387; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_388; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_389; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_390; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_391; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_392; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_393; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_394; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_395; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_396; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_397; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_398; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_399; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_400; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_401; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_402; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_403; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_404; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_405; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_406; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_407; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_408; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_409; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_410; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_411; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_412; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_413; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_414; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_415; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_416; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_417; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_418; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_419; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_420; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_421; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_422; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_423; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] twiddles_5_imag; // @[SDFChainRadix22.scala 291:27]
  wire [16:0] _T_765; // @[FixedPointTypeClass.scala 24:22]
  wire [15:0] outputWires_4_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [15:0] outputWires_4_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [16:0] _T_766; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] _T_767; // @[FixedPointTypeClass.scala 33:22]
  wire [16:0] _GEN_2118; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_768; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2119; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_769; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2120; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_770; // @[FixedPointTypeClass.scala 211:35]
  wire [33:0] _T_771; // @[FixedPointTypeClass.scala 33:22]
  wire [33:0] _T_772; // @[FixedPointTypeClass.scala 24:22]
  wire [33:0] _T_778; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_779; // @[FixedPointTypeClass.scala 176:41]
  wire [33:0] _T_782; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_783; // @[FixedPointTypeClass.scala 176:41]
  wire  _T_790; // @[SDFChainRadix22.scala 328:32]
  wire  _T_791; // @[SDFChainRadix22.scala 328:78]
  wire  _T_792; // @[SDFChainRadix22.scala 328:65]
  wire  _T_793; // @[SDFChainRadix22.scala 328:19]
  wire [15:0] outputWires_5_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [15:0] _T_799; // @[FixedPointTypeClass.scala 39:43]
  wire [15:0] outputWires_5_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [7:0] _GEN_682; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_683; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_684; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_685; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_686; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_687; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_688; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_689; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_690; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_691; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_692; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_693; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_694; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_695; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_696; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_697; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_698; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_699; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_700; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_701; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_702; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_703; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_704; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_705; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_706; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_707; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_708; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_709; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_710; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_711; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_712; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_713; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_714; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_715; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_716; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_717; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_718; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_719; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_720; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_721; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_722; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_723; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_724; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_725; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_726; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_727; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_728; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_729; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_730; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_731; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_732; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_733; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_734; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_735; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_736; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_737; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_738; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_739; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_740; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_741; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_742; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_743; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_744; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_745; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_746; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_747; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_748; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_749; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_750; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_751; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_752; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_753; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_754; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_755; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_756; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_757; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_758; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_759; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_760; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_761; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_762; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_763; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_764; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_765; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_766; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_767; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_768; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_769; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_770; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_771; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_772; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_773; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_774; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_775; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_776; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_777; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_778; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_779; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_780; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_781; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_782; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_783; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_784; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_785; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_786; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_787; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_788; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_789; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_790; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_791; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_792; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_793; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_794; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_795; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_796; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_797; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_798; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_799; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_800; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_801; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_802; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_803; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_804; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_805; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_806; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_807; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_808; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_809; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_810; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_811; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_812; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_813; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_814; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_815; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_816; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_817; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_818; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_819; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_820; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_821; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_822; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_823; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_824; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_825; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_826; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_827; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_828; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_829; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_830; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_831; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_832; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_833; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_834; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_835; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_836; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_837; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_838; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_839; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_840; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_841; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_842; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_843; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_844; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_845; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_846; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_847; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_848; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_849; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_850; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_851; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_852; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_853; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_854; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_855; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_856; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_857; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_858; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_859; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_860; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_861; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_862; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_863; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_864; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_865; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_866; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_867; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_868; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_869; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_870; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_871; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_872; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_873; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_874; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_875; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_876; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_877; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_878; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_879; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_880; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_881; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_882; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_883; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_884; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_885; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_886; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_887; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_888; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_889; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_890; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_891; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_892; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_893; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_894; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_895; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_896; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_897; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_898; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_899; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_900; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_901; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_902; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_903; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_904; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_905; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_906; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_907; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_908; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_909; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_910; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_911; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_912; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_913; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_914; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_915; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_916; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_917; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_918; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_919; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_920; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_921; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_922; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_923; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_924; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_925; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_926; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_927; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_928; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_929; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_930; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_931; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_932; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_933; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_934; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_935; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_936; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_937; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_938; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_939; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_940; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_941; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_942; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_943; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_944; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_945; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_946; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_947; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_948; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_949; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_950; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_951; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_952; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_953; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_954; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_955; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_956; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_957; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_958; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_959; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_960; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_961; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_962; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_963; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_964; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_965; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_966; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_967; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_968; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_969; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_970; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_971; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_972; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_973; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_974; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_975; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_976; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_977; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_978; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_979; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_980; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_981; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_982; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_983; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_984; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_985; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_986; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_987; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_988; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_989; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_990; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_991; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_992; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_993; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_994; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_995; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_996; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_997; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_998; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_999; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1000; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1001; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1002; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1003; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1004; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1005; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1006; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1007; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1008; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1009; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1010; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1011; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1012; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1013; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1014; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1015; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1016; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1017; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1018; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1019; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1020; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1021; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1022; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1023; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1024; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1025; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1026; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1027; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1028; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1029; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1030; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1031; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1032; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1033; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1034; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1035; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1036; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1037; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1038; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1039; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1040; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1041; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1042; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1043; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1044; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1045; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1046; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1047; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1048; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1049; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1050; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1051; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1052; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1053; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1054; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1055; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1056; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1057; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1058; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1059; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1060; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1061; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1062; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1063; // @[SDFChainRadix22.scala 291:27]
  wire [7:0] _GEN_1064; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1067; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1068; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1069; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1070; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1071; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1072; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1073; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1074; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1075; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1076; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1077; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1078; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1079; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1080; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1081; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1082; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1083; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1084; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1085; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1086; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1087; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1088; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1089; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1090; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1091; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1092; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1093; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1094; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1095; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1096; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1097; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1098; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1099; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1100; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1101; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1102; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1103; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1104; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1105; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1106; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1107; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1108; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1109; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1110; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1111; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1112; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1113; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1114; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1115; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1116; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1117; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1118; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1119; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1120; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1121; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1122; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1123; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1124; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1125; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1126; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1127; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1128; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1129; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1130; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1131; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1132; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1133; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1134; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1135; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1136; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1137; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1138; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1139; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1140; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1141; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1142; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1143; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1144; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1145; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1146; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1147; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1148; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1149; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1150; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1151; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1152; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1153; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1154; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1155; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1156; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1157; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1158; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1159; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1160; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1161; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1162; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1163; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1164; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1165; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1166; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1167; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1168; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1169; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1170; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1171; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1172; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1173; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1174; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1175; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1176; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1177; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1178; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1179; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1180; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1181; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1182; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1183; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1184; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1185; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1186; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1187; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1188; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1189; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1190; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1191; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1192; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1193; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1194; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1195; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1196; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1197; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1198; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1199; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1200; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1201; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1202; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1203; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1204; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1205; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1206; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1207; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1208; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1209; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1210; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1211; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1212; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1213; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1214; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1215; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1216; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1217; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1218; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1219; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1220; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1221; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1222; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1223; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1224; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1225; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1226; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1227; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1228; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1229; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1230; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1231; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1232; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1233; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1234; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1235; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1236; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1237; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1238; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1239; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1240; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1241; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1242; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1243; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1244; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1245; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1246; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1247; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1248; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1249; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1250; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1251; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1252; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1253; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1254; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1255; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1256; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1257; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1258; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1259; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1260; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1261; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1262; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1263; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1264; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1265; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1266; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1267; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1268; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1269; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1270; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1271; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1272; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1273; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1274; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1275; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1276; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1277; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1278; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1279; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1280; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1281; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1282; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1283; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1284; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1285; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1286; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1287; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1288; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1289; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1290; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1291; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1292; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1293; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1294; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1295; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1296; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1297; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1298; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1299; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1300; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1301; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1302; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1303; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1304; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1305; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1306; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1307; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1308; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1309; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1310; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1311; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1312; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1313; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1314; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1315; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1316; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1317; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1318; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1319; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1320; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1321; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1322; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1323; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1324; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1325; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1326; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1327; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1328; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1329; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1330; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1331; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1332; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1333; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1334; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1335; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1336; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1337; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1338; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1339; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1340; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1341; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1342; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1343; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1344; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1345; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1346; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1347; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1348; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1349; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1350; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1351; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1352; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1353; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1354; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1355; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1356; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1357; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1358; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1359; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1360; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1361; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1362; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1363; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1364; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1365; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1366; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1367; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1368; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1369; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1370; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1371; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1372; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1373; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1374; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1375; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1376; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1377; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1378; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1379; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1380; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1381; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1382; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1383; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1384; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1385; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1386; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1387; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1388; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1389; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1390; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1391; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1392; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1393; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1394; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1395; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1396; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1397; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1398; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1399; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1400; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1401; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1402; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1403; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1404; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1405; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1406; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1407; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1408; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1409; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1410; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1411; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1412; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1413; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1414; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1415; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1416; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1417; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1418; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1419; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1420; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1421; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1422; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1423; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1424; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1425; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1426; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1427; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1428; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1429; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1430; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1431; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1432; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1433; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1434; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1435; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1436; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1437; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1438; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1439; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1440; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1441; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1442; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1443; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1444; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1445; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1446; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1447; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1448; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1449; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1450; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1451; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1452; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1453; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1454; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1455; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1456; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1457; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1458; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1459; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1460; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1461; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1462; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1463; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1464; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1465; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1466; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1467; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1468; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1469; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1470; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1471; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1472; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1473; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1474; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1475; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1476; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1477; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1478; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1479; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1480; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1481; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1482; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1483; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1484; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1485; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1486; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1487; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1488; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1489; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1490; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1491; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1492; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1493; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1494; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1495; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1496; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1497; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1498; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1499; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1500; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1501; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1502; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1503; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1504; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1505; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1506; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1507; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1508; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1509; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1510; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1511; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1512; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1513; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1514; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1515; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1516; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1517; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1518; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1519; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1520; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1521; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1522; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1523; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1524; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1525; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1526; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1527; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1528; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1529; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1530; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1531; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1532; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1533; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1534; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1535; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1536; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1537; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1538; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1539; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1540; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1541; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1542; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1543; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1544; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1545; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1546; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1547; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1548; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1549; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1550; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1551; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1552; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1553; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1554; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1555; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1556; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1557; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1558; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1559; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1560; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1561; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1562; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1563; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1564; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1565; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1566; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1567; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1568; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1569; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1570; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1571; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1572; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1573; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1574; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] _GEN_1575; // @[SDFChainRadix22.scala 291:27]
  wire [15:0] twiddles_7_imag; // @[SDFChainRadix22.scala 291:27]
  wire [16:0] _T_2096; // @[FixedPointTypeClass.scala 24:22]
  wire [15:0] outputWires_6_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [15:0] outputWires_6_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [16:0] _T_2097; // @[FixedPointTypeClass.scala 24:22]
  wire [16:0] _T_2098; // @[FixedPointTypeClass.scala 33:22]
  wire [16:0] _GEN_2121; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_2099; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2122; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_2100; // @[FixedPointTypeClass.scala 211:35]
  wire [16:0] _GEN_2123; // @[FixedPointTypeClass.scala 211:35]
  wire [32:0] _T_2101; // @[FixedPointTypeClass.scala 211:35]
  wire [33:0] _T_2102; // @[FixedPointTypeClass.scala 33:22]
  wire [33:0] _T_2103; // @[FixedPointTypeClass.scala 24:22]
  wire [33:0] _T_2109; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_2110; // @[FixedPointTypeClass.scala 176:41]
  wire [33:0] _T_2113; // @[FixedPointTypeClass.scala 20:58]
  wire [19:0] _T_2114; // @[FixedPointTypeClass.scala 176:41]
  wire  _T_2121; // @[SDFChainRadix22.scala 328:32]
  wire  _T_2122; // @[SDFChainRadix22.scala 328:78]
  wire  _T_2123; // @[SDFChainRadix22.scala 328:65]
  wire  _T_2124; // @[SDFChainRadix22.scala 328:19]
  wire [15:0] outputWires_7_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [15:0] _T_2130; // @[FixedPointTypeClass.scala 39:43]
  wire [15:0] outputWires_7_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  wire [15:0] _GEN_2091; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2092; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2093; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2094; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2095; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2096; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2097; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2098; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2099; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2100; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2101; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2102; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2103; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] _GEN_2104; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] outputWires_8_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [15:0] _GEN_2105; // @[SDFChainRadix22.scala 364:24]
  wire [15:0] outputWires_8_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  wire [15:0] _GEN_2106; // @[SDFChainRadix22.scala 364:24]
  wire  _T_2140; // @[SDFChainRadix22.scala 368:33]
  wire  _T_2141; // @[SDFChainRadix22.scala 368:127]
  wire  _T_2142; // @[SDFChainRadix22.scala 368:117]
  wire [29:0] _GEN_2124; // @[SDFChainRadix22.scala 375:33]
  wire [31:0] _GEN_2107; // @[SDFChainRadix22.scala 375:33]
  wire [29:0] _GEN_2125; // @[SDFChainRadix22.scala 375:33]
  wire [31:0] _GEN_2108; // @[SDFChainRadix22.scala 375:33]
  wire [17:0] _GEN_2126; // @[SDFChainRadix22.scala 63:26 SDFChainRadix22.scala 384:22 SDFChainRadix22.scala 396:27]
  wire [17:0] _GEN_2128; // @[SDFChainRadix22.scala 63:26 SDFChainRadix22.scala 384:22 SDFChainRadix22.scala 397:27]
  SDFStageRadix22 sdf_stages_0 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_0_clock),
    .io_in_real(sdf_stages_0_io_in_real),
    .io_in_imag(sdf_stages_0_io_in_imag),
    .io_out_real(sdf_stages_0_io_out_real),
    .io_out_imag(sdf_stages_0_io_out_imag),
    .io_cntr(sdf_stages_0_io_cntr),
    .io_en(sdf_stages_0_io_en)
  );
  SDFStageRadix22_1 sdf_stages_1 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_1_clock),
    .io_in_real(sdf_stages_1_io_in_real),
    .io_in_imag(sdf_stages_1_io_in_imag),
    .io_out_real(sdf_stages_1_io_out_real),
    .io_out_imag(sdf_stages_1_io_out_imag),
    .io_cntr(sdf_stages_1_io_cntr),
    .io_en(sdf_stages_1_io_en)
  );
  SDFStageRadix22_2 sdf_stages_2 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_2_clock),
    .io_in_real(sdf_stages_2_io_in_real),
    .io_in_imag(sdf_stages_2_io_in_imag),
    .io_out_real(sdf_stages_2_io_out_real),
    .io_out_imag(sdf_stages_2_io_out_imag),
    .io_cntr(sdf_stages_2_io_cntr),
    .io_en(sdf_stages_2_io_en)
  );
  SDFStageRadix22_3 sdf_stages_3 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_3_clock),
    .io_in_real(sdf_stages_3_io_in_real),
    .io_in_imag(sdf_stages_3_io_in_imag),
    .io_out_real(sdf_stages_3_io_out_real),
    .io_out_imag(sdf_stages_3_io_out_imag),
    .io_cntr(sdf_stages_3_io_cntr),
    .io_en(sdf_stages_3_io_en)
  );
  SDFStageRadix22_4 sdf_stages_4 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_4_clock),
    .io_in_real(sdf_stages_4_io_in_real),
    .io_in_imag(sdf_stages_4_io_in_imag),
    .io_out_real(sdf_stages_4_io_out_real),
    .io_out_imag(sdf_stages_4_io_out_imag),
    .io_cntr(sdf_stages_4_io_cntr),
    .io_en(sdf_stages_4_io_en)
  );
  SDFStageRadix22_5 sdf_stages_5 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_5_clock),
    .io_in_real(sdf_stages_5_io_in_real),
    .io_in_imag(sdf_stages_5_io_in_imag),
    .io_out_real(sdf_stages_5_io_out_real),
    .io_out_imag(sdf_stages_5_io_out_imag),
    .io_cntr(sdf_stages_5_io_cntr),
    .io_en(sdf_stages_5_io_en)
  );
  SDFStageRadix22_6 sdf_stages_6 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_6_clock),
    .io_in_real(sdf_stages_6_io_in_real),
    .io_in_imag(sdf_stages_6_io_in_imag),
    .io_out_real(sdf_stages_6_io_out_real),
    .io_out_imag(sdf_stages_6_io_out_imag),
    .io_cntr(sdf_stages_6_io_cntr),
    .io_en(sdf_stages_6_io_en)
  );
  SDFStageRadix22_7 sdf_stages_7 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_7_clock),
    .io_in_real(sdf_stages_7_io_in_real),
    .io_in_imag(sdf_stages_7_io_in_imag),
    .io_out_real(sdf_stages_7_io_out_real),
    .io_out_imag(sdf_stages_7_io_out_imag),
    .io_cntr(sdf_stages_7_io_cntr),
    .io_en(sdf_stages_7_io_en)
  );
  SDFStageRadix22_8 sdf_stages_8 ( // @[SDFChainRadix22.scala 164:25]
    .clock(sdf_stages_8_clock),
    .reset(sdf_stages_8_reset),
    .io_in_real(sdf_stages_8_io_in_real),
    .io_in_imag(sdf_stages_8_io_in_imag),
    .io_out_real(sdf_stages_8_io_out_real),
    .io_out_imag(sdf_stages_8_io_out_imag),
    .io_cntr(sdf_stages_8_io_cntr),
    .io_en(sdf_stages_8_io_en)
  );
  assign _T_46 = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  assign fireLast = io_lastIn & _T_46; // @[SDFChainRadix22.scala 79:28]
  assign _T_48 = 9'h9 - 9'h1; // @[SDFChainRadix22.scala 81:45]
  assign _T_53 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _GEN_0 = _T_46 ? 2'h1 : state; // @[SDFChainRadix22.scala 90:27]
  assign _T_56 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _GEN_1 = fireLast ? 2'h2 : state; // @[SDFChainRadix22.scala 93:23]
  assign _T_57 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign _GEN_2 = io_lastOut ? 2'h0 : state; // @[SDFChainRadix22.scala 98:25]
  assign _GEN_3 = _T_57 ? _GEN_2 : state; // @[Conditional.scala 39:67]
  assign _GEN_4 = _T_56 ? _GEN_1 : _GEN_3; // @[Conditional.scala 39:67]
  assign state_next = _T_53 ? _GEN_0 : _GEN_4; // @[Conditional.scala 40:58]
  assign _T_59 = 10'h200 - 10'h1; // @[SDFChainRadix22.scala 111:44]
  assign _GEN_2109 = {{1'd0}, cntValidOut}; // @[SDFChainRadix22.scala 111:29]
  assign _T_60 = _GEN_2109 == _T_59; // @[SDFChainRadix22.scala 111:29]
  assign _T_61 = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  assign pktEnd = _T_60 & _T_61; // @[SDFChainRadix22.scala 111:52]
  assign _T_62 = state_next == 2'h0; // @[SDFChainRadix22.scala 114:20]
  assign cntr_wires_0 = cnt[8:0]; // @[SDFChainRadix22.scala 52:24 SDFChainRadix22.scala 185:29]
  assign _GEN_20 = 4'h1 == _T_48[3:0] ? cntr_wires_0 : cntr_wires_0; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_21 = 4'h2 == _T_48[3:0] ? cntr_wires_0 : _GEN_20; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_22 = 4'h3 == _T_48[3:0] ? cntr_wires_0 : _GEN_21; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_23 = 4'h4 == _T_48[3:0] ? cntr_wires_0 : _GEN_22; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_24 = 4'h5 == _T_48[3:0] ? cntr_wires_0 : _GEN_23; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_25 = 4'h6 == _T_48[3:0] ? cntr_wires_0 : _GEN_24; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_26 = 4'h7 == _T_48[3:0] ? cntr_wires_0 : _GEN_25; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_27 = 4'h8 == _T_48[3:0] ? cntr_wires_0 : _GEN_26; // @[SDFChainRadix22.scala 126:79]
  assign _GEN_2110 = {{1'd0}, _GEN_27}; // @[SDFChainRadix22.scala 126:79]
  assign _T_76 = _T_62 & pktEnd; // @[SDFChainRadix22.scala 130:31]
  assign _T_77 = _T_76 | pktEnd; // @[SDFChainRadix22.scala 130:42]
  assign _T_80 = cntValidOut + 9'h1; // @[SDFChainRadix22.scala 134:32]
  assign _T_83 = state == 2'h2; // @[SDFChainRadix22.scala 144:90]
  assign _T_122 = _T_83 & io_out_ready; // @[SDFChainRadix22.scala 173:54]
  assign enableInit = _T_46 | _T_122; // @[SDFChainRadix22.scala 173:33]
  assign _T_125 = cnt + 10'h1; // @[SDFChainRadix22.scala 179:16]
  assign _T_145 = 10'h200 - 10'h2; // @[SDFChainRadix22.scala 193:37]
  assign _T_146 = _GEN_2110 == _T_145; // @[SDFChainRadix22.scala 193:22]
  assign _T_147 = _T_146 & enableInit; // @[SDFChainRadix22.scala 193:44]
  assign _GEN_45 = _T_62 ? 1'h0 : initialOutDone; // @[SDFChainRadix22.scala 196:36]
  assign _GEN_46 = _T_147 | _GEN_45; // @[SDFChainRadix22.scala 193:60]
  assign _T_166 = cntr_wires_0 - 9'h0; // @[SDFChainRadix22.scala 224:38]
  assign _T_171 = 9'h1 - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_173 = cntr_wires_0 - _T_171; // @[SDFChainRadix22.scala 224:38]
  assign _T_178 = 9'h3 - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_180 = cntr_wires_0 - _T_178; // @[SDFChainRadix22.scala 224:38]
  assign _T_185 = 9'h7 - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_187 = cntr_wires_0 - _T_185; // @[SDFChainRadix22.scala 224:38]
  assign _T_192 = 9'hf - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_194 = cntr_wires_0 - _T_192; // @[SDFChainRadix22.scala 224:38]
  assign _T_199 = 9'h1f - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_201 = cntr_wires_0 - _T_199; // @[SDFChainRadix22.scala 224:38]
  assign _T_206 = 9'h3f - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_208 = cntr_wires_0 - _T_206; // @[SDFChainRadix22.scala 224:38]
  assign _T_213 = 9'h7f - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _T_215 = cntr_wires_0 - _T_213; // @[SDFChainRadix22.scala 224:38]
  assign _T_220 = 9'hff - 9'h0; // @[SDFChainRadix22.scala 224:68]
  assign _GEN_52 = 3'h3 == _T_173[2:0] ? 2'h2 : 2'h0; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_53 = 3'h4 == _T_173[2:0] ? 2'h0 : _GEN_52; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_54 = 3'h5 == _T_173[2:0] ? 2'h1 : _GEN_53; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_55 = 3'h6 == _T_173[2:0] ? 2'h0 : _GEN_54; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_56 = 3'h7 == _T_173[2:0] ? 2'h3 : _GEN_55; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_59 = 2'h1 == _GEN_56 ? $signed(16'sh2d41) : $signed(16'sh4000); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_60 = 2'h1 == _GEN_56 ? $signed(-16'sh2d41) : $signed(16'sh0); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_61 = 2'h2 == _GEN_56 ? $signed(16'sh0) : $signed(_GEN_59); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_62 = 2'h2 == _GEN_56 ? $signed(-16'sh4000) : $signed(_GEN_60); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_63 = 2'h3 == _GEN_56 ? $signed(-16'sh2d41) : $signed(_GEN_61); // @[SDFChainRadix22.scala 291:27]
  assign twiddles_1_imag = 2'h3 == _GEN_56 ? $signed(-16'sh2d41) : $signed(_GEN_62); // @[SDFChainRadix22.scala 291:27]
  assign _T_261 = $signed(_GEN_63) + $signed(twiddles_1_imag); // @[FixedPointTypeClass.scala 24:22]
  assign outputWires_0_real = sdf_stages_0_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 348:32]
  assign outputWires_0_imag = sdf_stages_0_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 348:32]
  assign _T_262 = $signed(outputWires_0_real) + $signed(outputWires_0_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_263 = $signed(outputWires_0_imag) - $signed(outputWires_0_real); // @[FixedPointTypeClass.scala 33:22]
  assign _GEN_2112 = {{1{outputWires_0_real[15]}},outputWires_0_real}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_264 = $signed(_GEN_2112) * $signed(_T_261); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2113 = {{1{twiddles_1_imag[15]}},twiddles_1_imag}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_265 = $signed(_T_262) * $signed(_GEN_2113); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2114 = {{1{_GEN_63[15]}},_GEN_63}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_266 = $signed(_T_263) * $signed(_GEN_2114); // @[FixedPointTypeClass.scala 211:35]
  assign _T_267 = $signed(_T_264) - $signed(_T_265); // @[FixedPointTypeClass.scala 33:22]
  assign _T_268 = $signed(_T_264) + $signed(_T_266); // @[FixedPointTypeClass.scala 24:22]
  assign _T_274 = $signed(_T_267) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_275 = _T_274[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_278 = $signed(_T_268) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_279 = _T_278[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_286 = sdf_stages_2_io_cntr < 9'h4; // @[SDFChainRadix22.scala 328:32]
  assign _T_287 = sdf_stages_2_io_cntr < 9'h6; // @[SDFChainRadix22.scala 328:78]
  assign _T_288 = _T_287 ? 1'h0 : 1'h1; // @[SDFChainRadix22.scala 328:65]
  assign _T_289 = _T_286 ? 1'h0 : _T_288; // @[SDFChainRadix22.scala 328:19]
  assign outputWires_1_real = sdf_stages_1_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _T_295 = 16'sh0 - $signed(outputWires_1_real); // @[FixedPointTypeClass.scala 39:43]
  assign outputWires_1_imag = sdf_stages_1_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _GEN_82 = 5'h9 == _T_187[4:0] ? 4'h2 : 4'h0; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_83 = 5'ha == _T_187[4:0] ? 4'h4 : _GEN_82; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_84 = 5'hb == _T_187[4:0] ? 4'h6 : _GEN_83; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_85 = 5'hc == _T_187[4:0] ? 4'h8 : _GEN_84; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_86 = 5'hd == _T_187[4:0] ? 4'ha : _GEN_85; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_87 = 5'he == _T_187[4:0] ? 4'hb : _GEN_86; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_88 = 5'hf == _T_187[4:0] ? 4'hc : _GEN_87; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_89 = 5'h10 == _T_187[4:0] ? 4'h0 : _GEN_88; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_90 = 5'h11 == _T_187[4:0] ? 4'h1 : _GEN_89; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_91 = 5'h12 == _T_187[4:0] ? 4'h2 : _GEN_90; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_92 = 5'h13 == _T_187[4:0] ? 4'h3 : _GEN_91; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_93 = 5'h14 == _T_187[4:0] ? 4'h4 : _GEN_92; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_94 = 5'h15 == _T_187[4:0] ? 4'h5 : _GEN_93; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_95 = 5'h16 == _T_187[4:0] ? 4'h6 : _GEN_94; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_96 = 5'h17 == _T_187[4:0] ? 4'h7 : _GEN_95; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_97 = 5'h18 == _T_187[4:0] ? 4'h0 : _GEN_96; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_98 = 5'h19 == _T_187[4:0] ? 4'h3 : _GEN_97; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_99 = 5'h1a == _T_187[4:0] ? 4'h6 : _GEN_98; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_100 = 5'h1b == _T_187[4:0] ? 4'h9 : _GEN_99; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_101 = 5'h1c == _T_187[4:0] ? 4'hb : _GEN_100; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_102 = 5'h1d == _T_187[4:0] ? 4'hd : _GEN_101; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_103 = 5'h1e == _T_187[4:0] ? 4'he : _GEN_102; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_104 = 5'h1f == _T_187[4:0] ? 4'hf : _GEN_103; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_107 = 4'h1 == _GEN_104 ? $signed(16'sh3ec5) : $signed(16'sh4000); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_108 = 4'h1 == _GEN_104 ? $signed(-16'shc7c) : $signed(16'sh0); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_109 = 4'h2 == _GEN_104 ? $signed(16'sh3b21) : $signed(_GEN_107); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_110 = 4'h2 == _GEN_104 ? $signed(-16'sh187e) : $signed(_GEN_108); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_111 = 4'h3 == _GEN_104 ? $signed(16'sh3537) : $signed(_GEN_109); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_112 = 4'h3 == _GEN_104 ? $signed(-16'sh238e) : $signed(_GEN_110); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_113 = 4'h4 == _GEN_104 ? $signed(16'sh2d41) : $signed(_GEN_111); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_114 = 4'h4 == _GEN_104 ? $signed(-16'sh2d41) : $signed(_GEN_112); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_115 = 4'h5 == _GEN_104 ? $signed(16'sh238e) : $signed(_GEN_113); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_116 = 4'h5 == _GEN_104 ? $signed(-16'sh3537) : $signed(_GEN_114); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_117 = 4'h6 == _GEN_104 ? $signed(16'sh187e) : $signed(_GEN_115); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_118 = 4'h6 == _GEN_104 ? $signed(-16'sh3b21) : $signed(_GEN_116); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_119 = 4'h7 == _GEN_104 ? $signed(16'shc7c) : $signed(_GEN_117); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_120 = 4'h7 == _GEN_104 ? $signed(-16'sh3ec5) : $signed(_GEN_118); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_121 = 4'h8 == _GEN_104 ? $signed(16'sh0) : $signed(_GEN_119); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_122 = 4'h8 == _GEN_104 ? $signed(-16'sh4000) : $signed(_GEN_120); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_123 = 4'h9 == _GEN_104 ? $signed(-16'shc7c) : $signed(_GEN_121); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_124 = 4'h9 == _GEN_104 ? $signed(-16'sh3ec5) : $signed(_GEN_122); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_125 = 4'ha == _GEN_104 ? $signed(-16'sh187e) : $signed(_GEN_123); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_126 = 4'ha == _GEN_104 ? $signed(-16'sh3b21) : $signed(_GEN_124); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_127 = 4'hb == _GEN_104 ? $signed(-16'sh2d41) : $signed(_GEN_125); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_128 = 4'hb == _GEN_104 ? $signed(-16'sh2d41) : $signed(_GEN_126); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_129 = 4'hc == _GEN_104 ? $signed(-16'sh3b21) : $signed(_GEN_127); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_130 = 4'hc == _GEN_104 ? $signed(-16'sh187e) : $signed(_GEN_128); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_131 = 4'hd == _GEN_104 ? $signed(-16'sh3ec5) : $signed(_GEN_129); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_132 = 4'hd == _GEN_104 ? $signed(-16'shc7c) : $signed(_GEN_130); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_133 = 4'he == _GEN_104 ? $signed(-16'sh3b21) : $signed(_GEN_131); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_134 = 4'he == _GEN_104 ? $signed(16'sh187e) : $signed(_GEN_132); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_135 = 4'hf == _GEN_104 ? $signed(-16'sh238e) : $signed(_GEN_133); // @[SDFChainRadix22.scala 291:27]
  assign twiddles_3_imag = 4'hf == _GEN_104 ? $signed(16'sh3537) : $signed(_GEN_134); // @[SDFChainRadix22.scala 291:27]
  assign _T_393 = $signed(_GEN_135) + $signed(twiddles_3_imag); // @[FixedPointTypeClass.scala 24:22]
  assign outputWires_2_real = sdf_stages_2_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign outputWires_2_imag = sdf_stages_2_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign _T_394 = $signed(outputWires_2_real) + $signed(outputWires_2_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_395 = $signed(outputWires_2_imag) - $signed(outputWires_2_real); // @[FixedPointTypeClass.scala 33:22]
  assign _GEN_2115 = {{1{outputWires_2_real[15]}},outputWires_2_real}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_396 = $signed(_GEN_2115) * $signed(_T_393); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2116 = {{1{twiddles_3_imag[15]}},twiddles_3_imag}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_397 = $signed(_T_394) * $signed(_GEN_2116); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2117 = {{1{_GEN_135[15]}},_GEN_135}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_398 = $signed(_T_395) * $signed(_GEN_2117); // @[FixedPointTypeClass.scala 211:35]
  assign _T_399 = $signed(_T_396) - $signed(_T_397); // @[FixedPointTypeClass.scala 33:22]
  assign _T_400 = $signed(_T_396) + $signed(_T_398); // @[FixedPointTypeClass.scala 24:22]
  assign _T_406 = $signed(_T_399) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_407 = _T_406[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_410 = $signed(_T_400) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_411 = _T_410[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_418 = sdf_stages_4_io_cntr < 9'h10; // @[SDFChainRadix22.scala 328:32]
  assign _T_419 = sdf_stages_4_io_cntr < 9'h18; // @[SDFChainRadix22.scala 328:78]
  assign _T_420 = _T_419 ? 1'h0 : 1'h1; // @[SDFChainRadix22.scala 328:65]
  assign _T_421 = _T_418 ? 1'h0 : _T_420; // @[SDFChainRadix22.scala 328:19]
  assign outputWires_3_real = sdf_stages_3_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _T_427 = 16'sh0 - $signed(outputWires_3_real); // @[FixedPointTypeClass.scala 39:43]
  assign outputWires_3_imag = sdf_stages_3_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _GEN_202 = 7'h21 == _T_201[6:0] ? 6'h2 : 6'h0; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_203 = 7'h22 == _T_201[6:0] ? 6'h4 : _GEN_202; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_204 = 7'h23 == _T_201[6:0] ? 6'h6 : _GEN_203; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_205 = 7'h24 == _T_201[6:0] ? 6'h8 : _GEN_204; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_206 = 7'h25 == _T_201[6:0] ? 6'ha : _GEN_205; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_207 = 7'h26 == _T_201[6:0] ? 6'hc : _GEN_206; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_208 = 7'h27 == _T_201[6:0] ? 6'he : _GEN_207; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_209 = 7'h28 == _T_201[6:0] ? 6'h10 : _GEN_208; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_210 = 7'h29 == _T_201[6:0] ? 6'h12 : _GEN_209; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_211 = 7'h2a == _T_201[6:0] ? 6'h14 : _GEN_210; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_212 = 7'h2b == _T_201[6:0] ? 6'h16 : _GEN_211; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_213 = 7'h2c == _T_201[6:0] ? 6'h18 : _GEN_212; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_214 = 7'h2d == _T_201[6:0] ? 6'h1a : _GEN_213; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_215 = 7'h2e == _T_201[6:0] ? 6'h1c : _GEN_214; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_216 = 7'h2f == _T_201[6:0] ? 6'h1e : _GEN_215; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_217 = 7'h30 == _T_201[6:0] ? 6'h20 : _GEN_216; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_218 = 7'h31 == _T_201[6:0] ? 6'h22 : _GEN_217; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_219 = 7'h32 == _T_201[6:0] ? 6'h23 : _GEN_218; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_220 = 7'h33 == _T_201[6:0] ? 6'h24 : _GEN_219; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_221 = 7'h34 == _T_201[6:0] ? 6'h26 : _GEN_220; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_222 = 7'h35 == _T_201[6:0] ? 6'h27 : _GEN_221; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_223 = 7'h36 == _T_201[6:0] ? 6'h28 : _GEN_222; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_224 = 7'h37 == _T_201[6:0] ? 6'h2a : _GEN_223; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_225 = 7'h38 == _T_201[6:0] ? 6'h2b : _GEN_224; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_226 = 7'h39 == _T_201[6:0] ? 6'h2c : _GEN_225; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_227 = 7'h3a == _T_201[6:0] ? 6'h2e : _GEN_226; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_228 = 7'h3b == _T_201[6:0] ? 6'h2f : _GEN_227; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_229 = 7'h3c == _T_201[6:0] ? 6'h30 : _GEN_228; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_230 = 7'h3d == _T_201[6:0] ? 6'h32 : _GEN_229; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_231 = 7'h3e == _T_201[6:0] ? 6'h33 : _GEN_230; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_232 = 7'h3f == _T_201[6:0] ? 6'h34 : _GEN_231; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_233 = 7'h40 == _T_201[6:0] ? 6'h0 : _GEN_232; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_234 = 7'h41 == _T_201[6:0] ? 6'h1 : _GEN_233; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_235 = 7'h42 == _T_201[6:0] ? 6'h2 : _GEN_234; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_236 = 7'h43 == _T_201[6:0] ? 6'h3 : _GEN_235; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_237 = 7'h44 == _T_201[6:0] ? 6'h4 : _GEN_236; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_238 = 7'h45 == _T_201[6:0] ? 6'h5 : _GEN_237; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_239 = 7'h46 == _T_201[6:0] ? 6'h6 : _GEN_238; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_240 = 7'h47 == _T_201[6:0] ? 6'h7 : _GEN_239; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_241 = 7'h48 == _T_201[6:0] ? 6'h8 : _GEN_240; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_242 = 7'h49 == _T_201[6:0] ? 6'h9 : _GEN_241; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_243 = 7'h4a == _T_201[6:0] ? 6'ha : _GEN_242; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_244 = 7'h4b == _T_201[6:0] ? 6'hb : _GEN_243; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_245 = 7'h4c == _T_201[6:0] ? 6'hc : _GEN_244; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_246 = 7'h4d == _T_201[6:0] ? 6'hd : _GEN_245; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_247 = 7'h4e == _T_201[6:0] ? 6'he : _GEN_246; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_248 = 7'h4f == _T_201[6:0] ? 6'hf : _GEN_247; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_249 = 7'h50 == _T_201[6:0] ? 6'h10 : _GEN_248; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_250 = 7'h51 == _T_201[6:0] ? 6'h11 : _GEN_249; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_251 = 7'h52 == _T_201[6:0] ? 6'h12 : _GEN_250; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_252 = 7'h53 == _T_201[6:0] ? 6'h13 : _GEN_251; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_253 = 7'h54 == _T_201[6:0] ? 6'h14 : _GEN_252; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_254 = 7'h55 == _T_201[6:0] ? 6'h15 : _GEN_253; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_255 = 7'h56 == _T_201[6:0] ? 6'h16 : _GEN_254; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_256 = 7'h57 == _T_201[6:0] ? 6'h17 : _GEN_255; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_257 = 7'h58 == _T_201[6:0] ? 6'h18 : _GEN_256; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_258 = 7'h59 == _T_201[6:0] ? 6'h19 : _GEN_257; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_259 = 7'h5a == _T_201[6:0] ? 6'h1a : _GEN_258; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_260 = 7'h5b == _T_201[6:0] ? 6'h1b : _GEN_259; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_261 = 7'h5c == _T_201[6:0] ? 6'h1c : _GEN_260; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_262 = 7'h5d == _T_201[6:0] ? 6'h1d : _GEN_261; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_263 = 7'h5e == _T_201[6:0] ? 6'h1e : _GEN_262; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_264 = 7'h5f == _T_201[6:0] ? 6'h1f : _GEN_263; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_265 = 7'h60 == _T_201[6:0] ? 6'h0 : _GEN_264; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_266 = 7'h61 == _T_201[6:0] ? 6'h3 : _GEN_265; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_267 = 7'h62 == _T_201[6:0] ? 6'h6 : _GEN_266; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_268 = 7'h63 == _T_201[6:0] ? 6'h9 : _GEN_267; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_269 = 7'h64 == _T_201[6:0] ? 6'hc : _GEN_268; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_270 = 7'h65 == _T_201[6:0] ? 6'hf : _GEN_269; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_271 = 7'h66 == _T_201[6:0] ? 6'h12 : _GEN_270; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_272 = 7'h67 == _T_201[6:0] ? 6'h15 : _GEN_271; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_273 = 7'h68 == _T_201[6:0] ? 6'h18 : _GEN_272; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_274 = 7'h69 == _T_201[6:0] ? 6'h1b : _GEN_273; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_275 = 7'h6a == _T_201[6:0] ? 6'h1e : _GEN_274; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_276 = 7'h6b == _T_201[6:0] ? 6'h21 : _GEN_275; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_277 = 7'h6c == _T_201[6:0] ? 6'h23 : _GEN_276; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_278 = 7'h6d == _T_201[6:0] ? 6'h25 : _GEN_277; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_279 = 7'h6e == _T_201[6:0] ? 6'h27 : _GEN_278; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_280 = 7'h6f == _T_201[6:0] ? 6'h29 : _GEN_279; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_281 = 7'h70 == _T_201[6:0] ? 6'h2b : _GEN_280; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_282 = 7'h71 == _T_201[6:0] ? 6'h2d : _GEN_281; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_283 = 7'h72 == _T_201[6:0] ? 6'h2f : _GEN_282; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_284 = 7'h73 == _T_201[6:0] ? 6'h31 : _GEN_283; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_285 = 7'h74 == _T_201[6:0] ? 6'h33 : _GEN_284; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_286 = 7'h75 == _T_201[6:0] ? 6'h35 : _GEN_285; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_287 = 7'h76 == _T_201[6:0] ? 6'h36 : _GEN_286; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_288 = 7'h77 == _T_201[6:0] ? 6'h37 : _GEN_287; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_289 = 7'h78 == _T_201[6:0] ? 6'h38 : _GEN_288; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_290 = 7'h79 == _T_201[6:0] ? 6'h39 : _GEN_289; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_291 = 7'h7a == _T_201[6:0] ? 6'h3a : _GEN_290; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_292 = 7'h7b == _T_201[6:0] ? 6'h3b : _GEN_291; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_293 = 7'h7c == _T_201[6:0] ? 6'h3c : _GEN_292; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_294 = 7'h7d == _T_201[6:0] ? 6'h3d : _GEN_293; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_295 = 7'h7e == _T_201[6:0] ? 6'h3e : _GEN_294; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_296 = 7'h7f == _T_201[6:0] ? 6'h3f : _GEN_295; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_299 = 6'h1 == _GEN_296 ? $signed(16'sh3fec) : $signed(16'sh4000); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_300 = 6'h1 == _GEN_296 ? $signed(-16'sh324) : $signed(16'sh0); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_301 = 6'h2 == _GEN_296 ? $signed(16'sh3fb1) : $signed(_GEN_299); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_302 = 6'h2 == _GEN_296 ? $signed(-16'sh646) : $signed(_GEN_300); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_303 = 6'h3 == _GEN_296 ? $signed(16'sh3f4f) : $signed(_GEN_301); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_304 = 6'h3 == _GEN_296 ? $signed(-16'sh964) : $signed(_GEN_302); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_305 = 6'h4 == _GEN_296 ? $signed(16'sh3ec5) : $signed(_GEN_303); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_306 = 6'h4 == _GEN_296 ? $signed(-16'shc7c) : $signed(_GEN_304); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_307 = 6'h5 == _GEN_296 ? $signed(16'sh3e15) : $signed(_GEN_305); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_308 = 6'h5 == _GEN_296 ? $signed(-16'shf8d) : $signed(_GEN_306); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_309 = 6'h6 == _GEN_296 ? $signed(16'sh3d3f) : $signed(_GEN_307); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_310 = 6'h6 == _GEN_296 ? $signed(-16'sh1294) : $signed(_GEN_308); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_311 = 6'h7 == _GEN_296 ? $signed(16'sh3c42) : $signed(_GEN_309); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_312 = 6'h7 == _GEN_296 ? $signed(-16'sh1590) : $signed(_GEN_310); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_313 = 6'h8 == _GEN_296 ? $signed(16'sh3b21) : $signed(_GEN_311); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_314 = 6'h8 == _GEN_296 ? $signed(-16'sh187e) : $signed(_GEN_312); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_315 = 6'h9 == _GEN_296 ? $signed(16'sh39db) : $signed(_GEN_313); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_316 = 6'h9 == _GEN_296 ? $signed(-16'sh1b5d) : $signed(_GEN_314); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_317 = 6'ha == _GEN_296 ? $signed(16'sh3871) : $signed(_GEN_315); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_318 = 6'ha == _GEN_296 ? $signed(-16'sh1e2b) : $signed(_GEN_316); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_319 = 6'hb == _GEN_296 ? $signed(16'sh36e5) : $signed(_GEN_317); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_320 = 6'hb == _GEN_296 ? $signed(-16'sh20e7) : $signed(_GEN_318); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_321 = 6'hc == _GEN_296 ? $signed(16'sh3537) : $signed(_GEN_319); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_322 = 6'hc == _GEN_296 ? $signed(-16'sh238e) : $signed(_GEN_320); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_323 = 6'hd == _GEN_296 ? $signed(16'sh3368) : $signed(_GEN_321); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_324 = 6'hd == _GEN_296 ? $signed(-16'sh2620) : $signed(_GEN_322); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_325 = 6'he == _GEN_296 ? $signed(16'sh3179) : $signed(_GEN_323); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_326 = 6'he == _GEN_296 ? $signed(-16'sh289a) : $signed(_GEN_324); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_327 = 6'hf == _GEN_296 ? $signed(16'sh2f6c) : $signed(_GEN_325); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_328 = 6'hf == _GEN_296 ? $signed(-16'sh2afb) : $signed(_GEN_326); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_329 = 6'h10 == _GEN_296 ? $signed(16'sh2d41) : $signed(_GEN_327); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_330 = 6'h10 == _GEN_296 ? $signed(-16'sh2d41) : $signed(_GEN_328); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_331 = 6'h11 == _GEN_296 ? $signed(16'sh2afb) : $signed(_GEN_329); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_332 = 6'h11 == _GEN_296 ? $signed(-16'sh2f6c) : $signed(_GEN_330); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_333 = 6'h12 == _GEN_296 ? $signed(16'sh289a) : $signed(_GEN_331); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_334 = 6'h12 == _GEN_296 ? $signed(-16'sh3179) : $signed(_GEN_332); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_335 = 6'h13 == _GEN_296 ? $signed(16'sh2620) : $signed(_GEN_333); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_336 = 6'h13 == _GEN_296 ? $signed(-16'sh3368) : $signed(_GEN_334); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_337 = 6'h14 == _GEN_296 ? $signed(16'sh238e) : $signed(_GEN_335); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_338 = 6'h14 == _GEN_296 ? $signed(-16'sh3537) : $signed(_GEN_336); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_339 = 6'h15 == _GEN_296 ? $signed(16'sh20e7) : $signed(_GEN_337); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_340 = 6'h15 == _GEN_296 ? $signed(-16'sh36e5) : $signed(_GEN_338); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_341 = 6'h16 == _GEN_296 ? $signed(16'sh1e2b) : $signed(_GEN_339); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_342 = 6'h16 == _GEN_296 ? $signed(-16'sh3871) : $signed(_GEN_340); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_343 = 6'h17 == _GEN_296 ? $signed(16'sh1b5d) : $signed(_GEN_341); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_344 = 6'h17 == _GEN_296 ? $signed(-16'sh39db) : $signed(_GEN_342); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_345 = 6'h18 == _GEN_296 ? $signed(16'sh187e) : $signed(_GEN_343); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_346 = 6'h18 == _GEN_296 ? $signed(-16'sh3b21) : $signed(_GEN_344); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_347 = 6'h19 == _GEN_296 ? $signed(16'sh1590) : $signed(_GEN_345); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_348 = 6'h19 == _GEN_296 ? $signed(-16'sh3c42) : $signed(_GEN_346); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_349 = 6'h1a == _GEN_296 ? $signed(16'sh1294) : $signed(_GEN_347); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_350 = 6'h1a == _GEN_296 ? $signed(-16'sh3d3f) : $signed(_GEN_348); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_351 = 6'h1b == _GEN_296 ? $signed(16'shf8d) : $signed(_GEN_349); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_352 = 6'h1b == _GEN_296 ? $signed(-16'sh3e15) : $signed(_GEN_350); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_353 = 6'h1c == _GEN_296 ? $signed(16'shc7c) : $signed(_GEN_351); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_354 = 6'h1c == _GEN_296 ? $signed(-16'sh3ec5) : $signed(_GEN_352); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_355 = 6'h1d == _GEN_296 ? $signed(16'sh964) : $signed(_GEN_353); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_356 = 6'h1d == _GEN_296 ? $signed(-16'sh3f4f) : $signed(_GEN_354); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_357 = 6'h1e == _GEN_296 ? $signed(16'sh646) : $signed(_GEN_355); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_358 = 6'h1e == _GEN_296 ? $signed(-16'sh3fb1) : $signed(_GEN_356); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_359 = 6'h1f == _GEN_296 ? $signed(16'sh324) : $signed(_GEN_357); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_360 = 6'h1f == _GEN_296 ? $signed(-16'sh3fec) : $signed(_GEN_358); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_361 = 6'h20 == _GEN_296 ? $signed(16'sh0) : $signed(_GEN_359); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_362 = 6'h20 == _GEN_296 ? $signed(-16'sh4000) : $signed(_GEN_360); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_363 = 6'h21 == _GEN_296 ? $signed(-16'sh324) : $signed(_GEN_361); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_364 = 6'h21 == _GEN_296 ? $signed(-16'sh3fec) : $signed(_GEN_362); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_365 = 6'h22 == _GEN_296 ? $signed(-16'sh646) : $signed(_GEN_363); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_366 = 6'h22 == _GEN_296 ? $signed(-16'sh3fb1) : $signed(_GEN_364); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_367 = 6'h23 == _GEN_296 ? $signed(-16'shc7c) : $signed(_GEN_365); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_368 = 6'h23 == _GEN_296 ? $signed(-16'sh3ec5) : $signed(_GEN_366); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_369 = 6'h24 == _GEN_296 ? $signed(-16'sh1294) : $signed(_GEN_367); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_370 = 6'h24 == _GEN_296 ? $signed(-16'sh3d3f) : $signed(_GEN_368); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_371 = 6'h25 == _GEN_296 ? $signed(-16'sh1590) : $signed(_GEN_369); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_372 = 6'h25 == _GEN_296 ? $signed(-16'sh3c42) : $signed(_GEN_370); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_373 = 6'h26 == _GEN_296 ? $signed(-16'sh187e) : $signed(_GEN_371); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_374 = 6'h26 == _GEN_296 ? $signed(-16'sh3b21) : $signed(_GEN_372); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_375 = 6'h27 == _GEN_296 ? $signed(-16'sh1e2b) : $signed(_GEN_373); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_376 = 6'h27 == _GEN_296 ? $signed(-16'sh3871) : $signed(_GEN_374); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_377 = 6'h28 == _GEN_296 ? $signed(-16'sh238e) : $signed(_GEN_375); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_378 = 6'h28 == _GEN_296 ? $signed(-16'sh3537) : $signed(_GEN_376); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_379 = 6'h29 == _GEN_296 ? $signed(-16'sh2620) : $signed(_GEN_377); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_380 = 6'h29 == _GEN_296 ? $signed(-16'sh3368) : $signed(_GEN_378); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_381 = 6'h2a == _GEN_296 ? $signed(-16'sh289a) : $signed(_GEN_379); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_382 = 6'h2a == _GEN_296 ? $signed(-16'sh3179) : $signed(_GEN_380); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_383 = 6'h2b == _GEN_296 ? $signed(-16'sh2d41) : $signed(_GEN_381); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_384 = 6'h2b == _GEN_296 ? $signed(-16'sh2d41) : $signed(_GEN_382); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_385 = 6'h2c == _GEN_296 ? $signed(-16'sh3179) : $signed(_GEN_383); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_386 = 6'h2c == _GEN_296 ? $signed(-16'sh289a) : $signed(_GEN_384); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_387 = 6'h2d == _GEN_296 ? $signed(-16'sh3368) : $signed(_GEN_385); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_388 = 6'h2d == _GEN_296 ? $signed(-16'sh2620) : $signed(_GEN_386); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_389 = 6'h2e == _GEN_296 ? $signed(-16'sh3537) : $signed(_GEN_387); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_390 = 6'h2e == _GEN_296 ? $signed(-16'sh238e) : $signed(_GEN_388); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_391 = 6'h2f == _GEN_296 ? $signed(-16'sh3871) : $signed(_GEN_389); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_392 = 6'h2f == _GEN_296 ? $signed(-16'sh1e2b) : $signed(_GEN_390); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_393 = 6'h30 == _GEN_296 ? $signed(-16'sh3b21) : $signed(_GEN_391); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_394 = 6'h30 == _GEN_296 ? $signed(-16'sh187e) : $signed(_GEN_392); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_395 = 6'h31 == _GEN_296 ? $signed(-16'sh3c42) : $signed(_GEN_393); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_396 = 6'h31 == _GEN_296 ? $signed(-16'sh1590) : $signed(_GEN_394); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_397 = 6'h32 == _GEN_296 ? $signed(-16'sh3d3f) : $signed(_GEN_395); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_398 = 6'h32 == _GEN_296 ? $signed(-16'sh1294) : $signed(_GEN_396); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_399 = 6'h33 == _GEN_296 ? $signed(-16'sh3ec5) : $signed(_GEN_397); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_400 = 6'h33 == _GEN_296 ? $signed(-16'shc7c) : $signed(_GEN_398); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_401 = 6'h34 == _GEN_296 ? $signed(-16'sh3fb1) : $signed(_GEN_399); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_402 = 6'h34 == _GEN_296 ? $signed(-16'sh646) : $signed(_GEN_400); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_403 = 6'h35 == _GEN_296 ? $signed(-16'sh3fec) : $signed(_GEN_401); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_404 = 6'h35 == _GEN_296 ? $signed(-16'sh324) : $signed(_GEN_402); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_405 = 6'h36 == _GEN_296 ? $signed(-16'sh3fb1) : $signed(_GEN_403); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_406 = 6'h36 == _GEN_296 ? $signed(16'sh646) : $signed(_GEN_404); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_407 = 6'h37 == _GEN_296 ? $signed(-16'sh3e15) : $signed(_GEN_405); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_408 = 6'h37 == _GEN_296 ? $signed(16'shf8d) : $signed(_GEN_406); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_409 = 6'h38 == _GEN_296 ? $signed(-16'sh3b21) : $signed(_GEN_407); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_410 = 6'h38 == _GEN_296 ? $signed(16'sh187e) : $signed(_GEN_408); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_411 = 6'h39 == _GEN_296 ? $signed(-16'sh36e5) : $signed(_GEN_409); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_412 = 6'h39 == _GEN_296 ? $signed(16'sh20e7) : $signed(_GEN_410); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_413 = 6'h3a == _GEN_296 ? $signed(-16'sh3179) : $signed(_GEN_411); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_414 = 6'h3a == _GEN_296 ? $signed(16'sh289a) : $signed(_GEN_412); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_415 = 6'h3b == _GEN_296 ? $signed(-16'sh2afb) : $signed(_GEN_413); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_416 = 6'h3b == _GEN_296 ? $signed(16'sh2f6c) : $signed(_GEN_414); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_417 = 6'h3c == _GEN_296 ? $signed(-16'sh238e) : $signed(_GEN_415); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_418 = 6'h3c == _GEN_296 ? $signed(16'sh3537) : $signed(_GEN_416); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_419 = 6'h3d == _GEN_296 ? $signed(-16'sh1b5d) : $signed(_GEN_417); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_420 = 6'h3d == _GEN_296 ? $signed(16'sh39db) : $signed(_GEN_418); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_421 = 6'h3e == _GEN_296 ? $signed(-16'sh1294) : $signed(_GEN_419); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_422 = 6'h3e == _GEN_296 ? $signed(16'sh3d3f) : $signed(_GEN_420); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_423 = 6'h3f == _GEN_296 ? $signed(-16'sh964) : $signed(_GEN_421); // @[SDFChainRadix22.scala 291:27]
  assign twiddles_5_imag = 6'h3f == _GEN_296 ? $signed(16'sh3f4f) : $signed(_GEN_422); // @[SDFChainRadix22.scala 291:27]
  assign _T_765 = $signed(_GEN_423) + $signed(twiddles_5_imag); // @[FixedPointTypeClass.scala 24:22]
  assign outputWires_4_real = sdf_stages_4_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign outputWires_4_imag = sdf_stages_4_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign _T_766 = $signed(outputWires_4_real) + $signed(outputWires_4_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_767 = $signed(outputWires_4_imag) - $signed(outputWires_4_real); // @[FixedPointTypeClass.scala 33:22]
  assign _GEN_2118 = {{1{outputWires_4_real[15]}},outputWires_4_real}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_768 = $signed(_GEN_2118) * $signed(_T_765); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2119 = {{1{twiddles_5_imag[15]}},twiddles_5_imag}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_769 = $signed(_T_766) * $signed(_GEN_2119); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2120 = {{1{_GEN_423[15]}},_GEN_423}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_770 = $signed(_T_767) * $signed(_GEN_2120); // @[FixedPointTypeClass.scala 211:35]
  assign _T_771 = $signed(_T_768) - $signed(_T_769); // @[FixedPointTypeClass.scala 33:22]
  assign _T_772 = $signed(_T_768) + $signed(_T_770); // @[FixedPointTypeClass.scala 24:22]
  assign _T_778 = $signed(_T_771) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_779 = _T_778[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_782 = $signed(_T_772) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_783 = _T_782[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_790 = sdf_stages_6_io_cntr < 9'h40; // @[SDFChainRadix22.scala 328:32]
  assign _T_791 = sdf_stages_6_io_cntr < 9'h60; // @[SDFChainRadix22.scala 328:78]
  assign _T_792 = _T_791 ? 1'h0 : 1'h1; // @[SDFChainRadix22.scala 328:65]
  assign _T_793 = _T_790 ? 1'h0 : _T_792; // @[SDFChainRadix22.scala 328:19]
  assign outputWires_5_real = sdf_stages_5_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _T_799 = 16'sh0 - $signed(outputWires_5_real); // @[FixedPointTypeClass.scala 39:43]
  assign outputWires_5_imag = sdf_stages_5_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _GEN_682 = 9'h81 == _T_215 ? 8'h2 : 8'h0; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_683 = 9'h82 == _T_215 ? 8'h4 : _GEN_682; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_684 = 9'h83 == _T_215 ? 8'h6 : _GEN_683; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_685 = 9'h84 == _T_215 ? 8'h8 : _GEN_684; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_686 = 9'h85 == _T_215 ? 8'ha : _GEN_685; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_687 = 9'h86 == _T_215 ? 8'hc : _GEN_686; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_688 = 9'h87 == _T_215 ? 8'he : _GEN_687; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_689 = 9'h88 == _T_215 ? 8'h10 : _GEN_688; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_690 = 9'h89 == _T_215 ? 8'h12 : _GEN_689; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_691 = 9'h8a == _T_215 ? 8'h14 : _GEN_690; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_692 = 9'h8b == _T_215 ? 8'h16 : _GEN_691; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_693 = 9'h8c == _T_215 ? 8'h18 : _GEN_692; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_694 = 9'h8d == _T_215 ? 8'h1a : _GEN_693; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_695 = 9'h8e == _T_215 ? 8'h1c : _GEN_694; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_696 = 9'h8f == _T_215 ? 8'h1e : _GEN_695; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_697 = 9'h90 == _T_215 ? 8'h20 : _GEN_696; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_698 = 9'h91 == _T_215 ? 8'h22 : _GEN_697; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_699 = 9'h92 == _T_215 ? 8'h24 : _GEN_698; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_700 = 9'h93 == _T_215 ? 8'h26 : _GEN_699; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_701 = 9'h94 == _T_215 ? 8'h28 : _GEN_700; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_702 = 9'h95 == _T_215 ? 8'h2a : _GEN_701; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_703 = 9'h96 == _T_215 ? 8'h2c : _GEN_702; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_704 = 9'h97 == _T_215 ? 8'h2e : _GEN_703; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_705 = 9'h98 == _T_215 ? 8'h30 : _GEN_704; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_706 = 9'h99 == _T_215 ? 8'h32 : _GEN_705; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_707 = 9'h9a == _T_215 ? 8'h34 : _GEN_706; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_708 = 9'h9b == _T_215 ? 8'h36 : _GEN_707; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_709 = 9'h9c == _T_215 ? 8'h38 : _GEN_708; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_710 = 9'h9d == _T_215 ? 8'h3a : _GEN_709; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_711 = 9'h9e == _T_215 ? 8'h3c : _GEN_710; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_712 = 9'h9f == _T_215 ? 8'h3e : _GEN_711; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_713 = 9'ha0 == _T_215 ? 8'h40 : _GEN_712; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_714 = 9'ha1 == _T_215 ? 8'h42 : _GEN_713; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_715 = 9'ha2 == _T_215 ? 8'h44 : _GEN_714; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_716 = 9'ha3 == _T_215 ? 8'h46 : _GEN_715; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_717 = 9'ha4 == _T_215 ? 8'h48 : _GEN_716; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_718 = 9'ha5 == _T_215 ? 8'h4a : _GEN_717; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_719 = 9'ha6 == _T_215 ? 8'h4c : _GEN_718; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_720 = 9'ha7 == _T_215 ? 8'h4e : _GEN_719; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_721 = 9'ha8 == _T_215 ? 8'h50 : _GEN_720; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_722 = 9'ha9 == _T_215 ? 8'h52 : _GEN_721; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_723 = 9'haa == _T_215 ? 8'h54 : _GEN_722; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_724 = 9'hab == _T_215 ? 8'h56 : _GEN_723; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_725 = 9'hac == _T_215 ? 8'h58 : _GEN_724; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_726 = 9'had == _T_215 ? 8'h5a : _GEN_725; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_727 = 9'hae == _T_215 ? 8'h5c : _GEN_726; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_728 = 9'haf == _T_215 ? 8'h5e : _GEN_727; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_729 = 9'hb0 == _T_215 ? 8'h60 : _GEN_728; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_730 = 9'hb1 == _T_215 ? 8'h62 : _GEN_729; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_731 = 9'hb2 == _T_215 ? 8'h64 : _GEN_730; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_732 = 9'hb3 == _T_215 ? 8'h66 : _GEN_731; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_733 = 9'hb4 == _T_215 ? 8'h68 : _GEN_732; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_734 = 9'hb5 == _T_215 ? 8'h6a : _GEN_733; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_735 = 9'hb6 == _T_215 ? 8'h6c : _GEN_734; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_736 = 9'hb7 == _T_215 ? 8'h6e : _GEN_735; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_737 = 9'hb8 == _T_215 ? 8'h70 : _GEN_736; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_738 = 9'hb9 == _T_215 ? 8'h72 : _GEN_737; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_739 = 9'hba == _T_215 ? 8'h74 : _GEN_738; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_740 = 9'hbb == _T_215 ? 8'h76 : _GEN_739; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_741 = 9'hbc == _T_215 ? 8'h78 : _GEN_740; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_742 = 9'hbd == _T_215 ? 8'h7a : _GEN_741; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_743 = 9'hbe == _T_215 ? 8'h7c : _GEN_742; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_744 = 9'hbf == _T_215 ? 8'h7e : _GEN_743; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_745 = 9'hc0 == _T_215 ? 8'h80 : _GEN_744; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_746 = 9'hc1 == _T_215 ? 8'h82 : _GEN_745; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_747 = 9'hc2 == _T_215 ? 8'h83 : _GEN_746; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_748 = 9'hc3 == _T_215 ? 8'h84 : _GEN_747; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_749 = 9'hc4 == _T_215 ? 8'h86 : _GEN_748; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_750 = 9'hc5 == _T_215 ? 8'h87 : _GEN_749; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_751 = 9'hc6 == _T_215 ? 8'h88 : _GEN_750; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_752 = 9'hc7 == _T_215 ? 8'h8a : _GEN_751; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_753 = 9'hc8 == _T_215 ? 8'h8b : _GEN_752; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_754 = 9'hc9 == _T_215 ? 8'h8c : _GEN_753; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_755 = 9'hca == _T_215 ? 8'h8e : _GEN_754; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_756 = 9'hcb == _T_215 ? 8'h8f : _GEN_755; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_757 = 9'hcc == _T_215 ? 8'h90 : _GEN_756; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_758 = 9'hcd == _T_215 ? 8'h92 : _GEN_757; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_759 = 9'hce == _T_215 ? 8'h93 : _GEN_758; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_760 = 9'hcf == _T_215 ? 8'h94 : _GEN_759; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_761 = 9'hd0 == _T_215 ? 8'h96 : _GEN_760; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_762 = 9'hd1 == _T_215 ? 8'h97 : _GEN_761; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_763 = 9'hd2 == _T_215 ? 8'h98 : _GEN_762; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_764 = 9'hd3 == _T_215 ? 8'h9a : _GEN_763; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_765 = 9'hd4 == _T_215 ? 8'h9b : _GEN_764; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_766 = 9'hd5 == _T_215 ? 8'h9c : _GEN_765; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_767 = 9'hd6 == _T_215 ? 8'h9e : _GEN_766; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_768 = 9'hd7 == _T_215 ? 8'h9f : _GEN_767; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_769 = 9'hd8 == _T_215 ? 8'ha0 : _GEN_768; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_770 = 9'hd9 == _T_215 ? 8'ha2 : _GEN_769; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_771 = 9'hda == _T_215 ? 8'ha3 : _GEN_770; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_772 = 9'hdb == _T_215 ? 8'ha4 : _GEN_771; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_773 = 9'hdc == _T_215 ? 8'ha6 : _GEN_772; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_774 = 9'hdd == _T_215 ? 8'ha7 : _GEN_773; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_775 = 9'hde == _T_215 ? 8'ha8 : _GEN_774; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_776 = 9'hdf == _T_215 ? 8'haa : _GEN_775; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_777 = 9'he0 == _T_215 ? 8'hab : _GEN_776; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_778 = 9'he1 == _T_215 ? 8'hac : _GEN_777; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_779 = 9'he2 == _T_215 ? 8'hae : _GEN_778; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_780 = 9'he3 == _T_215 ? 8'haf : _GEN_779; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_781 = 9'he4 == _T_215 ? 8'hb0 : _GEN_780; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_782 = 9'he5 == _T_215 ? 8'hb2 : _GEN_781; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_783 = 9'he6 == _T_215 ? 8'hb3 : _GEN_782; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_784 = 9'he7 == _T_215 ? 8'hb4 : _GEN_783; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_785 = 9'he8 == _T_215 ? 8'hb6 : _GEN_784; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_786 = 9'he9 == _T_215 ? 8'hb7 : _GEN_785; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_787 = 9'hea == _T_215 ? 8'hb8 : _GEN_786; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_788 = 9'heb == _T_215 ? 8'hba : _GEN_787; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_789 = 9'hec == _T_215 ? 8'hbb : _GEN_788; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_790 = 9'hed == _T_215 ? 8'hbc : _GEN_789; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_791 = 9'hee == _T_215 ? 8'hbe : _GEN_790; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_792 = 9'hef == _T_215 ? 8'hbf : _GEN_791; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_793 = 9'hf0 == _T_215 ? 8'hc0 : _GEN_792; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_794 = 9'hf1 == _T_215 ? 8'hc2 : _GEN_793; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_795 = 9'hf2 == _T_215 ? 8'hc3 : _GEN_794; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_796 = 9'hf3 == _T_215 ? 8'hc4 : _GEN_795; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_797 = 9'hf4 == _T_215 ? 8'hc6 : _GEN_796; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_798 = 9'hf5 == _T_215 ? 8'hc7 : _GEN_797; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_799 = 9'hf6 == _T_215 ? 8'hc8 : _GEN_798; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_800 = 9'hf7 == _T_215 ? 8'hca : _GEN_799; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_801 = 9'hf8 == _T_215 ? 8'hcb : _GEN_800; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_802 = 9'hf9 == _T_215 ? 8'hcc : _GEN_801; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_803 = 9'hfa == _T_215 ? 8'hce : _GEN_802; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_804 = 9'hfb == _T_215 ? 8'hcf : _GEN_803; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_805 = 9'hfc == _T_215 ? 8'hd0 : _GEN_804; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_806 = 9'hfd == _T_215 ? 8'hd2 : _GEN_805; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_807 = 9'hfe == _T_215 ? 8'hd3 : _GEN_806; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_808 = 9'hff == _T_215 ? 8'hd4 : _GEN_807; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_809 = 9'h100 == _T_215 ? 8'h0 : _GEN_808; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_810 = 9'h101 == _T_215 ? 8'h1 : _GEN_809; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_811 = 9'h102 == _T_215 ? 8'h2 : _GEN_810; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_812 = 9'h103 == _T_215 ? 8'h3 : _GEN_811; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_813 = 9'h104 == _T_215 ? 8'h4 : _GEN_812; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_814 = 9'h105 == _T_215 ? 8'h5 : _GEN_813; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_815 = 9'h106 == _T_215 ? 8'h6 : _GEN_814; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_816 = 9'h107 == _T_215 ? 8'h7 : _GEN_815; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_817 = 9'h108 == _T_215 ? 8'h8 : _GEN_816; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_818 = 9'h109 == _T_215 ? 8'h9 : _GEN_817; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_819 = 9'h10a == _T_215 ? 8'ha : _GEN_818; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_820 = 9'h10b == _T_215 ? 8'hb : _GEN_819; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_821 = 9'h10c == _T_215 ? 8'hc : _GEN_820; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_822 = 9'h10d == _T_215 ? 8'hd : _GEN_821; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_823 = 9'h10e == _T_215 ? 8'he : _GEN_822; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_824 = 9'h10f == _T_215 ? 8'hf : _GEN_823; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_825 = 9'h110 == _T_215 ? 8'h10 : _GEN_824; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_826 = 9'h111 == _T_215 ? 8'h11 : _GEN_825; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_827 = 9'h112 == _T_215 ? 8'h12 : _GEN_826; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_828 = 9'h113 == _T_215 ? 8'h13 : _GEN_827; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_829 = 9'h114 == _T_215 ? 8'h14 : _GEN_828; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_830 = 9'h115 == _T_215 ? 8'h15 : _GEN_829; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_831 = 9'h116 == _T_215 ? 8'h16 : _GEN_830; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_832 = 9'h117 == _T_215 ? 8'h17 : _GEN_831; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_833 = 9'h118 == _T_215 ? 8'h18 : _GEN_832; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_834 = 9'h119 == _T_215 ? 8'h19 : _GEN_833; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_835 = 9'h11a == _T_215 ? 8'h1a : _GEN_834; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_836 = 9'h11b == _T_215 ? 8'h1b : _GEN_835; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_837 = 9'h11c == _T_215 ? 8'h1c : _GEN_836; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_838 = 9'h11d == _T_215 ? 8'h1d : _GEN_837; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_839 = 9'h11e == _T_215 ? 8'h1e : _GEN_838; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_840 = 9'h11f == _T_215 ? 8'h1f : _GEN_839; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_841 = 9'h120 == _T_215 ? 8'h20 : _GEN_840; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_842 = 9'h121 == _T_215 ? 8'h21 : _GEN_841; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_843 = 9'h122 == _T_215 ? 8'h22 : _GEN_842; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_844 = 9'h123 == _T_215 ? 8'h23 : _GEN_843; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_845 = 9'h124 == _T_215 ? 8'h24 : _GEN_844; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_846 = 9'h125 == _T_215 ? 8'h25 : _GEN_845; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_847 = 9'h126 == _T_215 ? 8'h26 : _GEN_846; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_848 = 9'h127 == _T_215 ? 8'h27 : _GEN_847; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_849 = 9'h128 == _T_215 ? 8'h28 : _GEN_848; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_850 = 9'h129 == _T_215 ? 8'h29 : _GEN_849; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_851 = 9'h12a == _T_215 ? 8'h2a : _GEN_850; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_852 = 9'h12b == _T_215 ? 8'h2b : _GEN_851; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_853 = 9'h12c == _T_215 ? 8'h2c : _GEN_852; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_854 = 9'h12d == _T_215 ? 8'h2d : _GEN_853; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_855 = 9'h12e == _T_215 ? 8'h2e : _GEN_854; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_856 = 9'h12f == _T_215 ? 8'h2f : _GEN_855; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_857 = 9'h130 == _T_215 ? 8'h30 : _GEN_856; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_858 = 9'h131 == _T_215 ? 8'h31 : _GEN_857; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_859 = 9'h132 == _T_215 ? 8'h32 : _GEN_858; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_860 = 9'h133 == _T_215 ? 8'h33 : _GEN_859; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_861 = 9'h134 == _T_215 ? 8'h34 : _GEN_860; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_862 = 9'h135 == _T_215 ? 8'h35 : _GEN_861; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_863 = 9'h136 == _T_215 ? 8'h36 : _GEN_862; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_864 = 9'h137 == _T_215 ? 8'h37 : _GEN_863; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_865 = 9'h138 == _T_215 ? 8'h38 : _GEN_864; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_866 = 9'h139 == _T_215 ? 8'h39 : _GEN_865; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_867 = 9'h13a == _T_215 ? 8'h3a : _GEN_866; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_868 = 9'h13b == _T_215 ? 8'h3b : _GEN_867; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_869 = 9'h13c == _T_215 ? 8'h3c : _GEN_868; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_870 = 9'h13d == _T_215 ? 8'h3d : _GEN_869; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_871 = 9'h13e == _T_215 ? 8'h3e : _GEN_870; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_872 = 9'h13f == _T_215 ? 8'h3f : _GEN_871; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_873 = 9'h140 == _T_215 ? 8'h40 : _GEN_872; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_874 = 9'h141 == _T_215 ? 8'h41 : _GEN_873; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_875 = 9'h142 == _T_215 ? 8'h42 : _GEN_874; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_876 = 9'h143 == _T_215 ? 8'h43 : _GEN_875; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_877 = 9'h144 == _T_215 ? 8'h44 : _GEN_876; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_878 = 9'h145 == _T_215 ? 8'h45 : _GEN_877; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_879 = 9'h146 == _T_215 ? 8'h46 : _GEN_878; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_880 = 9'h147 == _T_215 ? 8'h47 : _GEN_879; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_881 = 9'h148 == _T_215 ? 8'h48 : _GEN_880; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_882 = 9'h149 == _T_215 ? 8'h49 : _GEN_881; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_883 = 9'h14a == _T_215 ? 8'h4a : _GEN_882; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_884 = 9'h14b == _T_215 ? 8'h4b : _GEN_883; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_885 = 9'h14c == _T_215 ? 8'h4c : _GEN_884; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_886 = 9'h14d == _T_215 ? 8'h4d : _GEN_885; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_887 = 9'h14e == _T_215 ? 8'h4e : _GEN_886; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_888 = 9'h14f == _T_215 ? 8'h4f : _GEN_887; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_889 = 9'h150 == _T_215 ? 8'h50 : _GEN_888; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_890 = 9'h151 == _T_215 ? 8'h51 : _GEN_889; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_891 = 9'h152 == _T_215 ? 8'h52 : _GEN_890; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_892 = 9'h153 == _T_215 ? 8'h53 : _GEN_891; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_893 = 9'h154 == _T_215 ? 8'h54 : _GEN_892; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_894 = 9'h155 == _T_215 ? 8'h55 : _GEN_893; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_895 = 9'h156 == _T_215 ? 8'h56 : _GEN_894; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_896 = 9'h157 == _T_215 ? 8'h57 : _GEN_895; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_897 = 9'h158 == _T_215 ? 8'h58 : _GEN_896; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_898 = 9'h159 == _T_215 ? 8'h59 : _GEN_897; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_899 = 9'h15a == _T_215 ? 8'h5a : _GEN_898; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_900 = 9'h15b == _T_215 ? 8'h5b : _GEN_899; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_901 = 9'h15c == _T_215 ? 8'h5c : _GEN_900; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_902 = 9'h15d == _T_215 ? 8'h5d : _GEN_901; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_903 = 9'h15e == _T_215 ? 8'h5e : _GEN_902; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_904 = 9'h15f == _T_215 ? 8'h5f : _GEN_903; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_905 = 9'h160 == _T_215 ? 8'h60 : _GEN_904; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_906 = 9'h161 == _T_215 ? 8'h61 : _GEN_905; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_907 = 9'h162 == _T_215 ? 8'h62 : _GEN_906; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_908 = 9'h163 == _T_215 ? 8'h63 : _GEN_907; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_909 = 9'h164 == _T_215 ? 8'h64 : _GEN_908; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_910 = 9'h165 == _T_215 ? 8'h65 : _GEN_909; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_911 = 9'h166 == _T_215 ? 8'h66 : _GEN_910; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_912 = 9'h167 == _T_215 ? 8'h67 : _GEN_911; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_913 = 9'h168 == _T_215 ? 8'h68 : _GEN_912; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_914 = 9'h169 == _T_215 ? 8'h69 : _GEN_913; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_915 = 9'h16a == _T_215 ? 8'h6a : _GEN_914; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_916 = 9'h16b == _T_215 ? 8'h6b : _GEN_915; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_917 = 9'h16c == _T_215 ? 8'h6c : _GEN_916; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_918 = 9'h16d == _T_215 ? 8'h6d : _GEN_917; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_919 = 9'h16e == _T_215 ? 8'h6e : _GEN_918; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_920 = 9'h16f == _T_215 ? 8'h6f : _GEN_919; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_921 = 9'h170 == _T_215 ? 8'h70 : _GEN_920; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_922 = 9'h171 == _T_215 ? 8'h71 : _GEN_921; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_923 = 9'h172 == _T_215 ? 8'h72 : _GEN_922; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_924 = 9'h173 == _T_215 ? 8'h73 : _GEN_923; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_925 = 9'h174 == _T_215 ? 8'h74 : _GEN_924; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_926 = 9'h175 == _T_215 ? 8'h75 : _GEN_925; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_927 = 9'h176 == _T_215 ? 8'h76 : _GEN_926; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_928 = 9'h177 == _T_215 ? 8'h77 : _GEN_927; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_929 = 9'h178 == _T_215 ? 8'h78 : _GEN_928; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_930 = 9'h179 == _T_215 ? 8'h79 : _GEN_929; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_931 = 9'h17a == _T_215 ? 8'h7a : _GEN_930; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_932 = 9'h17b == _T_215 ? 8'h7b : _GEN_931; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_933 = 9'h17c == _T_215 ? 8'h7c : _GEN_932; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_934 = 9'h17d == _T_215 ? 8'h7d : _GEN_933; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_935 = 9'h17e == _T_215 ? 8'h7e : _GEN_934; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_936 = 9'h17f == _T_215 ? 8'h7f : _GEN_935; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_937 = 9'h180 == _T_215 ? 8'h0 : _GEN_936; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_938 = 9'h181 == _T_215 ? 8'h3 : _GEN_937; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_939 = 9'h182 == _T_215 ? 8'h6 : _GEN_938; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_940 = 9'h183 == _T_215 ? 8'h9 : _GEN_939; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_941 = 9'h184 == _T_215 ? 8'hc : _GEN_940; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_942 = 9'h185 == _T_215 ? 8'hf : _GEN_941; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_943 = 9'h186 == _T_215 ? 8'h12 : _GEN_942; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_944 = 9'h187 == _T_215 ? 8'h15 : _GEN_943; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_945 = 9'h188 == _T_215 ? 8'h18 : _GEN_944; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_946 = 9'h189 == _T_215 ? 8'h1b : _GEN_945; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_947 = 9'h18a == _T_215 ? 8'h1e : _GEN_946; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_948 = 9'h18b == _T_215 ? 8'h21 : _GEN_947; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_949 = 9'h18c == _T_215 ? 8'h24 : _GEN_948; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_950 = 9'h18d == _T_215 ? 8'h27 : _GEN_949; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_951 = 9'h18e == _T_215 ? 8'h2a : _GEN_950; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_952 = 9'h18f == _T_215 ? 8'h2d : _GEN_951; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_953 = 9'h190 == _T_215 ? 8'h30 : _GEN_952; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_954 = 9'h191 == _T_215 ? 8'h33 : _GEN_953; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_955 = 9'h192 == _T_215 ? 8'h36 : _GEN_954; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_956 = 9'h193 == _T_215 ? 8'h39 : _GEN_955; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_957 = 9'h194 == _T_215 ? 8'h3c : _GEN_956; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_958 = 9'h195 == _T_215 ? 8'h3f : _GEN_957; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_959 = 9'h196 == _T_215 ? 8'h42 : _GEN_958; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_960 = 9'h197 == _T_215 ? 8'h45 : _GEN_959; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_961 = 9'h198 == _T_215 ? 8'h48 : _GEN_960; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_962 = 9'h199 == _T_215 ? 8'h4b : _GEN_961; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_963 = 9'h19a == _T_215 ? 8'h4e : _GEN_962; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_964 = 9'h19b == _T_215 ? 8'h51 : _GEN_963; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_965 = 9'h19c == _T_215 ? 8'h54 : _GEN_964; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_966 = 9'h19d == _T_215 ? 8'h57 : _GEN_965; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_967 = 9'h19e == _T_215 ? 8'h5a : _GEN_966; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_968 = 9'h19f == _T_215 ? 8'h5d : _GEN_967; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_969 = 9'h1a0 == _T_215 ? 8'h60 : _GEN_968; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_970 = 9'h1a1 == _T_215 ? 8'h63 : _GEN_969; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_971 = 9'h1a2 == _T_215 ? 8'h66 : _GEN_970; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_972 = 9'h1a3 == _T_215 ? 8'h69 : _GEN_971; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_973 = 9'h1a4 == _T_215 ? 8'h6c : _GEN_972; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_974 = 9'h1a5 == _T_215 ? 8'h6f : _GEN_973; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_975 = 9'h1a6 == _T_215 ? 8'h72 : _GEN_974; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_976 = 9'h1a7 == _T_215 ? 8'h75 : _GEN_975; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_977 = 9'h1a8 == _T_215 ? 8'h78 : _GEN_976; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_978 = 9'h1a9 == _T_215 ? 8'h7b : _GEN_977; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_979 = 9'h1aa == _T_215 ? 8'h7e : _GEN_978; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_980 = 9'h1ab == _T_215 ? 8'h81 : _GEN_979; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_981 = 9'h1ac == _T_215 ? 8'h83 : _GEN_980; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_982 = 9'h1ad == _T_215 ? 8'h85 : _GEN_981; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_983 = 9'h1ae == _T_215 ? 8'h87 : _GEN_982; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_984 = 9'h1af == _T_215 ? 8'h89 : _GEN_983; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_985 = 9'h1b0 == _T_215 ? 8'h8b : _GEN_984; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_986 = 9'h1b1 == _T_215 ? 8'h8d : _GEN_985; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_987 = 9'h1b2 == _T_215 ? 8'h8f : _GEN_986; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_988 = 9'h1b3 == _T_215 ? 8'h91 : _GEN_987; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_989 = 9'h1b4 == _T_215 ? 8'h93 : _GEN_988; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_990 = 9'h1b5 == _T_215 ? 8'h95 : _GEN_989; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_991 = 9'h1b6 == _T_215 ? 8'h97 : _GEN_990; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_992 = 9'h1b7 == _T_215 ? 8'h99 : _GEN_991; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_993 = 9'h1b8 == _T_215 ? 8'h9b : _GEN_992; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_994 = 9'h1b9 == _T_215 ? 8'h9d : _GEN_993; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_995 = 9'h1ba == _T_215 ? 8'h9f : _GEN_994; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_996 = 9'h1bb == _T_215 ? 8'ha1 : _GEN_995; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_997 = 9'h1bc == _T_215 ? 8'ha3 : _GEN_996; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_998 = 9'h1bd == _T_215 ? 8'ha5 : _GEN_997; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_999 = 9'h1be == _T_215 ? 8'ha7 : _GEN_998; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1000 = 9'h1bf == _T_215 ? 8'ha9 : _GEN_999; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1001 = 9'h1c0 == _T_215 ? 8'hab : _GEN_1000; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1002 = 9'h1c1 == _T_215 ? 8'had : _GEN_1001; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1003 = 9'h1c2 == _T_215 ? 8'haf : _GEN_1002; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1004 = 9'h1c3 == _T_215 ? 8'hb1 : _GEN_1003; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1005 = 9'h1c4 == _T_215 ? 8'hb3 : _GEN_1004; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1006 = 9'h1c5 == _T_215 ? 8'hb5 : _GEN_1005; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1007 = 9'h1c6 == _T_215 ? 8'hb7 : _GEN_1006; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1008 = 9'h1c7 == _T_215 ? 8'hb9 : _GEN_1007; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1009 = 9'h1c8 == _T_215 ? 8'hbb : _GEN_1008; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1010 = 9'h1c9 == _T_215 ? 8'hbd : _GEN_1009; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1011 = 9'h1ca == _T_215 ? 8'hbf : _GEN_1010; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1012 = 9'h1cb == _T_215 ? 8'hc1 : _GEN_1011; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1013 = 9'h1cc == _T_215 ? 8'hc3 : _GEN_1012; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1014 = 9'h1cd == _T_215 ? 8'hc5 : _GEN_1013; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1015 = 9'h1ce == _T_215 ? 8'hc7 : _GEN_1014; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1016 = 9'h1cf == _T_215 ? 8'hc9 : _GEN_1015; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1017 = 9'h1d0 == _T_215 ? 8'hcb : _GEN_1016; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1018 = 9'h1d1 == _T_215 ? 8'hcd : _GEN_1017; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1019 = 9'h1d2 == _T_215 ? 8'hcf : _GEN_1018; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1020 = 9'h1d3 == _T_215 ? 8'hd1 : _GEN_1019; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1021 = 9'h1d4 == _T_215 ? 8'hd3 : _GEN_1020; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1022 = 9'h1d5 == _T_215 ? 8'hd5 : _GEN_1021; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1023 = 9'h1d6 == _T_215 ? 8'hd6 : _GEN_1022; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1024 = 9'h1d7 == _T_215 ? 8'hd7 : _GEN_1023; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1025 = 9'h1d8 == _T_215 ? 8'hd8 : _GEN_1024; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1026 = 9'h1d9 == _T_215 ? 8'hd9 : _GEN_1025; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1027 = 9'h1da == _T_215 ? 8'hda : _GEN_1026; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1028 = 9'h1db == _T_215 ? 8'hdb : _GEN_1027; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1029 = 9'h1dc == _T_215 ? 8'hdc : _GEN_1028; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1030 = 9'h1dd == _T_215 ? 8'hdd : _GEN_1029; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1031 = 9'h1de == _T_215 ? 8'hde : _GEN_1030; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1032 = 9'h1df == _T_215 ? 8'hdf : _GEN_1031; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1033 = 9'h1e0 == _T_215 ? 8'he0 : _GEN_1032; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1034 = 9'h1e1 == _T_215 ? 8'he1 : _GEN_1033; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1035 = 9'h1e2 == _T_215 ? 8'he2 : _GEN_1034; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1036 = 9'h1e3 == _T_215 ? 8'he3 : _GEN_1035; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1037 = 9'h1e4 == _T_215 ? 8'he4 : _GEN_1036; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1038 = 9'h1e5 == _T_215 ? 8'he5 : _GEN_1037; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1039 = 9'h1e6 == _T_215 ? 8'he6 : _GEN_1038; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1040 = 9'h1e7 == _T_215 ? 8'he7 : _GEN_1039; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1041 = 9'h1e8 == _T_215 ? 8'he8 : _GEN_1040; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1042 = 9'h1e9 == _T_215 ? 8'he9 : _GEN_1041; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1043 = 9'h1ea == _T_215 ? 8'hea : _GEN_1042; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1044 = 9'h1eb == _T_215 ? 8'heb : _GEN_1043; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1045 = 9'h1ec == _T_215 ? 8'hec : _GEN_1044; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1046 = 9'h1ed == _T_215 ? 8'hed : _GEN_1045; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1047 = 9'h1ee == _T_215 ? 8'hee : _GEN_1046; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1048 = 9'h1ef == _T_215 ? 8'hef : _GEN_1047; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1049 = 9'h1f0 == _T_215 ? 8'hf0 : _GEN_1048; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1050 = 9'h1f1 == _T_215 ? 8'hf1 : _GEN_1049; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1051 = 9'h1f2 == _T_215 ? 8'hf2 : _GEN_1050; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1052 = 9'h1f3 == _T_215 ? 8'hf3 : _GEN_1051; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1053 = 9'h1f4 == _T_215 ? 8'hf4 : _GEN_1052; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1054 = 9'h1f5 == _T_215 ? 8'hf5 : _GEN_1053; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1055 = 9'h1f6 == _T_215 ? 8'hf6 : _GEN_1054; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1056 = 9'h1f7 == _T_215 ? 8'hf7 : _GEN_1055; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1057 = 9'h1f8 == _T_215 ? 8'hf8 : _GEN_1056; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1058 = 9'h1f9 == _T_215 ? 8'hf9 : _GEN_1057; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1059 = 9'h1fa == _T_215 ? 8'hfa : _GEN_1058; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1060 = 9'h1fb == _T_215 ? 8'hfb : _GEN_1059; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1061 = 9'h1fc == _T_215 ? 8'hfc : _GEN_1060; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1062 = 9'h1fd == _T_215 ? 8'hfd : _GEN_1061; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1063 = 9'h1fe == _T_215 ? 8'hfe : _GEN_1062; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1064 = 9'h1ff == _T_215 ? 8'hff : _GEN_1063; // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1067 = 8'h1 == _GEN_1064 ? $signed(16'sh3fff) : $signed(16'sh4000); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1068 = 8'h1 == _GEN_1064 ? $signed(-16'shc9) : $signed(16'sh0); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1069 = 8'h2 == _GEN_1064 ? $signed(16'sh3ffb) : $signed(_GEN_1067); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1070 = 8'h2 == _GEN_1064 ? $signed(-16'sh192) : $signed(_GEN_1068); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1071 = 8'h3 == _GEN_1064 ? $signed(16'sh3ff5) : $signed(_GEN_1069); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1072 = 8'h3 == _GEN_1064 ? $signed(-16'sh25b) : $signed(_GEN_1070); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1073 = 8'h4 == _GEN_1064 ? $signed(16'sh3fec) : $signed(_GEN_1071); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1074 = 8'h4 == _GEN_1064 ? $signed(-16'sh324) : $signed(_GEN_1072); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1075 = 8'h5 == _GEN_1064 ? $signed(16'sh3fe1) : $signed(_GEN_1073); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1076 = 8'h5 == _GEN_1064 ? $signed(-16'sh3ed) : $signed(_GEN_1074); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1077 = 8'h6 == _GEN_1064 ? $signed(16'sh3fd4) : $signed(_GEN_1075); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1078 = 8'h6 == _GEN_1064 ? $signed(-16'sh4b5) : $signed(_GEN_1076); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1079 = 8'h7 == _GEN_1064 ? $signed(16'sh3fc4) : $signed(_GEN_1077); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1080 = 8'h7 == _GEN_1064 ? $signed(-16'sh57e) : $signed(_GEN_1078); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1081 = 8'h8 == _GEN_1064 ? $signed(16'sh3fb1) : $signed(_GEN_1079); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1082 = 8'h8 == _GEN_1064 ? $signed(-16'sh646) : $signed(_GEN_1080); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1083 = 8'h9 == _GEN_1064 ? $signed(16'sh3f9c) : $signed(_GEN_1081); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1084 = 8'h9 == _GEN_1064 ? $signed(-16'sh70e) : $signed(_GEN_1082); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1085 = 8'ha == _GEN_1064 ? $signed(16'sh3f85) : $signed(_GEN_1083); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1086 = 8'ha == _GEN_1064 ? $signed(-16'sh7d6) : $signed(_GEN_1084); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1087 = 8'hb == _GEN_1064 ? $signed(16'sh3f6b) : $signed(_GEN_1085); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1088 = 8'hb == _GEN_1064 ? $signed(-16'sh89d) : $signed(_GEN_1086); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1089 = 8'hc == _GEN_1064 ? $signed(16'sh3f4f) : $signed(_GEN_1087); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1090 = 8'hc == _GEN_1064 ? $signed(-16'sh964) : $signed(_GEN_1088); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1091 = 8'hd == _GEN_1064 ? $signed(16'sh3f30) : $signed(_GEN_1089); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1092 = 8'hd == _GEN_1064 ? $signed(-16'sha2b) : $signed(_GEN_1090); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1093 = 8'he == _GEN_1064 ? $signed(16'sh3f0f) : $signed(_GEN_1091); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1094 = 8'he == _GEN_1064 ? $signed(-16'shaf1) : $signed(_GEN_1092); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1095 = 8'hf == _GEN_1064 ? $signed(16'sh3eeb) : $signed(_GEN_1093); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1096 = 8'hf == _GEN_1064 ? $signed(-16'shbb7) : $signed(_GEN_1094); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1097 = 8'h10 == _GEN_1064 ? $signed(16'sh3ec5) : $signed(_GEN_1095); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1098 = 8'h10 == _GEN_1064 ? $signed(-16'shc7c) : $signed(_GEN_1096); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1099 = 8'h11 == _GEN_1064 ? $signed(16'sh3e9d) : $signed(_GEN_1097); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1100 = 8'h11 == _GEN_1064 ? $signed(-16'shd41) : $signed(_GEN_1098); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1101 = 8'h12 == _GEN_1064 ? $signed(16'sh3e72) : $signed(_GEN_1099); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1102 = 8'h12 == _GEN_1064 ? $signed(-16'she06) : $signed(_GEN_1100); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1103 = 8'h13 == _GEN_1064 ? $signed(16'sh3e45) : $signed(_GEN_1101); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1104 = 8'h13 == _GEN_1064 ? $signed(-16'sheca) : $signed(_GEN_1102); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1105 = 8'h14 == _GEN_1064 ? $signed(16'sh3e15) : $signed(_GEN_1103); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1106 = 8'h14 == _GEN_1064 ? $signed(-16'shf8d) : $signed(_GEN_1104); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1107 = 8'h15 == _GEN_1064 ? $signed(16'sh3de3) : $signed(_GEN_1105); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1108 = 8'h15 == _GEN_1064 ? $signed(-16'sh1050) : $signed(_GEN_1106); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1109 = 8'h16 == _GEN_1064 ? $signed(16'sh3daf) : $signed(_GEN_1107); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1110 = 8'h16 == _GEN_1064 ? $signed(-16'sh1112) : $signed(_GEN_1108); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1111 = 8'h17 == _GEN_1064 ? $signed(16'sh3d78) : $signed(_GEN_1109); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1112 = 8'h17 == _GEN_1064 ? $signed(-16'sh11d3) : $signed(_GEN_1110); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1113 = 8'h18 == _GEN_1064 ? $signed(16'sh3d3f) : $signed(_GEN_1111); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1114 = 8'h18 == _GEN_1064 ? $signed(-16'sh1294) : $signed(_GEN_1112); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1115 = 8'h19 == _GEN_1064 ? $signed(16'sh3d03) : $signed(_GEN_1113); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1116 = 8'h19 == _GEN_1064 ? $signed(-16'sh1354) : $signed(_GEN_1114); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1117 = 8'h1a == _GEN_1064 ? $signed(16'sh3cc5) : $signed(_GEN_1115); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1118 = 8'h1a == _GEN_1064 ? $signed(-16'sh1413) : $signed(_GEN_1116); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1119 = 8'h1b == _GEN_1064 ? $signed(16'sh3c85) : $signed(_GEN_1117); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1120 = 8'h1b == _GEN_1064 ? $signed(-16'sh14d2) : $signed(_GEN_1118); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1121 = 8'h1c == _GEN_1064 ? $signed(16'sh3c42) : $signed(_GEN_1119); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1122 = 8'h1c == _GEN_1064 ? $signed(-16'sh1590) : $signed(_GEN_1120); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1123 = 8'h1d == _GEN_1064 ? $signed(16'sh3bfd) : $signed(_GEN_1121); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1124 = 8'h1d == _GEN_1064 ? $signed(-16'sh164c) : $signed(_GEN_1122); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1125 = 8'h1e == _GEN_1064 ? $signed(16'sh3bb6) : $signed(_GEN_1123); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1126 = 8'h1e == _GEN_1064 ? $signed(-16'sh1709) : $signed(_GEN_1124); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1127 = 8'h1f == _GEN_1064 ? $signed(16'sh3b6d) : $signed(_GEN_1125); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1128 = 8'h1f == _GEN_1064 ? $signed(-16'sh17c4) : $signed(_GEN_1126); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1129 = 8'h20 == _GEN_1064 ? $signed(16'sh3b21) : $signed(_GEN_1127); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1130 = 8'h20 == _GEN_1064 ? $signed(-16'sh187e) : $signed(_GEN_1128); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1131 = 8'h21 == _GEN_1064 ? $signed(16'sh3ad3) : $signed(_GEN_1129); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1132 = 8'h21 == _GEN_1064 ? $signed(-16'sh1937) : $signed(_GEN_1130); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1133 = 8'h22 == _GEN_1064 ? $signed(16'sh3a82) : $signed(_GEN_1131); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1134 = 8'h22 == _GEN_1064 ? $signed(-16'sh19ef) : $signed(_GEN_1132); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1135 = 8'h23 == _GEN_1064 ? $signed(16'sh3a30) : $signed(_GEN_1133); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1136 = 8'h23 == _GEN_1064 ? $signed(-16'sh1aa7) : $signed(_GEN_1134); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1137 = 8'h24 == _GEN_1064 ? $signed(16'sh39db) : $signed(_GEN_1135); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1138 = 8'h24 == _GEN_1064 ? $signed(-16'sh1b5d) : $signed(_GEN_1136); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1139 = 8'h25 == _GEN_1064 ? $signed(16'sh3984) : $signed(_GEN_1137); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1140 = 8'h25 == _GEN_1064 ? $signed(-16'sh1c12) : $signed(_GEN_1138); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1141 = 8'h26 == _GEN_1064 ? $signed(16'sh392b) : $signed(_GEN_1139); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1142 = 8'h26 == _GEN_1064 ? $signed(-16'sh1cc6) : $signed(_GEN_1140); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1143 = 8'h27 == _GEN_1064 ? $signed(16'sh38cf) : $signed(_GEN_1141); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1144 = 8'h27 == _GEN_1064 ? $signed(-16'sh1d79) : $signed(_GEN_1142); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1145 = 8'h28 == _GEN_1064 ? $signed(16'sh3871) : $signed(_GEN_1143); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1146 = 8'h28 == _GEN_1064 ? $signed(-16'sh1e2b) : $signed(_GEN_1144); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1147 = 8'h29 == _GEN_1064 ? $signed(16'sh3812) : $signed(_GEN_1145); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1148 = 8'h29 == _GEN_1064 ? $signed(-16'sh1edc) : $signed(_GEN_1146); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1149 = 8'h2a == _GEN_1064 ? $signed(16'sh37b0) : $signed(_GEN_1147); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1150 = 8'h2a == _GEN_1064 ? $signed(-16'sh1f8c) : $signed(_GEN_1148); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1151 = 8'h2b == _GEN_1064 ? $signed(16'sh374b) : $signed(_GEN_1149); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1152 = 8'h2b == _GEN_1064 ? $signed(-16'sh203a) : $signed(_GEN_1150); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1153 = 8'h2c == _GEN_1064 ? $signed(16'sh36e5) : $signed(_GEN_1151); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1154 = 8'h2c == _GEN_1064 ? $signed(-16'sh20e7) : $signed(_GEN_1152); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1155 = 8'h2d == _GEN_1064 ? $signed(16'sh367d) : $signed(_GEN_1153); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1156 = 8'h2d == _GEN_1064 ? $signed(-16'sh2193) : $signed(_GEN_1154); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1157 = 8'h2e == _GEN_1064 ? $signed(16'sh3612) : $signed(_GEN_1155); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1158 = 8'h2e == _GEN_1064 ? $signed(-16'sh223d) : $signed(_GEN_1156); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1159 = 8'h2f == _GEN_1064 ? $signed(16'sh35a5) : $signed(_GEN_1157); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1160 = 8'h2f == _GEN_1064 ? $signed(-16'sh22e7) : $signed(_GEN_1158); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1161 = 8'h30 == _GEN_1064 ? $signed(16'sh3537) : $signed(_GEN_1159); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1162 = 8'h30 == _GEN_1064 ? $signed(-16'sh238e) : $signed(_GEN_1160); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1163 = 8'h31 == _GEN_1064 ? $signed(16'sh34c6) : $signed(_GEN_1161); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1164 = 8'h31 == _GEN_1064 ? $signed(-16'sh2435) : $signed(_GEN_1162); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1165 = 8'h32 == _GEN_1064 ? $signed(16'sh3453) : $signed(_GEN_1163); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1166 = 8'h32 == _GEN_1064 ? $signed(-16'sh24da) : $signed(_GEN_1164); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1167 = 8'h33 == _GEN_1064 ? $signed(16'sh33df) : $signed(_GEN_1165); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1168 = 8'h33 == _GEN_1064 ? $signed(-16'sh257e) : $signed(_GEN_1166); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1169 = 8'h34 == _GEN_1064 ? $signed(16'sh3368) : $signed(_GEN_1167); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1170 = 8'h34 == _GEN_1064 ? $signed(-16'sh2620) : $signed(_GEN_1168); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1171 = 8'h35 == _GEN_1064 ? $signed(16'sh32ef) : $signed(_GEN_1169); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1172 = 8'h35 == _GEN_1064 ? $signed(-16'sh26c1) : $signed(_GEN_1170); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1173 = 8'h36 == _GEN_1064 ? $signed(16'sh3274) : $signed(_GEN_1171); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1174 = 8'h36 == _GEN_1064 ? $signed(-16'sh2760) : $signed(_GEN_1172); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1175 = 8'h37 == _GEN_1064 ? $signed(16'sh31f8) : $signed(_GEN_1173); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1176 = 8'h37 == _GEN_1064 ? $signed(-16'sh27fe) : $signed(_GEN_1174); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1177 = 8'h38 == _GEN_1064 ? $signed(16'sh3179) : $signed(_GEN_1175); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1178 = 8'h38 == _GEN_1064 ? $signed(-16'sh289a) : $signed(_GEN_1176); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1179 = 8'h39 == _GEN_1064 ? $signed(16'sh30f9) : $signed(_GEN_1177); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1180 = 8'h39 == _GEN_1064 ? $signed(-16'sh2935) : $signed(_GEN_1178); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1181 = 8'h3a == _GEN_1064 ? $signed(16'sh3076) : $signed(_GEN_1179); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1182 = 8'h3a == _GEN_1064 ? $signed(-16'sh29ce) : $signed(_GEN_1180); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1183 = 8'h3b == _GEN_1064 ? $signed(16'sh2ff2) : $signed(_GEN_1181); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1184 = 8'h3b == _GEN_1064 ? $signed(-16'sh2a65) : $signed(_GEN_1182); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1185 = 8'h3c == _GEN_1064 ? $signed(16'sh2f6c) : $signed(_GEN_1183); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1186 = 8'h3c == _GEN_1064 ? $signed(-16'sh2afb) : $signed(_GEN_1184); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1187 = 8'h3d == _GEN_1064 ? $signed(16'sh2ee4) : $signed(_GEN_1185); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1188 = 8'h3d == _GEN_1064 ? $signed(-16'sh2b8f) : $signed(_GEN_1186); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1189 = 8'h3e == _GEN_1064 ? $signed(16'sh2e5a) : $signed(_GEN_1187); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1190 = 8'h3e == _GEN_1064 ? $signed(-16'sh2c21) : $signed(_GEN_1188); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1191 = 8'h3f == _GEN_1064 ? $signed(16'sh2dcf) : $signed(_GEN_1189); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1192 = 8'h3f == _GEN_1064 ? $signed(-16'sh2cb2) : $signed(_GEN_1190); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1193 = 8'h40 == _GEN_1064 ? $signed(16'sh2d41) : $signed(_GEN_1191); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1194 = 8'h40 == _GEN_1064 ? $signed(-16'sh2d41) : $signed(_GEN_1192); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1195 = 8'h41 == _GEN_1064 ? $signed(16'sh2cb2) : $signed(_GEN_1193); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1196 = 8'h41 == _GEN_1064 ? $signed(-16'sh2dcf) : $signed(_GEN_1194); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1197 = 8'h42 == _GEN_1064 ? $signed(16'sh2c21) : $signed(_GEN_1195); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1198 = 8'h42 == _GEN_1064 ? $signed(-16'sh2e5a) : $signed(_GEN_1196); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1199 = 8'h43 == _GEN_1064 ? $signed(16'sh2b8f) : $signed(_GEN_1197); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1200 = 8'h43 == _GEN_1064 ? $signed(-16'sh2ee4) : $signed(_GEN_1198); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1201 = 8'h44 == _GEN_1064 ? $signed(16'sh2afb) : $signed(_GEN_1199); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1202 = 8'h44 == _GEN_1064 ? $signed(-16'sh2f6c) : $signed(_GEN_1200); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1203 = 8'h45 == _GEN_1064 ? $signed(16'sh2a65) : $signed(_GEN_1201); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1204 = 8'h45 == _GEN_1064 ? $signed(-16'sh2ff2) : $signed(_GEN_1202); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1205 = 8'h46 == _GEN_1064 ? $signed(16'sh29ce) : $signed(_GEN_1203); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1206 = 8'h46 == _GEN_1064 ? $signed(-16'sh3076) : $signed(_GEN_1204); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1207 = 8'h47 == _GEN_1064 ? $signed(16'sh2935) : $signed(_GEN_1205); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1208 = 8'h47 == _GEN_1064 ? $signed(-16'sh30f9) : $signed(_GEN_1206); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1209 = 8'h48 == _GEN_1064 ? $signed(16'sh289a) : $signed(_GEN_1207); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1210 = 8'h48 == _GEN_1064 ? $signed(-16'sh3179) : $signed(_GEN_1208); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1211 = 8'h49 == _GEN_1064 ? $signed(16'sh27fe) : $signed(_GEN_1209); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1212 = 8'h49 == _GEN_1064 ? $signed(-16'sh31f8) : $signed(_GEN_1210); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1213 = 8'h4a == _GEN_1064 ? $signed(16'sh2760) : $signed(_GEN_1211); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1214 = 8'h4a == _GEN_1064 ? $signed(-16'sh3274) : $signed(_GEN_1212); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1215 = 8'h4b == _GEN_1064 ? $signed(16'sh26c1) : $signed(_GEN_1213); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1216 = 8'h4b == _GEN_1064 ? $signed(-16'sh32ef) : $signed(_GEN_1214); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1217 = 8'h4c == _GEN_1064 ? $signed(16'sh2620) : $signed(_GEN_1215); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1218 = 8'h4c == _GEN_1064 ? $signed(-16'sh3368) : $signed(_GEN_1216); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1219 = 8'h4d == _GEN_1064 ? $signed(16'sh257e) : $signed(_GEN_1217); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1220 = 8'h4d == _GEN_1064 ? $signed(-16'sh33df) : $signed(_GEN_1218); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1221 = 8'h4e == _GEN_1064 ? $signed(16'sh24da) : $signed(_GEN_1219); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1222 = 8'h4e == _GEN_1064 ? $signed(-16'sh3453) : $signed(_GEN_1220); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1223 = 8'h4f == _GEN_1064 ? $signed(16'sh2435) : $signed(_GEN_1221); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1224 = 8'h4f == _GEN_1064 ? $signed(-16'sh34c6) : $signed(_GEN_1222); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1225 = 8'h50 == _GEN_1064 ? $signed(16'sh238e) : $signed(_GEN_1223); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1226 = 8'h50 == _GEN_1064 ? $signed(-16'sh3537) : $signed(_GEN_1224); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1227 = 8'h51 == _GEN_1064 ? $signed(16'sh22e7) : $signed(_GEN_1225); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1228 = 8'h51 == _GEN_1064 ? $signed(-16'sh35a5) : $signed(_GEN_1226); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1229 = 8'h52 == _GEN_1064 ? $signed(16'sh223d) : $signed(_GEN_1227); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1230 = 8'h52 == _GEN_1064 ? $signed(-16'sh3612) : $signed(_GEN_1228); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1231 = 8'h53 == _GEN_1064 ? $signed(16'sh2193) : $signed(_GEN_1229); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1232 = 8'h53 == _GEN_1064 ? $signed(-16'sh367d) : $signed(_GEN_1230); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1233 = 8'h54 == _GEN_1064 ? $signed(16'sh20e7) : $signed(_GEN_1231); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1234 = 8'h54 == _GEN_1064 ? $signed(-16'sh36e5) : $signed(_GEN_1232); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1235 = 8'h55 == _GEN_1064 ? $signed(16'sh203a) : $signed(_GEN_1233); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1236 = 8'h55 == _GEN_1064 ? $signed(-16'sh374b) : $signed(_GEN_1234); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1237 = 8'h56 == _GEN_1064 ? $signed(16'sh1f8c) : $signed(_GEN_1235); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1238 = 8'h56 == _GEN_1064 ? $signed(-16'sh37b0) : $signed(_GEN_1236); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1239 = 8'h57 == _GEN_1064 ? $signed(16'sh1edc) : $signed(_GEN_1237); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1240 = 8'h57 == _GEN_1064 ? $signed(-16'sh3812) : $signed(_GEN_1238); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1241 = 8'h58 == _GEN_1064 ? $signed(16'sh1e2b) : $signed(_GEN_1239); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1242 = 8'h58 == _GEN_1064 ? $signed(-16'sh3871) : $signed(_GEN_1240); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1243 = 8'h59 == _GEN_1064 ? $signed(16'sh1d79) : $signed(_GEN_1241); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1244 = 8'h59 == _GEN_1064 ? $signed(-16'sh38cf) : $signed(_GEN_1242); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1245 = 8'h5a == _GEN_1064 ? $signed(16'sh1cc6) : $signed(_GEN_1243); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1246 = 8'h5a == _GEN_1064 ? $signed(-16'sh392b) : $signed(_GEN_1244); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1247 = 8'h5b == _GEN_1064 ? $signed(16'sh1c12) : $signed(_GEN_1245); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1248 = 8'h5b == _GEN_1064 ? $signed(-16'sh3984) : $signed(_GEN_1246); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1249 = 8'h5c == _GEN_1064 ? $signed(16'sh1b5d) : $signed(_GEN_1247); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1250 = 8'h5c == _GEN_1064 ? $signed(-16'sh39db) : $signed(_GEN_1248); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1251 = 8'h5d == _GEN_1064 ? $signed(16'sh1aa7) : $signed(_GEN_1249); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1252 = 8'h5d == _GEN_1064 ? $signed(-16'sh3a30) : $signed(_GEN_1250); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1253 = 8'h5e == _GEN_1064 ? $signed(16'sh19ef) : $signed(_GEN_1251); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1254 = 8'h5e == _GEN_1064 ? $signed(-16'sh3a82) : $signed(_GEN_1252); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1255 = 8'h5f == _GEN_1064 ? $signed(16'sh1937) : $signed(_GEN_1253); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1256 = 8'h5f == _GEN_1064 ? $signed(-16'sh3ad3) : $signed(_GEN_1254); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1257 = 8'h60 == _GEN_1064 ? $signed(16'sh187e) : $signed(_GEN_1255); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1258 = 8'h60 == _GEN_1064 ? $signed(-16'sh3b21) : $signed(_GEN_1256); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1259 = 8'h61 == _GEN_1064 ? $signed(16'sh17c4) : $signed(_GEN_1257); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1260 = 8'h61 == _GEN_1064 ? $signed(-16'sh3b6d) : $signed(_GEN_1258); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1261 = 8'h62 == _GEN_1064 ? $signed(16'sh1709) : $signed(_GEN_1259); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1262 = 8'h62 == _GEN_1064 ? $signed(-16'sh3bb6) : $signed(_GEN_1260); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1263 = 8'h63 == _GEN_1064 ? $signed(16'sh164c) : $signed(_GEN_1261); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1264 = 8'h63 == _GEN_1064 ? $signed(-16'sh3bfd) : $signed(_GEN_1262); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1265 = 8'h64 == _GEN_1064 ? $signed(16'sh1590) : $signed(_GEN_1263); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1266 = 8'h64 == _GEN_1064 ? $signed(-16'sh3c42) : $signed(_GEN_1264); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1267 = 8'h65 == _GEN_1064 ? $signed(16'sh14d2) : $signed(_GEN_1265); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1268 = 8'h65 == _GEN_1064 ? $signed(-16'sh3c85) : $signed(_GEN_1266); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1269 = 8'h66 == _GEN_1064 ? $signed(16'sh1413) : $signed(_GEN_1267); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1270 = 8'h66 == _GEN_1064 ? $signed(-16'sh3cc5) : $signed(_GEN_1268); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1271 = 8'h67 == _GEN_1064 ? $signed(16'sh1354) : $signed(_GEN_1269); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1272 = 8'h67 == _GEN_1064 ? $signed(-16'sh3d03) : $signed(_GEN_1270); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1273 = 8'h68 == _GEN_1064 ? $signed(16'sh1294) : $signed(_GEN_1271); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1274 = 8'h68 == _GEN_1064 ? $signed(-16'sh3d3f) : $signed(_GEN_1272); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1275 = 8'h69 == _GEN_1064 ? $signed(16'sh11d3) : $signed(_GEN_1273); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1276 = 8'h69 == _GEN_1064 ? $signed(-16'sh3d78) : $signed(_GEN_1274); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1277 = 8'h6a == _GEN_1064 ? $signed(16'sh1112) : $signed(_GEN_1275); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1278 = 8'h6a == _GEN_1064 ? $signed(-16'sh3daf) : $signed(_GEN_1276); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1279 = 8'h6b == _GEN_1064 ? $signed(16'sh1050) : $signed(_GEN_1277); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1280 = 8'h6b == _GEN_1064 ? $signed(-16'sh3de3) : $signed(_GEN_1278); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1281 = 8'h6c == _GEN_1064 ? $signed(16'shf8d) : $signed(_GEN_1279); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1282 = 8'h6c == _GEN_1064 ? $signed(-16'sh3e15) : $signed(_GEN_1280); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1283 = 8'h6d == _GEN_1064 ? $signed(16'sheca) : $signed(_GEN_1281); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1284 = 8'h6d == _GEN_1064 ? $signed(-16'sh3e45) : $signed(_GEN_1282); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1285 = 8'h6e == _GEN_1064 ? $signed(16'she06) : $signed(_GEN_1283); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1286 = 8'h6e == _GEN_1064 ? $signed(-16'sh3e72) : $signed(_GEN_1284); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1287 = 8'h6f == _GEN_1064 ? $signed(16'shd41) : $signed(_GEN_1285); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1288 = 8'h6f == _GEN_1064 ? $signed(-16'sh3e9d) : $signed(_GEN_1286); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1289 = 8'h70 == _GEN_1064 ? $signed(16'shc7c) : $signed(_GEN_1287); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1290 = 8'h70 == _GEN_1064 ? $signed(-16'sh3ec5) : $signed(_GEN_1288); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1291 = 8'h71 == _GEN_1064 ? $signed(16'shbb7) : $signed(_GEN_1289); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1292 = 8'h71 == _GEN_1064 ? $signed(-16'sh3eeb) : $signed(_GEN_1290); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1293 = 8'h72 == _GEN_1064 ? $signed(16'shaf1) : $signed(_GEN_1291); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1294 = 8'h72 == _GEN_1064 ? $signed(-16'sh3f0f) : $signed(_GEN_1292); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1295 = 8'h73 == _GEN_1064 ? $signed(16'sha2b) : $signed(_GEN_1293); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1296 = 8'h73 == _GEN_1064 ? $signed(-16'sh3f30) : $signed(_GEN_1294); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1297 = 8'h74 == _GEN_1064 ? $signed(16'sh964) : $signed(_GEN_1295); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1298 = 8'h74 == _GEN_1064 ? $signed(-16'sh3f4f) : $signed(_GEN_1296); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1299 = 8'h75 == _GEN_1064 ? $signed(16'sh89d) : $signed(_GEN_1297); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1300 = 8'h75 == _GEN_1064 ? $signed(-16'sh3f6b) : $signed(_GEN_1298); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1301 = 8'h76 == _GEN_1064 ? $signed(16'sh7d6) : $signed(_GEN_1299); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1302 = 8'h76 == _GEN_1064 ? $signed(-16'sh3f85) : $signed(_GEN_1300); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1303 = 8'h77 == _GEN_1064 ? $signed(16'sh70e) : $signed(_GEN_1301); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1304 = 8'h77 == _GEN_1064 ? $signed(-16'sh3f9c) : $signed(_GEN_1302); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1305 = 8'h78 == _GEN_1064 ? $signed(16'sh646) : $signed(_GEN_1303); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1306 = 8'h78 == _GEN_1064 ? $signed(-16'sh3fb1) : $signed(_GEN_1304); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1307 = 8'h79 == _GEN_1064 ? $signed(16'sh57e) : $signed(_GEN_1305); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1308 = 8'h79 == _GEN_1064 ? $signed(-16'sh3fc4) : $signed(_GEN_1306); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1309 = 8'h7a == _GEN_1064 ? $signed(16'sh4b5) : $signed(_GEN_1307); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1310 = 8'h7a == _GEN_1064 ? $signed(-16'sh3fd4) : $signed(_GEN_1308); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1311 = 8'h7b == _GEN_1064 ? $signed(16'sh3ed) : $signed(_GEN_1309); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1312 = 8'h7b == _GEN_1064 ? $signed(-16'sh3fe1) : $signed(_GEN_1310); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1313 = 8'h7c == _GEN_1064 ? $signed(16'sh324) : $signed(_GEN_1311); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1314 = 8'h7c == _GEN_1064 ? $signed(-16'sh3fec) : $signed(_GEN_1312); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1315 = 8'h7d == _GEN_1064 ? $signed(16'sh25b) : $signed(_GEN_1313); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1316 = 8'h7d == _GEN_1064 ? $signed(-16'sh3ff5) : $signed(_GEN_1314); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1317 = 8'h7e == _GEN_1064 ? $signed(16'sh192) : $signed(_GEN_1315); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1318 = 8'h7e == _GEN_1064 ? $signed(-16'sh3ffb) : $signed(_GEN_1316); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1319 = 8'h7f == _GEN_1064 ? $signed(16'shc9) : $signed(_GEN_1317); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1320 = 8'h7f == _GEN_1064 ? $signed(-16'sh3fff) : $signed(_GEN_1318); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1321 = 8'h80 == _GEN_1064 ? $signed(16'sh0) : $signed(_GEN_1319); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1322 = 8'h80 == _GEN_1064 ? $signed(-16'sh4000) : $signed(_GEN_1320); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1323 = 8'h81 == _GEN_1064 ? $signed(-16'shc9) : $signed(_GEN_1321); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1324 = 8'h81 == _GEN_1064 ? $signed(-16'sh3fff) : $signed(_GEN_1322); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1325 = 8'h82 == _GEN_1064 ? $signed(-16'sh192) : $signed(_GEN_1323); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1326 = 8'h82 == _GEN_1064 ? $signed(-16'sh3ffb) : $signed(_GEN_1324); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1327 = 8'h83 == _GEN_1064 ? $signed(-16'sh324) : $signed(_GEN_1325); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1328 = 8'h83 == _GEN_1064 ? $signed(-16'sh3fec) : $signed(_GEN_1326); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1329 = 8'h84 == _GEN_1064 ? $signed(-16'sh4b5) : $signed(_GEN_1327); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1330 = 8'h84 == _GEN_1064 ? $signed(-16'sh3fd4) : $signed(_GEN_1328); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1331 = 8'h85 == _GEN_1064 ? $signed(-16'sh57e) : $signed(_GEN_1329); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1332 = 8'h85 == _GEN_1064 ? $signed(-16'sh3fc4) : $signed(_GEN_1330); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1333 = 8'h86 == _GEN_1064 ? $signed(-16'sh646) : $signed(_GEN_1331); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1334 = 8'h86 == _GEN_1064 ? $signed(-16'sh3fb1) : $signed(_GEN_1332); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1335 = 8'h87 == _GEN_1064 ? $signed(-16'sh7d6) : $signed(_GEN_1333); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1336 = 8'h87 == _GEN_1064 ? $signed(-16'sh3f85) : $signed(_GEN_1334); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1337 = 8'h88 == _GEN_1064 ? $signed(-16'sh964) : $signed(_GEN_1335); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1338 = 8'h88 == _GEN_1064 ? $signed(-16'sh3f4f) : $signed(_GEN_1336); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1339 = 8'h89 == _GEN_1064 ? $signed(-16'sha2b) : $signed(_GEN_1337); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1340 = 8'h89 == _GEN_1064 ? $signed(-16'sh3f30) : $signed(_GEN_1338); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1341 = 8'h8a == _GEN_1064 ? $signed(-16'shaf1) : $signed(_GEN_1339); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1342 = 8'h8a == _GEN_1064 ? $signed(-16'sh3f0f) : $signed(_GEN_1340); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1343 = 8'h8b == _GEN_1064 ? $signed(-16'shc7c) : $signed(_GEN_1341); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1344 = 8'h8b == _GEN_1064 ? $signed(-16'sh3ec5) : $signed(_GEN_1342); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1345 = 8'h8c == _GEN_1064 ? $signed(-16'she06) : $signed(_GEN_1343); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1346 = 8'h8c == _GEN_1064 ? $signed(-16'sh3e72) : $signed(_GEN_1344); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1347 = 8'h8d == _GEN_1064 ? $signed(-16'sheca) : $signed(_GEN_1345); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1348 = 8'h8d == _GEN_1064 ? $signed(-16'sh3e45) : $signed(_GEN_1346); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1349 = 8'h8e == _GEN_1064 ? $signed(-16'shf8d) : $signed(_GEN_1347); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1350 = 8'h8e == _GEN_1064 ? $signed(-16'sh3e15) : $signed(_GEN_1348); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1351 = 8'h8f == _GEN_1064 ? $signed(-16'sh1112) : $signed(_GEN_1349); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1352 = 8'h8f == _GEN_1064 ? $signed(-16'sh3daf) : $signed(_GEN_1350); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1353 = 8'h90 == _GEN_1064 ? $signed(-16'sh1294) : $signed(_GEN_1351); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1354 = 8'h90 == _GEN_1064 ? $signed(-16'sh3d3f) : $signed(_GEN_1352); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1355 = 8'h91 == _GEN_1064 ? $signed(-16'sh1354) : $signed(_GEN_1353); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1356 = 8'h91 == _GEN_1064 ? $signed(-16'sh3d03) : $signed(_GEN_1354); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1357 = 8'h92 == _GEN_1064 ? $signed(-16'sh1413) : $signed(_GEN_1355); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1358 = 8'h92 == _GEN_1064 ? $signed(-16'sh3cc5) : $signed(_GEN_1356); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1359 = 8'h93 == _GEN_1064 ? $signed(-16'sh1590) : $signed(_GEN_1357); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1360 = 8'h93 == _GEN_1064 ? $signed(-16'sh3c42) : $signed(_GEN_1358); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1361 = 8'h94 == _GEN_1064 ? $signed(-16'sh1709) : $signed(_GEN_1359); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1362 = 8'h94 == _GEN_1064 ? $signed(-16'sh3bb6) : $signed(_GEN_1360); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1363 = 8'h95 == _GEN_1064 ? $signed(-16'sh17c4) : $signed(_GEN_1361); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1364 = 8'h95 == _GEN_1064 ? $signed(-16'sh3b6d) : $signed(_GEN_1362); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1365 = 8'h96 == _GEN_1064 ? $signed(-16'sh187e) : $signed(_GEN_1363); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1366 = 8'h96 == _GEN_1064 ? $signed(-16'sh3b21) : $signed(_GEN_1364); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1367 = 8'h97 == _GEN_1064 ? $signed(-16'sh19ef) : $signed(_GEN_1365); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1368 = 8'h97 == _GEN_1064 ? $signed(-16'sh3a82) : $signed(_GEN_1366); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1369 = 8'h98 == _GEN_1064 ? $signed(-16'sh1b5d) : $signed(_GEN_1367); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1370 = 8'h98 == _GEN_1064 ? $signed(-16'sh39db) : $signed(_GEN_1368); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1371 = 8'h99 == _GEN_1064 ? $signed(-16'sh1c12) : $signed(_GEN_1369); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1372 = 8'h99 == _GEN_1064 ? $signed(-16'sh3984) : $signed(_GEN_1370); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1373 = 8'h9a == _GEN_1064 ? $signed(-16'sh1cc6) : $signed(_GEN_1371); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1374 = 8'h9a == _GEN_1064 ? $signed(-16'sh392b) : $signed(_GEN_1372); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1375 = 8'h9b == _GEN_1064 ? $signed(-16'sh1e2b) : $signed(_GEN_1373); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1376 = 8'h9b == _GEN_1064 ? $signed(-16'sh3871) : $signed(_GEN_1374); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1377 = 8'h9c == _GEN_1064 ? $signed(-16'sh1f8c) : $signed(_GEN_1375); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1378 = 8'h9c == _GEN_1064 ? $signed(-16'sh37b0) : $signed(_GEN_1376); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1379 = 8'h9d == _GEN_1064 ? $signed(-16'sh203a) : $signed(_GEN_1377); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1380 = 8'h9d == _GEN_1064 ? $signed(-16'sh374b) : $signed(_GEN_1378); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1381 = 8'h9e == _GEN_1064 ? $signed(-16'sh20e7) : $signed(_GEN_1379); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1382 = 8'h9e == _GEN_1064 ? $signed(-16'sh36e5) : $signed(_GEN_1380); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1383 = 8'h9f == _GEN_1064 ? $signed(-16'sh223d) : $signed(_GEN_1381); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1384 = 8'h9f == _GEN_1064 ? $signed(-16'sh3612) : $signed(_GEN_1382); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1385 = 8'ha0 == _GEN_1064 ? $signed(-16'sh238e) : $signed(_GEN_1383); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1386 = 8'ha0 == _GEN_1064 ? $signed(-16'sh3537) : $signed(_GEN_1384); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1387 = 8'ha1 == _GEN_1064 ? $signed(-16'sh2435) : $signed(_GEN_1385); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1388 = 8'ha1 == _GEN_1064 ? $signed(-16'sh34c6) : $signed(_GEN_1386); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1389 = 8'ha2 == _GEN_1064 ? $signed(-16'sh24da) : $signed(_GEN_1387); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1390 = 8'ha2 == _GEN_1064 ? $signed(-16'sh3453) : $signed(_GEN_1388); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1391 = 8'ha3 == _GEN_1064 ? $signed(-16'sh2620) : $signed(_GEN_1389); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1392 = 8'ha3 == _GEN_1064 ? $signed(-16'sh3368) : $signed(_GEN_1390); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1393 = 8'ha4 == _GEN_1064 ? $signed(-16'sh2760) : $signed(_GEN_1391); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1394 = 8'ha4 == _GEN_1064 ? $signed(-16'sh3274) : $signed(_GEN_1392); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1395 = 8'ha5 == _GEN_1064 ? $signed(-16'sh27fe) : $signed(_GEN_1393); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1396 = 8'ha5 == _GEN_1064 ? $signed(-16'sh31f8) : $signed(_GEN_1394); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1397 = 8'ha6 == _GEN_1064 ? $signed(-16'sh289a) : $signed(_GEN_1395); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1398 = 8'ha6 == _GEN_1064 ? $signed(-16'sh3179) : $signed(_GEN_1396); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1399 = 8'ha7 == _GEN_1064 ? $signed(-16'sh29ce) : $signed(_GEN_1397); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1400 = 8'ha7 == _GEN_1064 ? $signed(-16'sh3076) : $signed(_GEN_1398); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1401 = 8'ha8 == _GEN_1064 ? $signed(-16'sh2afb) : $signed(_GEN_1399); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1402 = 8'ha8 == _GEN_1064 ? $signed(-16'sh2f6c) : $signed(_GEN_1400); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1403 = 8'ha9 == _GEN_1064 ? $signed(-16'sh2b8f) : $signed(_GEN_1401); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1404 = 8'ha9 == _GEN_1064 ? $signed(-16'sh2ee4) : $signed(_GEN_1402); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1405 = 8'haa == _GEN_1064 ? $signed(-16'sh2c21) : $signed(_GEN_1403); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1406 = 8'haa == _GEN_1064 ? $signed(-16'sh2e5a) : $signed(_GEN_1404); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1407 = 8'hab == _GEN_1064 ? $signed(-16'sh2d41) : $signed(_GEN_1405); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1408 = 8'hab == _GEN_1064 ? $signed(-16'sh2d41) : $signed(_GEN_1406); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1409 = 8'hac == _GEN_1064 ? $signed(-16'sh2e5a) : $signed(_GEN_1407); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1410 = 8'hac == _GEN_1064 ? $signed(-16'sh2c21) : $signed(_GEN_1408); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1411 = 8'had == _GEN_1064 ? $signed(-16'sh2ee4) : $signed(_GEN_1409); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1412 = 8'had == _GEN_1064 ? $signed(-16'sh2b8f) : $signed(_GEN_1410); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1413 = 8'hae == _GEN_1064 ? $signed(-16'sh2f6c) : $signed(_GEN_1411); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1414 = 8'hae == _GEN_1064 ? $signed(-16'sh2afb) : $signed(_GEN_1412); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1415 = 8'haf == _GEN_1064 ? $signed(-16'sh3076) : $signed(_GEN_1413); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1416 = 8'haf == _GEN_1064 ? $signed(-16'sh29ce) : $signed(_GEN_1414); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1417 = 8'hb0 == _GEN_1064 ? $signed(-16'sh3179) : $signed(_GEN_1415); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1418 = 8'hb0 == _GEN_1064 ? $signed(-16'sh289a) : $signed(_GEN_1416); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1419 = 8'hb1 == _GEN_1064 ? $signed(-16'sh31f8) : $signed(_GEN_1417); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1420 = 8'hb1 == _GEN_1064 ? $signed(-16'sh27fe) : $signed(_GEN_1418); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1421 = 8'hb2 == _GEN_1064 ? $signed(-16'sh3274) : $signed(_GEN_1419); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1422 = 8'hb2 == _GEN_1064 ? $signed(-16'sh2760) : $signed(_GEN_1420); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1423 = 8'hb3 == _GEN_1064 ? $signed(-16'sh3368) : $signed(_GEN_1421); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1424 = 8'hb3 == _GEN_1064 ? $signed(-16'sh2620) : $signed(_GEN_1422); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1425 = 8'hb4 == _GEN_1064 ? $signed(-16'sh3453) : $signed(_GEN_1423); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1426 = 8'hb4 == _GEN_1064 ? $signed(-16'sh24da) : $signed(_GEN_1424); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1427 = 8'hb5 == _GEN_1064 ? $signed(-16'sh34c6) : $signed(_GEN_1425); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1428 = 8'hb5 == _GEN_1064 ? $signed(-16'sh2435) : $signed(_GEN_1426); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1429 = 8'hb6 == _GEN_1064 ? $signed(-16'sh3537) : $signed(_GEN_1427); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1430 = 8'hb6 == _GEN_1064 ? $signed(-16'sh238e) : $signed(_GEN_1428); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1431 = 8'hb7 == _GEN_1064 ? $signed(-16'sh3612) : $signed(_GEN_1429); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1432 = 8'hb7 == _GEN_1064 ? $signed(-16'sh223d) : $signed(_GEN_1430); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1433 = 8'hb8 == _GEN_1064 ? $signed(-16'sh36e5) : $signed(_GEN_1431); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1434 = 8'hb8 == _GEN_1064 ? $signed(-16'sh20e7) : $signed(_GEN_1432); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1435 = 8'hb9 == _GEN_1064 ? $signed(-16'sh374b) : $signed(_GEN_1433); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1436 = 8'hb9 == _GEN_1064 ? $signed(-16'sh203a) : $signed(_GEN_1434); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1437 = 8'hba == _GEN_1064 ? $signed(-16'sh37b0) : $signed(_GEN_1435); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1438 = 8'hba == _GEN_1064 ? $signed(-16'sh1f8c) : $signed(_GEN_1436); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1439 = 8'hbb == _GEN_1064 ? $signed(-16'sh3871) : $signed(_GEN_1437); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1440 = 8'hbb == _GEN_1064 ? $signed(-16'sh1e2b) : $signed(_GEN_1438); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1441 = 8'hbc == _GEN_1064 ? $signed(-16'sh392b) : $signed(_GEN_1439); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1442 = 8'hbc == _GEN_1064 ? $signed(-16'sh1cc6) : $signed(_GEN_1440); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1443 = 8'hbd == _GEN_1064 ? $signed(-16'sh3984) : $signed(_GEN_1441); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1444 = 8'hbd == _GEN_1064 ? $signed(-16'sh1c12) : $signed(_GEN_1442); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1445 = 8'hbe == _GEN_1064 ? $signed(-16'sh39db) : $signed(_GEN_1443); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1446 = 8'hbe == _GEN_1064 ? $signed(-16'sh1b5d) : $signed(_GEN_1444); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1447 = 8'hbf == _GEN_1064 ? $signed(-16'sh3a82) : $signed(_GEN_1445); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1448 = 8'hbf == _GEN_1064 ? $signed(-16'sh19ef) : $signed(_GEN_1446); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1449 = 8'hc0 == _GEN_1064 ? $signed(-16'sh3b21) : $signed(_GEN_1447); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1450 = 8'hc0 == _GEN_1064 ? $signed(-16'sh187e) : $signed(_GEN_1448); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1451 = 8'hc1 == _GEN_1064 ? $signed(-16'sh3b6d) : $signed(_GEN_1449); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1452 = 8'hc1 == _GEN_1064 ? $signed(-16'sh17c4) : $signed(_GEN_1450); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1453 = 8'hc2 == _GEN_1064 ? $signed(-16'sh3bb6) : $signed(_GEN_1451); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1454 = 8'hc2 == _GEN_1064 ? $signed(-16'sh1709) : $signed(_GEN_1452); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1455 = 8'hc3 == _GEN_1064 ? $signed(-16'sh3c42) : $signed(_GEN_1453); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1456 = 8'hc3 == _GEN_1064 ? $signed(-16'sh1590) : $signed(_GEN_1454); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1457 = 8'hc4 == _GEN_1064 ? $signed(-16'sh3cc5) : $signed(_GEN_1455); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1458 = 8'hc4 == _GEN_1064 ? $signed(-16'sh1413) : $signed(_GEN_1456); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1459 = 8'hc5 == _GEN_1064 ? $signed(-16'sh3d03) : $signed(_GEN_1457); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1460 = 8'hc5 == _GEN_1064 ? $signed(-16'sh1354) : $signed(_GEN_1458); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1461 = 8'hc6 == _GEN_1064 ? $signed(-16'sh3d3f) : $signed(_GEN_1459); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1462 = 8'hc6 == _GEN_1064 ? $signed(-16'sh1294) : $signed(_GEN_1460); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1463 = 8'hc7 == _GEN_1064 ? $signed(-16'sh3daf) : $signed(_GEN_1461); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1464 = 8'hc7 == _GEN_1064 ? $signed(-16'sh1112) : $signed(_GEN_1462); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1465 = 8'hc8 == _GEN_1064 ? $signed(-16'sh3e15) : $signed(_GEN_1463); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1466 = 8'hc8 == _GEN_1064 ? $signed(-16'shf8d) : $signed(_GEN_1464); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1467 = 8'hc9 == _GEN_1064 ? $signed(-16'sh3e45) : $signed(_GEN_1465); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1468 = 8'hc9 == _GEN_1064 ? $signed(-16'sheca) : $signed(_GEN_1466); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1469 = 8'hca == _GEN_1064 ? $signed(-16'sh3e72) : $signed(_GEN_1467); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1470 = 8'hca == _GEN_1064 ? $signed(-16'she06) : $signed(_GEN_1468); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1471 = 8'hcb == _GEN_1064 ? $signed(-16'sh3ec5) : $signed(_GEN_1469); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1472 = 8'hcb == _GEN_1064 ? $signed(-16'shc7c) : $signed(_GEN_1470); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1473 = 8'hcc == _GEN_1064 ? $signed(-16'sh3f0f) : $signed(_GEN_1471); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1474 = 8'hcc == _GEN_1064 ? $signed(-16'shaf1) : $signed(_GEN_1472); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1475 = 8'hcd == _GEN_1064 ? $signed(-16'sh3f30) : $signed(_GEN_1473); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1476 = 8'hcd == _GEN_1064 ? $signed(-16'sha2b) : $signed(_GEN_1474); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1477 = 8'hce == _GEN_1064 ? $signed(-16'sh3f4f) : $signed(_GEN_1475); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1478 = 8'hce == _GEN_1064 ? $signed(-16'sh964) : $signed(_GEN_1476); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1479 = 8'hcf == _GEN_1064 ? $signed(-16'sh3f85) : $signed(_GEN_1477); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1480 = 8'hcf == _GEN_1064 ? $signed(-16'sh7d6) : $signed(_GEN_1478); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1481 = 8'hd0 == _GEN_1064 ? $signed(-16'sh3fb1) : $signed(_GEN_1479); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1482 = 8'hd0 == _GEN_1064 ? $signed(-16'sh646) : $signed(_GEN_1480); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1483 = 8'hd1 == _GEN_1064 ? $signed(-16'sh3fc4) : $signed(_GEN_1481); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1484 = 8'hd1 == _GEN_1064 ? $signed(-16'sh57e) : $signed(_GEN_1482); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1485 = 8'hd2 == _GEN_1064 ? $signed(-16'sh3fd4) : $signed(_GEN_1483); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1486 = 8'hd2 == _GEN_1064 ? $signed(-16'sh4b5) : $signed(_GEN_1484); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1487 = 8'hd3 == _GEN_1064 ? $signed(-16'sh3fec) : $signed(_GEN_1485); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1488 = 8'hd3 == _GEN_1064 ? $signed(-16'sh324) : $signed(_GEN_1486); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1489 = 8'hd4 == _GEN_1064 ? $signed(-16'sh3ffb) : $signed(_GEN_1487); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1490 = 8'hd4 == _GEN_1064 ? $signed(-16'sh192) : $signed(_GEN_1488); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1491 = 8'hd5 == _GEN_1064 ? $signed(-16'sh3fff) : $signed(_GEN_1489); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1492 = 8'hd5 == _GEN_1064 ? $signed(-16'shc9) : $signed(_GEN_1490); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1493 = 8'hd6 == _GEN_1064 ? $signed(-16'sh3ffb) : $signed(_GEN_1491); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1494 = 8'hd6 == _GEN_1064 ? $signed(16'sh192) : $signed(_GEN_1492); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1495 = 8'hd7 == _GEN_1064 ? $signed(-16'sh3fe1) : $signed(_GEN_1493); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1496 = 8'hd7 == _GEN_1064 ? $signed(16'sh3ed) : $signed(_GEN_1494); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1497 = 8'hd8 == _GEN_1064 ? $signed(-16'sh3fb1) : $signed(_GEN_1495); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1498 = 8'hd8 == _GEN_1064 ? $signed(16'sh646) : $signed(_GEN_1496); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1499 = 8'hd9 == _GEN_1064 ? $signed(-16'sh3f6b) : $signed(_GEN_1497); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1500 = 8'hd9 == _GEN_1064 ? $signed(16'sh89d) : $signed(_GEN_1498); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1501 = 8'hda == _GEN_1064 ? $signed(-16'sh3f0f) : $signed(_GEN_1499); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1502 = 8'hda == _GEN_1064 ? $signed(16'shaf1) : $signed(_GEN_1500); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1503 = 8'hdb == _GEN_1064 ? $signed(-16'sh3e9d) : $signed(_GEN_1501); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1504 = 8'hdb == _GEN_1064 ? $signed(16'shd41) : $signed(_GEN_1502); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1505 = 8'hdc == _GEN_1064 ? $signed(-16'sh3e15) : $signed(_GEN_1503); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1506 = 8'hdc == _GEN_1064 ? $signed(16'shf8d) : $signed(_GEN_1504); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1507 = 8'hdd == _GEN_1064 ? $signed(-16'sh3d78) : $signed(_GEN_1505); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1508 = 8'hdd == _GEN_1064 ? $signed(16'sh11d3) : $signed(_GEN_1506); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1509 = 8'hde == _GEN_1064 ? $signed(-16'sh3cc5) : $signed(_GEN_1507); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1510 = 8'hde == _GEN_1064 ? $signed(16'sh1413) : $signed(_GEN_1508); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1511 = 8'hdf == _GEN_1064 ? $signed(-16'sh3bfd) : $signed(_GEN_1509); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1512 = 8'hdf == _GEN_1064 ? $signed(16'sh164c) : $signed(_GEN_1510); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1513 = 8'he0 == _GEN_1064 ? $signed(-16'sh3b21) : $signed(_GEN_1511); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1514 = 8'he0 == _GEN_1064 ? $signed(16'sh187e) : $signed(_GEN_1512); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1515 = 8'he1 == _GEN_1064 ? $signed(-16'sh3a30) : $signed(_GEN_1513); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1516 = 8'he1 == _GEN_1064 ? $signed(16'sh1aa7) : $signed(_GEN_1514); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1517 = 8'he2 == _GEN_1064 ? $signed(-16'sh392b) : $signed(_GEN_1515); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1518 = 8'he2 == _GEN_1064 ? $signed(16'sh1cc6) : $signed(_GEN_1516); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1519 = 8'he3 == _GEN_1064 ? $signed(-16'sh3812) : $signed(_GEN_1517); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1520 = 8'he3 == _GEN_1064 ? $signed(16'sh1edc) : $signed(_GEN_1518); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1521 = 8'he4 == _GEN_1064 ? $signed(-16'sh36e5) : $signed(_GEN_1519); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1522 = 8'he4 == _GEN_1064 ? $signed(16'sh20e7) : $signed(_GEN_1520); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1523 = 8'he5 == _GEN_1064 ? $signed(-16'sh35a5) : $signed(_GEN_1521); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1524 = 8'he5 == _GEN_1064 ? $signed(16'sh22e7) : $signed(_GEN_1522); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1525 = 8'he6 == _GEN_1064 ? $signed(-16'sh3453) : $signed(_GEN_1523); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1526 = 8'he6 == _GEN_1064 ? $signed(16'sh24da) : $signed(_GEN_1524); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1527 = 8'he7 == _GEN_1064 ? $signed(-16'sh32ef) : $signed(_GEN_1525); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1528 = 8'he7 == _GEN_1064 ? $signed(16'sh26c1) : $signed(_GEN_1526); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1529 = 8'he8 == _GEN_1064 ? $signed(-16'sh3179) : $signed(_GEN_1527); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1530 = 8'he8 == _GEN_1064 ? $signed(16'sh289a) : $signed(_GEN_1528); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1531 = 8'he9 == _GEN_1064 ? $signed(-16'sh2ff2) : $signed(_GEN_1529); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1532 = 8'he9 == _GEN_1064 ? $signed(16'sh2a65) : $signed(_GEN_1530); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1533 = 8'hea == _GEN_1064 ? $signed(-16'sh2e5a) : $signed(_GEN_1531); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1534 = 8'hea == _GEN_1064 ? $signed(16'sh2c21) : $signed(_GEN_1532); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1535 = 8'heb == _GEN_1064 ? $signed(-16'sh2cb2) : $signed(_GEN_1533); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1536 = 8'heb == _GEN_1064 ? $signed(16'sh2dcf) : $signed(_GEN_1534); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1537 = 8'hec == _GEN_1064 ? $signed(-16'sh2afb) : $signed(_GEN_1535); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1538 = 8'hec == _GEN_1064 ? $signed(16'sh2f6c) : $signed(_GEN_1536); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1539 = 8'hed == _GEN_1064 ? $signed(-16'sh2935) : $signed(_GEN_1537); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1540 = 8'hed == _GEN_1064 ? $signed(16'sh30f9) : $signed(_GEN_1538); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1541 = 8'hee == _GEN_1064 ? $signed(-16'sh2760) : $signed(_GEN_1539); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1542 = 8'hee == _GEN_1064 ? $signed(16'sh3274) : $signed(_GEN_1540); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1543 = 8'hef == _GEN_1064 ? $signed(-16'sh257e) : $signed(_GEN_1541); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1544 = 8'hef == _GEN_1064 ? $signed(16'sh33df) : $signed(_GEN_1542); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1545 = 8'hf0 == _GEN_1064 ? $signed(-16'sh238e) : $signed(_GEN_1543); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1546 = 8'hf0 == _GEN_1064 ? $signed(16'sh3537) : $signed(_GEN_1544); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1547 = 8'hf1 == _GEN_1064 ? $signed(-16'sh2193) : $signed(_GEN_1545); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1548 = 8'hf1 == _GEN_1064 ? $signed(16'sh367d) : $signed(_GEN_1546); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1549 = 8'hf2 == _GEN_1064 ? $signed(-16'sh1f8c) : $signed(_GEN_1547); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1550 = 8'hf2 == _GEN_1064 ? $signed(16'sh37b0) : $signed(_GEN_1548); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1551 = 8'hf3 == _GEN_1064 ? $signed(-16'sh1d79) : $signed(_GEN_1549); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1552 = 8'hf3 == _GEN_1064 ? $signed(16'sh38cf) : $signed(_GEN_1550); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1553 = 8'hf4 == _GEN_1064 ? $signed(-16'sh1b5d) : $signed(_GEN_1551); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1554 = 8'hf4 == _GEN_1064 ? $signed(16'sh39db) : $signed(_GEN_1552); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1555 = 8'hf5 == _GEN_1064 ? $signed(-16'sh1937) : $signed(_GEN_1553); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1556 = 8'hf5 == _GEN_1064 ? $signed(16'sh3ad3) : $signed(_GEN_1554); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1557 = 8'hf6 == _GEN_1064 ? $signed(-16'sh1709) : $signed(_GEN_1555); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1558 = 8'hf6 == _GEN_1064 ? $signed(16'sh3bb6) : $signed(_GEN_1556); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1559 = 8'hf7 == _GEN_1064 ? $signed(-16'sh14d2) : $signed(_GEN_1557); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1560 = 8'hf7 == _GEN_1064 ? $signed(16'sh3c85) : $signed(_GEN_1558); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1561 = 8'hf8 == _GEN_1064 ? $signed(-16'sh1294) : $signed(_GEN_1559); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1562 = 8'hf8 == _GEN_1064 ? $signed(16'sh3d3f) : $signed(_GEN_1560); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1563 = 8'hf9 == _GEN_1064 ? $signed(-16'sh1050) : $signed(_GEN_1561); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1564 = 8'hf9 == _GEN_1064 ? $signed(16'sh3de3) : $signed(_GEN_1562); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1565 = 8'hfa == _GEN_1064 ? $signed(-16'she06) : $signed(_GEN_1563); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1566 = 8'hfa == _GEN_1064 ? $signed(16'sh3e72) : $signed(_GEN_1564); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1567 = 8'hfb == _GEN_1064 ? $signed(-16'shbb7) : $signed(_GEN_1565); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1568 = 8'hfb == _GEN_1064 ? $signed(16'sh3eeb) : $signed(_GEN_1566); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1569 = 8'hfc == _GEN_1064 ? $signed(-16'sh964) : $signed(_GEN_1567); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1570 = 8'hfc == _GEN_1064 ? $signed(16'sh3f4f) : $signed(_GEN_1568); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1571 = 8'hfd == _GEN_1064 ? $signed(-16'sh70e) : $signed(_GEN_1569); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1572 = 8'hfd == _GEN_1064 ? $signed(16'sh3f9c) : $signed(_GEN_1570); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1573 = 8'hfe == _GEN_1064 ? $signed(-16'sh4b5) : $signed(_GEN_1571); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1574 = 8'hfe == _GEN_1064 ? $signed(16'sh3fd4) : $signed(_GEN_1572); // @[SDFChainRadix22.scala 291:27]
  assign _GEN_1575 = 8'hff == _GEN_1064 ? $signed(-16'sh25b) : $signed(_GEN_1573); // @[SDFChainRadix22.scala 291:27]
  assign twiddles_7_imag = 8'hff == _GEN_1064 ? $signed(16'sh3ff5) : $signed(_GEN_1574); // @[SDFChainRadix22.scala 291:27]
  assign _T_2096 = $signed(_GEN_1575) + $signed(twiddles_7_imag); // @[FixedPointTypeClass.scala 24:22]
  assign outputWires_6_real = sdf_stages_6_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign outputWires_6_imag = sdf_stages_6_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign _T_2097 = $signed(outputWires_6_real) + $signed(outputWires_6_imag); // @[FixedPointTypeClass.scala 24:22]
  assign _T_2098 = $signed(outputWires_6_imag) - $signed(outputWires_6_real); // @[FixedPointTypeClass.scala 33:22]
  assign _GEN_2121 = {{1{outputWires_6_real[15]}},outputWires_6_real}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_2099 = $signed(_GEN_2121) * $signed(_T_2096); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2122 = {{1{twiddles_7_imag[15]}},twiddles_7_imag}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_2100 = $signed(_T_2097) * $signed(_GEN_2122); // @[FixedPointTypeClass.scala 211:35]
  assign _GEN_2123 = {{1{_GEN_1575[15]}},_GEN_1575}; // @[FixedPointTypeClass.scala 211:35]
  assign _T_2101 = $signed(_T_2098) * $signed(_GEN_2123); // @[FixedPointTypeClass.scala 211:35]
  assign _T_2102 = $signed(_T_2099) - $signed(_T_2100); // @[FixedPointTypeClass.scala 33:22]
  assign _T_2103 = $signed(_T_2099) + $signed(_T_2101); // @[FixedPointTypeClass.scala 24:22]
  assign _T_2109 = $signed(_T_2102) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_2110 = _T_2109[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_2113 = $signed(_T_2103) + 34'sh2000; // @[FixedPointTypeClass.scala 20:58]
  assign _T_2114 = _T_2113[33:14]; // @[FixedPointTypeClass.scala 176:41]
  assign _T_2121 = sdf_stages_8_io_cntr < 9'h100; // @[SDFChainRadix22.scala 328:32]
  assign _T_2122 = sdf_stages_8_io_cntr < 9'h180; // @[SDFChainRadix22.scala 328:78]
  assign _T_2123 = _T_2122 ? 1'h0 : 1'h1; // @[SDFChainRadix22.scala 328:65]
  assign _T_2124 = _T_2121 ? 1'h0 : _T_2123; // @[SDFChainRadix22.scala 328:19]
  assign outputWires_7_real = sdf_stages_7_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _T_2130 = 16'sh0 - $signed(outputWires_7_real); // @[FixedPointTypeClass.scala 39:43]
  assign outputWires_7_imag = sdf_stages_7_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 320:30]
  assign _GEN_2091 = 4'h1 == _T_48[3:0] ? $signed(outputWires_1_real) : $signed(outputWires_0_real); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2092 = 4'h1 == _T_48[3:0] ? $signed(outputWires_1_imag) : $signed(outputWires_0_imag); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2093 = 4'h2 == _T_48[3:0] ? $signed(outputWires_2_real) : $signed(_GEN_2091); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2094 = 4'h2 == _T_48[3:0] ? $signed(outputWires_2_imag) : $signed(_GEN_2092); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2095 = 4'h3 == _T_48[3:0] ? $signed(outputWires_3_real) : $signed(_GEN_2093); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2096 = 4'h3 == _T_48[3:0] ? $signed(outputWires_3_imag) : $signed(_GEN_2094); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2097 = 4'h4 == _T_48[3:0] ? $signed(outputWires_4_real) : $signed(_GEN_2095); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2098 = 4'h4 == _T_48[3:0] ? $signed(outputWires_4_imag) : $signed(_GEN_2096); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2099 = 4'h5 == _T_48[3:0] ? $signed(outputWires_5_real) : $signed(_GEN_2097); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2100 = 4'h5 == _T_48[3:0] ? $signed(outputWires_5_imag) : $signed(_GEN_2098); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2101 = 4'h6 == _T_48[3:0] ? $signed(outputWires_6_real) : $signed(_GEN_2099); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2102 = 4'h6 == _T_48[3:0] ? $signed(outputWires_6_imag) : $signed(_GEN_2100); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2103 = 4'h7 == _T_48[3:0] ? $signed(outputWires_7_real) : $signed(_GEN_2101); // @[SDFChainRadix22.scala 364:24]
  assign _GEN_2104 = 4'h7 == _T_48[3:0] ? $signed(outputWires_7_imag) : $signed(_GEN_2102); // @[SDFChainRadix22.scala 364:24]
  assign outputWires_8_real = sdf_stages_8_io_out_real; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign _GEN_2105 = 4'h8 == _T_48[3:0] ? $signed(outputWires_8_real) : $signed(_GEN_2103); // @[SDFChainRadix22.scala 364:24]
  assign outputWires_8_imag = sdf_stages_8_io_out_imag; // @[SDFChainRadix22.scala 43:111 SDFChainRadix22.scala 339:32]
  assign _GEN_2106 = 4'h8 == _T_48[3:0] ? $signed(outputWires_8_imag) : $signed(_GEN_2104); // @[SDFChainRadix22.scala 364:24]
  assign _T_2140 = ~initialOutDone; // @[SDFChainRadix22.scala 368:33]
  assign _T_2141 = state != 2'h2; // @[SDFChainRadix22.scala 368:127]
  assign _T_2142 = io_out_ready & _T_2141; // @[SDFChainRadix22.scala 368:117]
  assign _GEN_2124 = {$signed(_GEN_2106), 14'h0}; // @[SDFChainRadix22.scala 375:33]
  assign _GEN_2107 = {{2{_GEN_2124[29]}},_GEN_2124}; // @[SDFChainRadix22.scala 375:33]
  assign _GEN_2125 = {$signed(_GEN_2105), 14'h0}; // @[SDFChainRadix22.scala 375:33]
  assign _GEN_2108 = {{2{_GEN_2125[29]}},_GEN_2125}; // @[SDFChainRadix22.scala 375:33]
  assign _GEN_2126 = _GEN_2108[31:14]; // @[SDFChainRadix22.scala 63:26 SDFChainRadix22.scala 384:22 SDFChainRadix22.scala 396:27]
  assign _GEN_2128 = _GEN_2107[31:14]; // @[SDFChainRadix22.scala 63:26 SDFChainRadix22.scala 384:22 SDFChainRadix22.scala 397:27]
  assign io_in_ready = _T_2140 | _T_2142; // @[SDFChainRadix22.scala 368:15]
  assign io_out_valid = enableInit & initialOutDone; // @[SDFChainRadix22.scala 401:18]
  assign io_out_bits_real = _GEN_2126[15:0]; // @[SDFChainRadix22.scala 400:17]
  assign io_out_bits_imag = _GEN_2128[15:0]; // @[SDFChainRadix22.scala 400:17]
  assign io_lastOut = pktEnd & _T_83; // @[SDFChainRadix22.scala 428:14]
  assign io_busy = state != 2'h0; // @[SDFChainRadix22.scala 430:11]
  assign sdf_stages_0_clock = clock;
  assign sdf_stages_0_io_in_real = io_in_bits_real; // @[SDFChainRadix22.scala 347:23]
  assign sdf_stages_0_io_in_imag = io_in_bits_imag; // @[SDFChainRadix22.scala 347:23]
  assign sdf_stages_0_io_cntr = {{8'd0}, _T_166[0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_0_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_1_clock = clock;
  assign sdf_stages_1_io_in_real = _T_275[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_1_io_in_imag = _T_279[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_1_io_cntr = {{7'd0}, _T_173[1:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_1_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_2_clock = clock;
  assign sdf_stages_2_io_in_real = _T_289 ? $signed(outputWires_1_imag) : $signed(outputWires_1_real); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_2_io_in_imag = _T_289 ? $signed(_T_295) : $signed(outputWires_1_imag); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_2_io_cntr = {{6'd0}, _T_180[2:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_2_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_3_clock = clock;
  assign sdf_stages_3_io_in_real = _T_407[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_3_io_in_imag = _T_411[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_3_io_cntr = {{5'd0}, _T_187[3:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_3_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_4_clock = clock;
  assign sdf_stages_4_io_in_real = _T_421 ? $signed(outputWires_3_imag) : $signed(outputWires_3_real); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_4_io_in_imag = _T_421 ? $signed(_T_427) : $signed(outputWires_3_imag); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_4_io_cntr = {{4'd0}, _T_194[4:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_4_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_5_clock = clock;
  assign sdf_stages_5_io_in_real = _T_779[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_5_io_in_imag = _T_783[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_5_io_cntr = {{3'd0}, _T_201[5:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_5_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_6_clock = clock;
  assign sdf_stages_6_io_in_real = _T_793 ? $signed(outputWires_5_imag) : $signed(outputWires_5_real); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_6_io_in_imag = _T_793 ? $signed(_T_799) : $signed(outputWires_5_imag); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_6_io_cntr = {{2'd0}, _T_208[6:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_6_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_7_clock = clock;
  assign sdf_stages_7_io_in_real = _T_2110[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_7_io_in_imag = _T_2114[15:0]; // @[SDFChainRadix22.scala 319:21]
  assign sdf_stages_7_io_cntr = {{1'd0}, _T_215[7:0]}; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_7_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
  assign sdf_stages_8_clock = clock;
  assign sdf_stages_8_reset = reset;
  assign sdf_stages_8_io_in_real = _T_2124 ? $signed(outputWires_7_imag) : $signed(outputWires_7_real); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_8_io_in_imag = _T_2124 ? $signed(_T_2130) : $signed(outputWires_7_imag); // @[SDFChainRadix22.scala 340:23]
  assign sdf_stages_8_io_cntr = cntr_wires_0 - _T_220; // @[SDFChainRadix22.scala 224:16]
  assign sdf_stages_8_io_en = _T_46 | _T_122; // @[SDFChainRadix22.scala 223:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  initialOutDone = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cnt = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  cntValidOut = _RAND_3[8:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_53) begin
      if (_T_46) begin
        state <= 2'h1;
      end
    end else if (_T_56) begin
      if (fireLast) begin
        state <= 2'h2;
      end
    end else if (_T_57) begin
      if (io_lastOut) begin
        state <= 2'h0;
      end
    end
    if (reset) begin
      initialOutDone <= 1'h0;
    end else begin
      initialOutDone <= _GEN_46;
    end
    if (reset) begin
      cnt <= 10'h0;
    end else if (_T_62) begin
      cnt <= 10'h0;
    end else if (enableInit) begin
      cnt <= _T_125;
    end
    if (reset) begin
      cntValidOut <= 9'h0;
    end else if (_T_77) begin
      cntValidOut <= 9'h0;
    end else if (_T_61) begin
      cntValidOut <= _T_80;
    end
  end
endmodule
module SDFFFT_size_512_width_16_radix_22_bitreverse_0(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_real,
  input  [15:0] io_in_bits_imag,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits_real,
  output [15:0] io_out_bits_imag,
  output        io_lastOut,
  input         io_lastIn,
  output        io_busy
);
  wire  SDFChainRadix22_clock; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_reset; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_in_ready; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_in_valid; // @[SDFFFT.scala 219:119]
  wire [15:0] SDFChainRadix22_io_in_bits_real; // @[SDFFFT.scala 219:119]
  wire [15:0] SDFChainRadix22_io_in_bits_imag; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_out_ready; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_out_valid; // @[SDFFFT.scala 219:119]
  wire [15:0] SDFChainRadix22_io_out_bits_real; // @[SDFFFT.scala 219:119]
  wire [15:0] SDFChainRadix22_io_out_bits_imag; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_lastOut; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_lastIn; // @[SDFFFT.scala 219:119]
  wire  SDFChainRadix22_io_busy; // @[SDFFFT.scala 219:119]
  reg [8:0] cntWin; // @[SDFFFT.scala 71:23]
  reg [31:0] _RAND_0;
  wire  _T_4; // @[Decoupled.scala 40:37]
  wire [8:0] _T_6; // @[SDFFFT.scala 80:22]
  wire [8:0] _T_8; // @[SDFFFT.scala 82:44]
  wire  _T_9; // @[SDFFFT.scala 82:29]
  wire  _T_10; // @[SDFFFT.scala 82:19]
  wire [7:0] _T_85; // @[Bitwise.scala 103:31]
  wire [7:0] _T_87; // @[Bitwise.scala 103:65]
  wire [7:0] _T_89; // @[Bitwise.scala 103:75]
  wire [7:0] _T_90; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_522; // @[Bitwise.scala 103:31]
  wire [7:0] _T_95; // @[Bitwise.scala 103:31]
  wire [7:0] _T_97; // @[Bitwise.scala 103:65]
  wire [7:0] _T_99; // @[Bitwise.scala 103:75]
  wire [7:0] _T_100; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_523; // @[Bitwise.scala 103:31]
  wire [7:0] _T_105; // @[Bitwise.scala 103:31]
  wire [7:0] _T_107; // @[Bitwise.scala 103:65]
  wire [7:0] _T_109; // @[Bitwise.scala 103:75]
  wire [7:0] _T_110; // @[Bitwise.scala 103:39]
  wire [8:0] _T_143; // @[Cat.scala 29:58]
  wire [8:0] addrWin; // @[Mux.scala 87:16]
  wire [31:0] _T_152; // @[FixedPointTypeClass.scala 42:59]
  wire [31:0] _T_153; // @[FixedPointTypeClass.scala 42:59]
  wire [17:0] _GEN_526; // @[SDFFFT.scala 301:31 SDFFFT.scala 309:21]
  wire [17:0] _GEN_528; // @[SDFFFT.scala 302:31 SDFFFT.scala 309:21]
  SDFChainRadix22 SDFChainRadix22 ( // @[SDFFFT.scala 219:119]
    .clock(SDFChainRadix22_clock),
    .reset(SDFChainRadix22_reset),
    .io_in_ready(SDFChainRadix22_io_in_ready),
    .io_in_valid(SDFChainRadix22_io_in_valid),
    .io_in_bits_real(SDFChainRadix22_io_in_bits_real),
    .io_in_bits_imag(SDFChainRadix22_io_in_bits_imag),
    .io_out_ready(SDFChainRadix22_io_out_ready),
    .io_out_valid(SDFChainRadix22_io_out_valid),
    .io_out_bits_real(SDFChainRadix22_io_out_bits_real),
    .io_out_bits_imag(SDFChainRadix22_io_out_bits_imag),
    .io_lastOut(SDFChainRadix22_io_lastOut),
    .io_lastIn(SDFChainRadix22_io_lastIn),
    .io_busy(SDFChainRadix22_io_busy)
  );
  assign _T_4 = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  assign _T_6 = cntWin + 9'h1; // @[SDFFFT.scala 80:22]
  assign _T_8 = 9'h0 - 9'h1; // @[SDFFFT.scala 82:44]
  assign _T_9 = cntWin == _T_8; // @[SDFFFT.scala 82:29]
  assign _T_10 = io_lastIn | _T_9; // @[SDFFFT.scala 82:19]
  assign _T_85 = {{4'd0}, cntWin[7:4]}; // @[Bitwise.scala 103:31]
  assign _T_87 = {cntWin[3:0], 4'h0}; // @[Bitwise.scala 103:65]
  assign _T_89 = _T_87 & 8'hf0; // @[Bitwise.scala 103:75]
  assign _T_90 = _T_85 | _T_89; // @[Bitwise.scala 103:39]
  assign _GEN_522 = {{2'd0}, _T_90[7:2]}; // @[Bitwise.scala 103:31]
  assign _T_95 = _GEN_522 & 8'h33; // @[Bitwise.scala 103:31]
  assign _T_97 = {_T_90[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  assign _T_99 = _T_97 & 8'hcc; // @[Bitwise.scala 103:75]
  assign _T_100 = _T_95 | _T_99; // @[Bitwise.scala 103:39]
  assign _GEN_523 = {{1'd0}, _T_100[7:1]}; // @[Bitwise.scala 103:31]
  assign _T_105 = _GEN_523 & 8'h55; // @[Bitwise.scala 103:31]
  assign _T_107 = {_T_100[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  assign _T_109 = _T_107 & 8'haa; // @[Bitwise.scala 103:75]
  assign _T_110 = _T_105 | _T_109; // @[Bitwise.scala 103:39]
  assign _T_143 = {_T_110,cntWin[8]}; // @[Cat.scala 29:58]
  assign addrWin = _T_143; // @[Mux.scala 87:16]
  assign _T_152 = $signed(io_in_bits_real) * 16'sh4000; // @[FixedPointTypeClass.scala 42:59]
  assign _T_153 = $signed(io_in_bits_imag) * 16'sh4000; // @[FixedPointTypeClass.scala 42:59]
  assign io_in_ready = SDFChainRadix22_io_in_ready; // @[SDFFFT.scala 305:23 SDFFFT.scala 309:21]
  assign io_out_valid = SDFChainRadix22_io_out_valid; // @[SDFFFT.scala 306:18 SDFFFT.scala 313:24]
  assign io_out_bits_real = SDFChainRadix22_io_out_bits_real; // @[SDFFFT.scala 306:18 SDFFFT.scala 311:23]
  assign io_out_bits_imag = SDFChainRadix22_io_out_bits_imag; // @[SDFFFT.scala 306:18 SDFFFT.scala 311:23]
  assign io_lastOut = SDFChainRadix22_io_lastOut; // @[SDFFFT.scala 317:20]
  assign io_busy = SDFChainRadix22_io_busy; // @[SDFFFT.scala 320:15]
  assign SDFChainRadix22_clock = clock;
  assign SDFChainRadix22_reset = reset;
  assign SDFChainRadix22_io_in_valid = io_in_valid; // @[SDFFFT.scala 304:27 SDFFFT.scala 309:21]
  assign _GEN_526 = _T_152[31:14]; // @[SDFFFT.scala 301:31 SDFFFT.scala 309:21]
  assign SDFChainRadix22_io_in_bits_real = _GEN_526[15:0]; // @[SDFFFT.scala 301:31 SDFFFT.scala 309:21]
  assign _GEN_528 = _T_153[31:14]; // @[SDFFFT.scala 302:31 SDFFFT.scala 309:21]
  assign SDFChainRadix22_io_in_bits_imag = _GEN_528[15:0]; // @[SDFFFT.scala 302:31 SDFFFT.scala 309:21]
  assign SDFChainRadix22_io_out_ready = io_out_ready; // @[SDFFFT.scala 306:18 SDFFFT.scala 314:28]
  assign SDFChainRadix22_io_lastIn = io_lastIn; // @[SDFFFT.scala 316:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntWin = _RAND_0[8:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      cntWin <= 9'h0;
    end else if (_T_10) begin
      cntWin <= 9'h0;
    end else if (_T_4) begin
      cntWin <= _T_6;
    end
  end
endmodule
module Queue_1(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_read,
  input  [31:0] io_enq_bits_data,
  input         io_enq_bits_extra,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_read,
  output [31:0] io_deq_bits_data,
  output        io_deq_bits_extra
);
  reg  _T_read [0:1]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_0;
  wire  _T_read__T_18_data; // @[Decoupled.scala 209:24]
  wire  _T_read__T_18_addr; // @[Decoupled.scala 209:24]
  wire  _T_read__T_10_data; // @[Decoupled.scala 209:24]
  wire  _T_read__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T_read__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T_read__T_10_en; // @[Decoupled.scala 209:24]
  reg [31:0] _T_data [0:1]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_1;
  wire [31:0] _T_data__T_18_data; // @[Decoupled.scala 209:24]
  wire  _T_data__T_18_addr; // @[Decoupled.scala 209:24]
  wire [31:0] _T_data__T_10_data; // @[Decoupled.scala 209:24]
  wire  _T_data__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T_data__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T_data__T_10_en; // @[Decoupled.scala 209:24]
  reg  _T_extra [0:1]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_2;
  wire  _T_extra__T_18_data; // @[Decoupled.scala 209:24]
  wire  _T_extra__T_18_addr; // @[Decoupled.scala 209:24]
  wire  _T_extra__T_10_data; // @[Decoupled.scala 209:24]
  wire  _T_extra__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T_extra__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T_extra__T_10_en; // @[Decoupled.scala 209:24]
  reg  value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_3;
  reg  value_1; // @[Counter.scala 29:33]
  reg [31:0] _RAND_4;
  reg  _T_1; // @[Decoupled.scala 212:35]
  reg [31:0] _RAND_5;
  wire  _T_2; // @[Decoupled.scala 214:41]
  wire  _T_3; // @[Decoupled.scala 215:36]
  wire  _T_4; // @[Decoupled.scala 215:33]
  wire  _T_5; // @[Decoupled.scala 216:32]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_12; // @[Counter.scala 39:22]
  wire  _T_14; // @[Counter.scala 39:22]
  wire  _T_15; // @[Decoupled.scala 227:16]
  assign _T_read__T_18_addr = value_1;
  assign _T_read__T_18_data = _T_read[_T_read__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T_read__T_10_data = io_enq_bits_read;
  assign _T_read__T_10_addr = value;
  assign _T_read__T_10_mask = 1'h1;
  assign _T_read__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_data__T_18_addr = value_1;
  assign _T_data__T_18_data = _T_data[_T_data__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T_data__T_10_data = io_enq_bits_data;
  assign _T_data__T_10_addr = value;
  assign _T_data__T_10_mask = 1'h1;
  assign _T_data__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_extra__T_18_addr = value_1;
  assign _T_extra__T_18_data = _T_extra[_T_extra__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T_extra__T_10_data = io_enq_bits_extra;
  assign _T_extra__T_10_addr = value;
  assign _T_extra__T_10_mask = 1'h1;
  assign _T_extra__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_2 = value == value_1; // @[Decoupled.scala 214:41]
  assign _T_3 = ~_T_1; // @[Decoupled.scala 215:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = value + 1'h1; // @[Counter.scala 39:22]
  assign _T_14 = value_1 + 1'h1; // @[Counter.scala 39:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 227:16]
  assign io_enq_ready = ~_T_5; // @[Decoupled.scala 232:16]
  assign io_deq_valid = ~_T_4; // @[Decoupled.scala 231:16]
  assign io_deq_bits_read = _T_read__T_18_data; // @[Decoupled.scala 233:15]
  assign io_deq_bits_data = _T_data__T_18_data; // @[Decoupled.scala 233:15]
  assign io_deq_bits_extra = _T_extra__T_18_data; // @[Decoupled.scala 233:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_read[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_data[initvar] = _RAND_1[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_extra[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_1 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T_read__T_10_en & _T_read__T_10_mask) begin
      _T_read[_T_read__T_10_addr] <= _T_read__T_10_data; // @[Decoupled.scala 209:24]
    end
    if(_T_data__T_10_en & _T_data__T_10_mask) begin
      _T_data[_T_data__T_10_addr] <= _T_data__T_10_data; // @[Decoupled.scala 209:24]
    end
    if(_T_extra__T_10_en & _T_extra__T_10_mask) begin
      _T_extra[_T_extra__T_10_addr] <= _T_extra__T_10_data; // @[Decoupled.scala 209:24]
    end
    if (reset) begin
      value <= 1'h0;
    end else if (_T_6) begin
      value <= _T_12;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (_T_8) begin
      value_1 <= _T_14;
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else if (_T_15) begin
      _T_1 <= _T_6;
    end
  end
endmodule
module AXI4FFTBlock(
  input         clock,
  input         reset,
  output        auto_mem_in_aw_ready,
  input         auto_mem_in_aw_valid,
  input         auto_mem_in_aw_bits_id,
  input  [29:0] auto_mem_in_aw_bits_addr,
  output        auto_mem_in_w_ready,
  input         auto_mem_in_w_valid,
  input         auto_mem_in_b_ready,
  output        auto_mem_in_b_valid,
  output        auto_mem_in_b_bits_id,
  output        auto_mem_in_ar_ready,
  input         auto_mem_in_ar_valid,
  input         auto_mem_in_ar_bits_id,
  input  [29:0] auto_mem_in_ar_bits_addr,
  input         auto_mem_in_r_ready,
  output        auto_mem_in_r_valid,
  output        auto_mem_in_r_bits_id,
  output [31:0] auto_mem_in_r_bits_data,
  output        auto_stream_in_ready,
  input         auto_stream_in_valid,
  input  [31:0] auto_stream_in_bits_data,
  input         auto_stream_in_bits_last,
  input         auto_stream_out_ready,
  output        auto_stream_out_valid,
  output [31:0] auto_stream_out_bits_data,
  output        auto_stream_out_bits_last
);
  wire  fft_clock; // @[FFTBlock.scala 59:21]
  wire  fft_reset; // @[FFTBlock.scala 59:21]
  wire  fft_io_in_ready; // @[FFTBlock.scala 59:21]
  wire  fft_io_in_valid; // @[FFTBlock.scala 59:21]
  wire [15:0] fft_io_in_bits_real; // @[FFTBlock.scala 59:21]
  wire [15:0] fft_io_in_bits_imag; // @[FFTBlock.scala 59:21]
  wire  fft_io_out_ready; // @[FFTBlock.scala 59:21]
  wire  fft_io_out_valid; // @[FFTBlock.scala 59:21]
  wire [15:0] fft_io_out_bits_real; // @[FFTBlock.scala 59:21]
  wire [15:0] fft_io_out_bits_imag; // @[FFTBlock.scala 59:21]
  wire  fft_io_lastOut; // @[FFTBlock.scala 59:21]
  wire  fft_io_lastIn; // @[FFTBlock.scala 59:21]
  wire  fft_io_busy; // @[FFTBlock.scala 59:21]
  wire  Queue_clock; // @[Decoupled.scala 287:21]
  wire  Queue_reset; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_bits_read; // @[Decoupled.scala 287:21]
  wire [31:0] Queue_io_enq_bits_data; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_bits_extra; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_bits_read; // @[Decoupled.scala 287:21]
  wire [31:0] Queue_io_deq_bits_data; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_bits_extra; // @[Decoupled.scala 287:21]
  reg  busy; // @[FFTBlock.scala 63:34]
  reg [31:0] _RAND_0;
  wire  _T_2; // @[RegisterRouter.scala 40:39]
  wire  _T_4; // @[RegisterRouter.scala 42:29]
  wire  _T_47_ready; // @[RegisterRouter.scala 59:16 Decoupled.scala 290:17]
  wire [29:0] _T_11; // @[RegisterRouter.scala 48:19]
  wire  _T_53; // @[RegisterRouter.scala 59:16]
  wire  _T_5; // @[RegisterRouter.scala 42:26]
  wire  _T_171; // @[RegisterRouter.scala 59:16]
  wire  _T_172_bits_read; // @[Decoupled.scala 308:19 Decoupled.scala 309:14]
  wire  _T_172_valid; // @[Decoupled.scala 308:19 Decoupled.scala 310:15]
  wire  _T_175; // @[RegisterRouter.scala 65:29]
  SDFFFT_size_512_width_16_radix_22_bitreverse_0 fft ( // @[FFTBlock.scala 59:21]
    .clock(fft_clock),
    .reset(fft_reset),
    .io_in_ready(fft_io_in_ready),
    .io_in_valid(fft_io_in_valid),
    .io_in_bits_real(fft_io_in_bits_real),
    .io_in_bits_imag(fft_io_in_bits_imag),
    .io_out_ready(fft_io_out_ready),
    .io_out_valid(fft_io_out_valid),
    .io_out_bits_real(fft_io_out_bits_real),
    .io_out_bits_imag(fft_io_out_bits_imag),
    .io_lastOut(fft_io_lastOut),
    .io_lastIn(fft_io_lastIn),
    .io_busy(fft_io_busy)
  );
  Queue_1 Queue ( // @[Decoupled.scala 287:21]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_read(Queue_io_enq_bits_read),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_extra(Queue_io_enq_bits_extra),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_read(Queue_io_deq_bits_read),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_extra(Queue_io_deq_bits_extra)
  );
  assign _T_2 = auto_mem_in_aw_valid & auto_mem_in_w_valid; // @[RegisterRouter.scala 40:39]
  assign _T_4 = ~auto_mem_in_ar_valid; // @[RegisterRouter.scala 42:29]
  assign _T_47_ready = Queue_io_enq_ready; // @[RegisterRouter.scala 59:16 Decoupled.scala 290:17]
  assign _T_11 = auto_mem_in_ar_valid ? auto_mem_in_ar_bits_addr : auto_mem_in_aw_bits_addr; // @[RegisterRouter.scala 48:19]
  assign _T_53 = _T_11[7:2] == 6'h0; // @[RegisterRouter.scala 59:16]
  assign _T_5 = _T_47_ready & _T_4; // @[RegisterRouter.scala 42:26]
  assign _T_171 = _T_53 & busy; // @[RegisterRouter.scala 59:16]
  assign _T_172_bits_read = Queue_io_deq_bits_read; // @[Decoupled.scala 308:19 Decoupled.scala 309:14]
  assign _T_172_valid = Queue_io_deq_valid; // @[Decoupled.scala 308:19 Decoupled.scala 310:15]
  assign _T_175 = ~_T_172_bits_read; // @[RegisterRouter.scala 65:29]
  assign auto_mem_in_aw_ready = _T_5 & auto_mem_in_w_valid; // @[LazyModule.scala 173:31]
  assign auto_mem_in_w_ready = _T_5 & auto_mem_in_aw_valid; // @[LazyModule.scala 173:31]
  assign auto_mem_in_b_valid = _T_172_valid & _T_175; // @[LazyModule.scala 173:31]
  assign auto_mem_in_b_bits_id = Queue_io_deq_bits_extra; // @[LazyModule.scala 173:31]
  assign auto_mem_in_ar_ready = Queue_io_enq_ready; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_valid = _T_172_valid & _T_172_bits_read; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_bits_id = Queue_io_deq_bits_extra; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_bits_data = Queue_io_deq_bits_data; // @[LazyModule.scala 173:31]
  assign auto_stream_in_ready = fft_io_in_ready; // @[LazyModule.scala 173:31]
  assign auto_stream_out_valid = fft_io_out_valid; // @[LazyModule.scala 173:49]
  assign auto_stream_out_bits_data = {fft_io_out_bits_real,fft_io_out_bits_imag}; // @[LazyModule.scala 173:49]
  assign auto_stream_out_bits_last = fft_io_lastOut; // @[LazyModule.scala 173:49]
  assign fft_clock = clock;
  assign fft_reset = reset;
  assign fft_io_in_valid = auto_stream_in_valid; // @[FFTBlock.scala 124:24]
  assign fft_io_in_bits_real = auto_stream_in_bits_data[31:16]; // @[FFTBlock.scala 130:26]
  assign fft_io_in_bits_imag = auto_stream_in_bits_data[15:0]; // @[FFTBlock.scala 129:26]
  assign fft_io_out_ready = auto_stream_out_ready; // @[FFTBlock.scala 137:22]
  assign fft_io_lastIn = auto_stream_in_bits_last; // @[FFTBlock.scala 133:24]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = auto_mem_in_ar_valid | _T_2; // @[Decoupled.scala 288:22]
  assign Queue_io_enq_bits_read = auto_mem_in_ar_valid; // @[Decoupled.scala 289:21]
  assign Queue_io_enq_bits_data = {{31'd0}, _T_171}; // @[Decoupled.scala 289:21]
  assign Queue_io_enq_bits_extra = auto_mem_in_ar_valid ? auto_mem_in_ar_bits_id : auto_mem_in_aw_bits_id; // @[Decoupled.scala 289:21]
  assign Queue_io_deq_ready = _T_172_bits_read ? auto_mem_in_r_ready : auto_mem_in_b_ready; // @[Decoupled.scala 311:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      busy <= 1'h0;
    end else begin
      busy <= fft_io_busy;
    end
  end
endmodule
module Queue_2(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [15:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [15:0] io_deq_bits
);
  reg [15:0] _T [0:3]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_0;
  wire [15:0] _T__T_18_data; // @[Decoupled.scala 209:24]
  wire [1:0] _T__T_18_addr; // @[Decoupled.scala 209:24]
  wire [15:0] _T__T_10_data; // @[Decoupled.scala 209:24]
  wire [1:0] _T__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T__T_10_en; // @[Decoupled.scala 209:24]
  reg [1:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_1;
  reg [1:0] value_1; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  reg  _T_1; // @[Decoupled.scala 212:35]
  reg [31:0] _RAND_3;
  wire  _T_2; // @[Decoupled.scala 214:41]
  wire  _T_3; // @[Decoupled.scala 215:36]
  wire  _T_4; // @[Decoupled.scala 215:33]
  wire  _T_5; // @[Decoupled.scala 216:32]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire [1:0] _T_12; // @[Counter.scala 39:22]
  wire [1:0] _T_14; // @[Counter.scala 39:22]
  wire  _T_15; // @[Decoupled.scala 227:16]
  assign _T__T_18_addr = value_1;
  assign _T__T_18_data = _T[_T__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T__T_10_data = io_enq_bits;
  assign _T__T_10_addr = value;
  assign _T__T_10_mask = 1'h1;
  assign _T__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_2 = value == value_1; // @[Decoupled.scala 214:41]
  assign _T_3 = ~_T_1; // @[Decoupled.scala 215:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = value + 2'h1; // @[Counter.scala 39:22]
  assign _T_14 = value_1 + 2'h1; // @[Counter.scala 39:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 227:16]
  assign io_enq_ready = ~_T_5; // @[Decoupled.scala 232:16]
  assign io_deq_valid = ~_T_4; // @[Decoupled.scala 231:16]
  assign io_deq_bits = _T__T_18_data; // @[Decoupled.scala 233:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T[initvar] = _RAND_0[15:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T__T_10_en & _T__T_10_mask) begin
      _T[_T__T_10_addr] <= _T__T_10_data; // @[Decoupled.scala 209:24]
    end
    if (reset) begin
      value <= 2'h0;
    end else if (_T_6) begin
      value <= _T_12;
    end
    if (reset) begin
      value_1 <= 2'h0;
    end else if (_T_8) begin
      value_1 <= _T_14;
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else if (_T_15) begin
      _T_1 <= _T_6;
    end
  end
endmodule
module Queue_3(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits
);
  reg  _T [0:3]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_0;
  wire  _T__T_18_data; // @[Decoupled.scala 209:24]
  wire [1:0] _T__T_18_addr; // @[Decoupled.scala 209:24]
  wire  _T__T_10_data; // @[Decoupled.scala 209:24]
  wire [1:0] _T__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T__T_10_en; // @[Decoupled.scala 209:24]
  reg [1:0] value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_1;
  reg [1:0] value_1; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  reg  _T_1; // @[Decoupled.scala 212:35]
  reg [31:0] _RAND_3;
  wire  _T_2; // @[Decoupled.scala 214:41]
  wire  _T_3; // @[Decoupled.scala 215:36]
  wire  _T_4; // @[Decoupled.scala 215:33]
  wire  _T_5; // @[Decoupled.scala 216:32]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire [1:0] _T_12; // @[Counter.scala 39:22]
  wire [1:0] _T_14; // @[Counter.scala 39:22]
  wire  _T_15; // @[Decoupled.scala 227:16]
  assign _T__T_18_addr = value_1;
  assign _T__T_18_data = _T[_T__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T__T_10_data = io_enq_bits;
  assign _T__T_10_addr = value;
  assign _T__T_10_mask = 1'h1;
  assign _T__T_10_en = io_enq_ready & io_enq_valid;
  assign _T_2 = value == value_1; // @[Decoupled.scala 214:41]
  assign _T_3 = ~_T_1; // @[Decoupled.scala 215:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = value + 2'h1; // @[Counter.scala 39:22]
  assign _T_14 = value_1 + 2'h1; // @[Counter.scala 39:22]
  assign _T_15 = _T_6 != _T_8; // @[Decoupled.scala 227:16]
  assign io_enq_ready = ~_T_5; // @[Decoupled.scala 232:16]
  assign io_deq_valid = ~_T_4; // @[Decoupled.scala 231:16]
  assign io_deq_bits = _T__T_18_data; // @[Decoupled.scala 233:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    _T[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T__T_10_en & _T__T_10_mask) begin
      _T[_T__T_10_addr] <= _T__T_10_data; // @[Decoupled.scala 209:24]
    end
    if (reset) begin
      value <= 2'h0;
    end else if (_T_6) begin
      value <= _T_12;
    end
    if (reset) begin
      value_1 <= 2'h0;
    end else if (_T_8) begin
      value_1 <= _T_14;
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else if (_T_15) begin
      _T_1 <= _T_6;
    end
  end
endmodule
module MagJPLandSQRMagInst(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_real,
  input  [15:0] io_in_bits_imag,
  input         io_lastIn,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits,
  input  [1:0]  io_sel,
  output        io_lastOut
);
  wire  Queue_clock; // @[Skid.scala 26:23]
  wire  Queue_reset; // @[Skid.scala 26:23]
  wire  Queue_io_enq_ready; // @[Skid.scala 26:23]
  wire  Queue_io_enq_valid; // @[Skid.scala 26:23]
  wire [15:0] Queue_io_enq_bits; // @[Skid.scala 26:23]
  wire  Queue_io_deq_ready; // @[Skid.scala 26:23]
  wire  Queue_io_deq_valid; // @[Skid.scala 26:23]
  wire [15:0] Queue_io_deq_bits; // @[Skid.scala 26:23]
  wire  Queue_1_clock; // @[Skid.scala 26:23]
  wire  Queue_1_reset; // @[Skid.scala 26:23]
  wire  Queue_1_io_enq_ready; // @[Skid.scala 26:23]
  wire  Queue_1_io_enq_valid; // @[Skid.scala 26:23]
  wire  Queue_1_io_enq_bits; // @[Skid.scala 26:23]
  wire  Queue_1_io_deq_ready; // @[Skid.scala 26:23]
  wire  Queue_1_io_deq_valid; // @[Skid.scala 26:23]
  wire  Queue_1_io_deq_bits; // @[Skid.scala 26:23]
  wire [15:0] _T_5; // @[FixedPointTypeClass.scala 30:68]
  wire [15:0] absInReal; // @[FixedPointTypeClass.scala 247:8]
  wire [15:0] _T_9; // @[FixedPointTypeClass.scala 30:68]
  wire [15:0] absInImag; // @[FixedPointTypeClass.scala 247:8]
  wire  _T_10; // @[FixedPointTypeClass.scala 55:59]
  wire [15:0] u; // @[Order.scala 56:31]
  wire  _T_11; // @[FixedPointTypeClass.scala 53:59]
  wire [15:0] v; // @[Order.scala 55:31]
  wire [12:0] _T_12; // @[FixedPointTypeClass.scala 117:50]
  wire [15:0] _GEN_16; // @[FixedPointTypeClass.scala 24:22]
  reg [16:0] _T_14; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  reg [16:0] jplMagOp1; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  wire [12:0] _T_15; // @[FixedPointTypeClass.scala 117:50]
  wire [15:0] _GEN_17; // @[FixedPointTypeClass.scala 33:22]
  reg [16:0] tmpOp2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [14:0] _T_18; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  wire [16:0] _GEN_18; // @[FixedPointTypeClass.scala 24:22]
  reg [17:0] jplMagOp2; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg [31:0] _T_21; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  wire [17:0] _T_22; // @[FixedPointTypeClass.scala 153:43]
  reg [31:0] _T_24; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  wire [17:0] _T_25; // @[FixedPointTypeClass.scala 153:43]
  reg [18:0] squared_magnitude; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  wire [21:0] _T_27; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  wire [18:0] _T_29; // @[FixedPointTypeClass.scala 133:23]
  wire [18:0] _T_32; // @[FixedPointTypeClass.scala 20:58]
  wire [15:0] trim_squared_magnitude; // @[FixedPointTypeClass.scala 176:41]
  wire [17:0] _GEN_19; // @[FixedPointTypeClass.scala 55:59]
  wire  _T_33; // @[FixedPointTypeClass.scala 55:59]
  wire [17:0] jplMag; // @[Order.scala 56:31]
  reg [1:0] _T_34; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [1:0] _T_35; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  wire  _T_38; // @[Mux.scala 68:19]
  wire [18:0] _T_39; // @[Mux.scala 68:16]
  reg [1:0] queueCounter; // @[Skid.scala 27:31]
  reg [31:0] _RAND_10;
  wire  _T_48; // @[Skid.scala 35:31]
  wire  _T_49; // @[Skid.scala 35:68]
  wire  _T_50; // @[Skid.scala 35:89]
  wire  skidInData_ready; // @[Skid.scala 35:51]
  wire  _T_40; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_20; // @[Skid.scala 28:34]
  wire [2:0] _T_41; // @[Skid.scala 28:34]
  wire  _T_42; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_21; // @[Skid.scala 28:47]
  wire [3:0] _T_43; // @[Skid.scala 28:47]
  reg  _T_46; // @[Reg.scala 27:20]
  reg [31:0] _RAND_11;
  reg  _T_47; // @[Reg.scala 27:20]
  reg [31:0] _RAND_12;
  wire  _T_54; // @[Decoupled.scala 40:37]
  reg  _T_56; // @[Reg.scala 15:16]
  reg [31:0] _RAND_13;
  reg  _T_57; // @[Reg.scala 15:16]
  reg [31:0] _RAND_14;
  reg [1:0] queueCounter_1; // @[Skid.scala 27:31]
  reg [31:0] _RAND_15;
  wire  _T_66; // @[Skid.scala 35:31]
  wire  _T_67; // @[Skid.scala 35:68]
  wire  _T_68; // @[Skid.scala 35:89]
  wire  _T_69; // @[Skid.scala 35:51]
  wire  _T_58; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_22; // @[Skid.scala 28:34]
  wire [2:0] _T_59; // @[Skid.scala 28:34]
  wire  _T_53_valid; // @[LogMagMuxTypes.scala 220:27 Skid.scala 37:15]
  wire  _T_60; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_23; // @[Skid.scala 28:47]
  wire [3:0] _T_61; // @[Skid.scala 28:47]
  reg  _T_64; // @[Reg.scala 27:20]
  reg [31:0] _RAND_16;
  reg  _T_65; // @[Reg.scala 27:20]
  reg [31:0] _RAND_17;
  Queue_2 Queue ( // @[Skid.scala 26:23]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits(Queue_io_enq_bits),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits(Queue_io_deq_bits)
  );
  Queue_3 Queue_1 ( // @[Skid.scala 26:23]
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits(Queue_1_io_enq_bits),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits(Queue_1_io_deq_bits)
  );
  assign _T_5 = 16'sh0 - $signed(io_in_bits_real); // @[FixedPointTypeClass.scala 30:68]
  assign absInReal = io_in_bits_real[15] ? $signed(_T_5) : $signed(io_in_bits_real); // @[FixedPointTypeClass.scala 247:8]
  assign _T_9 = 16'sh0 - $signed(io_in_bits_imag); // @[FixedPointTypeClass.scala 30:68]
  assign absInImag = io_in_bits_imag[15] ? $signed(_T_9) : $signed(io_in_bits_imag); // @[FixedPointTypeClass.scala 247:8]
  assign _T_10 = $signed(absInReal) > $signed(absInImag); // @[FixedPointTypeClass.scala 55:59]
  assign u = _T_10 ? $signed(absInReal) : $signed(absInImag); // @[Order.scala 56:31]
  assign _T_11 = $signed(absInReal) < $signed(absInImag); // @[FixedPointTypeClass.scala 53:59]
  assign v = _T_11 ? $signed(absInReal) : $signed(absInImag); // @[Order.scala 55:31]
  assign _T_12 = v[15:3]; // @[FixedPointTypeClass.scala 117:50]
  assign _GEN_16 = {{3{_T_12[12]}},_T_12}; // @[FixedPointTypeClass.scala 24:22]
  assign _T_15 = u[15:3]; // @[FixedPointTypeClass.scala 117:50]
  assign _GEN_17 = {{3{_T_15[12]}},_T_15}; // @[FixedPointTypeClass.scala 33:22]
  assign _GEN_18 = {{2{_T_18[14]}},_T_18}; // @[FixedPointTypeClass.scala 24:22]
  assign _T_22 = _T_21[31:14]; // @[FixedPointTypeClass.scala 153:43]
  assign _T_25 = _T_24[31:14]; // @[FixedPointTypeClass.scala 153:43]
  assign _T_27 = {$signed(squared_magnitude), 3'h0}; // @[FixedPointTypeClass.scala 129:22 FixedPointTypeClass.scala 130:12]
  assign _T_29 = _T_27[21:3]; // @[FixedPointTypeClass.scala 133:23]
  assign _T_32 = $signed(_T_29) + 19'sh4; // @[FixedPointTypeClass.scala 20:58]
  assign trim_squared_magnitude = _T_32[18:3]; // @[FixedPointTypeClass.scala 176:41]
  assign _GEN_19 = {{1{jplMagOp1[16]}},jplMagOp1}; // @[FixedPointTypeClass.scala 55:59]
  assign _T_33 = $signed(_GEN_19) > $signed(jplMagOp2); // @[FixedPointTypeClass.scala 55:59]
  assign jplMag = _T_33 ? $signed({{1{jplMagOp1[16]}},jplMagOp1}) : $signed(jplMagOp2); // @[Order.scala 56:31]
  assign _T_38 = 2'h0 == _T_35; // @[Mux.scala 68:19]
  assign _T_39 = _T_38 ? $signed(squared_magnitude) : $signed({{1{jplMag[17]}},jplMag}); // @[Mux.scala 68:16]
  assign _T_48 = queueCounter < 2'h3; // @[Skid.scala 35:31]
  assign _T_49 = queueCounter == 2'h3; // @[Skid.scala 35:68]
  assign _T_50 = _T_49 & io_out_ready; // @[Skid.scala 35:89]
  assign skidInData_ready = _T_48 | _T_50; // @[Skid.scala 35:51]
  assign _T_40 = skidInData_ready & io_in_valid; // @[Decoupled.scala 40:37]
  assign _GEN_20 = {{1'd0}, _T_40}; // @[Skid.scala 28:34]
  assign _T_41 = queueCounter + _GEN_20; // @[Skid.scala 28:34]
  assign _T_42 = io_out_ready & io_out_valid; // @[Decoupled.scala 40:37]
  assign _GEN_21 = {{2'd0}, _T_42}; // @[Skid.scala 28:47]
  assign _T_43 = _T_41 - _GEN_21; // @[Skid.scala 28:47]
  assign _T_54 = io_in_ready & io_in_valid; // @[Decoupled.scala 40:37]
  assign _T_66 = queueCounter_1 < 2'h3; // @[Skid.scala 35:31]
  assign _T_67 = queueCounter_1 == 2'h3; // @[Skid.scala 35:68]
  assign _T_68 = _T_67 & io_out_ready; // @[Skid.scala 35:89]
  assign _T_69 = _T_66 | _T_68; // @[Skid.scala 35:51]
  assign _T_58 = _T_69 & io_in_valid; // @[Decoupled.scala 40:37]
  assign _GEN_22 = {{1'd0}, _T_58}; // @[Skid.scala 28:34]
  assign _T_59 = queueCounter_1 + _GEN_22; // @[Skid.scala 28:34]
  assign _T_53_valid = Queue_1_io_deq_valid; // @[LogMagMuxTypes.scala 220:27 Skid.scala 37:15]
  assign _T_60 = io_out_ready & _T_53_valid; // @[Decoupled.scala 40:37]
  assign _GEN_23 = {{2'd0}, _T_60}; // @[Skid.scala 28:47]
  assign _T_61 = _T_59 - _GEN_23; // @[Skid.scala 28:47]
  assign io_in_ready = _T_48 | _T_50; // @[LogMagMuxTypes.scala 215:15]
  assign io_out_valid = Queue_io_deq_valid; // @[Skid.scala 37:15]
  assign io_out_bits = Queue_io_deq_bits; // @[Skid.scala 38:14]
  assign io_lastOut = Queue_1_io_deq_bits; // @[LogMagMuxTypes.scala 225:20]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = _T_47; // @[Skid.scala 30:24]
  assign Queue_io_enq_bits = _T_39[15:0]; // @[LogMagMuxTypes.scala 216:37]
  assign Queue_io_deq_ready = io_out_ready; // @[Skid.scala 36:24]
  assign Queue_1_clock = clock;
  assign Queue_1_reset = reset;
  assign Queue_1_io_enq_valid = _T_65; // @[Skid.scala 30:24]
  assign Queue_1_io_enq_bits = _T_57; // @[LogMagMuxTypes.scala 224:44]
  assign Queue_1_io_deq_ready = io_out_ready; // @[Skid.scala 36:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_14 = _RAND_0[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  jplMagOp1 = _RAND_1[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  tmpOp2 = _RAND_2[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_18 = _RAND_3[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  jplMagOp2 = _RAND_4[17:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_21 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_24 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  squared_magnitude = _RAND_7[18:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_34 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_35 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  queueCounter = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_46 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_47 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_56 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_57 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  queueCounter_1 = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_64 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_65 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T_14 <= $signed(u) + $signed(_GEN_16);
    jplMagOp1 <= _T_14;
    tmpOp2 <= $signed(u) - $signed(_GEN_17);
    _T_18 <= v[15:1];
    jplMagOp2 <= $signed(tmpOp2) + $signed(_GEN_18);
    _T_21 <= $signed(absInReal) * $signed(absInReal);
    _T_24 <= $signed(absInImag) * $signed(absInImag);
    squared_magnitude <= $signed(_T_22) + $signed(_T_25);
    _T_34 <= io_sel;
    _T_35 <= _T_34;
    if (reset) begin
      queueCounter <= 2'h0;
    end else begin
      queueCounter <= _T_43[1:0];
    end
    if (reset) begin
      _T_46 <= 1'h0;
    end else begin
      _T_46 <= _T_40;
    end
    if (reset) begin
      _T_47 <= 1'h0;
    end else begin
      _T_47 <= _T_46;
    end
    _T_56 <= io_lastIn & _T_54;
    _T_57 <= _T_56;
    if (reset) begin
      queueCounter_1 <= 2'h0;
    end else begin
      queueCounter_1 <= _T_61[1:0];
    end
    if (reset) begin
      _T_64 <= 1'h0;
    end else begin
      _T_64 <= _T_58;
    end
    if (reset) begin
      _T_65 <= 1'h0;
    end else begin
      _T_65 <= _T_64;
    end
  end
endmodule
module LogMagMuxGenerator(
  input         clock,
  input         reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [15:0] io_in_bits_real,
  input  [15:0] io_in_bits_imag,
  input         io_lastIn,
  input         io_out_ready,
  output        io_out_valid,
  output [15:0] io_out_bits,
  input  [1:0]  io_sel,
  output        io_lastOut
);
  wire  magModule_clock; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_reset; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_in_ready; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_in_valid; // @[LogMagMuxGenerator.scala 60:35]
  wire [15:0] magModule_io_in_bits_real; // @[LogMagMuxGenerator.scala 60:35]
  wire [15:0] magModule_io_in_bits_imag; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_lastIn; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_out_ready; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_out_valid; // @[LogMagMuxGenerator.scala 60:35]
  wire [15:0] magModule_io_out_bits; // @[LogMagMuxGenerator.scala 60:35]
  wire [1:0] magModule_io_sel; // @[LogMagMuxGenerator.scala 60:35]
  wire  magModule_io_lastOut; // @[LogMagMuxGenerator.scala 60:35]
  MagJPLandSQRMagInst magModule ( // @[LogMagMuxGenerator.scala 60:35]
    .clock(magModule_clock),
    .reset(magModule_reset),
    .io_in_ready(magModule_io_in_ready),
    .io_in_valid(magModule_io_in_valid),
    .io_in_bits_real(magModule_io_in_bits_real),
    .io_in_bits_imag(magModule_io_in_bits_imag),
    .io_lastIn(magModule_io_lastIn),
    .io_out_ready(magModule_io_out_ready),
    .io_out_valid(magModule_io_out_valid),
    .io_out_bits(magModule_io_out_bits),
    .io_sel(magModule_io_sel),
    .io_lastOut(magModule_io_lastOut)
  );
  assign io_in_ready = magModule_io_in_ready; // @[LogMagMuxGenerator.scala 64:19]
  assign io_out_valid = magModule_io_out_valid; // @[LogMagMuxGenerator.scala 65:10]
  assign io_out_bits = magModule_io_out_bits; // @[LogMagMuxGenerator.scala 65:10]
  assign io_lastOut = magModule_io_lastOut; // @[LogMagMuxGenerator.scala 73:20]
  assign magModule_clock = clock;
  assign magModule_reset = reset;
  assign magModule_io_in_valid = io_in_valid; // @[LogMagMuxGenerator.scala 64:19]
  assign magModule_io_in_bits_real = io_in_bits_real; // @[LogMagMuxGenerator.scala 64:19]
  assign magModule_io_in_bits_imag = io_in_bits_imag; // @[LogMagMuxGenerator.scala 64:19]
  assign magModule_io_lastIn = io_lastIn; // @[LogMagMuxGenerator.scala 72:29]
  assign magModule_io_out_ready = io_out_ready; // @[LogMagMuxGenerator.scala 65:10]
  assign magModule_io_sel = io_sel; // @[LogMagMuxGenerator.scala 68:26]
endmodule
module AXI4LogMagMuxBlock(
  input         clock,
  input         reset,
  output        auto_mem_in_aw_ready,
  input         auto_mem_in_aw_valid,
  input         auto_mem_in_aw_bits_id,
  input  [29:0] auto_mem_in_aw_bits_addr,
  output        auto_mem_in_w_ready,
  input         auto_mem_in_w_valid,
  input  [31:0] auto_mem_in_w_bits_data,
  input  [3:0]  auto_mem_in_w_bits_strb,
  input         auto_mem_in_b_ready,
  output        auto_mem_in_b_valid,
  output        auto_mem_in_b_bits_id,
  output        auto_mem_in_ar_ready,
  input         auto_mem_in_ar_valid,
  input         auto_mem_in_ar_bits_id,
  input  [29:0] auto_mem_in_ar_bits_addr,
  input  [2:0]  auto_mem_in_ar_bits_size,
  input         auto_mem_in_r_ready,
  output        auto_mem_in_r_valid,
  output        auto_mem_in_r_bits_id,
  output [31:0] auto_mem_in_r_bits_data,
  input         auto_master_out_ready,
  output        auto_master_out_valid,
  output [15:0] auto_master_out_bits_data,
  output        auto_master_out_bits_last,
  output        auto_slave_in_ready,
  input         auto_slave_in_valid,
  input  [31:0] auto_slave_in_bits_data,
  input         auto_slave_in_bits_last
);
  wire  logMagMux_clock; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_reset; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_in_ready; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_in_valid; // @[LogMagMuxDspBlock.scala 70:27]
  wire [15:0] logMagMux_io_in_bits_real; // @[LogMagMuxDspBlock.scala 70:27]
  wire [15:0] logMagMux_io_in_bits_imag; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_lastIn; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_out_ready; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_out_valid; // @[LogMagMuxDspBlock.scala 70:27]
  wire [15:0] logMagMux_io_out_bits; // @[LogMagMuxDspBlock.scala 70:27]
  wire [1:0] logMagMux_io_sel; // @[LogMagMuxDspBlock.scala 70:27]
  wire  logMagMux_io_lastOut; // @[LogMagMuxDspBlock.scala 70:27]
  wire  Queue_clock; // @[Decoupled.scala 287:21]
  wire  Queue_reset; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_bits_read; // @[Decoupled.scala 287:21]
  wire [31:0] Queue_io_enq_bits_data; // @[Decoupled.scala 287:21]
  wire  Queue_io_enq_bits_extra; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_bits_read; // @[Decoupled.scala 287:21]
  wire [31:0] Queue_io_deq_bits_data; // @[Decoupled.scala 287:21]
  wire  Queue_io_deq_bits_extra; // @[Decoupled.scala 287:21]
  reg  selReg; // @[LogMagMuxDspBlock.scala 75:25]
  reg [31:0] _RAND_0;
  wire  _T_2; // @[RegisterRouter.scala 40:39]
  wire  _T_3; // @[RegisterRouter.scala 40:26]
  wire  _T_4; // @[RegisterRouter.scala 42:29]
  wire  _T_47_ready; // @[RegisterRouter.scala 59:16 Decoupled.scala 290:17]
  wire [29:0] _T_11; // @[RegisterRouter.scala 48:19]
  wire  _T_53; // @[RegisterRouter.scala 59:16]
  wire  _T_5; // @[RegisterRouter.scala 42:26]
  wire [1:0] _T_14; // @[OneHot.scala 65:12]
  wire [1:0] _T_16; // @[Misc.scala 200:81]
  wire  _T_17; // @[Misc.scala 204:21]
  wire  _T_20; // @[Misc.scala 209:20]
  wire  _T_22; // @[Misc.scala 213:38]
  wire  _T_23; // @[Misc.scala 213:29]
  wire  _T_25; // @[Misc.scala 213:38]
  wire  _T_26; // @[Misc.scala 213:29]
  wire  _T_29; // @[Misc.scala 209:20]
  wire  _T_30; // @[Misc.scala 212:27]
  wire  _T_31; // @[Misc.scala 213:38]
  wire  _T_32; // @[Misc.scala 213:29]
  wire  _T_33; // @[Misc.scala 212:27]
  wire  _T_34; // @[Misc.scala 213:38]
  wire  _T_35; // @[Misc.scala 213:29]
  wire  _T_36; // @[Misc.scala 212:27]
  wire  _T_37; // @[Misc.scala 213:38]
  wire  _T_38; // @[Misc.scala 213:29]
  wire  _T_39; // @[Misc.scala 212:27]
  wire  _T_40; // @[Misc.scala 213:38]
  wire  _T_41; // @[Misc.scala 213:29]
  wire [3:0] _T_44; // @[Cat.scala 29:58]
  wire [3:0] _T_46; // @[RegisterRouter.scala 54:25]
  wire [7:0] _T_63; // @[Bitwise.scala 72:12]
  wire [7:0] _T_65; // @[Bitwise.scala 72:12]
  wire [7:0] _T_67; // @[Bitwise.scala 72:12]
  wire [7:0] _T_69; // @[Bitwise.scala 72:12]
  wire [31:0] _T_72; // @[Cat.scala 29:58]
  wire  _T_117; // @[RegisterRouter.scala 59:16]
  wire  _T_129; // @[RegisterRouter.scala 59:16]
  wire  _T_132; // @[RegisterRouter.scala 59:16]
  wire  _T_98; // @[RegisterRouter.scala 59:16]
  wire  _T_171; // @[RegisterRouter.scala 59:16]
  wire  _T_172_bits_read; // @[Decoupled.scala 308:19 Decoupled.scala 309:14]
  wire  _T_172_valid; // @[Decoupled.scala 308:19 Decoupled.scala 310:15]
  wire  _T_175; // @[RegisterRouter.scala 65:29]
  LogMagMuxGenerator logMagMux ( // @[LogMagMuxDspBlock.scala 70:27]
    .clock(logMagMux_clock),
    .reset(logMagMux_reset),
    .io_in_ready(logMagMux_io_in_ready),
    .io_in_valid(logMagMux_io_in_valid),
    .io_in_bits_real(logMagMux_io_in_bits_real),
    .io_in_bits_imag(logMagMux_io_in_bits_imag),
    .io_lastIn(logMagMux_io_lastIn),
    .io_out_ready(logMagMux_io_out_ready),
    .io_out_valid(logMagMux_io_out_valid),
    .io_out_bits(logMagMux_io_out_bits),
    .io_sel(logMagMux_io_sel),
    .io_lastOut(logMagMux_io_lastOut)
  );
  Queue_1 Queue ( // @[Decoupled.scala 287:21]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_read(Queue_io_enq_bits_read),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_extra(Queue_io_enq_bits_extra),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_read(Queue_io_deq_bits_read),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_extra(Queue_io_deq_bits_extra)
  );
  assign _T_2 = auto_mem_in_aw_valid & auto_mem_in_w_valid; // @[RegisterRouter.scala 40:39]
  assign _T_3 = auto_mem_in_ar_valid | _T_2; // @[RegisterRouter.scala 40:26]
  assign _T_4 = ~auto_mem_in_ar_valid; // @[RegisterRouter.scala 42:29]
  assign _T_47_ready = Queue_io_enq_ready; // @[RegisterRouter.scala 59:16 Decoupled.scala 290:17]
  assign _T_11 = auto_mem_in_ar_valid ? auto_mem_in_ar_bits_addr : auto_mem_in_aw_bits_addr; // @[RegisterRouter.scala 48:19]
  assign _T_53 = _T_11[7:2] == 6'h0; // @[RegisterRouter.scala 59:16]
  assign _T_5 = _T_47_ready & _T_4; // @[RegisterRouter.scala 42:26]
  assign _T_14 = 2'h1 << auto_mem_in_ar_bits_size[0]; // @[OneHot.scala 65:12]
  assign _T_16 = _T_14 | 2'h1; // @[Misc.scala 200:81]
  assign _T_17 = auto_mem_in_ar_bits_size >= 3'h2; // @[Misc.scala 204:21]
  assign _T_20 = ~auto_mem_in_ar_bits_addr[1]; // @[Misc.scala 209:20]
  assign _T_22 = _T_16[1] & _T_20; // @[Misc.scala 213:38]
  assign _T_23 = _T_17 | _T_22; // @[Misc.scala 213:29]
  assign _T_25 = _T_16[1] & auto_mem_in_ar_bits_addr[1]; // @[Misc.scala 213:38]
  assign _T_26 = _T_17 | _T_25; // @[Misc.scala 213:29]
  assign _T_29 = ~auto_mem_in_ar_bits_addr[0]; // @[Misc.scala 209:20]
  assign _T_30 = _T_20 & _T_29; // @[Misc.scala 212:27]
  assign _T_31 = _T_16[0] & _T_30; // @[Misc.scala 213:38]
  assign _T_32 = _T_23 | _T_31; // @[Misc.scala 213:29]
  assign _T_33 = _T_20 & auto_mem_in_ar_bits_addr[0]; // @[Misc.scala 212:27]
  assign _T_34 = _T_16[0] & _T_33; // @[Misc.scala 213:38]
  assign _T_35 = _T_23 | _T_34; // @[Misc.scala 213:29]
  assign _T_36 = auto_mem_in_ar_bits_addr[1] & _T_29; // @[Misc.scala 212:27]
  assign _T_37 = _T_16[0] & _T_36; // @[Misc.scala 213:38]
  assign _T_38 = _T_26 | _T_37; // @[Misc.scala 213:29]
  assign _T_39 = auto_mem_in_ar_bits_addr[1] & auto_mem_in_ar_bits_addr[0]; // @[Misc.scala 212:27]
  assign _T_40 = _T_16[0] & _T_39; // @[Misc.scala 213:38]
  assign _T_41 = _T_26 | _T_40; // @[Misc.scala 213:29]
  assign _T_44 = {_T_41,_T_38,_T_35,_T_32}; // @[Cat.scala 29:58]
  assign _T_46 = auto_mem_in_ar_valid ? _T_44 : auto_mem_in_w_bits_strb; // @[RegisterRouter.scala 54:25]
  assign _T_63 = _T_46[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign _T_65 = _T_46[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign _T_67 = _T_46[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign _T_69 = _T_46[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  assign _T_72 = {_T_69,_T_67,_T_65,_T_63}; // @[Cat.scala 29:58]
  assign _T_117 = _T_3 & _T_47_ready; // @[RegisterRouter.scala 59:16]
  assign _T_129 = _T_117 & _T_4; // @[RegisterRouter.scala 59:16]
  assign _T_132 = _T_129 & _T_53; // @[RegisterRouter.scala 59:16]
  assign _T_98 = _T_132 & _T_72[0]; // @[RegisterRouter.scala 59:16]
  assign _T_171 = _T_53 & selReg; // @[RegisterRouter.scala 59:16]
  assign _T_172_bits_read = Queue_io_deq_bits_read; // @[Decoupled.scala 308:19 Decoupled.scala 309:14]
  assign _T_172_valid = Queue_io_deq_valid; // @[Decoupled.scala 308:19 Decoupled.scala 310:15]
  assign _T_175 = ~_T_172_bits_read; // @[RegisterRouter.scala 65:29]
  assign auto_mem_in_aw_ready = _T_5 & auto_mem_in_w_valid; // @[LazyModule.scala 173:31]
  assign auto_mem_in_w_ready = _T_5 & auto_mem_in_aw_valid; // @[LazyModule.scala 173:31]
  assign auto_mem_in_b_valid = _T_172_valid & _T_175; // @[LazyModule.scala 173:31]
  assign auto_mem_in_b_bits_id = Queue_io_deq_bits_extra; // @[LazyModule.scala 173:31]
  assign auto_mem_in_ar_ready = Queue_io_enq_ready; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_valid = _T_172_valid & _T_172_bits_read; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_bits_id = Queue_io_deq_bits_extra; // @[LazyModule.scala 173:31]
  assign auto_mem_in_r_bits_data = Queue_io_deq_bits_data; // @[LazyModule.scala 173:31]
  assign auto_master_out_valid = logMagMux_io_out_valid; // @[LazyModule.scala 173:49]
  assign auto_master_out_bits_data = logMagMux_io_out_bits; // @[LazyModule.scala 173:49]
  assign auto_master_out_bits_last = logMagMux_io_lastOut; // @[LazyModule.scala 173:49]
  assign auto_slave_in_ready = logMagMux_io_in_ready; // @[LazyModule.scala 173:31]
  assign logMagMux_clock = clock;
  assign logMagMux_reset = reset;
  assign logMagMux_io_in_valid = auto_slave_in_valid; // @[LogMagMuxDspBlock.scala 87:30]
  assign logMagMux_io_in_bits_real = auto_slave_in_bits_data[31:16]; // @[LogMagMuxDspBlock.scala 88:30]
  assign logMagMux_io_in_bits_imag = auto_slave_in_bits_data[15:0]; // @[LogMagMuxDspBlock.scala 88:30]
  assign logMagMux_io_lastIn = auto_slave_in_bits_last; // @[LogMagMuxDspBlock.scala 91:31]
  assign logMagMux_io_out_ready = auto_master_out_ready; // @[LogMagMuxDspBlock.scala 96:28]
  assign logMagMux_io_sel = {{1'd0}, selReg}; // @[LogMagMuxDspBlock.scala 81:26]
  assign Queue_clock = clock;
  assign Queue_reset = reset;
  assign Queue_io_enq_valid = auto_mem_in_ar_valid | _T_2; // @[Decoupled.scala 288:22]
  assign Queue_io_enq_bits_read = auto_mem_in_ar_valid; // @[Decoupled.scala 289:21]
  assign Queue_io_enq_bits_data = {{31'd0}, _T_171}; // @[Decoupled.scala 289:21]
  assign Queue_io_enq_bits_extra = auto_mem_in_ar_valid ? auto_mem_in_ar_bits_id : auto_mem_in_aw_bits_id; // @[Decoupled.scala 289:21]
  assign Queue_io_deq_ready = _T_172_bits_read ? auto_mem_in_r_ready : auto_mem_in_b_ready; // @[Decoupled.scala 311:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  selReg = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      selReg <= 1'h0;
    end else if (_T_98) begin
      selReg <= auto_mem_in_w_bits_data[0];
    end
  end
endmodule
module QueueCompatibility(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [1:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [1:0] io_deq_bits
);
  reg [1:0] _T [0:1]; // @[Decoupled.scala 209:24]
  reg [31:0] _RAND_0;
  wire [1:0] _T__T_18_data; // @[Decoupled.scala 209:24]
  wire  _T__T_18_addr; // @[Decoupled.scala 209:24]
  wire [1:0] _T__T_10_data; // @[Decoupled.scala 209:24]
  wire  _T__T_10_addr; // @[Decoupled.scala 209:24]
  wire  _T__T_10_mask; // @[Decoupled.scala 209:24]
  wire  _T__T_10_en; // @[Decoupled.scala 209:24]
  reg  value; // @[Counter.scala 29:33]
  reg [31:0] _RAND_1;
  reg  value_1; // @[Counter.scala 29:33]
  reg [31:0] _RAND_2;
  reg  _T_1; // @[Decoupled.scala 212:35]
  reg [31:0] _RAND_3;
  wire  _T_2; // @[Decoupled.scala 214:41]
  wire  _T_3; // @[Decoupled.scala 215:36]
  wire  _T_4; // @[Decoupled.scala 215:33]
  wire  _T_5; // @[Decoupled.scala 216:32]
  wire  _T_6; // @[Decoupled.scala 40:37]
  wire  _T_8; // @[Decoupled.scala 40:37]
  wire  _T_12; // @[Counter.scala 39:22]
  wire  _GEN_9; // @[Decoupled.scala 240:27]
  wire  _GEN_12; // @[Decoupled.scala 237:18]
  wire  _T_14; // @[Counter.scala 39:22]
  wire  _GEN_11; // @[Decoupled.scala 237:18]
  wire  _T_15; // @[Decoupled.scala 227:16]
  wire  _T_16; // @[Decoupled.scala 231:19]
  assign _T__T_18_addr = value_1;
  assign _T__T_18_data = _T[_T__T_18_addr]; // @[Decoupled.scala 209:24]
  assign _T__T_10_data = io_enq_bits;
  assign _T__T_10_addr = value;
  assign _T__T_10_mask = 1'h1;
  assign _T__T_10_en = _T_4 ? _GEN_9 : _T_6;
  assign _T_2 = value == value_1; // @[Decoupled.scala 214:41]
  assign _T_3 = ~_T_1; // @[Decoupled.scala 215:36]
  assign _T_4 = _T_2 & _T_3; // @[Decoupled.scala 215:33]
  assign _T_5 = _T_2 & _T_1; // @[Decoupled.scala 216:32]
  assign _T_6 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  assign _T_8 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign _T_12 = value + 1'h1; // @[Counter.scala 39:22]
  assign _GEN_9 = io_deq_ready ? 1'h0 : _T_6; // @[Decoupled.scala 240:27]
  assign _GEN_12 = _T_4 ? _GEN_9 : _T_6; // @[Decoupled.scala 237:18]
  assign _T_14 = value_1 + 1'h1; // @[Counter.scala 39:22]
  assign _GEN_11 = _T_4 ? 1'h0 : _T_8; // @[Decoupled.scala 237:18]
  assign _T_15 = _GEN_12 != _GEN_11; // @[Decoupled.scala 227:16]
  assign _T_16 = ~_T_4; // @[Decoupled.scala 231:19]
  assign io_enq_ready = ~_T_5; // @[Decoupled.scala 232:16]
  assign io_deq_valid = io_enq_valid | _T_16; // @[Decoupled.scala 231:16 Decoupled.scala 236:40]
  assign io_deq_bits = _T_4 ? io_enq_bits : _T__T_18_data; // @[Decoupled.scala 233:15 Decoupled.scala 238:19]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T[initvar] = _RAND_0[1:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(_T__T_10_en & _T__T_10_mask) begin
      _T[_T__T_10_addr] <= _T__T_10_data; // @[Decoupled.scala 209:24]
    end
    if (reset) begin
      value <= 1'h0;
    end else if (_GEN_12) begin
      value <= _T_12;
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else if (_GEN_11) begin
      value_1 <= _T_14;
    end
    if (reset) begin
      _T_1 <= 1'h0;
    end else if (_T_15) begin
      if (_T_4) begin
        if (io_deq_ready) begin
          _T_1 <= 1'h0;
        end else begin
          _T_1 <= _T_6;
        end
      end else begin
        _T_1 <= _T_6;
      end
    end
  end
endmodule
module AXI4Xbar(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [29:0] auto_in_aw_bits_addr,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [29:0] auto_in_ar_bits_addr,
  input  [2:0]  auto_in_ar_bits_size,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_1_aw_ready,
  output        auto_out_1_aw_valid,
  output        auto_out_1_aw_bits_id,
  output [29:0] auto_out_1_aw_bits_addr,
  input         auto_out_1_w_ready,
  output        auto_out_1_w_valid,
  output [31:0] auto_out_1_w_bits_data,
  output [3:0]  auto_out_1_w_bits_strb,
  output        auto_out_1_b_ready,
  input         auto_out_1_b_valid,
  input         auto_out_1_b_bits_id,
  input         auto_out_1_ar_ready,
  output        auto_out_1_ar_valid,
  output        auto_out_1_ar_bits_id,
  output [29:0] auto_out_1_ar_bits_addr,
  output [2:0]  auto_out_1_ar_bits_size,
  output        auto_out_1_r_ready,
  input         auto_out_1_r_valid,
  input         auto_out_1_r_bits_id,
  input  [31:0] auto_out_1_r_bits_data,
  input         auto_out_0_aw_ready,
  output        auto_out_0_aw_valid,
  output        auto_out_0_aw_bits_id,
  output [29:0] auto_out_0_aw_bits_addr,
  input         auto_out_0_w_ready,
  output        auto_out_0_w_valid,
  output        auto_out_0_b_ready,
  input         auto_out_0_b_valid,
  input         auto_out_0_b_bits_id,
  input         auto_out_0_ar_ready,
  output        auto_out_0_ar_valid,
  output        auto_out_0_ar_bits_id,
  output [29:0] auto_out_0_ar_bits_addr,
  output        auto_out_0_r_ready,
  input         auto_out_0_r_valid,
  input         auto_out_0_r_bits_id,
  input  [31:0] auto_out_0_r_bits_data
);
  wire  awIn_0_clock; // @[Xbar.scala 55:47]
  wire  awIn_0_reset; // @[Xbar.scala 55:47]
  wire  awIn_0_io_enq_ready; // @[Xbar.scala 55:47]
  wire  awIn_0_io_enq_valid; // @[Xbar.scala 55:47]
  wire [1:0] awIn_0_io_enq_bits; // @[Xbar.scala 55:47]
  wire  awIn_0_io_deq_ready; // @[Xbar.scala 55:47]
  wire  awIn_0_io_deq_valid; // @[Xbar.scala 55:47]
  wire [1:0] awIn_0_io_deq_bits; // @[Xbar.scala 55:47]
  wire [30:0] _T_1; // @[Parameters.scala 137:49]
  wire [30:0] _T_3; // @[Parameters.scala 137:52]
  wire  requestARIO_0_0; // @[Parameters.scala 137:67]
  wire [29:0] _T_5; // @[Parameters.scala 137:31]
  wire [30:0] _T_6; // @[Parameters.scala 137:49]
  wire [30:0] _T_8; // @[Parameters.scala 137:52]
  wire  requestARIO_0_1; // @[Parameters.scala 137:67]
  wire [30:0] _T_11; // @[Parameters.scala 137:49]
  wire [30:0] _T_13; // @[Parameters.scala 137:52]
  wire  requestAWIO_0_0; // @[Parameters.scala 137:67]
  wire [29:0] _T_15; // @[Parameters.scala 137:31]
  wire [30:0] _T_16; // @[Parameters.scala 137:49]
  wire [30:0] _T_18; // @[Parameters.scala 137:52]
  wire  requestAWIO_0_1; // @[Parameters.scala 137:67]
  wire  requestROI_0_0; // @[Parameters.scala 47:9]
  wire  requestROI_1_0; // @[Parameters.scala 47:9]
  wire  requestBOI_0_0; // @[Parameters.scala 47:9]
  wire  requestBOI_1_0; // @[Parameters.scala 47:9]
  wire [1:0] _T_20; // @[Xbar.scala 64:75]
  wire  requestWIO_0_0; // @[Xbar.scala 65:73]
  wire  requestWIO_0_1; // @[Xbar.scala 65:73]
  wire [1:0] _T_27; // @[Xbar.scala 93:45]
  wire  _T_108; // @[Mux.scala 27:72]
  wire  _T_109; // @[Mux.scala 27:72]
  wire  in_0_ar_ready; // @[Mux.scala 27:72]
  reg [2:0] _T_36; // @[Xbar.scala 104:34]
  reg [31:0] _RAND_0;
  wire  _T_55; // @[Xbar.scala 112:22]
  reg  _T_37; // @[Xbar.scala 105:29]
  reg [31:0] _RAND_1;
  wire  _T_54; // @[Xbar.scala 111:75]
  wire  _T_56; // @[Xbar.scala 112:34]
  wire  _T_57; // @[Xbar.scala 112:80]
  wire  _T_59; // @[Xbar.scala 112:48]
  wire  io_in_0_ar_ready; // @[Xbar.scala 130:45]
  wire  _T_31; // @[Decoupled.scala 40:37]
  reg  _T_222; // @[Xbar.scala 242:23]
  reg [31:0] _RAND_2;
  wire  _T_127; // @[Xbar.scala 222:40]
  wire  _T_129; // @[Xbar.scala 222:40]
  wire  _T_223; // @[Xbar.scala 246:36]
  reg  _T_278_0; // @[Xbar.scala 261:24]
  reg [31:0] _RAND_3;
  wire  _T_284; // @[Mux.scala 27:72]
  reg  _T_278_1; // @[Xbar.scala 261:24]
  reg [31:0] _RAND_4;
  wire  _T_285; // @[Mux.scala 27:72]
  wire  _T_286; // @[Mux.scala 27:72]
  wire  in_0_r_valid; // @[Xbar.scala 278:22]
  wire  _T_33; // @[Decoupled.scala 40:37]
  wire [1:0] _T_224; // @[Cat.scala 29:58]
  reg [1:0] _T_231; // @[Arbiter.scala 20:23]
  reg [31:0] _RAND_5;
  wire [1:0] _T_232; // @[Arbiter.scala 21:30]
  wire [1:0] _T_233; // @[Arbiter.scala 21:28]
  wire [3:0] _T_234; // @[Cat.scala 29:58]
  wire [3:0] _GEN_18; // @[package.scala 208:43]
  wire [3:0] _T_236; // @[package.scala 208:43]
  wire [3:0] _T_239; // @[Arbiter.scala 22:66]
  wire [3:0] _GEN_19; // @[Arbiter.scala 22:58]
  wire [3:0] _T_240; // @[Arbiter.scala 22:58]
  wire [1:0] _T_243; // @[Arbiter.scala 23:39]
  wire [1:0] _T_244; // @[Arbiter.scala 23:18]
  wire  _T_256; // @[Xbar.scala 250:63]
  wire  _T_279_0; // @[Xbar.scala 262:23]
  wire [35:0] _T_291; // @[Mux.scala 27:72]
  wire [35:0] _T_292; // @[Mux.scala 27:72]
  wire  _T_257; // @[Xbar.scala 250:63]
  wire  _T_279_1; // @[Xbar.scala 262:23]
  wire [35:0] _T_295; // @[Mux.scala 27:72]
  wire [35:0] _T_296; // @[Mux.scala 27:72]
  wire [35:0] _T_297; // @[Mux.scala 27:72]
  wire  in_0_r_bits_last; // @[Mux.scala 27:72]
  wire  _T_35; // @[Xbar.scala 120:45]
  wire [2:0] _GEN_20; // @[Xbar.scala 106:30]
  wire [2:0] _T_39; // @[Xbar.scala 106:30]
  wire [2:0] _GEN_21; // @[Xbar.scala 106:48]
  wire [2:0] _T_41; // @[Xbar.scala 106:48]
  wire  _T_42; // @[Xbar.scala 107:23]
  wire  _T_43; // @[Xbar.scala 107:43]
  wire  _T_44; // @[Xbar.scala 107:34]
  wire  _T_46; // @[Xbar.scala 107:22]
  wire  _T_47; // @[Xbar.scala 107:22]
  wire  _T_48; // @[Xbar.scala 108:23]
  wire  _T_50; // @[Xbar.scala 108:34]
  wire  _T_52; // @[Xbar.scala 108:22]
  wire  _T_53; // @[Xbar.scala 108:22]
  wire  _T_115; // @[Mux.scala 27:72]
  wire  _T_116; // @[Mux.scala 27:72]
  wire  in_0_aw_ready; // @[Mux.scala 27:72]
  reg  _T_90; // @[Xbar.scala 137:30]
  reg [31:0] _RAND_6;
  wire  _T_94; // @[Xbar.scala 139:57]
  wire  _T_95; // @[Xbar.scala 139:45]
  reg [2:0] _T_64; // @[Xbar.scala 104:34]
  reg [31:0] _RAND_7;
  wire  _T_83; // @[Xbar.scala 112:22]
  reg  _T_65; // @[Xbar.scala 105:29]
  reg [31:0] _RAND_8;
  wire  _T_82; // @[Xbar.scala 111:75]
  wire  _T_84; // @[Xbar.scala 112:34]
  wire  _T_85; // @[Xbar.scala 112:80]
  wire  _T_87; // @[Xbar.scala 112:48]
  wire  io_in_0_aw_ready; // @[Xbar.scala 139:82]
  wire  _T_60; // @[Decoupled.scala 40:37]
  reg  _T_304; // @[Xbar.scala 242:23]
  reg [31:0] _RAND_9;
  wire  _T_131; // @[Xbar.scala 222:40]
  wire  _T_133; // @[Xbar.scala 222:40]
  wire  _T_305; // @[Xbar.scala 246:36]
  reg  _T_360_0; // @[Xbar.scala 261:24]
  reg [31:0] _RAND_10;
  wire  _T_366; // @[Mux.scala 27:72]
  reg  _T_360_1; // @[Xbar.scala 261:24]
  reg [31:0] _RAND_11;
  wire  _T_367; // @[Mux.scala 27:72]
  wire  _T_368; // @[Mux.scala 27:72]
  wire  in_0_b_valid; // @[Xbar.scala 278:22]
  wire  _T_62; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_22; // @[Xbar.scala 106:30]
  wire [2:0] _T_67; // @[Xbar.scala 106:30]
  wire [2:0] _GEN_23; // @[Xbar.scala 106:48]
  wire [2:0] _T_69; // @[Xbar.scala 106:48]
  wire  _T_70; // @[Xbar.scala 107:23]
  wire  _T_71; // @[Xbar.scala 107:43]
  wire  _T_72; // @[Xbar.scala 107:34]
  wire  _T_74; // @[Xbar.scala 107:22]
  wire  _T_75; // @[Xbar.scala 107:22]
  wire  _T_76; // @[Xbar.scala 108:23]
  wire  _T_78; // @[Xbar.scala 108:34]
  wire  _T_80; // @[Xbar.scala 108:22]
  wire  _T_81; // @[Xbar.scala 108:22]
  wire  in_0_ar_valid; // @[Xbar.scala 129:45]
  wire  _T_92; // @[Xbar.scala 138:45]
  wire  in_0_aw_valid; // @[Xbar.scala 138:82]
  wire  _T_97; // @[Xbar.scala 140:54]
  wire  _T_99; // @[Decoupled.scala 40:37]
  wire  _GEN_2; // @[Xbar.scala 141:38]
  wire  _T_100; // @[Decoupled.scala 40:37]
  wire  in_0_w_valid; // @[Xbar.scala 145:43]
  wire  _T_122; // @[Mux.scala 27:72]
  wire  _T_123; // @[Mux.scala 27:72]
  wire  in_0_w_ready; // @[Mux.scala 27:72]
  wire  _T_103; // @[Xbar.scala 147:50]
  wire  out_0_ar_valid; // @[Xbar.scala 222:40]
  wire  out_1_ar_valid; // @[Xbar.scala 222:40]
  wire  out_0_aw_valid; // @[Xbar.scala 222:40]
  wire  out_1_aw_valid; // @[Xbar.scala 222:40]
  wire  _T_140; // @[Xbar.scala 256:60]
  wire  _T_146; // @[Xbar.scala 258:23]
  wire  _T_148; // @[Xbar.scala 258:12]
  wire  _T_149; // @[Xbar.scala 258:12]
  wire  _T_161; // @[Xbar.scala 256:60]
  wire  _T_167; // @[Xbar.scala 258:23]
  wire  _T_169; // @[Xbar.scala 258:12]
  wire  _T_170; // @[Xbar.scala 258:12]
  wire  _T_184; // @[Xbar.scala 256:60]
  wire  _T_190; // @[Xbar.scala 258:23]
  wire  _T_192; // @[Xbar.scala 258:12]
  wire  _T_193; // @[Xbar.scala 258:12]
  wire  _T_205; // @[Xbar.scala 256:60]
  wire  _T_211; // @[Xbar.scala 258:23]
  wire  _T_213; // @[Xbar.scala 258:12]
  wire  _T_214; // @[Xbar.scala 258:12]
  wire  _T_245; // @[Arbiter.scala 24:27]
  wire  _T_246; // @[Arbiter.scala 24:18]
  wire [1:0] _T_247; // @[Arbiter.scala 25:29]
  wire [2:0] _T_248; // @[package.scala 199:48]
  wire [1:0] _T_250; // @[package.scala 199:43]
  wire  _T_260; // @[Xbar.scala 255:50]
  wire  _T_262; // @[Xbar.scala 256:60]
  wire  _T_265; // @[Xbar.scala 256:60]
  wire  _T_266; // @[Xbar.scala 256:57]
  wire  _T_269; // @[Xbar.scala 256:11]
  wire  _T_270; // @[Xbar.scala 256:11]
  wire  _T_271; // @[Xbar.scala 258:13]
  wire  _T_273; // @[Xbar.scala 258:23]
  wire  _T_275; // @[Xbar.scala 258:12]
  wire  _T_276; // @[Xbar.scala 258:12]
  wire  _GEN_13; // @[Xbar.scala 266:21]
  wire  _GEN_14; // @[Xbar.scala 267:24]
  wire  _T_281_0; // @[Xbar.scala 270:24]
  wire  _T_281_1; // @[Xbar.scala 270:24]
  wire [1:0] _T_306; // @[Cat.scala 29:58]
  reg [1:0] _T_313; // @[Arbiter.scala 20:23]
  reg [31:0] _RAND_12;
  wire [1:0] _T_314; // @[Arbiter.scala 21:30]
  wire [1:0] _T_315; // @[Arbiter.scala 21:28]
  wire [3:0] _T_316; // @[Cat.scala 29:58]
  wire [3:0] _GEN_24; // @[package.scala 208:43]
  wire [3:0] _T_318; // @[package.scala 208:43]
  wire [3:0] _T_321; // @[Arbiter.scala 22:66]
  wire [3:0] _GEN_25; // @[Arbiter.scala 22:58]
  wire [3:0] _T_322; // @[Arbiter.scala 22:58]
  wire [1:0] _T_325; // @[Arbiter.scala 23:39]
  wire [1:0] _T_326; // @[Arbiter.scala 23:18]
  wire  _T_327; // @[Arbiter.scala 24:27]
  wire  _T_328; // @[Arbiter.scala 24:18]
  wire [1:0] _T_329; // @[Arbiter.scala 25:29]
  wire [2:0] _T_330; // @[package.scala 199:48]
  wire [1:0] _T_332; // @[package.scala 199:43]
  wire  _T_338; // @[Xbar.scala 250:63]
  wire  _T_339; // @[Xbar.scala 250:63]
  wire  _T_342; // @[Xbar.scala 255:50]
  wire  _T_344; // @[Xbar.scala 256:60]
  wire  _T_347; // @[Xbar.scala 256:60]
  wire  _T_348; // @[Xbar.scala 256:57]
  wire  _T_351; // @[Xbar.scala 256:11]
  wire  _T_352; // @[Xbar.scala 256:11]
  wire  _T_353; // @[Xbar.scala 258:13]
  wire  _T_355; // @[Xbar.scala 258:23]
  wire  _T_357; // @[Xbar.scala 258:12]
  wire  _T_358; // @[Xbar.scala 258:12]
  wire  _T_361_0; // @[Xbar.scala 262:23]
  wire  _T_361_1; // @[Xbar.scala 262:23]
  wire  _GEN_16; // @[Xbar.scala 266:21]
  wire  _GEN_17; // @[Xbar.scala 267:24]
  wire  _T_363_0; // @[Xbar.scala 270:24]
  wire  _T_363_1; // @[Xbar.scala 270:24]
  wire [2:0] _T_371; // @[Mux.scala 27:72]
  wire [2:0] _T_372; // @[Mux.scala 27:72]
  wire [2:0] _T_373; // @[Mux.scala 27:72]
  wire [2:0] _T_374; // @[Mux.scala 27:72]
  wire [2:0] _T_375; // @[Mux.scala 27:72]
  QueueCompatibility awIn_0 ( // @[Xbar.scala 55:47]
    .clock(awIn_0_clock),
    .reset(awIn_0_reset),
    .io_enq_ready(awIn_0_io_enq_ready),
    .io_enq_valid(awIn_0_io_enq_valid),
    .io_enq_bits(awIn_0_io_enq_bits),
    .io_deq_ready(awIn_0_io_deq_ready),
    .io_deq_valid(awIn_0_io_deq_valid),
    .io_deq_bits(awIn_0_io_deq_bits)
  );
  assign _T_1 = {1'b0,$signed(auto_in_ar_bits_addr)}; // @[Parameters.scala 137:49]
  assign _T_3 = $signed(_T_1) & 31'sh100; // @[Parameters.scala 137:52]
  assign requestARIO_0_0 = $signed(_T_3) == 31'sh0; // @[Parameters.scala 137:67]
  assign _T_5 = auto_in_ar_bits_addr ^ 30'h100; // @[Parameters.scala 137:31]
  assign _T_6 = {1'b0,$signed(_T_5)}; // @[Parameters.scala 137:49]
  assign _T_8 = $signed(_T_6) & 31'sh100; // @[Parameters.scala 137:52]
  assign requestARIO_0_1 = $signed(_T_8) == 31'sh0; // @[Parameters.scala 137:67]
  assign _T_11 = {1'b0,$signed(auto_in_aw_bits_addr)}; // @[Parameters.scala 137:49]
  assign _T_13 = $signed(_T_11) & 31'sh100; // @[Parameters.scala 137:52]
  assign requestAWIO_0_0 = $signed(_T_13) == 31'sh0; // @[Parameters.scala 137:67]
  assign _T_15 = auto_in_aw_bits_addr ^ 30'h100; // @[Parameters.scala 137:31]
  assign _T_16 = {1'b0,$signed(_T_15)}; // @[Parameters.scala 137:49]
  assign _T_18 = $signed(_T_16) & 31'sh100; // @[Parameters.scala 137:52]
  assign requestAWIO_0_1 = $signed(_T_18) == 31'sh0; // @[Parameters.scala 137:67]
  assign requestROI_0_0 = ~auto_out_0_r_bits_id; // @[Parameters.scala 47:9]
  assign requestROI_1_0 = ~auto_out_1_r_bits_id; // @[Parameters.scala 47:9]
  assign requestBOI_0_0 = ~auto_out_0_b_bits_id; // @[Parameters.scala 47:9]
  assign requestBOI_1_0 = ~auto_out_1_b_bits_id; // @[Parameters.scala 47:9]
  assign _T_20 = {requestAWIO_0_1,requestAWIO_0_0}; // @[Xbar.scala 64:75]
  assign requestWIO_0_0 = awIn_0_io_deq_bits[0]; // @[Xbar.scala 65:73]
  assign requestWIO_0_1 = awIn_0_io_deq_bits[1]; // @[Xbar.scala 65:73]
  assign _T_27 = {requestARIO_0_1,requestARIO_0_0}; // @[Xbar.scala 93:45]
  assign _T_108 = requestARIO_0_0 & auto_out_0_ar_ready; // @[Mux.scala 27:72]
  assign _T_109 = requestARIO_0_1 & auto_out_1_ar_ready; // @[Mux.scala 27:72]
  assign in_0_ar_ready = _T_108 | _T_109; // @[Mux.scala 27:72]
  assign _T_55 = _T_36 == 3'h0; // @[Xbar.scala 112:22]
  assign _T_54 = _T_37 == _T_27[1]; // @[Xbar.scala 111:75]
  assign _T_56 = _T_55 | _T_54; // @[Xbar.scala 112:34]
  assign _T_57 = _T_36 != 3'h7; // @[Xbar.scala 112:80]
  assign _T_59 = _T_56 & _T_57; // @[Xbar.scala 112:48]
  assign io_in_0_ar_ready = in_0_ar_ready & _T_59; // @[Xbar.scala 130:45]
  assign _T_31 = io_in_0_ar_ready & auto_in_ar_valid; // @[Decoupled.scala 40:37]
  assign _T_127 = auto_out_0_r_valid & requestROI_0_0; // @[Xbar.scala 222:40]
  assign _T_129 = auto_out_1_r_valid & requestROI_1_0; // @[Xbar.scala 222:40]
  assign _T_223 = _T_127 | _T_129; // @[Xbar.scala 246:36]
  assign _T_284 = _T_278_0 & _T_127; // @[Mux.scala 27:72]
  assign _T_285 = _T_278_1 & _T_129; // @[Mux.scala 27:72]
  assign _T_286 = _T_284 | _T_285; // @[Mux.scala 27:72]
  assign in_0_r_valid = _T_222 ? _T_223 : _T_286; // @[Xbar.scala 278:22]
  assign _T_33 = auto_in_r_ready & in_0_r_valid; // @[Decoupled.scala 40:37]
  assign _T_224 = {_T_129,_T_127}; // @[Cat.scala 29:58]
  assign _T_232 = ~_T_231; // @[Arbiter.scala 21:30]
  assign _T_233 = _T_224 & _T_232; // @[Arbiter.scala 21:28]
  assign _T_234 = {_T_233,_T_129,_T_127}; // @[Cat.scala 29:58]
  assign _GEN_18 = {{1'd0}, _T_234[3:1]}; // @[package.scala 208:43]
  assign _T_236 = _T_234 | _GEN_18; // @[package.scala 208:43]
  assign _T_239 = {_T_231, 2'h0}; // @[Arbiter.scala 22:66]
  assign _GEN_19 = {{1'd0}, _T_236[3:1]}; // @[Arbiter.scala 22:58]
  assign _T_240 = _GEN_19 | _T_239; // @[Arbiter.scala 22:58]
  assign _T_243 = _T_240[3:2] & _T_240[1:0]; // @[Arbiter.scala 23:39]
  assign _T_244 = ~_T_243; // @[Arbiter.scala 23:18]
  assign _T_256 = _T_244[0] & _T_127; // @[Xbar.scala 250:63]
  assign _T_279_0 = _T_222 ? _T_256 : _T_278_0; // @[Xbar.scala 262:23]
  assign _T_291 = {auto_out_0_r_bits_id,auto_out_0_r_bits_data,3'h1}; // @[Mux.scala 27:72]
  assign _T_292 = _T_279_0 ? _T_291 : 36'h0; // @[Mux.scala 27:72]
  assign _T_257 = _T_244[1] & _T_129; // @[Xbar.scala 250:63]
  assign _T_279_1 = _T_222 ? _T_257 : _T_278_1; // @[Xbar.scala 262:23]
  assign _T_295 = {auto_out_1_r_bits_id,auto_out_1_r_bits_data,3'h1}; // @[Mux.scala 27:72]
  assign _T_296 = _T_279_1 ? _T_295 : 36'h0; // @[Mux.scala 27:72]
  assign _T_297 = _T_292 | _T_296; // @[Mux.scala 27:72]
  assign in_0_r_bits_last = _T_297[0]; // @[Mux.scala 27:72]
  assign _T_35 = _T_33 & in_0_r_bits_last; // @[Xbar.scala 120:45]
  assign _GEN_20 = {{2'd0}, _T_31}; // @[Xbar.scala 106:30]
  assign _T_39 = _T_36 + _GEN_20; // @[Xbar.scala 106:30]
  assign _GEN_21 = {{2'd0}, _T_35}; // @[Xbar.scala 106:48]
  assign _T_41 = _T_39 - _GEN_21; // @[Xbar.scala 106:48]
  assign _T_42 = ~_T_35; // @[Xbar.scala 107:23]
  assign _T_43 = _T_36 != 3'h0; // @[Xbar.scala 107:43]
  assign _T_44 = _T_42 | _T_43; // @[Xbar.scala 107:34]
  assign _T_46 = _T_44 | reset; // @[Xbar.scala 107:22]
  assign _T_47 = ~_T_46; // @[Xbar.scala 107:22]
  assign _T_48 = ~_T_31; // @[Xbar.scala 108:23]
  assign _T_50 = _T_48 | _T_57; // @[Xbar.scala 108:34]
  assign _T_52 = _T_50 | reset; // @[Xbar.scala 108:22]
  assign _T_53 = ~_T_52; // @[Xbar.scala 108:22]
  assign _T_115 = requestAWIO_0_0 & auto_out_0_aw_ready; // @[Mux.scala 27:72]
  assign _T_116 = requestAWIO_0_1 & auto_out_1_aw_ready; // @[Mux.scala 27:72]
  assign in_0_aw_ready = _T_115 | _T_116; // @[Mux.scala 27:72]
  assign _T_94 = _T_90 | awIn_0_io_enq_ready; // @[Xbar.scala 139:57]
  assign _T_95 = in_0_aw_ready & _T_94; // @[Xbar.scala 139:45]
  assign _T_83 = _T_64 == 3'h0; // @[Xbar.scala 112:22]
  assign _T_82 = _T_65 == _T_20[1]; // @[Xbar.scala 111:75]
  assign _T_84 = _T_83 | _T_82; // @[Xbar.scala 112:34]
  assign _T_85 = _T_64 != 3'h7; // @[Xbar.scala 112:80]
  assign _T_87 = _T_84 & _T_85; // @[Xbar.scala 112:48]
  assign io_in_0_aw_ready = _T_95 & _T_87; // @[Xbar.scala 139:82]
  assign _T_60 = io_in_0_aw_ready & auto_in_aw_valid; // @[Decoupled.scala 40:37]
  assign _T_131 = auto_out_0_b_valid & requestBOI_0_0; // @[Xbar.scala 222:40]
  assign _T_133 = auto_out_1_b_valid & requestBOI_1_0; // @[Xbar.scala 222:40]
  assign _T_305 = _T_131 | _T_133; // @[Xbar.scala 246:36]
  assign _T_366 = _T_360_0 & _T_131; // @[Mux.scala 27:72]
  assign _T_367 = _T_360_1 & _T_133; // @[Mux.scala 27:72]
  assign _T_368 = _T_366 | _T_367; // @[Mux.scala 27:72]
  assign in_0_b_valid = _T_304 ? _T_305 : _T_368; // @[Xbar.scala 278:22]
  assign _T_62 = auto_in_b_ready & in_0_b_valid; // @[Decoupled.scala 40:37]
  assign _GEN_22 = {{2'd0}, _T_60}; // @[Xbar.scala 106:30]
  assign _T_67 = _T_64 + _GEN_22; // @[Xbar.scala 106:30]
  assign _GEN_23 = {{2'd0}, _T_62}; // @[Xbar.scala 106:48]
  assign _T_69 = _T_67 - _GEN_23; // @[Xbar.scala 106:48]
  assign _T_70 = ~_T_62; // @[Xbar.scala 107:23]
  assign _T_71 = _T_64 != 3'h0; // @[Xbar.scala 107:43]
  assign _T_72 = _T_70 | _T_71; // @[Xbar.scala 107:34]
  assign _T_74 = _T_72 | reset; // @[Xbar.scala 107:22]
  assign _T_75 = ~_T_74; // @[Xbar.scala 107:22]
  assign _T_76 = ~_T_60; // @[Xbar.scala 108:23]
  assign _T_78 = _T_76 | _T_85; // @[Xbar.scala 108:34]
  assign _T_80 = _T_78 | reset; // @[Xbar.scala 108:22]
  assign _T_81 = ~_T_80; // @[Xbar.scala 108:22]
  assign in_0_ar_valid = auto_in_ar_valid & _T_59; // @[Xbar.scala 129:45]
  assign _T_92 = auto_in_aw_valid & _T_94; // @[Xbar.scala 138:45]
  assign in_0_aw_valid = _T_92 & _T_87; // @[Xbar.scala 138:82]
  assign _T_97 = ~_T_90; // @[Xbar.scala 140:54]
  assign _T_99 = awIn_0_io_enq_ready & awIn_0_io_enq_valid; // @[Decoupled.scala 40:37]
  assign _GEN_2 = _T_99 | _T_90; // @[Xbar.scala 141:38]
  assign _T_100 = in_0_aw_ready & in_0_aw_valid; // @[Decoupled.scala 40:37]
  assign in_0_w_valid = auto_in_w_valid & awIn_0_io_deq_valid; // @[Xbar.scala 145:43]
  assign _T_122 = requestWIO_0_0 & auto_out_0_w_ready; // @[Mux.scala 27:72]
  assign _T_123 = requestWIO_0_1 & auto_out_1_w_ready; // @[Mux.scala 27:72]
  assign in_0_w_ready = _T_122 | _T_123; // @[Mux.scala 27:72]
  assign _T_103 = auto_in_w_valid & auto_in_w_bits_last; // @[Xbar.scala 147:50]
  assign out_0_ar_valid = in_0_ar_valid & requestARIO_0_0; // @[Xbar.scala 222:40]
  assign out_1_ar_valid = in_0_ar_valid & requestARIO_0_1; // @[Xbar.scala 222:40]
  assign out_0_aw_valid = in_0_aw_valid & requestAWIO_0_0; // @[Xbar.scala 222:40]
  assign out_1_aw_valid = in_0_aw_valid & requestAWIO_0_1; // @[Xbar.scala 222:40]
  assign _T_140 = ~out_0_aw_valid; // @[Xbar.scala 256:60]
  assign _T_146 = _T_140 | out_0_aw_valid; // @[Xbar.scala 258:23]
  assign _T_148 = _T_146 | reset; // @[Xbar.scala 258:12]
  assign _T_149 = ~_T_148; // @[Xbar.scala 258:12]
  assign _T_161 = ~out_0_ar_valid; // @[Xbar.scala 256:60]
  assign _T_167 = _T_161 | out_0_ar_valid; // @[Xbar.scala 258:23]
  assign _T_169 = _T_167 | reset; // @[Xbar.scala 258:12]
  assign _T_170 = ~_T_169; // @[Xbar.scala 258:12]
  assign _T_184 = ~out_1_aw_valid; // @[Xbar.scala 256:60]
  assign _T_190 = _T_184 | out_1_aw_valid; // @[Xbar.scala 258:23]
  assign _T_192 = _T_190 | reset; // @[Xbar.scala 258:12]
  assign _T_193 = ~_T_192; // @[Xbar.scala 258:12]
  assign _T_205 = ~out_1_ar_valid; // @[Xbar.scala 256:60]
  assign _T_211 = _T_205 | out_1_ar_valid; // @[Xbar.scala 258:23]
  assign _T_213 = _T_211 | reset; // @[Xbar.scala 258:12]
  assign _T_214 = ~_T_213; // @[Xbar.scala 258:12]
  assign _T_245 = _T_224 != 2'h0; // @[Arbiter.scala 24:27]
  assign _T_246 = _T_222 & _T_245; // @[Arbiter.scala 24:18]
  assign _T_247 = _T_244 & _T_224; // @[Arbiter.scala 25:29]
  assign _T_248 = {_T_247, 1'h0}; // @[package.scala 199:48]
  assign _T_250 = _T_247 | _T_248[1:0]; // @[package.scala 199:43]
  assign _T_260 = _T_256 | _T_257; // @[Xbar.scala 255:50]
  assign _T_262 = ~_T_256; // @[Xbar.scala 256:60]
  assign _T_265 = ~_T_257; // @[Xbar.scala 256:60]
  assign _T_266 = _T_262 | _T_265; // @[Xbar.scala 256:57]
  assign _T_269 = _T_266 | reset; // @[Xbar.scala 256:11]
  assign _T_270 = ~_T_269; // @[Xbar.scala 256:11]
  assign _T_271 = ~_T_223; // @[Xbar.scala 258:13]
  assign _T_273 = _T_271 | _T_260; // @[Xbar.scala 258:23]
  assign _T_275 = _T_273 | reset; // @[Xbar.scala 258:12]
  assign _T_276 = ~_T_275; // @[Xbar.scala 258:12]
  assign _GEN_13 = _T_223 ? 1'h0 : _T_222; // @[Xbar.scala 266:21]
  assign _GEN_14 = _T_33 | _GEN_13; // @[Xbar.scala 267:24]
  assign _T_281_0 = _T_222 ? _T_244[0] : _T_278_0; // @[Xbar.scala 270:24]
  assign _T_281_1 = _T_222 ? _T_244[1] : _T_278_1; // @[Xbar.scala 270:24]
  assign _T_306 = {_T_133,_T_131}; // @[Cat.scala 29:58]
  assign _T_314 = ~_T_313; // @[Arbiter.scala 21:30]
  assign _T_315 = _T_306 & _T_314; // @[Arbiter.scala 21:28]
  assign _T_316 = {_T_315,_T_133,_T_131}; // @[Cat.scala 29:58]
  assign _GEN_24 = {{1'd0}, _T_316[3:1]}; // @[package.scala 208:43]
  assign _T_318 = _T_316 | _GEN_24; // @[package.scala 208:43]
  assign _T_321 = {_T_313, 2'h0}; // @[Arbiter.scala 22:66]
  assign _GEN_25 = {{1'd0}, _T_318[3:1]}; // @[Arbiter.scala 22:58]
  assign _T_322 = _GEN_25 | _T_321; // @[Arbiter.scala 22:58]
  assign _T_325 = _T_322[3:2] & _T_322[1:0]; // @[Arbiter.scala 23:39]
  assign _T_326 = ~_T_325; // @[Arbiter.scala 23:18]
  assign _T_327 = _T_306 != 2'h0; // @[Arbiter.scala 24:27]
  assign _T_328 = _T_304 & _T_327; // @[Arbiter.scala 24:18]
  assign _T_329 = _T_326 & _T_306; // @[Arbiter.scala 25:29]
  assign _T_330 = {_T_329, 1'h0}; // @[package.scala 199:48]
  assign _T_332 = _T_329 | _T_330[1:0]; // @[package.scala 199:43]
  assign _T_338 = _T_326[0] & _T_131; // @[Xbar.scala 250:63]
  assign _T_339 = _T_326[1] & _T_133; // @[Xbar.scala 250:63]
  assign _T_342 = _T_338 | _T_339; // @[Xbar.scala 255:50]
  assign _T_344 = ~_T_338; // @[Xbar.scala 256:60]
  assign _T_347 = ~_T_339; // @[Xbar.scala 256:60]
  assign _T_348 = _T_344 | _T_347; // @[Xbar.scala 256:57]
  assign _T_351 = _T_348 | reset; // @[Xbar.scala 256:11]
  assign _T_352 = ~_T_351; // @[Xbar.scala 256:11]
  assign _T_353 = ~_T_305; // @[Xbar.scala 258:13]
  assign _T_355 = _T_353 | _T_342; // @[Xbar.scala 258:23]
  assign _T_357 = _T_355 | reset; // @[Xbar.scala 258:12]
  assign _T_358 = ~_T_357; // @[Xbar.scala 258:12]
  assign _T_361_0 = _T_304 ? _T_338 : _T_360_0; // @[Xbar.scala 262:23]
  assign _T_361_1 = _T_304 ? _T_339 : _T_360_1; // @[Xbar.scala 262:23]
  assign _GEN_16 = _T_305 ? 1'h0 : _T_304; // @[Xbar.scala 266:21]
  assign _GEN_17 = _T_62 | _GEN_16; // @[Xbar.scala 267:24]
  assign _T_363_0 = _T_304 ? _T_326[0] : _T_360_0; // @[Xbar.scala 270:24]
  assign _T_363_1 = _T_304 ? _T_326[1] : _T_360_1; // @[Xbar.scala 270:24]
  assign _T_371 = {auto_out_0_b_bits_id,2'h0}; // @[Mux.scala 27:72]
  assign _T_372 = _T_361_0 ? _T_371 : 3'h0; // @[Mux.scala 27:72]
  assign _T_373 = {auto_out_1_b_bits_id,2'h0}; // @[Mux.scala 27:72]
  assign _T_374 = _T_361_1 ? _T_373 : 3'h0; // @[Mux.scala 27:72]
  assign _T_375 = _T_372 | _T_374; // @[Mux.scala 27:72]
  assign auto_in_aw_ready = _T_95 & _T_87; // @[LazyModule.scala 173:31]
  assign auto_in_w_ready = in_0_w_ready & awIn_0_io_deq_valid; // @[LazyModule.scala 173:31]
  assign auto_in_b_valid = _T_304 ? _T_305 : _T_368; // @[LazyModule.scala 173:31]
  assign auto_in_b_bits_resp = _T_375[1:0]; // @[LazyModule.scala 173:31]
  assign auto_in_ar_ready = in_0_ar_ready & _T_59; // @[LazyModule.scala 173:31]
  assign auto_in_r_valid = _T_222 ? _T_223 : _T_286; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_data = _T_297[34:3]; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_resp = _T_297[2:1]; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_last = _T_297[0]; // @[LazyModule.scala 173:31]
  assign auto_out_1_aw_valid = in_0_aw_valid & requestAWIO_0_1; // @[LazyModule.scala 173:49]
  assign auto_out_1_aw_bits_id = auto_in_aw_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_1_aw_bits_addr = auto_in_aw_bits_addr; // @[LazyModule.scala 173:49]
  assign auto_out_1_w_valid = in_0_w_valid & requestWIO_0_1; // @[LazyModule.scala 173:49]
  assign auto_out_1_w_bits_data = auto_in_w_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_1_w_bits_strb = auto_in_w_bits_strb; // @[LazyModule.scala 173:49]
  assign auto_out_1_b_ready = auto_in_b_ready & _T_363_1; // @[LazyModule.scala 173:49]
  assign auto_out_1_ar_valid = in_0_ar_valid & requestARIO_0_1; // @[LazyModule.scala 173:49]
  assign auto_out_1_ar_bits_id = auto_in_ar_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_1_ar_bits_addr = auto_in_ar_bits_addr; // @[LazyModule.scala 173:49]
  assign auto_out_1_ar_bits_size = auto_in_ar_bits_size; // @[LazyModule.scala 173:49]
  assign auto_out_1_r_ready = auto_in_r_ready & _T_281_1; // @[LazyModule.scala 173:49]
  assign auto_out_0_aw_valid = in_0_aw_valid & requestAWIO_0_0; // @[LazyModule.scala 173:49]
  assign auto_out_0_aw_bits_id = auto_in_aw_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_0_aw_bits_addr = auto_in_aw_bits_addr; // @[LazyModule.scala 173:49]
  assign auto_out_0_w_valid = in_0_w_valid & requestWIO_0_0; // @[LazyModule.scala 173:49]
  assign auto_out_0_b_ready = auto_in_b_ready & _T_363_0; // @[LazyModule.scala 173:49]
  assign auto_out_0_ar_valid = in_0_ar_valid & requestARIO_0_0; // @[LazyModule.scala 173:49]
  assign auto_out_0_ar_bits_id = auto_in_ar_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_0_ar_bits_addr = auto_in_ar_bits_addr; // @[LazyModule.scala 173:49]
  assign auto_out_0_r_ready = auto_in_r_ready & _T_281_0; // @[LazyModule.scala 173:49]
  assign awIn_0_clock = clock;
  assign awIn_0_reset = reset;
  assign awIn_0_io_enq_valid = auto_in_aw_valid & _T_97; // @[Xbar.scala 140:30]
  assign awIn_0_io_enq_bits = {requestAWIO_0_1,requestAWIO_0_0}; // @[Xbar.scala 64:57]
  assign awIn_0_io_deq_ready = _T_103 & in_0_w_ready; // @[Xbar.scala 147:30]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_36 = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_37 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_222 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_278_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_278_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_231 = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_90 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_64 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_65 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_304 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_360_0 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_360_1 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_313 = _RAND_12[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      _T_36 <= 3'h0;
    end else begin
      _T_36 <= _T_41;
    end
    if (_T_31) begin
      _T_37 <= _T_27[1];
    end
    _T_222 <= reset | _GEN_14;
    if (reset) begin
      _T_278_0 <= 1'h0;
    end else if (_T_222) begin
      _T_278_0 <= _T_256;
    end
    if (reset) begin
      _T_278_1 <= 1'h0;
    end else if (_T_222) begin
      _T_278_1 <= _T_257;
    end
    if (reset) begin
      _T_231 <= 2'h3;
    end else if (_T_246) begin
      _T_231 <= _T_250;
    end
    if (reset) begin
      _T_90 <= 1'h0;
    end else if (_T_100) begin
      _T_90 <= 1'h0;
    end else begin
      _T_90 <= _GEN_2;
    end
    if (reset) begin
      _T_64 <= 3'h0;
    end else begin
      _T_64 <= _T_69;
    end
    if (_T_60) begin
      _T_65 <= _T_20[1];
    end
    _T_304 <= reset | _GEN_17;
    if (reset) begin
      _T_360_0 <= 1'h0;
    end else if (_T_304) begin
      _T_360_0 <= _T_338;
    end
    if (reset) begin
      _T_360_1 <= 1'h0;
    end else if (_T_304) begin
      _T_360_1 <= _T_339;
    end
    if (reset) begin
      _T_313 <= 2'h3;
    end else if (_T_328) begin
      _T_313 <= _T_332;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_47) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:107 assert (!resp_fire || count =/= UInt(0))\n"); // @[Xbar.scala 107:22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_47) begin
          $fatal; // @[Xbar.scala 107:22]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_53) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:108 assert (!req_fire  || count =/= UInt(flight))\n"); // @[Xbar.scala 108:22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_53) begin
          $fatal; // @[Xbar.scala 108:22]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_75) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:107 assert (!resp_fire || count =/= UInt(0))\n"); // @[Xbar.scala 107:22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_75) begin
          $fatal; // @[Xbar.scala 107:22]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_81) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:108 assert (!req_fire  || count =/= UInt(flight))\n"); // @[Xbar.scala 108:22]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_81) begin
          $fatal; // @[Xbar.scala 108:22]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_149) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_149) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_170) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_170) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_193) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_193) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_214) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_214) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_270) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:256 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"); // @[Xbar.scala 256:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_270) begin
          $fatal; // @[Xbar.scala 256:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_276) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_276) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_352) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:256 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"); // @[Xbar.scala 256:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_352) begin
          $fatal; // @[Xbar.scala 256:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_358) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Xbar.scala:258 assert (!anyValid || winner.reduce(_||_))\n"); // @[Xbar.scala 258:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_358) begin
          $fatal; // @[Xbar.scala 258:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module BundleBridgeToAXI4(
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [31:0] auto_in_w_bits_data,
  input  [3:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [2:0]  auto_in_ar_bits_size,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [31:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output        auto_out_aw_bits_id,
  output [29:0] auto_out_aw_bits_addr,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [31:0] auto_out_w_bits_data,
  output [3:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output        auto_out_ar_bits_id,
  output [29:0] auto_out_ar_bits_addr,
  output [2:0]  auto_out_ar_bits_size,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [31:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_last
);
  assign auto_in_aw_ready = auto_out_aw_ready; // @[LazyModule.scala 173:31]
  assign auto_in_w_ready = auto_out_w_ready; // @[LazyModule.scala 173:31]
  assign auto_in_b_valid = auto_out_b_valid; // @[LazyModule.scala 173:31]
  assign auto_in_b_bits_resp = auto_out_b_bits_resp; // @[LazyModule.scala 173:31]
  assign auto_in_ar_ready = auto_out_ar_ready; // @[LazyModule.scala 173:31]
  assign auto_in_r_valid = auto_out_r_valid; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_data = auto_out_r_bits_data; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; // @[LazyModule.scala 173:31]
  assign auto_in_r_bits_last = auto_out_r_bits_last; // @[LazyModule.scala 173:31]
  assign auto_out_aw_valid = auto_in_aw_valid; // @[LazyModule.scala 173:49]
  assign auto_out_aw_bits_id = auto_in_aw_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_aw_bits_addr = auto_in_aw_bits_addr[29:0]; // @[LazyModule.scala 173:49]
  assign auto_out_w_valid = auto_in_w_valid; // @[LazyModule.scala 173:49]
  assign auto_out_w_bits_data = auto_in_w_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_w_bits_strb = auto_in_w_bits_strb; // @[LazyModule.scala 173:49]
  assign auto_out_w_bits_last = auto_in_w_bits_last; // @[LazyModule.scala 173:49]
  assign auto_out_b_ready = auto_in_b_ready; // @[LazyModule.scala 173:49]
  assign auto_out_ar_valid = auto_in_ar_valid; // @[LazyModule.scala 173:49]
  assign auto_out_ar_bits_id = auto_in_ar_bits_id; // @[LazyModule.scala 173:49]
  assign auto_out_ar_bits_addr = auto_in_ar_bits_addr[29:0]; // @[LazyModule.scala 173:49]
  assign auto_out_ar_bits_size = auto_in_ar_bits_size; // @[LazyModule.scala 173:49]
  assign auto_out_r_ready = auto_in_r_ready; // @[LazyModule.scala 173:49]
endmodule
module AXI4StreamToBundleBridge(
  output        auto_in_ready,
  input         auto_in_valid,
  input  [15:0] auto_in_bits_data,
  input         auto_in_bits_last,
  input         auto_out_ready,
  output        auto_out_valid,
  output [15:0] auto_out_bits_data,
  output        auto_out_bits_last
);
  assign auto_in_ready = auto_out_ready; // @[LazyModule.scala 173:31]
  assign auto_out_valid = auto_in_valid; // @[LazyModule.scala 173:49]
  assign auto_out_bits_data = auto_in_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_bits_last = auto_in_bits_last; // @[LazyModule.scala 173:49]
endmodule
module BundleBridgeToAXI4Stream(
  output       auto_in_ready,
  input        auto_in_valid,
  input  [7:0] auto_in_bits_data,
  input        auto_in_bits_last,
  input        auto_out_ready,
  output       auto_out_valid,
  output [7:0] auto_out_bits_data,
  output       auto_out_bits_last
);
  assign auto_in_ready = auto_out_ready; // @[LazyModule.scala 173:31]
  assign auto_out_valid = auto_in_valid; // @[LazyModule.scala 173:49]
  assign auto_out_bits_data = auto_in_bits_data; // @[LazyModule.scala 173:49]
  assign auto_out_bits_last = auto_in_bits_last; // @[LazyModule.scala 173:49]
endmodule
module AXI4HyperSpace(
  input         clock,
  input         reset,
  output        ioMem_0_aw_ready,
  input         ioMem_0_aw_valid,
  input         ioMem_0_aw_bits_id,
  input  [31:0] ioMem_0_aw_bits_addr,
  input  [7:0]  ioMem_0_aw_bits_len,
  input  [2:0]  ioMem_0_aw_bits_size,
  input  [1:0]  ioMem_0_aw_bits_burst,
  input         ioMem_0_aw_bits_lock,
  input  [3:0]  ioMem_0_aw_bits_cache,
  input  [2:0]  ioMem_0_aw_bits_prot,
  input  [3:0]  ioMem_0_aw_bits_qos,
  output        ioMem_0_w_ready,
  input         ioMem_0_w_valid,
  input  [31:0] ioMem_0_w_bits_data,
  input  [3:0]  ioMem_0_w_bits_strb,
  input         ioMem_0_w_bits_last,
  input         ioMem_0_b_ready,
  output        ioMem_0_b_valid,
  output        ioMem_0_b_bits_id,
  output [1:0]  ioMem_0_b_bits_resp,
  output        ioMem_0_ar_ready,
  input         ioMem_0_ar_valid,
  input         ioMem_0_ar_bits_id,
  input  [31:0] ioMem_0_ar_bits_addr,
  input  [7:0]  ioMem_0_ar_bits_len,
  input  [2:0]  ioMem_0_ar_bits_size,
  input  [1:0]  ioMem_0_ar_bits_burst,
  input         ioMem_0_ar_bits_lock,
  input  [3:0]  ioMem_0_ar_bits_cache,
  input  [2:0]  ioMem_0_ar_bits_prot,
  input  [3:0]  ioMem_0_ar_bits_qos,
  input         ioMem_0_r_ready,
  output        ioMem_0_r_valid,
  output        ioMem_0_r_bits_id,
  output [31:0] ioMem_0_r_bits_data,
  output [1:0]  ioMem_0_r_bits_resp,
  output        ioMem_0_r_bits_last,
  output        in_0_ready,
  input         in_0_valid,
  input  [7:0]  in_0_bits_data,
  input         in_0_bits_last,
  input         out_0_ready,
  output        out_0_valid,
  output [15:0] out_0_bits_data,
  output        out_0_bits_last
);
  wire  widthAdapter_clock; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_reset; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_in_ready; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_in_valid; // @[WidthAdapter.scala 83:34]
  wire [7:0] widthAdapter_auto_in_bits_data; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_in_bits_last; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_out_ready; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_out_valid; // @[WidthAdapter.scala 83:34]
  wire [31:0] widthAdapter_auto_out_bits_data; // @[WidthAdapter.scala 83:34]
  wire  widthAdapter_auto_out_bits_last; // @[WidthAdapter.scala 83:34]
  wire  fft_clock; // @[HyperSpace.scala 62:76]
  wire  fft_reset; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_aw_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_aw_valid; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_aw_bits_id; // @[HyperSpace.scala 62:76]
  wire [29:0] fft_auto_mem_in_aw_bits_addr; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_w_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_w_valid; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_b_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_b_valid; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_b_bits_id; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_ar_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_ar_valid; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_ar_bits_id; // @[HyperSpace.scala 62:76]
  wire [29:0] fft_auto_mem_in_ar_bits_addr; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_r_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_r_valid; // @[HyperSpace.scala 62:76]
  wire  fft_auto_mem_in_r_bits_id; // @[HyperSpace.scala 62:76]
  wire [31:0] fft_auto_mem_in_r_bits_data; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_in_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_in_valid; // @[HyperSpace.scala 62:76]
  wire [31:0] fft_auto_stream_in_bits_data; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_in_bits_last; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_out_ready; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_out_valid; // @[HyperSpace.scala 62:76]
  wire [31:0] fft_auto_stream_out_bits_data; // @[HyperSpace.scala 62:76]
  wire  fft_auto_stream_out_bits_last; // @[HyperSpace.scala 62:76]
  wire  mag_clock; // @[HyperSpace.scala 63:76]
  wire  mag_reset; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_aw_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_aw_valid; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_aw_bits_id; // @[HyperSpace.scala 63:76]
  wire [29:0] mag_auto_mem_in_aw_bits_addr; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_w_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_w_valid; // @[HyperSpace.scala 63:76]
  wire [31:0] mag_auto_mem_in_w_bits_data; // @[HyperSpace.scala 63:76]
  wire [3:0] mag_auto_mem_in_w_bits_strb; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_b_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_b_valid; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_b_bits_id; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_ar_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_ar_valid; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_ar_bits_id; // @[HyperSpace.scala 63:76]
  wire [29:0] mag_auto_mem_in_ar_bits_addr; // @[HyperSpace.scala 63:76]
  wire [2:0] mag_auto_mem_in_ar_bits_size; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_r_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_r_valid; // @[HyperSpace.scala 63:76]
  wire  mag_auto_mem_in_r_bits_id; // @[HyperSpace.scala 63:76]
  wire [31:0] mag_auto_mem_in_r_bits_data; // @[HyperSpace.scala 63:76]
  wire  mag_auto_master_out_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_master_out_valid; // @[HyperSpace.scala 63:76]
  wire [15:0] mag_auto_master_out_bits_data; // @[HyperSpace.scala 63:76]
  wire  mag_auto_master_out_bits_last; // @[HyperSpace.scala 63:76]
  wire  mag_auto_slave_in_ready; // @[HyperSpace.scala 63:76]
  wire  mag_auto_slave_in_valid; // @[HyperSpace.scala 63:76]
  wire [31:0] mag_auto_slave_in_bits_data; // @[HyperSpace.scala 63:76]
  wire  mag_auto_slave_in_bits_last; // @[HyperSpace.scala 63:76]
  wire  bus_clock; // @[HyperSpace.scala 49:58]
  wire  bus_reset; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_aw_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_aw_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_aw_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_in_aw_bits_addr; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_w_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_w_valid; // @[HyperSpace.scala 49:58]
  wire [31:0] bus_auto_in_w_bits_data; // @[HyperSpace.scala 49:58]
  wire [3:0] bus_auto_in_w_bits_strb; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_w_bits_last; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_b_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_b_valid; // @[HyperSpace.scala 49:58]
  wire [1:0] bus_auto_in_b_bits_resp; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_ar_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_ar_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_ar_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_in_ar_bits_addr; // @[HyperSpace.scala 49:58]
  wire [2:0] bus_auto_in_ar_bits_size; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_r_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_r_valid; // @[HyperSpace.scala 49:58]
  wire [31:0] bus_auto_in_r_bits_data; // @[HyperSpace.scala 49:58]
  wire [1:0] bus_auto_in_r_bits_resp; // @[HyperSpace.scala 49:58]
  wire  bus_auto_in_r_bits_last; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_aw_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_aw_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_aw_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_out_1_aw_bits_addr; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_w_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_w_valid; // @[HyperSpace.scala 49:58]
  wire [31:0] bus_auto_out_1_w_bits_data; // @[HyperSpace.scala 49:58]
  wire [3:0] bus_auto_out_1_w_bits_strb; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_b_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_b_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_b_bits_id; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_ar_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_ar_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_ar_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_out_1_ar_bits_addr; // @[HyperSpace.scala 49:58]
  wire [2:0] bus_auto_out_1_ar_bits_size; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_r_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_r_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_1_r_bits_id; // @[HyperSpace.scala 49:58]
  wire [31:0] bus_auto_out_1_r_bits_data; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_aw_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_aw_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_aw_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_out_0_aw_bits_addr; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_w_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_w_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_b_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_b_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_b_bits_id; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_ar_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_ar_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_ar_bits_id; // @[HyperSpace.scala 49:58]
  wire [29:0] bus_auto_out_0_ar_bits_addr; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_r_ready; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_r_valid; // @[HyperSpace.scala 49:58]
  wire  bus_auto_out_0_r_bits_id; // @[HyperSpace.scala 49:58]
  wire [31:0] bus_auto_out_0_r_bits_data; // @[HyperSpace.scala 49:58]
  wire  converter_auto_in_aw_ready; // @[Node.scala 65:31]
  wire  converter_auto_in_aw_valid; // @[Node.scala 65:31]
  wire  converter_auto_in_aw_bits_id; // @[Node.scala 65:31]
  wire [31:0] converter_auto_in_aw_bits_addr; // @[Node.scala 65:31]
  wire  converter_auto_in_w_ready; // @[Node.scala 65:31]
  wire  converter_auto_in_w_valid; // @[Node.scala 65:31]
  wire [31:0] converter_auto_in_w_bits_data; // @[Node.scala 65:31]
  wire [3:0] converter_auto_in_w_bits_strb; // @[Node.scala 65:31]
  wire  converter_auto_in_w_bits_last; // @[Node.scala 65:31]
  wire  converter_auto_in_b_ready; // @[Node.scala 65:31]
  wire  converter_auto_in_b_valid; // @[Node.scala 65:31]
  wire [1:0] converter_auto_in_b_bits_resp; // @[Node.scala 65:31]
  wire  converter_auto_in_ar_ready; // @[Node.scala 65:31]
  wire  converter_auto_in_ar_valid; // @[Node.scala 65:31]
  wire  converter_auto_in_ar_bits_id; // @[Node.scala 65:31]
  wire [31:0] converter_auto_in_ar_bits_addr; // @[Node.scala 65:31]
  wire [2:0] converter_auto_in_ar_bits_size; // @[Node.scala 65:31]
  wire  converter_auto_in_r_ready; // @[Node.scala 65:31]
  wire  converter_auto_in_r_valid; // @[Node.scala 65:31]
  wire [31:0] converter_auto_in_r_bits_data; // @[Node.scala 65:31]
  wire [1:0] converter_auto_in_r_bits_resp; // @[Node.scala 65:31]
  wire  converter_auto_in_r_bits_last; // @[Node.scala 65:31]
  wire  converter_auto_out_aw_ready; // @[Node.scala 65:31]
  wire  converter_auto_out_aw_valid; // @[Node.scala 65:31]
  wire  converter_auto_out_aw_bits_id; // @[Node.scala 65:31]
  wire [29:0] converter_auto_out_aw_bits_addr; // @[Node.scala 65:31]
  wire  converter_auto_out_w_ready; // @[Node.scala 65:31]
  wire  converter_auto_out_w_valid; // @[Node.scala 65:31]
  wire [31:0] converter_auto_out_w_bits_data; // @[Node.scala 65:31]
  wire [3:0] converter_auto_out_w_bits_strb; // @[Node.scala 65:31]
  wire  converter_auto_out_w_bits_last; // @[Node.scala 65:31]
  wire  converter_auto_out_b_ready; // @[Node.scala 65:31]
  wire  converter_auto_out_b_valid; // @[Node.scala 65:31]
  wire [1:0] converter_auto_out_b_bits_resp; // @[Node.scala 65:31]
  wire  converter_auto_out_ar_ready; // @[Node.scala 65:31]
  wire  converter_auto_out_ar_valid; // @[Node.scala 65:31]
  wire  converter_auto_out_ar_bits_id; // @[Node.scala 65:31]
  wire [29:0] converter_auto_out_ar_bits_addr; // @[Node.scala 65:31]
  wire [2:0] converter_auto_out_ar_bits_size; // @[Node.scala 65:31]
  wire  converter_auto_out_r_ready; // @[Node.scala 65:31]
  wire  converter_auto_out_r_valid; // @[Node.scala 65:31]
  wire [31:0] converter_auto_out_r_bits_data; // @[Node.scala 65:31]
  wire [1:0] converter_auto_out_r_bits_resp; // @[Node.scala 65:31]
  wire  converter_auto_out_r_bits_last; // @[Node.scala 65:31]
  wire  converter_1_auto_in_ready; // @[Nodes.scala 165:31]
  wire  converter_1_auto_in_valid; // @[Nodes.scala 165:31]
  wire [15:0] converter_1_auto_in_bits_data; // @[Nodes.scala 165:31]
  wire  converter_1_auto_in_bits_last; // @[Nodes.scala 165:31]
  wire  converter_1_auto_out_ready; // @[Nodes.scala 165:31]
  wire  converter_1_auto_out_valid; // @[Nodes.scala 165:31]
  wire [15:0] converter_1_auto_out_bits_data; // @[Nodes.scala 165:31]
  wire  converter_1_auto_out_bits_last; // @[Nodes.scala 165:31]
  wire  converter_2_auto_in_ready; // @[Nodes.scala 201:31]
  wire  converter_2_auto_in_valid; // @[Nodes.scala 201:31]
  wire [7:0] converter_2_auto_in_bits_data; // @[Nodes.scala 201:31]
  wire  converter_2_auto_in_bits_last; // @[Nodes.scala 201:31]
  wire  converter_2_auto_out_ready; // @[Nodes.scala 201:31]
  wire  converter_2_auto_out_valid; // @[Nodes.scala 201:31]
  wire [7:0] converter_2_auto_out_bits_data; // @[Nodes.scala 201:31]
  wire  converter_2_auto_out_bits_last; // @[Nodes.scala 201:31]
  AXI4StreamWidthAdapater_4_to_1 widthAdapter ( // @[WidthAdapter.scala 83:34]
    .clock(widthAdapter_clock),
    .reset(widthAdapter_reset),
    .auto_in_ready(widthAdapter_auto_in_ready),
    .auto_in_valid(widthAdapter_auto_in_valid),
    .auto_in_bits_data(widthAdapter_auto_in_bits_data),
    .auto_in_bits_last(widthAdapter_auto_in_bits_last),
    .auto_out_ready(widthAdapter_auto_out_ready),
    .auto_out_valid(widthAdapter_auto_out_valid),
    .auto_out_bits_data(widthAdapter_auto_out_bits_data),
    .auto_out_bits_last(widthAdapter_auto_out_bits_last)
  );
  AXI4FFTBlock fft ( // @[HyperSpace.scala 62:76]
    .clock(fft_clock),
    .reset(fft_reset),
    .auto_mem_in_aw_ready(fft_auto_mem_in_aw_ready),
    .auto_mem_in_aw_valid(fft_auto_mem_in_aw_valid),
    .auto_mem_in_aw_bits_id(fft_auto_mem_in_aw_bits_id),
    .auto_mem_in_aw_bits_addr(fft_auto_mem_in_aw_bits_addr),
    .auto_mem_in_w_ready(fft_auto_mem_in_w_ready),
    .auto_mem_in_w_valid(fft_auto_mem_in_w_valid),
    .auto_mem_in_b_ready(fft_auto_mem_in_b_ready),
    .auto_mem_in_b_valid(fft_auto_mem_in_b_valid),
    .auto_mem_in_b_bits_id(fft_auto_mem_in_b_bits_id),
    .auto_mem_in_ar_ready(fft_auto_mem_in_ar_ready),
    .auto_mem_in_ar_valid(fft_auto_mem_in_ar_valid),
    .auto_mem_in_ar_bits_id(fft_auto_mem_in_ar_bits_id),
    .auto_mem_in_ar_bits_addr(fft_auto_mem_in_ar_bits_addr),
    .auto_mem_in_r_ready(fft_auto_mem_in_r_ready),
    .auto_mem_in_r_valid(fft_auto_mem_in_r_valid),
    .auto_mem_in_r_bits_id(fft_auto_mem_in_r_bits_id),
    .auto_mem_in_r_bits_data(fft_auto_mem_in_r_bits_data),
    .auto_stream_in_ready(fft_auto_stream_in_ready),
    .auto_stream_in_valid(fft_auto_stream_in_valid),
    .auto_stream_in_bits_data(fft_auto_stream_in_bits_data),
    .auto_stream_in_bits_last(fft_auto_stream_in_bits_last),
    .auto_stream_out_ready(fft_auto_stream_out_ready),
    .auto_stream_out_valid(fft_auto_stream_out_valid),
    .auto_stream_out_bits_data(fft_auto_stream_out_bits_data),
    .auto_stream_out_bits_last(fft_auto_stream_out_bits_last)
  );
  AXI4LogMagMuxBlock mag ( // @[HyperSpace.scala 63:76]
    .clock(mag_clock),
    .reset(mag_reset),
    .auto_mem_in_aw_ready(mag_auto_mem_in_aw_ready),
    .auto_mem_in_aw_valid(mag_auto_mem_in_aw_valid),
    .auto_mem_in_aw_bits_id(mag_auto_mem_in_aw_bits_id),
    .auto_mem_in_aw_bits_addr(mag_auto_mem_in_aw_bits_addr),
    .auto_mem_in_w_ready(mag_auto_mem_in_w_ready),
    .auto_mem_in_w_valid(mag_auto_mem_in_w_valid),
    .auto_mem_in_w_bits_data(mag_auto_mem_in_w_bits_data),
    .auto_mem_in_w_bits_strb(mag_auto_mem_in_w_bits_strb),
    .auto_mem_in_b_ready(mag_auto_mem_in_b_ready),
    .auto_mem_in_b_valid(mag_auto_mem_in_b_valid),
    .auto_mem_in_b_bits_id(mag_auto_mem_in_b_bits_id),
    .auto_mem_in_ar_ready(mag_auto_mem_in_ar_ready),
    .auto_mem_in_ar_valid(mag_auto_mem_in_ar_valid),
    .auto_mem_in_ar_bits_id(mag_auto_mem_in_ar_bits_id),
    .auto_mem_in_ar_bits_addr(mag_auto_mem_in_ar_bits_addr),
    .auto_mem_in_ar_bits_size(mag_auto_mem_in_ar_bits_size),
    .auto_mem_in_r_ready(mag_auto_mem_in_r_ready),
    .auto_mem_in_r_valid(mag_auto_mem_in_r_valid),
    .auto_mem_in_r_bits_id(mag_auto_mem_in_r_bits_id),
    .auto_mem_in_r_bits_data(mag_auto_mem_in_r_bits_data),
    .auto_master_out_ready(mag_auto_master_out_ready),
    .auto_master_out_valid(mag_auto_master_out_valid),
    .auto_master_out_bits_data(mag_auto_master_out_bits_data),
    .auto_master_out_bits_last(mag_auto_master_out_bits_last),
    .auto_slave_in_ready(mag_auto_slave_in_ready),
    .auto_slave_in_valid(mag_auto_slave_in_valid),
    .auto_slave_in_bits_data(mag_auto_slave_in_bits_data),
    .auto_slave_in_bits_last(mag_auto_slave_in_bits_last)
  );
  AXI4Xbar bus ( // @[HyperSpace.scala 49:58]
    .clock(bus_clock),
    .reset(bus_reset),
    .auto_in_aw_ready(bus_auto_in_aw_ready),
    .auto_in_aw_valid(bus_auto_in_aw_valid),
    .auto_in_aw_bits_id(bus_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(bus_auto_in_aw_bits_addr),
    .auto_in_w_ready(bus_auto_in_w_ready),
    .auto_in_w_valid(bus_auto_in_w_valid),
    .auto_in_w_bits_data(bus_auto_in_w_bits_data),
    .auto_in_w_bits_strb(bus_auto_in_w_bits_strb),
    .auto_in_w_bits_last(bus_auto_in_w_bits_last),
    .auto_in_b_ready(bus_auto_in_b_ready),
    .auto_in_b_valid(bus_auto_in_b_valid),
    .auto_in_b_bits_resp(bus_auto_in_b_bits_resp),
    .auto_in_ar_ready(bus_auto_in_ar_ready),
    .auto_in_ar_valid(bus_auto_in_ar_valid),
    .auto_in_ar_bits_id(bus_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(bus_auto_in_ar_bits_addr),
    .auto_in_ar_bits_size(bus_auto_in_ar_bits_size),
    .auto_in_r_ready(bus_auto_in_r_ready),
    .auto_in_r_valid(bus_auto_in_r_valid),
    .auto_in_r_bits_data(bus_auto_in_r_bits_data),
    .auto_in_r_bits_resp(bus_auto_in_r_bits_resp),
    .auto_in_r_bits_last(bus_auto_in_r_bits_last),
    .auto_out_1_aw_ready(bus_auto_out_1_aw_ready),
    .auto_out_1_aw_valid(bus_auto_out_1_aw_valid),
    .auto_out_1_aw_bits_id(bus_auto_out_1_aw_bits_id),
    .auto_out_1_aw_bits_addr(bus_auto_out_1_aw_bits_addr),
    .auto_out_1_w_ready(bus_auto_out_1_w_ready),
    .auto_out_1_w_valid(bus_auto_out_1_w_valid),
    .auto_out_1_w_bits_data(bus_auto_out_1_w_bits_data),
    .auto_out_1_w_bits_strb(bus_auto_out_1_w_bits_strb),
    .auto_out_1_b_ready(bus_auto_out_1_b_ready),
    .auto_out_1_b_valid(bus_auto_out_1_b_valid),
    .auto_out_1_b_bits_id(bus_auto_out_1_b_bits_id),
    .auto_out_1_ar_ready(bus_auto_out_1_ar_ready),
    .auto_out_1_ar_valid(bus_auto_out_1_ar_valid),
    .auto_out_1_ar_bits_id(bus_auto_out_1_ar_bits_id),
    .auto_out_1_ar_bits_addr(bus_auto_out_1_ar_bits_addr),
    .auto_out_1_ar_bits_size(bus_auto_out_1_ar_bits_size),
    .auto_out_1_r_ready(bus_auto_out_1_r_ready),
    .auto_out_1_r_valid(bus_auto_out_1_r_valid),
    .auto_out_1_r_bits_id(bus_auto_out_1_r_bits_id),
    .auto_out_1_r_bits_data(bus_auto_out_1_r_bits_data),
    .auto_out_0_aw_ready(bus_auto_out_0_aw_ready),
    .auto_out_0_aw_valid(bus_auto_out_0_aw_valid),
    .auto_out_0_aw_bits_id(bus_auto_out_0_aw_bits_id),
    .auto_out_0_aw_bits_addr(bus_auto_out_0_aw_bits_addr),
    .auto_out_0_w_ready(bus_auto_out_0_w_ready),
    .auto_out_0_w_valid(bus_auto_out_0_w_valid),
    .auto_out_0_b_ready(bus_auto_out_0_b_ready),
    .auto_out_0_b_valid(bus_auto_out_0_b_valid),
    .auto_out_0_b_bits_id(bus_auto_out_0_b_bits_id),
    .auto_out_0_ar_ready(bus_auto_out_0_ar_ready),
    .auto_out_0_ar_valid(bus_auto_out_0_ar_valid),
    .auto_out_0_ar_bits_id(bus_auto_out_0_ar_bits_id),
    .auto_out_0_ar_bits_addr(bus_auto_out_0_ar_bits_addr),
    .auto_out_0_r_ready(bus_auto_out_0_r_ready),
    .auto_out_0_r_valid(bus_auto_out_0_r_valid),
    .auto_out_0_r_bits_id(bus_auto_out_0_r_bits_id),
    .auto_out_0_r_bits_data(bus_auto_out_0_r_bits_data)
  );
  BundleBridgeToAXI4 converter ( // @[Node.scala 65:31]
    .auto_in_aw_ready(converter_auto_in_aw_ready),
    .auto_in_aw_valid(converter_auto_in_aw_valid),
    .auto_in_aw_bits_id(converter_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(converter_auto_in_aw_bits_addr),
    .auto_in_w_ready(converter_auto_in_w_ready),
    .auto_in_w_valid(converter_auto_in_w_valid),
    .auto_in_w_bits_data(converter_auto_in_w_bits_data),
    .auto_in_w_bits_strb(converter_auto_in_w_bits_strb),
    .auto_in_w_bits_last(converter_auto_in_w_bits_last),
    .auto_in_b_ready(converter_auto_in_b_ready),
    .auto_in_b_valid(converter_auto_in_b_valid),
    .auto_in_b_bits_resp(converter_auto_in_b_bits_resp),
    .auto_in_ar_ready(converter_auto_in_ar_ready),
    .auto_in_ar_valid(converter_auto_in_ar_valid),
    .auto_in_ar_bits_id(converter_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(converter_auto_in_ar_bits_addr),
    .auto_in_ar_bits_size(converter_auto_in_ar_bits_size),
    .auto_in_r_ready(converter_auto_in_r_ready),
    .auto_in_r_valid(converter_auto_in_r_valid),
    .auto_in_r_bits_data(converter_auto_in_r_bits_data),
    .auto_in_r_bits_resp(converter_auto_in_r_bits_resp),
    .auto_in_r_bits_last(converter_auto_in_r_bits_last),
    .auto_out_aw_ready(converter_auto_out_aw_ready),
    .auto_out_aw_valid(converter_auto_out_aw_valid),
    .auto_out_aw_bits_id(converter_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(converter_auto_out_aw_bits_addr),
    .auto_out_w_ready(converter_auto_out_w_ready),
    .auto_out_w_valid(converter_auto_out_w_valid),
    .auto_out_w_bits_data(converter_auto_out_w_bits_data),
    .auto_out_w_bits_strb(converter_auto_out_w_bits_strb),
    .auto_out_w_bits_last(converter_auto_out_w_bits_last),
    .auto_out_b_ready(converter_auto_out_b_ready),
    .auto_out_b_valid(converter_auto_out_b_valid),
    .auto_out_b_bits_resp(converter_auto_out_b_bits_resp),
    .auto_out_ar_ready(converter_auto_out_ar_ready),
    .auto_out_ar_valid(converter_auto_out_ar_valid),
    .auto_out_ar_bits_id(converter_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(converter_auto_out_ar_bits_addr),
    .auto_out_ar_bits_size(converter_auto_out_ar_bits_size),
    .auto_out_r_ready(converter_auto_out_r_ready),
    .auto_out_r_valid(converter_auto_out_r_valid),
    .auto_out_r_bits_data(converter_auto_out_r_bits_data),
    .auto_out_r_bits_resp(converter_auto_out_r_bits_resp),
    .auto_out_r_bits_last(converter_auto_out_r_bits_last)
  );
  AXI4StreamToBundleBridge converter_1 ( // @[Nodes.scala 165:31]
    .auto_in_ready(converter_1_auto_in_ready),
    .auto_in_valid(converter_1_auto_in_valid),
    .auto_in_bits_data(converter_1_auto_in_bits_data),
    .auto_in_bits_last(converter_1_auto_in_bits_last),
    .auto_out_ready(converter_1_auto_out_ready),
    .auto_out_valid(converter_1_auto_out_valid),
    .auto_out_bits_data(converter_1_auto_out_bits_data),
    .auto_out_bits_last(converter_1_auto_out_bits_last)
  );
  BundleBridgeToAXI4Stream converter_2 ( // @[Nodes.scala 201:31]
    .auto_in_ready(converter_2_auto_in_ready),
    .auto_in_valid(converter_2_auto_in_valid),
    .auto_in_bits_data(converter_2_auto_in_bits_data),
    .auto_in_bits_last(converter_2_auto_in_bits_last),
    .auto_out_ready(converter_2_auto_out_ready),
    .auto_out_valid(converter_2_auto_out_valid),
    .auto_out_bits_data(converter_2_auto_out_bits_data),
    .auto_out_bits_last(converter_2_auto_out_bits_last)
  );
  assign ioMem_0_aw_ready = converter_auto_in_aw_ready; // @[Nodes.scala 624:60]
  assign ioMem_0_w_ready = converter_auto_in_w_ready; // @[Nodes.scala 624:60]
  assign ioMem_0_b_valid = converter_auto_in_b_valid; // @[Nodes.scala 624:60]
  assign ioMem_0_b_bits_id = 1'h0; // @[Nodes.scala 624:60]
  assign ioMem_0_b_bits_resp = converter_auto_in_b_bits_resp; // @[Nodes.scala 624:60]
  assign ioMem_0_ar_ready = converter_auto_in_ar_ready; // @[Nodes.scala 624:60]
  assign ioMem_0_r_valid = converter_auto_in_r_valid; // @[Nodes.scala 624:60]
  assign ioMem_0_r_bits_id = 1'h0; // @[Nodes.scala 624:60]
  assign ioMem_0_r_bits_data = converter_auto_in_r_bits_data; // @[Nodes.scala 624:60]
  assign ioMem_0_r_bits_resp = converter_auto_in_r_bits_resp; // @[Nodes.scala 624:60]
  assign ioMem_0_r_bits_last = converter_auto_in_r_bits_last; // @[Nodes.scala 624:60]
  assign in_0_ready = converter_2_auto_in_ready; // @[Nodes.scala 624:60]
  assign out_0_valid = converter_1_auto_out_valid; // @[Nodes.scala 649:56]
  assign out_0_bits_data = converter_1_auto_out_bits_data; // @[Nodes.scala 649:56]
  assign out_0_bits_last = converter_1_auto_out_bits_last; // @[Nodes.scala 649:56]
  assign widthAdapter_clock = clock;
  assign widthAdapter_reset = reset;
  assign widthAdapter_auto_in_valid = converter_2_auto_out_valid; // @[LazyModule.scala 167:31]
  assign widthAdapter_auto_in_bits_data = converter_2_auto_out_bits_data; // @[LazyModule.scala 167:31]
  assign widthAdapter_auto_in_bits_last = converter_2_auto_out_bits_last; // @[LazyModule.scala 167:31]
  assign widthAdapter_auto_out_ready = fft_auto_stream_in_ready; // @[LazyModule.scala 167:57]
  assign fft_clock = clock;
  assign fft_reset = reset;
  assign fft_auto_mem_in_aw_valid = bus_auto_out_0_aw_valid; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_aw_bits_id = bus_auto_out_0_aw_bits_id; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_aw_bits_addr = bus_auto_out_0_aw_bits_addr; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_w_valid = bus_auto_out_0_w_valid; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_b_ready = bus_auto_out_0_b_ready; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_ar_valid = bus_auto_out_0_ar_valid; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_ar_bits_id = bus_auto_out_0_ar_bits_id; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_ar_bits_addr = bus_auto_out_0_ar_bits_addr; // @[LazyModule.scala 167:31]
  assign fft_auto_mem_in_r_ready = bus_auto_out_0_r_ready; // @[LazyModule.scala 167:31]
  assign fft_auto_stream_in_valid = widthAdapter_auto_out_valid; // @[LazyModule.scala 167:57]
  assign fft_auto_stream_in_bits_data = widthAdapter_auto_out_bits_data; // @[LazyModule.scala 167:57]
  assign fft_auto_stream_in_bits_last = widthAdapter_auto_out_bits_last; // @[LazyModule.scala 167:57]
  assign fft_auto_stream_out_ready = mag_auto_slave_in_ready; // @[LazyModule.scala 167:57]
  assign mag_clock = clock;
  assign mag_reset = reset;
  assign mag_auto_mem_in_aw_valid = bus_auto_out_1_aw_valid; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_aw_bits_id = bus_auto_out_1_aw_bits_id; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_aw_bits_addr = bus_auto_out_1_aw_bits_addr; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_w_valid = bus_auto_out_1_w_valid; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_w_bits_data = bus_auto_out_1_w_bits_data; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_w_bits_strb = bus_auto_out_1_w_bits_strb; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_b_ready = bus_auto_out_1_b_ready; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_ar_valid = bus_auto_out_1_ar_valid; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_ar_bits_id = bus_auto_out_1_ar_bits_id; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_ar_bits_addr = bus_auto_out_1_ar_bits_addr; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_ar_bits_size = bus_auto_out_1_ar_bits_size; // @[LazyModule.scala 167:31]
  assign mag_auto_mem_in_r_ready = bus_auto_out_1_r_ready; // @[LazyModule.scala 167:31]
  assign mag_auto_master_out_ready = converter_1_auto_in_ready; // @[LazyModule.scala 167:57]
  assign mag_auto_slave_in_valid = fft_auto_stream_out_valid; // @[LazyModule.scala 167:57]
  assign mag_auto_slave_in_bits_data = fft_auto_stream_out_bits_data; // @[LazyModule.scala 167:57]
  assign mag_auto_slave_in_bits_last = fft_auto_stream_out_bits_last; // @[LazyModule.scala 167:57]
  assign bus_clock = clock;
  assign bus_reset = reset;
  assign bus_auto_in_aw_valid = converter_auto_out_aw_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_in_aw_bits_id = converter_auto_out_aw_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_in_aw_bits_addr = converter_auto_out_aw_bits_addr; // @[LazyModule.scala 167:31]
  assign bus_auto_in_w_valid = converter_auto_out_w_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_in_w_bits_data = converter_auto_out_w_bits_data; // @[LazyModule.scala 167:31]
  assign bus_auto_in_w_bits_strb = converter_auto_out_w_bits_strb; // @[LazyModule.scala 167:31]
  assign bus_auto_in_w_bits_last = converter_auto_out_w_bits_last; // @[LazyModule.scala 167:31]
  assign bus_auto_in_b_ready = converter_auto_out_b_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_in_ar_valid = converter_auto_out_ar_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_in_ar_bits_id = converter_auto_out_ar_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_in_ar_bits_addr = converter_auto_out_ar_bits_addr; // @[LazyModule.scala 167:31]
  assign bus_auto_in_ar_bits_size = converter_auto_out_ar_bits_size; // @[LazyModule.scala 167:31]
  assign bus_auto_in_r_ready = converter_auto_out_r_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_aw_ready = mag_auto_mem_in_aw_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_w_ready = mag_auto_mem_in_w_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_b_valid = mag_auto_mem_in_b_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_b_bits_id = mag_auto_mem_in_b_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_ar_ready = mag_auto_mem_in_ar_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_r_valid = mag_auto_mem_in_r_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_r_bits_id = mag_auto_mem_in_r_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_out_1_r_bits_data = mag_auto_mem_in_r_bits_data; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_aw_ready = fft_auto_mem_in_aw_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_w_ready = fft_auto_mem_in_w_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_b_valid = fft_auto_mem_in_b_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_b_bits_id = fft_auto_mem_in_b_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_ar_ready = fft_auto_mem_in_ar_ready; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_r_valid = fft_auto_mem_in_r_valid; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_r_bits_id = fft_auto_mem_in_r_bits_id; // @[LazyModule.scala 167:31]
  assign bus_auto_out_0_r_bits_data = fft_auto_mem_in_r_bits_data; // @[LazyModule.scala 167:31]
  assign converter_auto_in_aw_valid = ioMem_0_aw_valid; // @[LazyModule.scala 167:57]
  assign converter_auto_in_aw_bits_id = ioMem_0_aw_bits_id; // @[LazyModule.scala 167:57]
  assign converter_auto_in_aw_bits_addr = ioMem_0_aw_bits_addr; // @[LazyModule.scala 167:57]
  assign converter_auto_in_w_valid = ioMem_0_w_valid; // @[LazyModule.scala 167:57]
  assign converter_auto_in_w_bits_data = ioMem_0_w_bits_data; // @[LazyModule.scala 167:57]
  assign converter_auto_in_w_bits_strb = ioMem_0_w_bits_strb; // @[LazyModule.scala 167:57]
  assign converter_auto_in_w_bits_last = ioMem_0_w_bits_last; // @[LazyModule.scala 167:57]
  assign converter_auto_in_b_ready = ioMem_0_b_ready; // @[LazyModule.scala 167:57]
  assign converter_auto_in_ar_valid = ioMem_0_ar_valid; // @[LazyModule.scala 167:57]
  assign converter_auto_in_ar_bits_id = ioMem_0_ar_bits_id; // @[LazyModule.scala 167:57]
  assign converter_auto_in_ar_bits_addr = ioMem_0_ar_bits_addr; // @[LazyModule.scala 167:57]
  assign converter_auto_in_ar_bits_size = ioMem_0_ar_bits_size; // @[LazyModule.scala 167:57]
  assign converter_auto_in_r_ready = ioMem_0_r_ready; // @[LazyModule.scala 167:57]
  assign converter_auto_out_aw_ready = bus_auto_in_aw_ready; // @[LazyModule.scala 167:31]
  assign converter_auto_out_w_ready = bus_auto_in_w_ready; // @[LazyModule.scala 167:31]
  assign converter_auto_out_b_valid = bus_auto_in_b_valid; // @[LazyModule.scala 167:31]
  assign converter_auto_out_b_bits_resp = bus_auto_in_b_bits_resp; // @[LazyModule.scala 167:31]
  assign converter_auto_out_ar_ready = bus_auto_in_ar_ready; // @[LazyModule.scala 167:31]
  assign converter_auto_out_r_valid = bus_auto_in_r_valid; // @[LazyModule.scala 167:31]
  assign converter_auto_out_r_bits_data = bus_auto_in_r_bits_data; // @[LazyModule.scala 167:31]
  assign converter_auto_out_r_bits_resp = bus_auto_in_r_bits_resp; // @[LazyModule.scala 167:31]
  assign converter_auto_out_r_bits_last = bus_auto_in_r_bits_last; // @[LazyModule.scala 167:31]
  assign converter_1_auto_in_valid = mag_auto_master_out_valid; // @[LazyModule.scala 167:57]
  assign converter_1_auto_in_bits_data = mag_auto_master_out_bits_data; // @[LazyModule.scala 167:57]
  assign converter_1_auto_in_bits_last = mag_auto_master_out_bits_last; // @[LazyModule.scala 167:57]
  assign converter_1_auto_out_ready = out_0_ready; // @[LazyModule.scala 167:31]
  assign converter_2_auto_in_valid = in_0_valid; // @[LazyModule.scala 167:57]
  assign converter_2_auto_in_bits_data = in_0_bits_data; // @[LazyModule.scala 167:57]
  assign converter_2_auto_in_bits_last = in_0_bits_last; // @[LazyModule.scala 167:57]
  assign converter_2_auto_out_ready = widthAdapter_auto_in_ready; // @[LazyModule.scala 167:31]
endmodule
module SRAM_depth_256_width_32_mem(
  input  [7:0]  R0_addr,
  input         R0_en,
  input         R0_clk,
  output [15:0] R0_data_real,
  output [15:0] R0_data_imag,
  input  [7:0]  W0_addr,
  input         W0_en,
  input         W0_clk,
  input  [15:0] W0_data_real,
  input  [15:0] W0_data_imag
);
  wire [7:0] SRAM_depth_256_width_32_mem_ext_R0_addr;
  wire  SRAM_depth_256_width_32_mem_ext_R0_en;
  wire  SRAM_depth_256_width_32_mem_ext_R0_clk;
  wire [31:0] SRAM_depth_256_width_32_mem_ext_R0_data;
  wire [7:0] SRAM_depth_256_width_32_mem_ext_W0_addr;
  wire  SRAM_depth_256_width_32_mem_ext_W0_en;
  wire  SRAM_depth_256_width_32_mem_ext_W0_clk;
  wire [31:0] SRAM_depth_256_width_32_mem_ext_W0_data;
  SRAM_depth_256_width_32_mem_ext SRAM_depth_256_width_32_mem_ext (
    .R0_addr(SRAM_depth_256_width_32_mem_ext_R0_addr),
    .R0_en(SRAM_depth_256_width_32_mem_ext_R0_en),
    .R0_clk(SRAM_depth_256_width_32_mem_ext_R0_clk),
    .R0_data(SRAM_depth_256_width_32_mem_ext_R0_data),
    .W0_addr(SRAM_depth_256_width_32_mem_ext_W0_addr),
    .W0_en(SRAM_depth_256_width_32_mem_ext_W0_en),
    .W0_clk(SRAM_depth_256_width_32_mem_ext_W0_clk),
    .W0_data(SRAM_depth_256_width_32_mem_ext_W0_data)
  );
  assign SRAM_depth_256_width_32_mem_ext_R0_clk = R0_clk;
  assign SRAM_depth_256_width_32_mem_ext_R0_en = R0_en;
  assign SRAM_depth_256_width_32_mem_ext_R0_addr = R0_addr;
  assign R0_data_imag = SRAM_depth_256_width_32_mem_ext_R0_data[15:0];
  assign R0_data_real = SRAM_depth_256_width_32_mem_ext_R0_data[31:16];
  assign SRAM_depth_256_width_32_mem_ext_W0_clk = W0_clk;
  assign SRAM_depth_256_width_32_mem_ext_W0_en = W0_en;
  assign SRAM_depth_256_width_32_mem_ext_W0_addr = W0_addr;
  assign SRAM_depth_256_width_32_mem_ext_W0_data = {W0_data_real,W0_data_imag};
endmodule
