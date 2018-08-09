module rv32IF( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  output [31:0] io_NPCOut, // @[:@6.4]
  output [31:0] io_PCOut, // @[:@6.4]
  input         io_condIn, // @[:@6.4]
  input  [31:0] io_nextPC, // @[:@6.4]
  input  [31:0] io_instrIn, // @[:@6.4]
  input         io_stall // @[:@6.4]
);
  reg [31:0] PCReg; // @[instruction_fetch.scala 16:23:@8.4]
  reg [31:0] _RAND_0;
  wire [6:0] _T_22; // @[instruction_fetch.scala 19:44:@11.4]
  wire  _T_32; // @[instruction_fetch.scala 19:50:@12.4]
  wire  _T_33; // @[instruction_fetch.scala 19:31:@13.4]
  wire  _T_35; // @[instruction_fetch.scala 19:89:@15.4]
  wire  _T_37; // @[instruction_fetch.scala 19:123:@17.4]
  wire  _T_38; // @[instruction_fetch.scala 19:104:@18.4]
  wire  _T_39; // @[instruction_fetch.scala 19:69:@19.4]
  wire [32:0] _T_41; // @[instruction_fetch.scala 24:19:@28.8]
  wire [31:0] _T_42; // @[instruction_fetch.scala 24:19:@29.8]
  wire [31:0] _GEN_0; // @[instruction_fetch.scala 21:24:@24.6]
  wire [31:0] NPC; // @[instruction_fetch.scala 19:140:@20.4]
  assign _T_22 = io_instrIn[6:0]; // @[instruction_fetch.scala 19:44:@11.4]
  assign _T_32 = _T_22 == 7'h63; // @[instruction_fetch.scala 19:50:@12.4]
  assign _T_33 = io_condIn & _T_32; // @[instruction_fetch.scala 19:31:@13.4]
  assign _T_35 = _T_22 == 7'h6f; // @[instruction_fetch.scala 19:89:@15.4]
  assign _T_37 = _T_22 == 7'h67; // @[instruction_fetch.scala 19:123:@17.4]
  assign _T_38 = _T_35 | _T_37; // @[instruction_fetch.scala 19:104:@18.4]
  assign _T_39 = _T_33 | _T_38; // @[instruction_fetch.scala 19:69:@19.4]
  assign _T_41 = PCReg + 32'h4; // @[instruction_fetch.scala 24:19:@28.8]
  assign _T_42 = _T_41[31:0]; // @[instruction_fetch.scala 24:19:@29.8]
  assign _GEN_0 = io_stall ? PCReg : _T_42; // @[instruction_fetch.scala 21:24:@24.6]
  assign NPC = _T_39 ? io_nextPC : _GEN_0; // @[instruction_fetch.scala 19:140:@20.4]
  assign io_NPCOut = _T_39 ? io_nextPC : _GEN_0; // @[instruction_fetch.scala 28:14:@32.4]
  assign io_PCOut = PCReg; // @[instruction_fetch.scala 31:13:@34.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  PCReg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      PCReg <= 32'h0;
    end else begin
      if (_T_39) begin
        PCReg <= io_nextPC;
      end else begin
        if (!(io_stall)) begin
          PCReg <= _T_42;
        end
      end
    end
  end
endmodule
module InstructionRom( // @[:@36.2]
  input  [31:0] io_addrIn, // @[:@39.4]
  output [31:0] io_dataOut // @[:@39.4]
);
  wire [4:0] _T_41; // @[:@68.4]
  wire [31:0] _GEN_1; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_2; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_3; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_4; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_5; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_6; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_7; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_8; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_9; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_10; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_11; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_12; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_13; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_14; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_15; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_16; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_17; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_18; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_19; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_20; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_21; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_22; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_23; // @[instruction_memory.scala 33:15:@69.4]
  wire [31:0] _GEN_24; // @[instruction_memory.scala 33:15:@69.4]
  assign _T_41 = io_addrIn[4:0]; // @[:@68.4]
  assign _GEN_1 = 5'h1 == _T_41 ? 32'h93 : 32'h13; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_2 = 5'h2 == _T_41 ? 32'h100113 : _GEN_1; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_3 = 5'h3 == _T_41 ? 32'h913 : _GEN_2; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_4 = 5'h4 == _T_41 ? 32'h9c41b7 : _GEN_3; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_5 = 5'h5 == _T_41 ? 32'h1b37 : _GEN_4; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_6 = 5'h6 == _T_41 ? 32'h2080b3 : _GEN_5; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_7 = 5'h7 == _T_41 ? 32'hfe30c8e3 : _GEN_6; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_8 = 5'h8 == _T_41 ? 32'h13 : _GEN_7; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_9 = 5'h9 == _T_41 ? 32'h13 : _GEN_8; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_10 = 5'ha == _T_41 ? 32'h13 : _GEN_9; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_11 = 5'hb == _T_41 ? 32'h13 : _GEN_10; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_12 = 5'hc == _T_41 ? 32'h13 : _GEN_11; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_13 = 5'hd == _T_41 ? 32'h190913 : _GEN_12; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_14 = 5'he == _T_41 ? 32'h1202823 : _GEN_13; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_15 = 5'hf == _T_41 ? 32'h13 : _GEN_14; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_16 = 5'h10 == _T_41 ? 32'h13 : _GEN_15; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_17 = 5'h11 == _T_41 ? 32'h1002383 : _GEN_16; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_18 = 5'h12 == _T_41 ? 32'h7b2023 : _GEN_17; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_19 = 5'h13 == _T_41 ? 32'h93 : _GEN_18; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_20 = 5'h14 == _T_41 ? 32'h18002e7 : _GEN_19; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_21 = 5'h15 == _T_41 ? 32'h13 : _GEN_20; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_22 = 5'h16 == _T_41 ? 32'h13 : _GEN_21; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_23 = 5'h17 == _T_41 ? 32'h13 : _GEN_22; // @[instruction_memory.scala 33:15:@69.4]
  assign _GEN_24 = 5'h18 == _T_41 ? 32'h13 : _GEN_23; // @[instruction_memory.scala 33:15:@69.4]
  assign io_dataOut = 5'h19 == _T_41 ? 32'h13 : _GEN_24; // @[instruction_memory.scala 33:15:@69.4]
endmodule
module rv32ID( // @[:@71.2]
  output [4:0]  io_reg1, // @[:@74.4]
  output [4:0]  io_reg2, // @[:@74.4]
  output [31:0] io_immidiate, // @[:@74.4]
  output [9:0]  io_funct, // @[:@74.4]
  input  [31:0] io_instrIn // @[:@74.4]
);
  wire [4:0] _T_15; // @[instruction_decode.scala 17:25:@76.4]
  wire [4:0] _T_16; // @[instruction_decode.scala 18:25:@78.4]
  wire [6:0] funct7; // @[instruction_decode.scala 20:31:@80.4]
  wire [2:0] funct3; // @[instruction_decode.scala 21:31:@81.4]
  wire [9:0] funct_temp; // @[Cat.scala 30:58:@82.4]
  wire [6:0] _T_23; // @[instruction_decode.scala 31:19:@89.4]
  wire  _T_24; // @[instruction_decode.scala 31:26:@90.4]
  wire  _T_27; // @[instruction_decode.scala 34:31:@97.6]
  wire [4:0] _T_29; // @[instruction_decode.scala 35:60:@100.8]
  wire [11:0] _T_30; // @[Cat.scala 30:58:@101.8]
  wire [11:0] _T_31; // @[instruction_decode.scala 35:69:@102.8]
  wire  _T_35; // @[instruction_decode.scala 38:31:@110.8]
  wire [11:0] _T_36; // @[instruction_decode.scala 39:37:@112.10]
  wire [11:0] _T_37; // @[instruction_decode.scala 39:46:@113.10]
  wire  _T_41; // @[instruction_decode.scala 42:31:@121.10]
  wire  _T_43; // @[instruction_decode.scala 43:20:@123.12]
  wire  _T_45; // @[instruction_decode.scala 43:43:@124.12]
  wire  _T_46; // @[instruction_decode.scala 43:32:@125.12]
  wire [11:0] _GEN_2; // @[instruction_decode.scala 43:56:@126.12]
  wire  _T_55; // @[instruction_decode.scala 51:31:@144.12]
  wire  _T_57; // @[instruction_decode.scala 53:41:@147.14]
  wire  _T_58; // @[instruction_decode.scala 53:57:@148.14]
  wire [1:0] _T_63; // @[Cat.scala 30:58:@152.14]
  wire [5:0] _T_59; // @[instruction_decode.scala 53:72:@149.14]
  wire [7:0] _T_64; // @[Cat.scala 30:58:@153.14]
  wire [3:0] _T_60; // @[instruction_decode.scala 53:92:@150.14]
  wire [4:0] _T_62; // @[Cat.scala 30:58:@151.14]
  wire [12:0] _T_65; // @[Cat.scala 30:58:@154.14]
  wire [12:0] _T_66; // @[instruction_decode.scala 53:105:@155.14]
  wire  _T_69; // @[instruction_decode.scala 55:31:@162.14]
  wire [7:0] _T_72; // @[instruction_decode.scala 57:57:@166.16]
  wire [8:0] _T_77; // @[Cat.scala 30:58:@170.16]
  wire  _T_73; // @[instruction_decode.scala 57:77:@167.16]
  wire [9:0] _T_78; // @[Cat.scala 30:58:@171.16]
  wire [9:0] _T_74; // @[instruction_decode.scala 57:93:@168.16]
  wire [10:0] _T_76; // @[Cat.scala 30:58:@169.16]
  wire [20:0] _T_79; // @[Cat.scala 30:58:@172.16]
  wire [20:0] _T_80; // @[instruction_decode.scala 57:108:@173.16]
  wire  _T_83; // @[instruction_decode.scala 59:31:@180.16]
  wire [11:0] _GEN_7; // @[instruction_decode.scala 59:47:@181.16]
  wire [20:0] _GEN_11; // @[instruction_decode.scala 55:46:@163.14]
  wire [20:0] _GEN_15; // @[instruction_decode.scala 51:49:@145.12]
  wire [20:0] _GEN_20; // @[instruction_decode.scala 42:49:@122.10]
  wire [20:0] _GEN_22; // @[instruction_decode.scala 38:47:@111.8]
  wire [20:0] _GEN_26; // @[instruction_decode.scala 34:48:@98.6]
  wire [20:0] _GEN_32; // @[instruction_decode.scala 31:44:@91.4]
  wire [31:0] immidiate_temp; // @[instruction_decode.scala 26:29:@85.4 instruction_decode.scala 27:19:@86.4 instruction_decode.scala 35:23:@103.8 instruction_decode.scala 39:23:@114.10 instruction_decode.scala 48:26:@137.14 instruction_decode.scala 53:23:@156.14 instruction_decode.scala 57:23:@174.16 instruction_decode.scala 61:23:@185.18]
  wire [31:0] _T_32; // @[instruction_decode.scala 36:39:@104.8]
  wire [9:0] _T_50; // @[Cat.scala 30:58:@133.14]
  wire [9:0] _GEN_0; // @[instruction_decode.scala 43:56:@126.12]
  wire [31:0] _GEN_1; // @[instruction_decode.scala 43:56:@126.12]
  wire  _T_89; // @[instruction_decode.scala 63:31:@191.18]
  wire  _T_91; // @[instruction_decode.scala 63:65:@193.18]
  wire  _T_92; // @[instruction_decode.scala 63:46:@194.18]
  wire [19:0] _T_94; // @[instruction_decode.scala 65:38:@197.20]
  wire [31:0] _T_95; // @[Cat.scala 30:58:@198.20]
  wire [31:0] _GEN_4; // @[instruction_decode.scala 63:82:@195.18]
  wire [4:0] _GEN_5; // @[instruction_decode.scala 63:82:@195.18]
  wire [31:0] _GEN_8; // @[instruction_decode.scala 59:47:@181.16]
  wire [4:0] _GEN_9; // @[instruction_decode.scala 59:47:@181.16]
  wire [31:0] _GEN_12; // @[instruction_decode.scala 55:46:@163.14]
  wire [4:0] _GEN_13; // @[instruction_decode.scala 55:46:@163.14]
  wire [31:0] _GEN_16; // @[instruction_decode.scala 51:49:@145.12]
  wire [4:0] _GEN_17; // @[instruction_decode.scala 51:49:@145.12]
  wire [9:0] _GEN_18; // @[instruction_decode.scala 42:49:@122.10]
  wire [31:0] _GEN_19; // @[instruction_decode.scala 42:49:@122.10]
  wire [4:0] _GEN_21; // @[instruction_decode.scala 42:49:@122.10]
  wire [31:0] _GEN_23; // @[instruction_decode.scala 38:47:@111.8]
  wire [9:0] _GEN_24; // @[instruction_decode.scala 38:47:@111.8]
  wire [4:0] _GEN_25; // @[instruction_decode.scala 38:47:@111.8]
  wire [31:0] _GEN_27; // @[instruction_decode.scala 34:48:@98.6]
  wire [9:0] _GEN_28; // @[instruction_decode.scala 34:48:@98.6]
  wire [4:0] _GEN_29; // @[instruction_decode.scala 34:48:@98.6]
  assign _T_15 = io_instrIn[19:15]; // @[instruction_decode.scala 17:25:@76.4]
  assign _T_16 = io_instrIn[24:20]; // @[instruction_decode.scala 18:25:@78.4]
  assign funct7 = io_instrIn[31:25]; // @[instruction_decode.scala 20:31:@80.4]
  assign funct3 = io_instrIn[14:12]; // @[instruction_decode.scala 21:31:@81.4]
  assign funct_temp = {funct7,funct3}; // @[Cat.scala 30:58:@82.4]
  assign _T_23 = io_instrIn[6:0]; // @[instruction_decode.scala 31:19:@89.4]
  assign _T_24 = _T_23 == 7'h33; // @[instruction_decode.scala 31:26:@90.4]
  assign _T_27 = _T_23 == 7'h23; // @[instruction_decode.scala 34:31:@97.6]
  assign _T_29 = io_instrIn[11:7]; // @[instruction_decode.scala 35:60:@100.8]
  assign _T_30 = {funct7,_T_29}; // @[Cat.scala 30:58:@101.8]
  assign _T_31 = $signed(_T_30); // @[instruction_decode.scala 35:69:@102.8]
  assign _T_35 = _T_23 == 7'h3; // @[instruction_decode.scala 38:31:@110.8]
  assign _T_36 = io_instrIn[31:20]; // @[instruction_decode.scala 39:37:@112.10]
  assign _T_37 = $signed(_T_36); // @[instruction_decode.scala 39:46:@113.10]
  assign _T_41 = _T_23 == 7'h13; // @[instruction_decode.scala 42:31:@121.10]
  assign _T_43 = funct3 == 3'h1; // @[instruction_decode.scala 43:20:@123.12]
  assign _T_45 = funct3 == 3'h5; // @[instruction_decode.scala 43:43:@124.12]
  assign _T_46 = _T_43 | _T_45; // @[instruction_decode.scala 43:32:@125.12]
  assign _GEN_2 = _T_46 ? $signed(12'sh0) : $signed(_T_37); // @[instruction_decode.scala 43:56:@126.12]
  assign _T_55 = _T_23 == 7'h63; // @[instruction_decode.scala 51:31:@144.12]
  assign _T_57 = io_instrIn[31]; // @[instruction_decode.scala 53:41:@147.14]
  assign _T_58 = io_instrIn[7]; // @[instruction_decode.scala 53:57:@148.14]
  assign _T_63 = {_T_57,_T_58}; // @[Cat.scala 30:58:@152.14]
  assign _T_59 = io_instrIn[30:25]; // @[instruction_decode.scala 53:72:@149.14]
  assign _T_64 = {_T_63,_T_59}; // @[Cat.scala 30:58:@153.14]
  assign _T_60 = io_instrIn[11:8]; // @[instruction_decode.scala 53:92:@150.14]
  assign _T_62 = {_T_60,1'h0}; // @[Cat.scala 30:58:@151.14]
  assign _T_65 = {_T_64,_T_62}; // @[Cat.scala 30:58:@154.14]
  assign _T_66 = $signed(_T_65); // @[instruction_decode.scala 53:105:@155.14]
  assign _T_69 = _T_23 == 7'h6f; // @[instruction_decode.scala 55:31:@162.14]
  assign _T_72 = io_instrIn[19:12]; // @[instruction_decode.scala 57:57:@166.16]
  assign _T_77 = {_T_57,_T_72}; // @[Cat.scala 30:58:@170.16]
  assign _T_73 = io_instrIn[20]; // @[instruction_decode.scala 57:77:@167.16]
  assign _T_78 = {_T_77,_T_73}; // @[Cat.scala 30:58:@171.16]
  assign _T_74 = io_instrIn[30:21]; // @[instruction_decode.scala 57:93:@168.16]
  assign _T_76 = {_T_74,1'h0}; // @[Cat.scala 30:58:@169.16]
  assign _T_79 = {_T_78,_T_76}; // @[Cat.scala 30:58:@172.16]
  assign _T_80 = $signed(_T_79); // @[instruction_decode.scala 57:108:@173.16]
  assign _T_83 = _T_23 == 7'h67; // @[instruction_decode.scala 59:31:@180.16]
  assign _GEN_7 = _T_83 ? $signed(_T_37) : $signed(12'sh0); // @[instruction_decode.scala 59:47:@181.16]
  assign _GEN_11 = _T_69 ? $signed(_T_80) : $signed({{9{_GEN_7[11]}},_GEN_7}); // @[instruction_decode.scala 55:46:@163.14]
  assign _GEN_15 = _T_55 ? $signed({{8{_T_66[12]}},_T_66}) : $signed(_GEN_11); // @[instruction_decode.scala 51:49:@145.12]
  assign _GEN_20 = _T_41 ? $signed({{9{_GEN_2[11]}},_GEN_2}) : $signed(_GEN_15); // @[instruction_decode.scala 42:49:@122.10]
  assign _GEN_22 = _T_35 ? $signed({{9{_T_37[11]}},_T_37}) : $signed(_GEN_20); // @[instruction_decode.scala 38:47:@111.8]
  assign _GEN_26 = _T_27 ? $signed({{9{_T_31[11]}},_T_31}) : $signed(_GEN_22); // @[instruction_decode.scala 34:48:@98.6]
  assign _GEN_32 = _T_24 ? $signed(21'sh0) : $signed(_GEN_26); // @[instruction_decode.scala 31:44:@91.4]
  assign immidiate_temp = {{11{_GEN_32[20]}},_GEN_32}; // @[instruction_decode.scala 26:29:@85.4 instruction_decode.scala 27:19:@86.4 instruction_decode.scala 35:23:@103.8 instruction_decode.scala 39:23:@114.10 instruction_decode.scala 48:26:@137.14 instruction_decode.scala 53:23:@156.14 instruction_decode.scala 57:23:@174.16 instruction_decode.scala 61:23:@185.18]
  assign _T_32 = $unsigned(immidiate_temp); // @[instruction_decode.scala 36:39:@104.8]
  assign _T_50 = {7'h0,funct3}; // @[Cat.scala 30:58:@133.14]
  assign _GEN_0 = _T_46 ? funct_temp : _T_50; // @[instruction_decode.scala 43:56:@126.12]
  assign _GEN_1 = _T_46 ? {{27'd0}, _T_16} : _T_32; // @[instruction_decode.scala 43:56:@126.12]
  assign _T_89 = _T_23 == 7'h37; // @[instruction_decode.scala 63:31:@191.18]
  assign _T_91 = _T_23 == 7'h17; // @[instruction_decode.scala 63:65:@193.18]
  assign _T_92 = _T_89 | _T_91; // @[instruction_decode.scala 63:46:@194.18]
  assign _T_94 = io_instrIn[31:12]; // @[instruction_decode.scala 65:38:@197.20]
  assign _T_95 = {_T_94,12'h0}; // @[Cat.scala 30:58:@198.20]
  assign _GEN_4 = _T_92 ? _T_95 : 32'h0; // @[instruction_decode.scala 63:82:@195.18]
  assign _GEN_5 = _T_92 ? 5'h0 : _T_15; // @[instruction_decode.scala 63:82:@195.18]
  assign _GEN_8 = _T_83 ? _T_32 : _GEN_4; // @[instruction_decode.scala 59:47:@181.16]
  assign _GEN_9 = _T_83 ? _T_15 : _GEN_5; // @[instruction_decode.scala 59:47:@181.16]
  assign _GEN_12 = _T_69 ? _T_32 : _GEN_8; // @[instruction_decode.scala 55:46:@163.14]
  assign _GEN_13 = _T_69 ? _T_15 : _GEN_9; // @[instruction_decode.scala 55:46:@163.14]
  assign _GEN_16 = _T_55 ? _T_32 : _GEN_12; // @[instruction_decode.scala 51:49:@145.12]
  assign _GEN_17 = _T_55 ? _T_15 : _GEN_13; // @[instruction_decode.scala 51:49:@145.12]
  assign _GEN_18 = _T_41 ? _GEN_0 : 10'h0; // @[instruction_decode.scala 42:49:@122.10]
  assign _GEN_19 = _T_41 ? _GEN_1 : _GEN_16; // @[instruction_decode.scala 42:49:@122.10]
  assign _GEN_21 = _T_41 ? _T_15 : _GEN_17; // @[instruction_decode.scala 42:49:@122.10]
  assign _GEN_23 = _T_35 ? _T_32 : _GEN_19; // @[instruction_decode.scala 38:47:@111.8]
  assign _GEN_24 = _T_35 ? 10'h0 : _GEN_18; // @[instruction_decode.scala 38:47:@111.8]
  assign _GEN_25 = _T_35 ? _T_15 : _GEN_21; // @[instruction_decode.scala 38:47:@111.8]
  assign _GEN_27 = _T_27 ? _T_32 : _GEN_23; // @[instruction_decode.scala 34:48:@98.6]
  assign _GEN_28 = _T_27 ? 10'h0 : _GEN_24; // @[instruction_decode.scala 34:48:@98.6]
  assign _GEN_29 = _T_27 ? _T_15 : _GEN_25; // @[instruction_decode.scala 34:48:@98.6]
  assign io_reg1 = _T_24 ? _T_15 : _GEN_29; // @[instruction_decode.scala 17:12:@77.4 instruction_decode.scala 66:16:@200.20]
  assign io_reg2 = io_instrIn[24:20]; // @[instruction_decode.scala 18:12:@79.4]
  assign io_immidiate = _T_24 ? 32'h0 : _GEN_27; // @[instruction_decode.scala 25:17:@84.4 instruction_decode.scala 32:21:@92.6 instruction_decode.scala 36:21:@105.8 instruction_decode.scala 40:21:@116.10 instruction_decode.scala 45:24:@130.14 instruction_decode.scala 49:24:@139.14 instruction_decode.scala 54:21:@158.14 instruction_decode.scala 58:21:@176.16 instruction_decode.scala 62:21:@187.18 instruction_decode.scala 65:21:@199.20]
  assign io_funct = _T_24 ? funct_temp : _GEN_28; // @[instruction_decode.scala 24:13:@83.4 instruction_decode.scala 33:17:@93.6 instruction_decode.scala 37:21:@106.8 instruction_decode.scala 41:21:@117.10 instruction_decode.scala 44:20:@128.14 instruction_decode.scala 47:20:@134.14 instruction_decode.scala 52:17:@146.14 instruction_decode.scala 56:17:@164.16 instruction_decode.scala 60:17:@182.18 instruction_decode.scala 64:17:@196.20]
endmodule
module RegistryFile( // @[:@203.2]
  input         clock, // @[:@204.4]
  input         reset, // @[:@205.4]
  output [31:0] io_regOut1, // @[:@206.4]
  output [31:0] io_regOut2, // @[:@206.4]
  input  [31:0] io_regIn, // @[:@206.4]
  input  [4:0]  io_reg1Selector, // @[:@206.4]
  input  [4:0]  io_reg2Selector, // @[:@206.4]
  input  [4:0]  io_regInSelector, // @[:@206.4]
  input         io_writeEn // @[:@206.4]
);
  reg [31:0] Reg1; // @[registry_file.scala 23:23:@209.4]
  reg [31:0] _RAND_0;
  reg [31:0] Reg2; // @[registry_file.scala 24:23:@210.4]
  reg [31:0] _RAND_1;
  reg [31:0] Reg3; // @[registry_file.scala 25:23:@211.4]
  reg [31:0] _RAND_2;
  reg [31:0] Reg4; // @[registry_file.scala 26:23:@212.4]
  reg [31:0] _RAND_3;
  reg [31:0] Reg5; // @[registry_file.scala 27:23:@213.4]
  reg [31:0] _RAND_4;
  reg [31:0] Reg6; // @[registry_file.scala 28:23:@214.4]
  reg [31:0] _RAND_5;
  reg [31:0] Reg7; // @[registry_file.scala 29:23:@215.4]
  reg [31:0] _RAND_6;
  reg [31:0] Reg8; // @[registry_file.scala 30:23:@216.4]
  reg [31:0] _RAND_7;
  reg [31:0] Reg9; // @[registry_file.scala 31:23:@217.4]
  reg [31:0] _RAND_8;
  reg [31:0] Reg10; // @[registry_file.scala 32:23:@218.4]
  reg [31:0] _RAND_9;
  reg [31:0] Reg11; // @[registry_file.scala 33:23:@219.4]
  reg [31:0] _RAND_10;
  reg [31:0] Reg12; // @[registry_file.scala 34:23:@220.4]
  reg [31:0] _RAND_11;
  reg [31:0] Reg13; // @[registry_file.scala 35:23:@221.4]
  reg [31:0] _RAND_12;
  reg [31:0] Reg14; // @[registry_file.scala 36:23:@222.4]
  reg [31:0] _RAND_13;
  reg [31:0] Reg15; // @[registry_file.scala 37:23:@223.4]
  reg [31:0] _RAND_14;
  reg [31:0] Reg16; // @[registry_file.scala 38:23:@224.4]
  reg [31:0] _RAND_15;
  reg [31:0] Reg17; // @[registry_file.scala 39:23:@225.4]
  reg [31:0] _RAND_16;
  reg [31:0] Reg18; // @[registry_file.scala 40:23:@226.4]
  reg [31:0] _RAND_17;
  reg [31:0] Reg19; // @[registry_file.scala 41:23:@227.4]
  reg [31:0] _RAND_18;
  reg [31:0] Reg20; // @[registry_file.scala 42:23:@228.4]
  reg [31:0] _RAND_19;
  reg [31:0] Reg21; // @[registry_file.scala 43:23:@229.4]
  reg [31:0] _RAND_20;
  reg [31:0] Reg22; // @[registry_file.scala 44:23:@230.4]
  reg [31:0] _RAND_21;
  reg [31:0] Reg23; // @[registry_file.scala 45:23:@231.4]
  reg [31:0] _RAND_22;
  reg [31:0] Reg24; // @[registry_file.scala 46:23:@232.4]
  reg [31:0] _RAND_23;
  reg [31:0] Reg25; // @[registry_file.scala 47:23:@233.4]
  reg [31:0] _RAND_24;
  reg [31:0] Reg26; // @[registry_file.scala 48:23:@234.4]
  reg [31:0] _RAND_25;
  reg [31:0] Reg27; // @[registry_file.scala 49:23:@235.4]
  reg [31:0] _RAND_26;
  reg [31:0] Reg28; // @[registry_file.scala 50:23:@236.4]
  reg [31:0] _RAND_27;
  reg [31:0] Reg29; // @[registry_file.scala 51:23:@237.4]
  reg [31:0] _RAND_28;
  reg [31:0] Reg30; // @[registry_file.scala 52:23:@238.4]
  reg [31:0] _RAND_29;
  reg [31:0] Reg31; // @[registry_file.scala 53:23:@239.4]
  reg [31:0] _RAND_30;
  wire  _T_84; // @[registry_file.scala 57:29:@241.6]
  wire [31:0] _GEN_0; // @[registry_file.scala 57:37:@242.6]
  wire  _T_86; // @[registry_file.scala 60:29:@245.6]
  wire [31:0] _GEN_1; // @[registry_file.scala 60:37:@246.6]
  wire  _T_88; // @[registry_file.scala 63:29:@249.6]
  wire [31:0] _GEN_2; // @[registry_file.scala 63:37:@250.6]
  wire  _T_90; // @[registry_file.scala 66:29:@253.6]
  wire [31:0] _GEN_3; // @[registry_file.scala 66:37:@254.6]
  wire  _T_92; // @[registry_file.scala 69:29:@257.6]
  wire [31:0] _GEN_4; // @[registry_file.scala 69:37:@258.6]
  wire  _T_94; // @[registry_file.scala 72:29:@261.6]
  wire [31:0] _GEN_5; // @[registry_file.scala 72:37:@262.6]
  wire  _T_96; // @[registry_file.scala 75:29:@265.6]
  wire [31:0] _GEN_6; // @[registry_file.scala 75:37:@266.6]
  wire  _T_98; // @[registry_file.scala 78:29:@269.6]
  wire [31:0] _GEN_7; // @[registry_file.scala 78:37:@270.6]
  wire  _T_100; // @[registry_file.scala 81:29:@273.6]
  wire [31:0] _GEN_8; // @[registry_file.scala 81:37:@274.6]
  wire  _T_102; // @[registry_file.scala 84:29:@277.6]
  wire [31:0] _GEN_9; // @[registry_file.scala 84:38:@278.6]
  wire  _T_104; // @[registry_file.scala 87:29:@281.6]
  wire [31:0] _GEN_10; // @[registry_file.scala 87:38:@282.6]
  wire  _T_106; // @[registry_file.scala 90:29:@285.6]
  wire [31:0] _GEN_11; // @[registry_file.scala 90:38:@286.6]
  wire  _T_108; // @[registry_file.scala 93:29:@289.6]
  wire [31:0] _GEN_12; // @[registry_file.scala 93:38:@290.6]
  wire  _T_110; // @[registry_file.scala 96:29:@293.6]
  wire [31:0] _GEN_13; // @[registry_file.scala 96:38:@294.6]
  wire  _T_112; // @[registry_file.scala 99:29:@297.6]
  wire [31:0] _GEN_14; // @[registry_file.scala 99:38:@298.6]
  wire  _T_114; // @[registry_file.scala 102:29:@301.6]
  wire [31:0] _GEN_15; // @[registry_file.scala 102:38:@302.6]
  wire  _T_116; // @[registry_file.scala 105:29:@305.6]
  wire [31:0] _GEN_16; // @[registry_file.scala 105:38:@306.6]
  wire  _T_118; // @[registry_file.scala 108:29:@309.6]
  wire [31:0] _GEN_17; // @[registry_file.scala 108:38:@310.6]
  wire  _T_120; // @[registry_file.scala 111:29:@313.6]
  wire [31:0] _GEN_18; // @[registry_file.scala 111:38:@314.6]
  wire  _T_122; // @[registry_file.scala 114:29:@317.6]
  wire [31:0] _GEN_19; // @[registry_file.scala 114:38:@318.6]
  wire  _T_124; // @[registry_file.scala 117:29:@321.6]
  wire [31:0] _GEN_20; // @[registry_file.scala 117:38:@322.6]
  wire  _T_126; // @[registry_file.scala 120:29:@325.6]
  wire [31:0] _GEN_21; // @[registry_file.scala 120:38:@326.6]
  wire  _T_128; // @[registry_file.scala 123:29:@329.6]
  wire [31:0] _GEN_22; // @[registry_file.scala 123:38:@330.6]
  wire  _T_130; // @[registry_file.scala 126:29:@333.6]
  wire [31:0] _GEN_23; // @[registry_file.scala 126:38:@334.6]
  wire  _T_132; // @[registry_file.scala 129:29:@337.6]
  wire [31:0] _GEN_24; // @[registry_file.scala 129:38:@338.6]
  wire  _T_134; // @[registry_file.scala 132:29:@341.6]
  wire [31:0] _GEN_25; // @[registry_file.scala 132:38:@342.6]
  wire  _T_136; // @[registry_file.scala 135:29:@345.6]
  wire [31:0] _GEN_26; // @[registry_file.scala 135:38:@346.6]
  wire  _T_138; // @[registry_file.scala 138:29:@349.6]
  wire [31:0] _GEN_27; // @[registry_file.scala 138:38:@350.6]
  wire  _T_140; // @[registry_file.scala 141:29:@353.6]
  wire [31:0] _GEN_28; // @[registry_file.scala 141:38:@354.6]
  wire  _T_142; // @[registry_file.scala 144:29:@357.6]
  wire [31:0] _GEN_29; // @[registry_file.scala 144:38:@358.6]
  wire  _T_144; // @[registry_file.scala 147:29:@361.6]
  wire [31:0] _GEN_30; // @[registry_file.scala 147:38:@362.6]
  wire [31:0] _GEN_31; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_32; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_33; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_34; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_35; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_36; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_37; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_38; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_39; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_40; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_41; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_42; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_43; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_44; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_45; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_46; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_47; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_48; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_49; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_50; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_51; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_52; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_53; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_54; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_55; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_56; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_57; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_58; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_59; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_60; // @[registry_file.scala 56:20:@240.4]
  wire [31:0] _GEN_61; // @[registry_file.scala 56:20:@240.4]
  wire  _T_146; // @[registry_file.scala 155:25:@367.4]
  wire  _T_148; // @[registry_file.scala 157:31:@372.6]
  wire  _T_150; // @[registry_file.scala 159:31:@377.8]
  wire  _T_152; // @[registry_file.scala 162:30:@382.10]
  wire  _T_154; // @[registry_file.scala 165:30:@387.12]
  wire  _T_156; // @[registry_file.scala 168:30:@392.14]
  wire  _T_158; // @[registry_file.scala 171:30:@397.16]
  wire  _T_160; // @[registry_file.scala 174:30:@402.18]
  wire  _T_162; // @[registry_file.scala 177:30:@407.20]
  wire  _T_164; // @[registry_file.scala 180:30:@412.22]
  wire  _T_166; // @[registry_file.scala 183:30:@417.24]
  wire  _T_168; // @[registry_file.scala 186:30:@422.26]
  wire  _T_170; // @[registry_file.scala 189:30:@427.28]
  wire  _T_172; // @[registry_file.scala 192:30:@432.30]
  wire  _T_174; // @[registry_file.scala 195:30:@437.32]
  wire  _T_176; // @[registry_file.scala 198:30:@442.34]
  wire  _T_178; // @[registry_file.scala 201:30:@447.36]
  wire  _T_180; // @[registry_file.scala 204:30:@452.38]
  wire  _T_182; // @[registry_file.scala 207:30:@457.40]
  wire  _T_184; // @[registry_file.scala 210:30:@462.42]
  wire  _T_186; // @[registry_file.scala 213:30:@467.44]
  wire  _T_188; // @[registry_file.scala 216:30:@472.46]
  wire  _T_190; // @[registry_file.scala 219:30:@477.48]
  wire  _T_192; // @[registry_file.scala 222:30:@482.50]
  wire  _T_194; // @[registry_file.scala 225:30:@487.52]
  wire  _T_196; // @[registry_file.scala 228:30:@492.54]
  wire  _T_198; // @[registry_file.scala 231:30:@497.56]
  wire  _T_200; // @[registry_file.scala 234:30:@502.58]
  wire  _T_202; // @[registry_file.scala 237:30:@507.60]
  wire  _T_204; // @[registry_file.scala 240:30:@512.62]
  wire  _T_206; // @[registry_file.scala 243:30:@517.64]
  wire  _T_208; // @[registry_file.scala 246:30:@522.66]
  wire [31:0] _GEN_62; // @[registry_file.scala 246:39:@523.66]
  wire [31:0] _GEN_63; // @[registry_file.scala 243:39:@518.64]
  wire [31:0] _GEN_64; // @[registry_file.scala 240:39:@513.62]
  wire [31:0] _GEN_65; // @[registry_file.scala 237:39:@508.60]
  wire [31:0] _GEN_66; // @[registry_file.scala 234:39:@503.58]
  wire [31:0] _GEN_67; // @[registry_file.scala 231:39:@498.56]
  wire [31:0] _GEN_68; // @[registry_file.scala 228:39:@493.54]
  wire [31:0] _GEN_69; // @[registry_file.scala 225:39:@488.52]
  wire [31:0] _GEN_70; // @[registry_file.scala 222:39:@483.50]
  wire [31:0] _GEN_71; // @[registry_file.scala 219:39:@478.48]
  wire [31:0] _GEN_72; // @[registry_file.scala 216:39:@473.46]
  wire [31:0] _GEN_73; // @[registry_file.scala 213:39:@468.44]
  wire [31:0] _GEN_74; // @[registry_file.scala 210:39:@463.42]
  wire [31:0] _GEN_75; // @[registry_file.scala 207:39:@458.40]
  wire [31:0] _GEN_76; // @[registry_file.scala 204:39:@453.38]
  wire [31:0] _GEN_77; // @[registry_file.scala 201:39:@448.36]
  wire [31:0] _GEN_78; // @[registry_file.scala 198:39:@443.34]
  wire [31:0] _GEN_79; // @[registry_file.scala 195:39:@438.32]
  wire [31:0] _GEN_80; // @[registry_file.scala 192:39:@433.30]
  wire [31:0] _GEN_81; // @[registry_file.scala 189:39:@428.28]
  wire [31:0] _GEN_82; // @[registry_file.scala 186:39:@423.26]
  wire [31:0] _GEN_83; // @[registry_file.scala 183:39:@418.24]
  wire [31:0] _GEN_84; // @[registry_file.scala 180:38:@413.22]
  wire [31:0] _GEN_85; // @[registry_file.scala 177:38:@408.20]
  wire [31:0] _GEN_86; // @[registry_file.scala 174:38:@403.18]
  wire [31:0] _GEN_87; // @[registry_file.scala 171:38:@398.16]
  wire [31:0] _GEN_88; // @[registry_file.scala 168:38:@393.14]
  wire [31:0] _GEN_89; // @[registry_file.scala 165:38:@388.12]
  wire [31:0] _GEN_90; // @[registry_file.scala 162:38:@383.10]
  wire [31:0] _GEN_91; // @[registry_file.scala 159:39:@378.8]
  wire [31:0] _GEN_92; // @[registry_file.scala 157:39:@373.6]
  wire  _T_210; // @[registry_file.scala 252:25:@527.4]
  wire  _T_212; // @[registry_file.scala 255:30:@532.6]
  wire  _T_214; // @[registry_file.scala 258:30:@537.8]
  wire  _T_216; // @[registry_file.scala 261:30:@542.10]
  wire  _T_218; // @[registry_file.scala 264:30:@547.12]
  wire  _T_220; // @[registry_file.scala 267:30:@552.14]
  wire  _T_222; // @[registry_file.scala 270:30:@557.16]
  wire  _T_224; // @[registry_file.scala 273:30:@562.18]
  wire  _T_226; // @[registry_file.scala 276:30:@567.20]
  wire  _T_228; // @[registry_file.scala 279:30:@572.22]
  wire  _T_230; // @[registry_file.scala 282:30:@577.24]
  wire  _T_232; // @[registry_file.scala 285:30:@582.26]
  wire  _T_234; // @[registry_file.scala 288:30:@587.28]
  wire  _T_236; // @[registry_file.scala 291:30:@592.30]
  wire  _T_238; // @[registry_file.scala 294:30:@597.32]
  wire  _T_240; // @[registry_file.scala 297:30:@602.34]
  wire  _T_242; // @[registry_file.scala 300:30:@607.36]
  wire  _T_244; // @[registry_file.scala 303:30:@612.38]
  wire  _T_246; // @[registry_file.scala 306:30:@617.40]
  wire  _T_248; // @[registry_file.scala 309:30:@622.42]
  wire  _T_250; // @[registry_file.scala 312:30:@627.44]
  wire  _T_252; // @[registry_file.scala 315:30:@632.46]
  wire  _T_254; // @[registry_file.scala 318:30:@637.48]
  wire  _T_256; // @[registry_file.scala 321:30:@642.50]
  wire  _T_258; // @[registry_file.scala 324:30:@647.52]
  wire  _T_260; // @[registry_file.scala 327:30:@652.54]
  wire  _T_262; // @[registry_file.scala 330:30:@657.56]
  wire  _T_264; // @[registry_file.scala 333:30:@662.58]
  wire  _T_266; // @[registry_file.scala 336:30:@667.60]
  wire  _T_268; // @[registry_file.scala 339:30:@672.62]
  wire  _T_270; // @[registry_file.scala 342:30:@677.64]
  wire  _T_272; // @[registry_file.scala 345:30:@682.66]
  wire [31:0] _GEN_94; // @[registry_file.scala 345:39:@683.66]
  wire [31:0] _GEN_95; // @[registry_file.scala 342:39:@678.64]
  wire [31:0] _GEN_96; // @[registry_file.scala 339:39:@673.62]
  wire [31:0] _GEN_97; // @[registry_file.scala 336:39:@668.60]
  wire [31:0] _GEN_98; // @[registry_file.scala 333:39:@663.58]
  wire [31:0] _GEN_99; // @[registry_file.scala 330:39:@658.56]
  wire [31:0] _GEN_100; // @[registry_file.scala 327:39:@653.54]
  wire [31:0] _GEN_101; // @[registry_file.scala 324:39:@648.52]
  wire [31:0] _GEN_102; // @[registry_file.scala 321:39:@643.50]
  wire [31:0] _GEN_103; // @[registry_file.scala 318:39:@638.48]
  wire [31:0] _GEN_104; // @[registry_file.scala 315:39:@633.46]
  wire [31:0] _GEN_105; // @[registry_file.scala 312:39:@628.44]
  wire [31:0] _GEN_106; // @[registry_file.scala 309:39:@623.42]
  wire [31:0] _GEN_107; // @[registry_file.scala 306:39:@618.40]
  wire [31:0] _GEN_108; // @[registry_file.scala 303:39:@613.38]
  wire [31:0] _GEN_109; // @[registry_file.scala 300:39:@608.36]
  wire [31:0] _GEN_110; // @[registry_file.scala 297:39:@603.34]
  wire [31:0] _GEN_111; // @[registry_file.scala 294:39:@598.32]
  wire [31:0] _GEN_112; // @[registry_file.scala 291:39:@593.30]
  wire [31:0] _GEN_113; // @[registry_file.scala 288:39:@588.28]
  wire [31:0] _GEN_114; // @[registry_file.scala 285:39:@583.26]
  wire [31:0] _GEN_115; // @[registry_file.scala 282:39:@578.24]
  wire [31:0] _GEN_116; // @[registry_file.scala 279:38:@573.22]
  wire [31:0] _GEN_117; // @[registry_file.scala 276:38:@568.20]
  wire [31:0] _GEN_118; // @[registry_file.scala 273:38:@563.18]
  wire [31:0] _GEN_119; // @[registry_file.scala 270:38:@558.16]
  wire [31:0] _GEN_120; // @[registry_file.scala 267:38:@553.14]
  wire [31:0] _GEN_121; // @[registry_file.scala 264:38:@548.12]
  wire [31:0] _GEN_122; // @[registry_file.scala 261:38:@543.10]
  wire [31:0] _GEN_123; // @[registry_file.scala 258:38:@538.8]
  wire [31:0] _GEN_124; // @[registry_file.scala 255:38:@533.6]
  assign _T_84 = io_regInSelector == 5'h1; // @[registry_file.scala 57:29:@241.6]
  assign _GEN_0 = _T_84 ? io_regIn : Reg1; // @[registry_file.scala 57:37:@242.6]
  assign _T_86 = io_regInSelector == 5'h2; // @[registry_file.scala 60:29:@245.6]
  assign _GEN_1 = _T_86 ? io_regIn : Reg2; // @[registry_file.scala 60:37:@246.6]
  assign _T_88 = io_regInSelector == 5'h3; // @[registry_file.scala 63:29:@249.6]
  assign _GEN_2 = _T_88 ? io_regIn : Reg3; // @[registry_file.scala 63:37:@250.6]
  assign _T_90 = io_regInSelector == 5'h4; // @[registry_file.scala 66:29:@253.6]
  assign _GEN_3 = _T_90 ? io_regIn : Reg4; // @[registry_file.scala 66:37:@254.6]
  assign _T_92 = io_regInSelector == 5'h5; // @[registry_file.scala 69:29:@257.6]
  assign _GEN_4 = _T_92 ? io_regIn : Reg5; // @[registry_file.scala 69:37:@258.6]
  assign _T_94 = io_regInSelector == 5'h6; // @[registry_file.scala 72:29:@261.6]
  assign _GEN_5 = _T_94 ? io_regIn : Reg6; // @[registry_file.scala 72:37:@262.6]
  assign _T_96 = io_regInSelector == 5'h7; // @[registry_file.scala 75:29:@265.6]
  assign _GEN_6 = _T_96 ? io_regIn : Reg7; // @[registry_file.scala 75:37:@266.6]
  assign _T_98 = io_regInSelector == 5'h8; // @[registry_file.scala 78:29:@269.6]
  assign _GEN_7 = _T_98 ? io_regIn : Reg8; // @[registry_file.scala 78:37:@270.6]
  assign _T_100 = io_regInSelector == 5'h9; // @[registry_file.scala 81:29:@273.6]
  assign _GEN_8 = _T_100 ? io_regIn : Reg9; // @[registry_file.scala 81:37:@274.6]
  assign _T_102 = io_regInSelector == 5'ha; // @[registry_file.scala 84:29:@277.6]
  assign _GEN_9 = _T_102 ? io_regIn : Reg10; // @[registry_file.scala 84:38:@278.6]
  assign _T_104 = io_regInSelector == 5'hb; // @[registry_file.scala 87:29:@281.6]
  assign _GEN_10 = _T_104 ? io_regIn : Reg11; // @[registry_file.scala 87:38:@282.6]
  assign _T_106 = io_regInSelector == 5'hc; // @[registry_file.scala 90:29:@285.6]
  assign _GEN_11 = _T_106 ? io_regIn : Reg12; // @[registry_file.scala 90:38:@286.6]
  assign _T_108 = io_regInSelector == 5'hd; // @[registry_file.scala 93:29:@289.6]
  assign _GEN_12 = _T_108 ? io_regIn : Reg13; // @[registry_file.scala 93:38:@290.6]
  assign _T_110 = io_regInSelector == 5'he; // @[registry_file.scala 96:29:@293.6]
  assign _GEN_13 = _T_110 ? io_regIn : Reg14; // @[registry_file.scala 96:38:@294.6]
  assign _T_112 = io_regInSelector == 5'hf; // @[registry_file.scala 99:29:@297.6]
  assign _GEN_14 = _T_112 ? io_regIn : Reg15; // @[registry_file.scala 99:38:@298.6]
  assign _T_114 = io_regInSelector == 5'h10; // @[registry_file.scala 102:29:@301.6]
  assign _GEN_15 = _T_114 ? io_regIn : Reg16; // @[registry_file.scala 102:38:@302.6]
  assign _T_116 = io_regInSelector == 5'h11; // @[registry_file.scala 105:29:@305.6]
  assign _GEN_16 = _T_116 ? io_regIn : Reg17; // @[registry_file.scala 105:38:@306.6]
  assign _T_118 = io_regInSelector == 5'h12; // @[registry_file.scala 108:29:@309.6]
  assign _GEN_17 = _T_118 ? io_regIn : Reg18; // @[registry_file.scala 108:38:@310.6]
  assign _T_120 = io_regInSelector == 5'h13; // @[registry_file.scala 111:29:@313.6]
  assign _GEN_18 = _T_120 ? io_regIn : Reg19; // @[registry_file.scala 111:38:@314.6]
  assign _T_122 = io_regInSelector == 5'h14; // @[registry_file.scala 114:29:@317.6]
  assign _GEN_19 = _T_122 ? io_regIn : Reg20; // @[registry_file.scala 114:38:@318.6]
  assign _T_124 = io_regInSelector == 5'h15; // @[registry_file.scala 117:29:@321.6]
  assign _GEN_20 = _T_124 ? io_regIn : Reg21; // @[registry_file.scala 117:38:@322.6]
  assign _T_126 = io_regInSelector == 5'h16; // @[registry_file.scala 120:29:@325.6]
  assign _GEN_21 = _T_126 ? io_regIn : Reg22; // @[registry_file.scala 120:38:@326.6]
  assign _T_128 = io_regInSelector == 5'h17; // @[registry_file.scala 123:29:@329.6]
  assign _GEN_22 = _T_128 ? io_regIn : Reg23; // @[registry_file.scala 123:38:@330.6]
  assign _T_130 = io_regInSelector == 5'h18; // @[registry_file.scala 126:29:@333.6]
  assign _GEN_23 = _T_130 ? io_regIn : Reg24; // @[registry_file.scala 126:38:@334.6]
  assign _T_132 = io_regInSelector == 5'h19; // @[registry_file.scala 129:29:@337.6]
  assign _GEN_24 = _T_132 ? io_regIn : Reg25; // @[registry_file.scala 129:38:@338.6]
  assign _T_134 = io_regInSelector == 5'h1a; // @[registry_file.scala 132:29:@341.6]
  assign _GEN_25 = _T_134 ? io_regIn : Reg26; // @[registry_file.scala 132:38:@342.6]
  assign _T_136 = io_regInSelector == 5'h1b; // @[registry_file.scala 135:29:@345.6]
  assign _GEN_26 = _T_136 ? io_regIn : Reg27; // @[registry_file.scala 135:38:@346.6]
  assign _T_138 = io_regInSelector == 5'h1c; // @[registry_file.scala 138:29:@349.6]
  assign _GEN_27 = _T_138 ? io_regIn : Reg28; // @[registry_file.scala 138:38:@350.6]
  assign _T_140 = io_regInSelector == 5'h1d; // @[registry_file.scala 141:29:@353.6]
  assign _GEN_28 = _T_140 ? io_regIn : Reg29; // @[registry_file.scala 141:38:@354.6]
  assign _T_142 = io_regInSelector == 5'h1e; // @[registry_file.scala 144:29:@357.6]
  assign _GEN_29 = _T_142 ? io_regIn : Reg30; // @[registry_file.scala 144:38:@358.6]
  assign _T_144 = io_regInSelector == 5'h1f; // @[registry_file.scala 147:29:@361.6]
  assign _GEN_30 = _T_144 ? io_regIn : Reg31; // @[registry_file.scala 147:38:@362.6]
  assign _GEN_31 = io_writeEn ? _GEN_0 : Reg1; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_32 = io_writeEn ? _GEN_1 : Reg2; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_33 = io_writeEn ? _GEN_2 : Reg3; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_34 = io_writeEn ? _GEN_3 : Reg4; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_35 = io_writeEn ? _GEN_4 : Reg5; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_36 = io_writeEn ? _GEN_5 : Reg6; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_37 = io_writeEn ? _GEN_6 : Reg7; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_38 = io_writeEn ? _GEN_7 : Reg8; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_39 = io_writeEn ? _GEN_8 : Reg9; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_40 = io_writeEn ? _GEN_9 : Reg10; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_41 = io_writeEn ? _GEN_10 : Reg11; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_42 = io_writeEn ? _GEN_11 : Reg12; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_43 = io_writeEn ? _GEN_12 : Reg13; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_44 = io_writeEn ? _GEN_13 : Reg14; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_45 = io_writeEn ? _GEN_14 : Reg15; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_46 = io_writeEn ? _GEN_15 : Reg16; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_47 = io_writeEn ? _GEN_16 : Reg17; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_48 = io_writeEn ? _GEN_17 : Reg18; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_49 = io_writeEn ? _GEN_18 : Reg19; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_50 = io_writeEn ? _GEN_19 : Reg20; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_51 = io_writeEn ? _GEN_20 : Reg21; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_52 = io_writeEn ? _GEN_21 : Reg22; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_53 = io_writeEn ? _GEN_22 : Reg23; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_54 = io_writeEn ? _GEN_23 : Reg24; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_55 = io_writeEn ? _GEN_24 : Reg25; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_56 = io_writeEn ? _GEN_25 : Reg26; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_57 = io_writeEn ? _GEN_26 : Reg27; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_58 = io_writeEn ? _GEN_27 : Reg28; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_59 = io_writeEn ? _GEN_28 : Reg29; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_60 = io_writeEn ? _GEN_29 : Reg30; // @[registry_file.scala 56:20:@240.4]
  assign _GEN_61 = io_writeEn ? _GEN_30 : Reg31; // @[registry_file.scala 56:20:@240.4]
  assign _T_146 = io_reg1Selector == 5'h0; // @[registry_file.scala 155:25:@367.4]
  assign _T_148 = io_reg1Selector == 5'h1; // @[registry_file.scala 157:31:@372.6]
  assign _T_150 = io_reg1Selector == 5'h2; // @[registry_file.scala 159:31:@377.8]
  assign _T_152 = io_reg1Selector == 5'h3; // @[registry_file.scala 162:30:@382.10]
  assign _T_154 = io_reg1Selector == 5'h4; // @[registry_file.scala 165:30:@387.12]
  assign _T_156 = io_reg1Selector == 5'h5; // @[registry_file.scala 168:30:@392.14]
  assign _T_158 = io_reg1Selector == 5'h6; // @[registry_file.scala 171:30:@397.16]
  assign _T_160 = io_reg1Selector == 5'h7; // @[registry_file.scala 174:30:@402.18]
  assign _T_162 = io_reg1Selector == 5'h8; // @[registry_file.scala 177:30:@407.20]
  assign _T_164 = io_reg1Selector == 5'h9; // @[registry_file.scala 180:30:@412.22]
  assign _T_166 = io_reg1Selector == 5'ha; // @[registry_file.scala 183:30:@417.24]
  assign _T_168 = io_reg1Selector == 5'hb; // @[registry_file.scala 186:30:@422.26]
  assign _T_170 = io_reg1Selector == 5'hc; // @[registry_file.scala 189:30:@427.28]
  assign _T_172 = io_reg1Selector == 5'hd; // @[registry_file.scala 192:30:@432.30]
  assign _T_174 = io_reg1Selector == 5'he; // @[registry_file.scala 195:30:@437.32]
  assign _T_176 = io_reg1Selector == 5'hf; // @[registry_file.scala 198:30:@442.34]
  assign _T_178 = io_reg1Selector == 5'h10; // @[registry_file.scala 201:30:@447.36]
  assign _T_180 = io_reg1Selector == 5'h11; // @[registry_file.scala 204:30:@452.38]
  assign _T_182 = io_reg1Selector == 5'h12; // @[registry_file.scala 207:30:@457.40]
  assign _T_184 = io_reg1Selector == 5'h13; // @[registry_file.scala 210:30:@462.42]
  assign _T_186 = io_reg1Selector == 5'h14; // @[registry_file.scala 213:30:@467.44]
  assign _T_188 = io_reg1Selector == 5'h15; // @[registry_file.scala 216:30:@472.46]
  assign _T_190 = io_reg1Selector == 5'h16; // @[registry_file.scala 219:30:@477.48]
  assign _T_192 = io_reg1Selector == 5'h17; // @[registry_file.scala 222:30:@482.50]
  assign _T_194 = io_reg1Selector == 5'h18; // @[registry_file.scala 225:30:@487.52]
  assign _T_196 = io_reg1Selector == 5'h19; // @[registry_file.scala 228:30:@492.54]
  assign _T_198 = io_reg1Selector == 5'h1a; // @[registry_file.scala 231:30:@497.56]
  assign _T_200 = io_reg1Selector == 5'h1b; // @[registry_file.scala 234:30:@502.58]
  assign _T_202 = io_reg1Selector == 5'h1c; // @[registry_file.scala 237:30:@507.60]
  assign _T_204 = io_reg1Selector == 5'h1d; // @[registry_file.scala 240:30:@512.62]
  assign _T_206 = io_reg1Selector == 5'h1e; // @[registry_file.scala 243:30:@517.64]
  assign _T_208 = io_reg1Selector == 5'h1f; // @[registry_file.scala 246:30:@522.66]
  assign _GEN_62 = _T_208 ? Reg31 : 32'h0; // @[registry_file.scala 246:39:@523.66]
  assign _GEN_63 = _T_206 ? Reg30 : _GEN_62; // @[registry_file.scala 243:39:@518.64]
  assign _GEN_64 = _T_204 ? Reg29 : _GEN_63; // @[registry_file.scala 240:39:@513.62]
  assign _GEN_65 = _T_202 ? Reg28 : _GEN_64; // @[registry_file.scala 237:39:@508.60]
  assign _GEN_66 = _T_200 ? Reg27 : _GEN_65; // @[registry_file.scala 234:39:@503.58]
  assign _GEN_67 = _T_198 ? Reg26 : _GEN_66; // @[registry_file.scala 231:39:@498.56]
  assign _GEN_68 = _T_196 ? Reg25 : _GEN_67; // @[registry_file.scala 228:39:@493.54]
  assign _GEN_69 = _T_194 ? Reg24 : _GEN_68; // @[registry_file.scala 225:39:@488.52]
  assign _GEN_70 = _T_192 ? Reg23 : _GEN_69; // @[registry_file.scala 222:39:@483.50]
  assign _GEN_71 = _T_190 ? Reg22 : _GEN_70; // @[registry_file.scala 219:39:@478.48]
  assign _GEN_72 = _T_188 ? Reg21 : _GEN_71; // @[registry_file.scala 216:39:@473.46]
  assign _GEN_73 = _T_186 ? Reg20 : _GEN_72; // @[registry_file.scala 213:39:@468.44]
  assign _GEN_74 = _T_184 ? Reg19 : _GEN_73; // @[registry_file.scala 210:39:@463.42]
  assign _GEN_75 = _T_182 ? Reg18 : _GEN_74; // @[registry_file.scala 207:39:@458.40]
  assign _GEN_76 = _T_180 ? Reg17 : _GEN_75; // @[registry_file.scala 204:39:@453.38]
  assign _GEN_77 = _T_178 ? Reg16 : _GEN_76; // @[registry_file.scala 201:39:@448.36]
  assign _GEN_78 = _T_176 ? Reg15 : _GEN_77; // @[registry_file.scala 198:39:@443.34]
  assign _GEN_79 = _T_174 ? Reg14 : _GEN_78; // @[registry_file.scala 195:39:@438.32]
  assign _GEN_80 = _T_172 ? Reg13 : _GEN_79; // @[registry_file.scala 192:39:@433.30]
  assign _GEN_81 = _T_170 ? Reg12 : _GEN_80; // @[registry_file.scala 189:39:@428.28]
  assign _GEN_82 = _T_168 ? Reg11 : _GEN_81; // @[registry_file.scala 186:39:@423.26]
  assign _GEN_83 = _T_166 ? Reg10 : _GEN_82; // @[registry_file.scala 183:39:@418.24]
  assign _GEN_84 = _T_164 ? Reg9 : _GEN_83; // @[registry_file.scala 180:38:@413.22]
  assign _GEN_85 = _T_162 ? Reg8 : _GEN_84; // @[registry_file.scala 177:38:@408.20]
  assign _GEN_86 = _T_160 ? Reg7 : _GEN_85; // @[registry_file.scala 174:38:@403.18]
  assign _GEN_87 = _T_158 ? Reg6 : _GEN_86; // @[registry_file.scala 171:38:@398.16]
  assign _GEN_88 = _T_156 ? Reg5 : _GEN_87; // @[registry_file.scala 168:38:@393.14]
  assign _GEN_89 = _T_154 ? Reg4 : _GEN_88; // @[registry_file.scala 165:38:@388.12]
  assign _GEN_90 = _T_152 ? Reg3 : _GEN_89; // @[registry_file.scala 162:38:@383.10]
  assign _GEN_91 = _T_150 ? Reg2 : _GEN_90; // @[registry_file.scala 159:39:@378.8]
  assign _GEN_92 = _T_148 ? Reg1 : _GEN_91; // @[registry_file.scala 157:39:@373.6]
  assign _T_210 = io_reg2Selector == 5'h0; // @[registry_file.scala 252:25:@527.4]
  assign _T_212 = io_reg2Selector == 5'h1; // @[registry_file.scala 255:30:@532.6]
  assign _T_214 = io_reg2Selector == 5'h2; // @[registry_file.scala 258:30:@537.8]
  assign _T_216 = io_reg2Selector == 5'h3; // @[registry_file.scala 261:30:@542.10]
  assign _T_218 = io_reg2Selector == 5'h4; // @[registry_file.scala 264:30:@547.12]
  assign _T_220 = io_reg2Selector == 5'h5; // @[registry_file.scala 267:30:@552.14]
  assign _T_222 = io_reg2Selector == 5'h6; // @[registry_file.scala 270:30:@557.16]
  assign _T_224 = io_reg2Selector == 5'h7; // @[registry_file.scala 273:30:@562.18]
  assign _T_226 = io_reg2Selector == 5'h8; // @[registry_file.scala 276:30:@567.20]
  assign _T_228 = io_reg2Selector == 5'h9; // @[registry_file.scala 279:30:@572.22]
  assign _T_230 = io_reg2Selector == 5'ha; // @[registry_file.scala 282:30:@577.24]
  assign _T_232 = io_reg2Selector == 5'hb; // @[registry_file.scala 285:30:@582.26]
  assign _T_234 = io_reg2Selector == 5'hc; // @[registry_file.scala 288:30:@587.28]
  assign _T_236 = io_reg2Selector == 5'hd; // @[registry_file.scala 291:30:@592.30]
  assign _T_238 = io_reg2Selector == 5'he; // @[registry_file.scala 294:30:@597.32]
  assign _T_240 = io_reg2Selector == 5'hf; // @[registry_file.scala 297:30:@602.34]
  assign _T_242 = io_reg2Selector == 5'h10; // @[registry_file.scala 300:30:@607.36]
  assign _T_244 = io_reg2Selector == 5'h11; // @[registry_file.scala 303:30:@612.38]
  assign _T_246 = io_reg2Selector == 5'h12; // @[registry_file.scala 306:30:@617.40]
  assign _T_248 = io_reg2Selector == 5'h13; // @[registry_file.scala 309:30:@622.42]
  assign _T_250 = io_reg2Selector == 5'h14; // @[registry_file.scala 312:30:@627.44]
  assign _T_252 = io_reg2Selector == 5'h15; // @[registry_file.scala 315:30:@632.46]
  assign _T_254 = io_reg2Selector == 5'h16; // @[registry_file.scala 318:30:@637.48]
  assign _T_256 = io_reg2Selector == 5'h17; // @[registry_file.scala 321:30:@642.50]
  assign _T_258 = io_reg2Selector == 5'h18; // @[registry_file.scala 324:30:@647.52]
  assign _T_260 = io_reg2Selector == 5'h19; // @[registry_file.scala 327:30:@652.54]
  assign _T_262 = io_reg2Selector == 5'h1a; // @[registry_file.scala 330:30:@657.56]
  assign _T_264 = io_reg2Selector == 5'h1b; // @[registry_file.scala 333:30:@662.58]
  assign _T_266 = io_reg2Selector == 5'h1c; // @[registry_file.scala 336:30:@667.60]
  assign _T_268 = io_reg2Selector == 5'h1d; // @[registry_file.scala 339:30:@672.62]
  assign _T_270 = io_reg2Selector == 5'h1e; // @[registry_file.scala 342:30:@677.64]
  assign _T_272 = io_reg2Selector == 5'h1f; // @[registry_file.scala 345:30:@682.66]
  assign _GEN_94 = _T_272 ? Reg31 : 32'h0; // @[registry_file.scala 345:39:@683.66]
  assign _GEN_95 = _T_270 ? Reg30 : _GEN_94; // @[registry_file.scala 342:39:@678.64]
  assign _GEN_96 = _T_268 ? Reg29 : _GEN_95; // @[registry_file.scala 339:39:@673.62]
  assign _GEN_97 = _T_266 ? Reg28 : _GEN_96; // @[registry_file.scala 336:39:@668.60]
  assign _GEN_98 = _T_264 ? Reg27 : _GEN_97; // @[registry_file.scala 333:39:@663.58]
  assign _GEN_99 = _T_262 ? Reg26 : _GEN_98; // @[registry_file.scala 330:39:@658.56]
  assign _GEN_100 = _T_260 ? Reg25 : _GEN_99; // @[registry_file.scala 327:39:@653.54]
  assign _GEN_101 = _T_258 ? Reg24 : _GEN_100; // @[registry_file.scala 324:39:@648.52]
  assign _GEN_102 = _T_256 ? Reg23 : _GEN_101; // @[registry_file.scala 321:39:@643.50]
  assign _GEN_103 = _T_254 ? Reg22 : _GEN_102; // @[registry_file.scala 318:39:@638.48]
  assign _GEN_104 = _T_252 ? Reg21 : _GEN_103; // @[registry_file.scala 315:39:@633.46]
  assign _GEN_105 = _T_250 ? Reg20 : _GEN_104; // @[registry_file.scala 312:39:@628.44]
  assign _GEN_106 = _T_248 ? Reg19 : _GEN_105; // @[registry_file.scala 309:39:@623.42]
  assign _GEN_107 = _T_246 ? Reg18 : _GEN_106; // @[registry_file.scala 306:39:@618.40]
  assign _GEN_108 = _T_244 ? Reg17 : _GEN_107; // @[registry_file.scala 303:39:@613.38]
  assign _GEN_109 = _T_242 ? Reg16 : _GEN_108; // @[registry_file.scala 300:39:@608.36]
  assign _GEN_110 = _T_240 ? Reg15 : _GEN_109; // @[registry_file.scala 297:39:@603.34]
  assign _GEN_111 = _T_238 ? Reg14 : _GEN_110; // @[registry_file.scala 294:39:@598.32]
  assign _GEN_112 = _T_236 ? Reg13 : _GEN_111; // @[registry_file.scala 291:39:@593.30]
  assign _GEN_113 = _T_234 ? Reg12 : _GEN_112; // @[registry_file.scala 288:39:@588.28]
  assign _GEN_114 = _T_232 ? Reg11 : _GEN_113; // @[registry_file.scala 285:39:@583.26]
  assign _GEN_115 = _T_230 ? Reg10 : _GEN_114; // @[registry_file.scala 282:39:@578.24]
  assign _GEN_116 = _T_228 ? Reg9 : _GEN_115; // @[registry_file.scala 279:38:@573.22]
  assign _GEN_117 = _T_226 ? Reg8 : _GEN_116; // @[registry_file.scala 276:38:@568.20]
  assign _GEN_118 = _T_224 ? Reg7 : _GEN_117; // @[registry_file.scala 273:38:@563.18]
  assign _GEN_119 = _T_222 ? Reg6 : _GEN_118; // @[registry_file.scala 270:38:@558.16]
  assign _GEN_120 = _T_220 ? Reg5 : _GEN_119; // @[registry_file.scala 267:38:@553.14]
  assign _GEN_121 = _T_218 ? Reg4 : _GEN_120; // @[registry_file.scala 264:38:@548.12]
  assign _GEN_122 = _T_216 ? Reg3 : _GEN_121; // @[registry_file.scala 261:38:@543.10]
  assign _GEN_123 = _T_214 ? Reg2 : _GEN_122; // @[registry_file.scala 258:38:@538.8]
  assign _GEN_124 = _T_212 ? Reg1 : _GEN_123; // @[registry_file.scala 255:38:@533.6]
  assign io_regOut1 = _T_146 ? 32'h0 : _GEN_92; // @[registry_file.scala 153:20:@366.4 registry_file.scala 156:18:@369.6 registry_file.scala 158:18:@374.8 registry_file.scala 160:18:@379.10 registry_file.scala 163:18:@384.12 registry_file.scala 166:18:@389.14 registry_file.scala 169:18:@394.16 registry_file.scala 172:18:@399.18 registry_file.scala 175:18:@404.20 registry_file.scala 178:18:@409.22 registry_file.scala 181:18:@414.24 registry_file.scala 184:18:@419.26 registry_file.scala 187:18:@424.28 registry_file.scala 190:18:@429.30 registry_file.scala 193:18:@434.32 registry_file.scala 196:18:@439.34 registry_file.scala 199:18:@444.36 registry_file.scala 202:18:@449.38 registry_file.scala 205:18:@454.40 registry_file.scala 208:18:@459.42 registry_file.scala 211:18:@464.44 registry_file.scala 214:18:@469.46 registry_file.scala 217:18:@474.48 registry_file.scala 220:18:@479.50 registry_file.scala 223:18:@484.52 registry_file.scala 226:18:@489.54 registry_file.scala 229:18:@494.56 registry_file.scala 232:18:@499.58 registry_file.scala 235:18:@504.60 registry_file.scala 238:18:@509.62 registry_file.scala 241:18:@514.64 registry_file.scala 244:18:@519.66 registry_file.scala 247:18:@524.68]
  assign io_regOut2 = _T_210 ? 32'h0 : _GEN_124; // @[registry_file.scala 250:15:@526.4 registry_file.scala 253:20:@529.6 registry_file.scala 256:18:@534.8 registry_file.scala 259:18:@539.10 registry_file.scala 262:18:@544.12 registry_file.scala 265:18:@549.14 registry_file.scala 268:18:@554.16 registry_file.scala 271:18:@559.18 registry_file.scala 274:18:@564.20 registry_file.scala 277:18:@569.22 registry_file.scala 280:18:@574.24 registry_file.scala 283:18:@579.26 registry_file.scala 286:18:@584.28 registry_file.scala 289:18:@589.30 registry_file.scala 292:18:@594.32 registry_file.scala 295:18:@599.34 registry_file.scala 298:18:@604.36 registry_file.scala 301:18:@609.38 registry_file.scala 304:18:@614.40 registry_file.scala 307:18:@619.42 registry_file.scala 310:18:@624.44 registry_file.scala 313:18:@629.46 registry_file.scala 316:18:@634.48 registry_file.scala 319:18:@639.50 registry_file.scala 322:18:@644.52 registry_file.scala 325:18:@649.54 registry_file.scala 328:18:@654.56 registry_file.scala 331:18:@659.58 registry_file.scala 334:18:@664.60 registry_file.scala 337:18:@669.62 registry_file.scala 340:18:@674.64 registry_file.scala 343:18:@679.66 registry_file.scala 346:18:@684.68]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  Reg1 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  Reg2 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  Reg3 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  Reg4 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  Reg5 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  Reg6 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  Reg7 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  Reg8 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  Reg9 = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  Reg10 = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  Reg11 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  Reg12 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  Reg13 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  Reg14 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  Reg15 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  Reg16 = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  Reg17 = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  Reg18 = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  Reg19 = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  Reg20 = _RAND_19[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  Reg21 = _RAND_20[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  Reg22 = _RAND_21[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  Reg23 = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  Reg24 = _RAND_23[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  Reg25 = _RAND_24[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  Reg26 = _RAND_25[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  Reg27 = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  Reg28 = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  Reg29 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  Reg30 = _RAND_29[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  Reg31 = _RAND_30[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      Reg1 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_84) begin
          Reg1 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg2 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_86) begin
          Reg2 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg3 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_88) begin
          Reg3 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg4 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_90) begin
          Reg4 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg5 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_92) begin
          Reg5 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg6 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_94) begin
          Reg6 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg7 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_96) begin
          Reg7 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg8 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_98) begin
          Reg8 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg9 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_100) begin
          Reg9 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg10 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_102) begin
          Reg10 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg11 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_104) begin
          Reg11 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg12 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_106) begin
          Reg12 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg13 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_108) begin
          Reg13 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg14 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_110) begin
          Reg14 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg15 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_112) begin
          Reg15 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg16 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_114) begin
          Reg16 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg17 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_116) begin
          Reg17 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg18 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_118) begin
          Reg18 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg19 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_120) begin
          Reg19 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg20 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_122) begin
          Reg20 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg21 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_124) begin
          Reg21 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg22 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_126) begin
          Reg22 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg23 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_128) begin
          Reg23 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg24 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_130) begin
          Reg24 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg25 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_132) begin
          Reg25 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg26 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_134) begin
          Reg26 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg27 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_136) begin
          Reg27 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg28 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_138) begin
          Reg28 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg29 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_140) begin
          Reg29 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg30 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_142) begin
          Reg30 <= io_regIn;
        end
      end
    end
    if (reset) begin
      Reg31 <= 32'h0;
    end else begin
      if (io_writeEn) begin
        if (_T_144) begin
          Reg31 <= io_regIn;
        end
      end
    end
  end
endmodule
module ALU32( // @[:@687.2]
  input  [9:0]  io_funct, // @[:@690.4]
  input  [31:0] io_A, // @[:@690.4]
  input  [31:0] io_B, // @[:@690.4]
  output [31:0] io_res // @[:@690.4]
);
  wire [32:0] _T_33; // @[alu.scala 31:17:@712.4]
  wire [31:0] resTemp1; // @[alu.scala 31:17:@713.4]
  wire [32:0] _T_35; // @[alu.scala 32:17:@715.4]
  wire [32:0] _T_36; // @[alu.scala 32:17:@716.4]
  wire [31:0] resTemp2; // @[alu.scala 32:17:@717.4]
  wire [4:0] _T_38; // @[alu.scala 33:22:@719.4]
  wire [62:0] _GEN_10; // @[alu.scala 33:18:@720.4]
  wire [62:0] _T_39; // @[alu.scala 33:18:@720.4]
  wire [31:0] _T_40; // @[alu.scala 34:18:@722.4]
  wire [31:0] _T_41; // @[alu.scala 34:29:@723.4]
  wire  _T_42; // @[alu.scala 34:25:@724.4]
  wire  _T_43; // @[alu.scala 35:18:@726.4]
  wire [31:0] resTemp6; // @[alu.scala 36:18:@728.4]
  wire [31:0] resTemp7; // @[alu.scala 37:18:@731.4]
  wire [31:0] _T_49; // @[alu.scala 38:26:@735.4]
  wire [31:0] resTemp8; // @[alu.scala 38:37:@736.4]
  wire [31:0] resTemp9; // @[alu.scala 39:18:@738.4]
  wire [31:0] resTemp10; // @[alu.scala 40:19:@740.4]
  wire  _T_54; // @[alu.scala 42:18:@742.4]
  wire  _T_56; // @[alu.scala 45:24:@747.6]
  wire  _T_58; // @[alu.scala 48:24:@752.8]
  wire  _T_60; // @[alu.scala 51:24:@757.10]
  wire  _T_62; // @[alu.scala 54:24:@762.12]
  wire  _T_64; // @[alu.scala 57:24:@767.14]
  wire  _T_66; // @[alu.scala 60:24:@772.16]
  wire  _T_68; // @[alu.scala 63:24:@777.18]
  wire  _T_70; // @[alu.scala 66:24:@782.20]
  wire  _T_72; // @[alu.scala 69:24:@787.22]
  wire [31:0] _GEN_0; // @[alu.scala 69:44:@788.22]
  wire [31:0] _GEN_1; // @[alu.scala 66:44:@783.20]
  wire [31:0] _GEN_2; // @[alu.scala 63:44:@778.18]
  wire [31:0] _GEN_3; // @[alu.scala 60:44:@773.16]
  wire [31:0] _GEN_4; // @[alu.scala 57:44:@768.14]
  wire [31:0] resTemp5; // @[:@700.4 :@701.4 alu.scala 35:13:@727.4]
  wire [31:0] _GEN_5; // @[alu.scala 54:44:@763.12]
  wire [31:0] resTemp4; // @[:@698.4 :@699.4 alu.scala 34:13:@725.4]
  wire [31:0] _GEN_6; // @[alu.scala 51:44:@758.10]
  wire [31:0] resTemp3; // @[:@696.4 :@697.4 alu.scala 33:13:@721.4]
  wire [31:0] _GEN_7; // @[alu.scala 48:44:@753.8]
  wire [31:0] _GEN_8; // @[alu.scala 45:44:@748.6]
  assign _T_33 = io_A + io_B; // @[alu.scala 31:17:@712.4]
  assign resTemp1 = _T_33[31:0]; // @[alu.scala 31:17:@713.4]
  assign _T_35 = io_A - io_B; // @[alu.scala 32:17:@715.4]
  assign _T_36 = $unsigned(_T_35); // @[alu.scala 32:17:@716.4]
  assign resTemp2 = _T_36[31:0]; // @[alu.scala 32:17:@717.4]
  assign _T_38 = io_B[4:0]; // @[alu.scala 33:22:@719.4]
  assign _GEN_10 = {{31'd0}, io_A}; // @[alu.scala 33:18:@720.4]
  assign _T_39 = _GEN_10 << _T_38; // @[alu.scala 33:18:@720.4]
  assign _T_40 = $signed(io_A); // @[alu.scala 34:18:@722.4]
  assign _T_41 = $signed(io_B); // @[alu.scala 34:29:@723.4]
  assign _T_42 = $signed(_T_40) < $signed(_T_41); // @[alu.scala 34:25:@724.4]
  assign _T_43 = io_A < io_B; // @[alu.scala 35:18:@726.4]
  assign resTemp6 = io_A ^ io_B; // @[alu.scala 36:18:@728.4]
  assign resTemp7 = io_A >> _T_38; // @[alu.scala 37:18:@731.4]
  assign _T_49 = $signed(_T_40) >>> _T_38; // @[alu.scala 38:26:@735.4]
  assign resTemp8 = $unsigned(_T_49); // @[alu.scala 38:37:@736.4]
  assign resTemp9 = io_A | io_B; // @[alu.scala 39:18:@738.4]
  assign resTemp10 = io_A & io_B; // @[alu.scala 40:19:@740.4]
  assign _T_54 = io_funct == 10'h0; // @[alu.scala 42:18:@742.4]
  assign _T_56 = io_funct == 10'h100; // @[alu.scala 45:24:@747.6]
  assign _T_58 = io_funct == 10'h1; // @[alu.scala 48:24:@752.8]
  assign _T_60 = io_funct == 10'h2; // @[alu.scala 51:24:@757.10]
  assign _T_62 = io_funct == 10'h3; // @[alu.scala 54:24:@762.12]
  assign _T_64 = io_funct == 10'h4; // @[alu.scala 57:24:@767.14]
  assign _T_66 = io_funct == 10'h5; // @[alu.scala 60:24:@772.16]
  assign _T_68 = io_funct == 10'h105; // @[alu.scala 63:24:@777.18]
  assign _T_70 = io_funct == 10'h6; // @[alu.scala 66:24:@782.20]
  assign _T_72 = io_funct == 10'h7; // @[alu.scala 69:24:@787.22]
  assign _GEN_0 = _T_72 ? resTemp10 : 32'h0; // @[alu.scala 69:44:@788.22]
  assign _GEN_1 = _T_70 ? resTemp9 : _GEN_0; // @[alu.scala 66:44:@783.20]
  assign _GEN_2 = _T_68 ? resTemp8 : _GEN_1; // @[alu.scala 63:44:@778.18]
  assign _GEN_3 = _T_66 ? resTemp7 : _GEN_2; // @[alu.scala 60:44:@773.16]
  assign _GEN_4 = _T_64 ? resTemp6 : _GEN_3; // @[alu.scala 57:44:@768.14]
  assign resTemp5 = {{31'd0}, _T_43}; // @[:@700.4 :@701.4 alu.scala 35:13:@727.4]
  assign _GEN_5 = _T_62 ? resTemp5 : _GEN_4; // @[alu.scala 54:44:@763.12]
  assign resTemp4 = {{31'd0}, _T_42}; // @[:@698.4 :@699.4 alu.scala 34:13:@725.4]
  assign _GEN_6 = _T_60 ? resTemp4 : _GEN_5; // @[alu.scala 51:44:@758.10]
  assign resTemp3 = _T_39[31:0]; // @[:@696.4 :@697.4 alu.scala 33:13:@721.4]
  assign _GEN_7 = _T_58 ? resTemp3 : _GEN_6; // @[alu.scala 48:44:@753.8]
  assign _GEN_8 = _T_56 ? resTemp2 : _GEN_7; // @[alu.scala 45:44:@748.6]
  assign io_res = _T_54 ? resTemp1 : _GEN_8; // @[alu.scala 44:13:@744.6 alu.scala 47:13:@749.8 alu.scala 50:13:@754.10 alu.scala 53:13:@759.12 alu.scala 56:13:@764.14 alu.scala 59:13:@769.16 alu.scala 62:13:@774.18 alu.scala 65:13:@779.20 alu.scala 68:13:@784.22 alu.scala 71:13:@789.24 alu.scala 73:13:@792.24]
endmodule
module rv32EX( // @[:@795.2]
  output        io_cond, // @[:@798.4]
  output [31:0] io_res, // @[:@798.4]
  input  [9:0]  io_funct, // @[:@798.4]
  input  [31:0] io_reg1, // @[:@798.4]
  input  [31:0] io_reg2, // @[:@798.4]
  input  [31:0] io_immidiate, // @[:@798.4]
  input  [31:0] io_NPCIn, // @[:@798.4]
  input  [31:0] io_instrIn // @[:@798.4]
);
  wire [9:0] alu_io_funct; // @[execute.scala 18:21:@800.4]
  wire [31:0] alu_io_A; // @[execute.scala 18:21:@800.4]
  wire [31:0] alu_io_B; // @[execute.scala 18:21:@800.4]
  wire [31:0] alu_io_res; // @[execute.scala 18:21:@800.4]
  wire [6:0] _T_28; // @[execute.scala 28:19:@810.4]
  wire  _T_29; // @[execute.scala 28:25:@811.4]
  wire  _T_31; // @[execute.scala 28:62:@813.4]
  wire  _T_32; // @[execute.scala 28:43:@814.4]
  wire  _T_34; // @[execute.scala 28:98:@816.4]
  wire  _T_35; // @[execute.scala 28:79:@817.4]
  wire  _T_38; // @[execute.scala 33:25:@822.4]
  wire [2:0] _T_41; // @[execute.scala 36:23:@826.6]
  wire  _T_43; // @[execute.scala 36:32:@827.6]
  wire  _T_44; // @[execute.scala 37:31:@829.8]
  wire  _GEN_1; // @[execute.scala 36:45:@828.6]
  wire  _T_47; // @[execute.scala 39:32:@833.6]
  wire  _T_48; // @[execute.scala 40:31:@835.8]
  wire  _GEN_2; // @[execute.scala 39:45:@834.6]
  wire  _T_51; // @[execute.scala 42:32:@839.6]
  wire [31:0] _T_52; // @[execute.scala 43:31:@841.8]
  wire [31:0] _T_53; // @[execute.scala 43:48:@842.8]
  wire  _T_54; // @[execute.scala 43:38:@843.8]
  wire  _GEN_3; // @[execute.scala 42:45:@840.6]
  wire  _T_57; // @[execute.scala 45:32:@847.6]
  wire  _T_62; // @[execute.scala 46:23:@852.8]
  wire  _GEN_4; // @[execute.scala 45:45:@848.6]
  wire  _T_65; // @[execute.scala 48:32:@856.6]
  wire  _T_66; // @[execute.scala 49:31:@858.8]
  wire  _GEN_5; // @[execute.scala 48:45:@857.6]
  wire  _T_69; // @[execute.scala 51:32:@862.6]
  wire  _T_72; // @[execute.scala 52:23:@865.8]
  wire  _GEN_6; // @[execute.scala 51:45:@863.6]
  wire  _GEN_7; // @[execute.scala 33:43:@823.4]
  wire  _T_74; // @[execute.scala 56:25:@870.4]
  wire  _GEN_10; // @[execute.scala 56:40:@871.4]
  wire  _GEN_11; // @[execute.scala 56:40:@871.4]
  wire  _T_78; // @[execute.scala 61:25:@876.4]
  wire  _GEN_12; // @[execute.scala 61:41:@877.4]
  wire  _T_81; // @[execute.scala 66:25:@881.4]
  wire  _GEN_13; // @[execute.scala 66:40:@882.4]
  wire  _T_84; // @[execute.scala 70:25:@886.4]
  wire  useImmidiate; // @[execute.scala 70:42:@887.4]
  wire  useNPCIn; // @[execute.scala 70:42:@887.4]
  ALU32 alu ( // @[execute.scala 18:21:@800.4]
    .io_funct(alu_io_funct),
    .io_A(alu_io_A),
    .io_B(alu_io_B),
    .io_res(alu_io_res)
  );
  assign _T_28 = io_instrIn[6:0]; // @[execute.scala 28:19:@810.4]
  assign _T_29 = _T_28 == 7'h13; // @[execute.scala 28:25:@811.4]
  assign _T_31 = _T_28 == 7'h23; // @[execute.scala 28:62:@813.4]
  assign _T_32 = _T_29 | _T_31; // @[execute.scala 28:43:@814.4]
  assign _T_34 = _T_28 == 7'h3; // @[execute.scala 28:98:@816.4]
  assign _T_35 = _T_32 | _T_34; // @[execute.scala 28:79:@817.4]
  assign _T_38 = _T_28 == 7'h63; // @[execute.scala 33:25:@822.4]
  assign _T_41 = io_instrIn[14:12]; // @[execute.scala 36:23:@826.6]
  assign _T_43 = _T_41 == 3'h0; // @[execute.scala 36:32:@827.6]
  assign _T_44 = io_reg1 == io_reg2; // @[execute.scala 37:31:@829.8]
  assign _GEN_1 = _T_43 ? _T_44 : 1'h0; // @[execute.scala 36:45:@828.6]
  assign _T_47 = _T_41 == 3'h1; // @[execute.scala 39:32:@833.6]
  assign _T_48 = io_reg1 != io_reg2; // @[execute.scala 40:31:@835.8]
  assign _GEN_2 = _T_47 ? _T_48 : _GEN_1; // @[execute.scala 39:45:@834.6]
  assign _T_51 = _T_41 == 3'h4; // @[execute.scala 42:32:@839.6]
  assign _T_52 = $signed(io_reg1); // @[execute.scala 43:31:@841.8]
  assign _T_53 = $signed(io_reg2); // @[execute.scala 43:48:@842.8]
  assign _T_54 = $signed(_T_52) < $signed(_T_53); // @[execute.scala 43:38:@843.8]
  assign _GEN_3 = _T_51 ? _T_54 : _GEN_2; // @[execute.scala 42:45:@840.6]
  assign _T_57 = _T_41 == 3'h5; // @[execute.scala 45:32:@847.6]
  assign _T_62 = _T_54 == 1'h0; // @[execute.scala 46:23:@852.8]
  assign _GEN_4 = _T_57 ? _T_62 : _GEN_3; // @[execute.scala 45:45:@848.6]
  assign _T_65 = _T_41 == 3'h6; // @[execute.scala 48:32:@856.6]
  assign _T_66 = io_reg1 < io_reg2; // @[execute.scala 49:31:@858.8]
  assign _GEN_5 = _T_65 ? _T_66 : _GEN_4; // @[execute.scala 48:45:@857.6]
  assign _T_69 = _T_41 == 3'h7; // @[execute.scala 51:32:@862.6]
  assign _T_72 = _T_66 == 1'h0; // @[execute.scala 52:23:@865.8]
  assign _GEN_6 = _T_69 ? _T_72 : _GEN_5; // @[execute.scala 51:45:@863.6]
  assign _GEN_7 = _T_38 ? 1'h1 : _T_35; // @[execute.scala 33:43:@823.4]
  assign _T_74 = _T_28 == 7'h6f; // @[execute.scala 56:25:@870.4]
  assign _GEN_10 = _T_74 ? 1'h1 : _GEN_7; // @[execute.scala 56:40:@871.4]
  assign _GEN_11 = _T_74 ? 1'h1 : _T_38; // @[execute.scala 56:40:@871.4]
  assign _T_78 = _T_28 == 7'h67; // @[execute.scala 61:25:@876.4]
  assign _GEN_12 = _T_78 ? 1'h1 : _GEN_10; // @[execute.scala 61:41:@877.4]
  assign _T_81 = _T_28 == 7'h37; // @[execute.scala 66:25:@881.4]
  assign _GEN_13 = _T_81 ? 1'h1 : _GEN_12; // @[execute.scala 66:40:@882.4]
  assign _T_84 = _T_28 == 7'h17; // @[execute.scala 70:25:@886.4]
  assign useImmidiate = _T_84 ? 1'h1 : _GEN_13; // @[execute.scala 70:42:@887.4]
  assign useNPCIn = _T_84 ? 1'h1 : _GEN_11; // @[execute.scala 70:42:@887.4]
  assign io_cond = _T_38 ? _GEN_6 : 1'h0; // @[execute.scala 25:12:@809.4 execute.scala 37:20:@830.8 execute.scala 40:20:@836.8 execute.scala 43:20:@844.8 execute.scala 46:20:@853.8 execute.scala 49:20:@859.8 execute.scala 52:20:@866.8]
  assign io_res = alu_io_res; // @[execute.scala 83:17:@896.4]
  assign alu_io_funct = io_funct; // @[execute.scala 80:17:@893.4]
  assign alu_io_A = useNPCIn ? io_NPCIn : io_reg1; // @[execute.scala 81:17:@894.4]
  assign alu_io_B = useImmidiate ? io_immidiate : io_reg2; // @[execute.scala 82:17:@895.4]
endmodule
module rv32MEM( // @[:@898.2]
  input  [31:0] io_addrIn, // @[:@901.4]
  input  [31:0] io_dataIn, // @[:@901.4]
  output [31:0] io_dataOut, // @[:@901.4]
  input  [31:0] io_instrIn, // @[:@901.4]
  output [31:0] io_addrOutPipeline, // @[:@901.4]
  output [31:0] io_dataOutPipeline, // @[:@901.4]
  input  [31:0] io_dataInPipeline, // @[:@901.4]
  output        io_WE // @[:@901.4]
);
  wire [6:0] _T_22; // @[memory.scala 25:19:@907.4]
  assign _T_22 = io_instrIn[6:0]; // @[memory.scala 25:19:@907.4]
  assign io_dataOut = io_dataInPipeline; // @[memory.scala 23:23:@906.4]
  assign io_addrOutPipeline = io_addrIn; // @[memory.scala 21:23:@904.4]
  assign io_dataOutPipeline = io_dataIn; // @[memory.scala 22:23:@905.4]
  assign io_WE = _T_22 == 7'h23; // @[memory.scala 19:10:@903.4 memory.scala 26:12:@910.6]
endmodule
module rv32WB( // @[:@913.2]
  input  [31:0] io_instrIn, // @[:@916.4]
  input  [31:0] io_res, // @[:@916.4]
  input  [31:0] io_dataIn, // @[:@916.4]
  input  [31:0] io_NPCIn, // @[:@916.4]
  output [31:0] io_dataToReg, // @[:@916.4]
  output [4:0]  io_regInSelector, // @[:@916.4]
  output        io_writeRegister // @[:@916.4]
);
  wire [6:0] _T_21; // @[write_back.scala 20:19:@921.4]
  wire  _T_22; // @[write_back.scala 20:25:@922.4]
  wire  _T_24; // @[write_back.scala 20:62:@924.4]
  wire  _T_25; // @[write_back.scala 20:43:@925.4]
  wire  _T_27; // @[write_back.scala 20:99:@927.4]
  wire  _T_28; // @[write_back.scala 20:80:@928.4]
  wire  _T_30; // @[write_back.scala 20:134:@930.4]
  wire  _T_31; // @[write_back.scala 20:115:@931.4]
  wire  _T_33; // @[write_back.scala 21:25:@933.4]
  wire  _T_34; // @[write_back.scala 20:149:@934.4]
  wire  _T_36; // @[write_back.scala 21:61:@936.4]
  wire  _T_37; // @[write_back.scala 21:42:@937.4]
  wire  _T_39; // @[write_back.scala 21:95:@939.4]
  wire  _T_49; // @[write_back.scala 25:80:@951.4]
  wire  _T_52; // @[write_back.scala 25:114:@954.4]
  wire  _T_57; // @[write_back.scala 28:46:@963.6]
  wire [31:0] _GEN_1; // @[write_back.scala 28:81:@964.6]
  assign _T_21 = io_instrIn[6:0]; // @[write_back.scala 20:19:@921.4]
  assign _T_22 = _T_21 == 7'h13; // @[write_back.scala 20:25:@922.4]
  assign _T_24 = _T_21 == 7'h33; // @[write_back.scala 20:62:@924.4]
  assign _T_25 = _T_22 | _T_24; // @[write_back.scala 20:43:@925.4]
  assign _T_27 = _T_21 == 7'h3; // @[write_back.scala 20:99:@927.4]
  assign _T_28 = _T_25 | _T_27; // @[write_back.scala 20:80:@928.4]
  assign _T_30 = _T_21 == 7'h37; // @[write_back.scala 20:134:@930.4]
  assign _T_31 = _T_28 | _T_30; // @[write_back.scala 20:115:@931.4]
  assign _T_33 = _T_21 == 7'h17; // @[write_back.scala 21:25:@933.4]
  assign _T_34 = _T_31 | _T_33; // @[write_back.scala 20:149:@934.4]
  assign _T_36 = _T_21 == 7'h6f; // @[write_back.scala 21:61:@936.4]
  assign _T_37 = _T_34 | _T_36; // @[write_back.scala 21:42:@937.4]
  assign _T_39 = _T_21 == 7'h67; // @[write_back.scala 21:95:@939.4]
  assign _T_49 = _T_25 | _T_30; // @[write_back.scala 25:80:@951.4]
  assign _T_52 = _T_49 | _T_33; // @[write_back.scala 25:114:@954.4]
  assign _T_57 = _T_36 | _T_39; // @[write_back.scala 28:46:@963.6]
  assign _GEN_1 = _T_57 ? io_NPCIn : io_dataIn; // @[write_back.scala 28:81:@964.6]
  assign io_dataToReg = _T_52 ? io_res : _GEN_1; // @[write_back.scala 27:20:@956.6 write_back.scala 29:20:@965.8 write_back.scala 31:20:@968.8]
  assign io_regInSelector = io_instrIn[11:7]; // @[write_back.scala 18:21:@920.4]
  assign io_writeRegister = _T_37 | _T_39; // @[write_back.scala 17:21:@918.4 write_back.scala 22:24:@942.6]
endmodule
module ForwardingUnit( // @[:@971.2]
  input  [31:0] io_id_ex_inst, // @[:@974.4]
  input  [31:0] io_ex_mem_inst, // @[:@974.4]
  input  [31:0] io_mem_wb_inst, // @[:@974.4]
  output [1:0]  io_forward_A, // @[:@974.4]
  output [1:0]  io_forward_B // @[:@974.4]
);
  wire [4:0] id_ex_rs1; // @[forwarding_unit.scala 20:30:@984.4]
  wire [4:0] id_ex_rs2; // @[forwarding_unit.scala 21:30:@986.4]
  wire [4:0] ex_mem_rd; // @[forwarding_unit.scala 22:31:@988.4]
  wire [4:0] mem_wb_rd; // @[forwarding_unit.scala 23:31:@990.4]
  wire [6:0] _T_29; // @[forwarding_unit.scala 29:24:@994.4]
  wire  _T_30; // @[forwarding_unit.scala 29:30:@995.4]
  wire  _T_32; // @[forwarding_unit.scala 29:70:@997.4]
  wire  _T_33; // @[forwarding_unit.scala 29:46:@998.4]
  wire  _T_35; // @[forwarding_unit.scala 29:112:@1000.4]
  wire  _T_36; // @[forwarding_unit.scala 29:88:@1001.4]
  wire  _T_38; // @[forwarding_unit.scala 29:152:@1003.4]
  wire  _T_39; // @[forwarding_unit.scala 29:128:@1004.4]
  wire  _T_41; // @[forwarding_unit.scala 30:51:@1006.4]
  wire  _T_42; // @[forwarding_unit.scala 30:25:@1007.4]
  wire  _T_44; // @[forwarding_unit.scala 30:94:@1009.4]
  wire  ex_mem_inst_rd; // @[forwarding_unit.scala 30:70:@1010.4]
  wire [6:0] _T_49; // @[forwarding_unit.scala 39:24:@1016.4]
  wire  _T_50; // @[forwarding_unit.scala 39:30:@1017.4]
  wire  _T_52; // @[forwarding_unit.scala 39:70:@1019.4]
  wire  _T_53; // @[forwarding_unit.scala 39:46:@1020.4]
  wire  _T_55; // @[forwarding_unit.scala 39:112:@1022.4]
  wire  _T_56; // @[forwarding_unit.scala 39:88:@1023.4]
  wire  _T_58; // @[forwarding_unit.scala 39:152:@1025.4]
  wire  _T_59; // @[forwarding_unit.scala 39:128:@1026.4]
  wire  _T_61; // @[forwarding_unit.scala 40:49:@1028.4]
  wire  _T_62; // @[forwarding_unit.scala 40:25:@1029.4]
  wire  _T_64; // @[forwarding_unit.scala 40:91:@1031.4]
  wire  _T_65; // @[forwarding_unit.scala 40:66:@1032.4]
  wire  _T_67; // @[forwarding_unit.scala 40:134:@1034.4]
  wire  mem_wb_inst_rd; // @[forwarding_unit.scala 40:110:@1035.4]
  wire [6:0] _T_72; // @[forwarding_unit.scala 48:23:@1041.4]
  wire  _T_73; // @[forwarding_unit.scala 48:29:@1042.4]
  wire  _T_75; // @[forwarding_unit.scala 48:71:@1044.4]
  wire  _T_76; // @[forwarding_unit.scala 48:48:@1045.4]
  wire  _T_78; // @[forwarding_unit.scala 49:29:@1047.4]
  wire  _T_79; // @[forwarding_unit.scala 48:90:@1048.4]
  wire  _T_81; // @[forwarding_unit.scala 49:69:@1050.4]
  wire  _T_82; // @[forwarding_unit.scala 49:46:@1051.4]
  wire  _T_84; // @[forwarding_unit.scala 49:110:@1053.4]
  wire  uses_rs1; // @[forwarding_unit.scala 49:87:@1054.4]
  wire  uses_rs2; // @[forwarding_unit.scala 57:48:@1064.4]
  wire  _T_95; // @[forwarding_unit.scala 61:24:@1068.4]
  wire  _T_96; // @[forwarding_unit.scala 61:49:@1069.4]
  wire  _T_97; // @[forwarding_unit.scala 61:36:@1070.4]
  wire  _T_99; // @[forwarding_unit.scala 61:76:@1071.4]
  wire  _T_100; // @[forwarding_unit.scala 61:63:@1072.4]
  wire  _T_102; // @[forwarding_unit.scala 63:30:@1077.6]
  wire  _T_103; // @[forwarding_unit.scala 63:55:@1078.6]
  wire  _T_104; // @[forwarding_unit.scala 63:42:@1079.6]
  wire  _T_107; // @[forwarding_unit.scala 63:69:@1081.6]
  wire  _T_110; // @[forwarding_unit.scala 69:24:@1088.4]
  wire  _T_112; // @[forwarding_unit.scala 69:60:@1090.4]
  wire  _T_113; // @[forwarding_unit.scala 69:36:@1091.4]
  wire  _T_116; // @[forwarding_unit.scala 69:98:@1093.4]
  wire  _T_117; // @[forwarding_unit.scala 69:74:@1094.4]
  wire  _T_119; // @[forwarding_unit.scala 71:30:@1099.6]
  wire  _T_121; // @[forwarding_unit.scala 71:66:@1101.6]
  wire  _T_122; // @[forwarding_unit.scala 71:42:@1102.6]
  wire  _T_126; // @[forwarding_unit.scala 71:80:@1105.6]
  assign id_ex_rs1 = io_id_ex_inst[19:15]; // @[forwarding_unit.scala 20:30:@984.4]
  assign id_ex_rs2 = io_id_ex_inst[24:20]; // @[forwarding_unit.scala 21:30:@986.4]
  assign ex_mem_rd = io_ex_mem_inst[11:7]; // @[forwarding_unit.scala 22:31:@988.4]
  assign mem_wb_rd = io_mem_wb_inst[11:7]; // @[forwarding_unit.scala 23:31:@990.4]
  assign _T_29 = io_ex_mem_inst[6:0]; // @[forwarding_unit.scala 29:24:@994.4]
  assign _T_30 = _T_29 == 7'h37; // @[forwarding_unit.scala 29:30:@995.4]
  assign _T_32 = _T_29 == 7'h17; // @[forwarding_unit.scala 29:70:@997.4]
  assign _T_33 = _T_30 | _T_32; // @[forwarding_unit.scala 29:46:@998.4]
  assign _T_35 = _T_29 == 7'h6f; // @[forwarding_unit.scala 29:112:@1000.4]
  assign _T_36 = _T_33 | _T_35; // @[forwarding_unit.scala 29:88:@1001.4]
  assign _T_38 = _T_29 == 7'h67; // @[forwarding_unit.scala 29:152:@1003.4]
  assign _T_39 = _T_36 | _T_38; // @[forwarding_unit.scala 29:128:@1004.4]
  assign _T_41 = _T_29 == 7'h13; // @[forwarding_unit.scala 30:51:@1006.4]
  assign _T_42 = _T_39 | _T_41; // @[forwarding_unit.scala 30:25:@1007.4]
  assign _T_44 = _T_29 == 7'h33; // @[forwarding_unit.scala 30:94:@1009.4]
  assign ex_mem_inst_rd = _T_42 | _T_44; // @[forwarding_unit.scala 30:70:@1010.4]
  assign _T_49 = io_mem_wb_inst[6:0]; // @[forwarding_unit.scala 39:24:@1016.4]
  assign _T_50 = _T_49 == 7'h37; // @[forwarding_unit.scala 39:30:@1017.4]
  assign _T_52 = _T_49 == 7'h17; // @[forwarding_unit.scala 39:70:@1019.4]
  assign _T_53 = _T_50 | _T_52; // @[forwarding_unit.scala 39:46:@1020.4]
  assign _T_55 = _T_49 == 7'h6f; // @[forwarding_unit.scala 39:112:@1022.4]
  assign _T_56 = _T_53 | _T_55; // @[forwarding_unit.scala 39:88:@1023.4]
  assign _T_58 = _T_49 == 7'h67; // @[forwarding_unit.scala 39:152:@1025.4]
  assign _T_59 = _T_56 | _T_58; // @[forwarding_unit.scala 39:128:@1026.4]
  assign _T_61 = _T_49 == 7'h3; // @[forwarding_unit.scala 40:49:@1028.4]
  assign _T_62 = _T_59 | _T_61; // @[forwarding_unit.scala 40:25:@1029.4]
  assign _T_64 = _T_49 == 7'h13; // @[forwarding_unit.scala 40:91:@1031.4]
  assign _T_65 = _T_62 | _T_64; // @[forwarding_unit.scala 40:66:@1032.4]
  assign _T_67 = _T_49 == 7'h33; // @[forwarding_unit.scala 40:134:@1034.4]
  assign mem_wb_inst_rd = _T_65 | _T_67; // @[forwarding_unit.scala 40:110:@1035.4]
  assign _T_72 = io_id_ex_inst[6:0]; // @[forwarding_unit.scala 48:23:@1041.4]
  assign _T_73 = _T_72 == 7'h33; // @[forwarding_unit.scala 48:29:@1042.4]
  assign _T_75 = _T_72 == 7'h13; // @[forwarding_unit.scala 48:71:@1044.4]
  assign _T_76 = _T_73 | _T_75; // @[forwarding_unit.scala 48:48:@1045.4]
  assign _T_78 = _T_72 == 7'h3; // @[forwarding_unit.scala 49:29:@1047.4]
  assign _T_79 = _T_76 | _T_78; // @[forwarding_unit.scala 48:90:@1048.4]
  assign _T_81 = _T_72 == 7'h23; // @[forwarding_unit.scala 49:69:@1050.4]
  assign _T_82 = _T_79 | _T_81; // @[forwarding_unit.scala 49:46:@1051.4]
  assign _T_84 = _T_72 == 7'h63; // @[forwarding_unit.scala 49:110:@1053.4]
  assign uses_rs1 = _T_82 | _T_84; // @[forwarding_unit.scala 49:87:@1054.4]
  assign uses_rs2 = _T_73 | _T_84; // @[forwarding_unit.scala 57:48:@1064.4]
  assign _T_95 = ex_mem_inst_rd & uses_rs1; // @[forwarding_unit.scala 61:24:@1068.4]
  assign _T_96 = id_ex_rs1 == ex_mem_rd; // @[forwarding_unit.scala 61:49:@1069.4]
  assign _T_97 = _T_95 & _T_96; // @[forwarding_unit.scala 61:36:@1070.4]
  assign _T_99 = id_ex_rs1 != 5'h0; // @[forwarding_unit.scala 61:76:@1071.4]
  assign _T_100 = _T_97 & _T_99; // @[forwarding_unit.scala 61:63:@1072.4]
  assign _T_102 = mem_wb_inst_rd & uses_rs1; // @[forwarding_unit.scala 63:30:@1077.6]
  assign _T_103 = id_ex_rs1 == mem_wb_rd; // @[forwarding_unit.scala 63:55:@1078.6]
  assign _T_104 = _T_102 & _T_103; // @[forwarding_unit.scala 63:42:@1079.6]
  assign _T_107 = _T_104 & _T_99; // @[forwarding_unit.scala 63:69:@1081.6]
  assign _T_110 = ex_mem_inst_rd & uses_rs2; // @[forwarding_unit.scala 69:24:@1088.4]
  assign _T_112 = id_ex_rs2 == ex_mem_rd; // @[forwarding_unit.scala 69:60:@1090.4]
  assign _T_113 = _T_110 & _T_112; // @[forwarding_unit.scala 69:36:@1091.4]
  assign _T_116 = id_ex_rs2 != 5'h0; // @[forwarding_unit.scala 69:98:@1093.4]
  assign _T_117 = _T_113 & _T_116; // @[forwarding_unit.scala 69:74:@1094.4]
  assign _T_119 = mem_wb_inst_rd & uses_rs2; // @[forwarding_unit.scala 71:30:@1099.6]
  assign _T_121 = id_ex_rs2 == mem_wb_rd; // @[forwarding_unit.scala 71:66:@1101.6]
  assign _T_122 = _T_119 & _T_121; // @[forwarding_unit.scala 71:42:@1102.6]
  assign _T_126 = _T_122 & _T_116; // @[forwarding_unit.scala 71:80:@1105.6]
  assign io_forward_A = _T_100 ? 2'h2 : {{1'd0}, _T_107}; // @[forwarding_unit.scala 62:19:@1074.6 forwarding_unit.scala 64:19:@1083.8 forwarding_unit.scala 66:19:@1086.8]
  assign io_forward_B = _T_117 ? 2'h2 : {{1'd0}, _T_126}; // @[forwarding_unit.scala 70:19:@1096.6 forwarding_unit.scala 72:19:@1107.8 forwarding_unit.scala 74:19:@1110.8]
endmodule
module HazardDetectionUnit( // @[:@1113.2]
  input  [31:0] io_id_ex_instr, // @[:@1116.4]
  input  [31:0] io_if_id_instr, // @[:@1116.4]
  output        io_stall // @[:@1116.4]
);
  wire [6:0] _T_17; // @[hazard_detection_unit.scala 22:23:@1124.4]
  wire  id_ex_rd; // @[hazard_detection_unit.scala 22:29:@1125.4]
  wire [6:0] _T_20; // @[hazard_detection_unit.scala 26:24:@1129.4]
  wire  _T_21; // @[hazard_detection_unit.scala 26:30:@1130.4]
  wire  _T_23; // @[hazard_detection_unit.scala 26:71:@1132.4]
  wire  _T_24; // @[hazard_detection_unit.scala 26:47:@1133.4]
  wire  _T_26; // @[hazard_detection_unit.scala 26:114:@1135.4]
  wire  _T_27; // @[hazard_detection_unit.scala 26:90:@1136.4]
  wire  _T_29; // @[hazard_detection_unit.scala 26:155:@1138.4]
  wire  _T_30; // @[hazard_detection_unit.scala 26:131:@1139.4]
  wire  _T_32; // @[hazard_detection_unit.scala 27:31:@1141.4]
  wire  _T_33; // @[hazard_detection_unit.scala 26:173:@1142.4]
  wire  _T_35; // @[hazard_detection_unit.scala 27:74:@1144.4]
  wire  if_id_rs1; // @[hazard_detection_unit.scala 27:50:@1145.4]
  wire  if_id_rs2; // @[hazard_detection_unit.scala 31:49:@1153.4]
  wire  _T_44; // @[hazard_detection_unit.scala 35:20:@1157.4]
  wire [4:0] _T_45; // @[hazard_detection_unit.scala 35:53:@1158.4]
  wire [4:0] _T_46; // @[hazard_detection_unit.scala 35:78:@1159.4]
  wire  _T_47; // @[hazard_detection_unit.scala 35:60:@1160.4]
  wire  _T_48; // @[hazard_detection_unit.scala 35:35:@1161.4]
  wire  _T_50; // @[hazard_detection_unit.scala 37:26:@1166.6]
  wire [4:0] _T_52; // @[hazard_detection_unit.scala 37:84:@1168.6]
  wire  _T_53; // @[hazard_detection_unit.scala 37:66:@1169.6]
  wire  _T_54; // @[hazard_detection_unit.scala 37:41:@1170.6]
  assign _T_17 = io_id_ex_instr[6:0]; // @[hazard_detection_unit.scala 22:23:@1124.4]
  assign id_ex_rd = _T_17 == 7'h3; // @[hazard_detection_unit.scala 22:29:@1125.4]
  assign _T_20 = io_if_id_instr[6:0]; // @[hazard_detection_unit.scala 26:24:@1129.4]
  assign _T_21 = _T_20 == 7'h67; // @[hazard_detection_unit.scala 26:30:@1130.4]
  assign _T_23 = _T_20 == 7'h63; // @[hazard_detection_unit.scala 26:71:@1132.4]
  assign _T_24 = _T_21 | _T_23; // @[hazard_detection_unit.scala 26:47:@1133.4]
  assign _T_26 = _T_20 == 7'h3; // @[hazard_detection_unit.scala 26:114:@1135.4]
  assign _T_27 = _T_24 | _T_26; // @[hazard_detection_unit.scala 26:90:@1136.4]
  assign _T_29 = _T_20 == 7'h23; // @[hazard_detection_unit.scala 26:155:@1138.4]
  assign _T_30 = _T_27 | _T_29; // @[hazard_detection_unit.scala 26:131:@1139.4]
  assign _T_32 = _T_20 == 7'h13; // @[hazard_detection_unit.scala 27:31:@1141.4]
  assign _T_33 = _T_30 | _T_32; // @[hazard_detection_unit.scala 26:173:@1142.4]
  assign _T_35 = _T_20 == 7'h33; // @[hazard_detection_unit.scala 27:74:@1144.4]
  assign if_id_rs1 = _T_33 | _T_35; // @[hazard_detection_unit.scala 27:50:@1145.4]
  assign if_id_rs2 = _T_23 | _T_35; // @[hazard_detection_unit.scala 31:49:@1153.4]
  assign _T_44 = id_ex_rd & if_id_rs1; // @[hazard_detection_unit.scala 35:20:@1157.4]
  assign _T_45 = io_id_ex_instr[11:7]; // @[hazard_detection_unit.scala 35:53:@1158.4]
  assign _T_46 = io_if_id_instr[19:15]; // @[hazard_detection_unit.scala 35:78:@1159.4]
  assign _T_47 = _T_45 == _T_46; // @[hazard_detection_unit.scala 35:60:@1160.4]
  assign _T_48 = _T_44 & _T_47; // @[hazard_detection_unit.scala 35:35:@1161.4]
  assign _T_50 = id_ex_rd & if_id_rs2; // @[hazard_detection_unit.scala 37:26:@1166.6]
  assign _T_52 = io_if_id_instr[24:20]; // @[hazard_detection_unit.scala 37:84:@1168.6]
  assign _T_53 = _T_45 == _T_52; // @[hazard_detection_unit.scala 37:66:@1169.6]
  assign _T_54 = _T_50 & _T_53; // @[hazard_detection_unit.scala 37:41:@1170.6]
  assign io_stall = _T_48 ? 1'h1 : _T_54; // @[hazard_detection_unit.scala 36:16:@1163.6 hazard_detection_unit.scala 38:16:@1172.8 hazard_detection_unit.scala 40:16:@1175.8]
endmodule
module rv32Ipipeline( // @[:@1178.2]
  input         clock, // @[:@1179.4]
  input         reset, // @[:@1180.4]
  output [31:0] io_addrOutPipeline, // @[:@1181.4]
  output [31:0] io_dataOutPipeline, // @[:@1181.4]
  input  [31:0] io_dataInPipeline, // @[:@1181.4]
  output        io_WE // @[:@1181.4]
);
  wire  instruction_fetch_clock; // @[pipeline.scala 15:38:@1183.4]
  wire  instruction_fetch_reset; // @[pipeline.scala 15:38:@1183.4]
  wire [31:0] instruction_fetch_io_NPCOut; // @[pipeline.scala 15:38:@1183.4]
  wire [31:0] instruction_fetch_io_PCOut; // @[pipeline.scala 15:38:@1183.4]
  wire  instruction_fetch_io_condIn; // @[pipeline.scala 15:38:@1183.4]
  wire [31:0] instruction_fetch_io_nextPC; // @[pipeline.scala 15:38:@1183.4]
  wire [31:0] instruction_fetch_io_instrIn; // @[pipeline.scala 15:38:@1183.4]
  wire  instruction_fetch_io_stall; // @[pipeline.scala 15:38:@1183.4]
  wire [31:0] instruction_memory_io_addrIn; // @[pipeline.scala 16:38:@1186.4]
  wire [31:0] instruction_memory_io_dataOut; // @[pipeline.scala 16:38:@1186.4]
  wire [4:0] instruction_decode_io_reg1; // @[pipeline.scala 17:38:@1189.4]
  wire [4:0] instruction_decode_io_reg2; // @[pipeline.scala 17:38:@1189.4]
  wire [31:0] instruction_decode_io_immidiate; // @[pipeline.scala 17:38:@1189.4]
  wire [9:0] instruction_decode_io_funct; // @[pipeline.scala 17:38:@1189.4]
  wire [31:0] instruction_decode_io_instrIn; // @[pipeline.scala 17:38:@1189.4]
  wire  registers_clock; // @[pipeline.scala 18:38:@1192.4]
  wire  registers_reset; // @[pipeline.scala 18:38:@1192.4]
  wire [31:0] registers_io_regOut1; // @[pipeline.scala 18:38:@1192.4]
  wire [31:0] registers_io_regOut2; // @[pipeline.scala 18:38:@1192.4]
  wire [31:0] registers_io_regIn; // @[pipeline.scala 18:38:@1192.4]
  wire [4:0] registers_io_reg1Selector; // @[pipeline.scala 18:38:@1192.4]
  wire [4:0] registers_io_reg2Selector; // @[pipeline.scala 18:38:@1192.4]
  wire [4:0] registers_io_regInSelector; // @[pipeline.scala 18:38:@1192.4]
  wire  registers_io_writeEn; // @[pipeline.scala 18:38:@1192.4]
  wire  execute_io_cond; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_res; // @[pipeline.scala 19:38:@1195.4]
  wire [9:0] execute_io_funct; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_reg1; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_reg2; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_immidiate; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_NPCIn; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] execute_io_instrIn; // @[pipeline.scala 19:38:@1195.4]
  wire [31:0] mem_io_addrIn; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_dataIn; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_dataOut; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_instrIn; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_addrOutPipeline; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_dataOutPipeline; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] mem_io_dataInPipeline; // @[pipeline.scala 20:38:@1198.4]
  wire  mem_io_WE; // @[pipeline.scala 20:38:@1198.4]
  wire [31:0] write_back_io_instrIn; // @[pipeline.scala 21:38:@1201.4]
  wire [31:0] write_back_io_res; // @[pipeline.scala 21:38:@1201.4]
  wire [31:0] write_back_io_dataIn; // @[pipeline.scala 21:38:@1201.4]
  wire [31:0] write_back_io_NPCIn; // @[pipeline.scala 21:38:@1201.4]
  wire [31:0] write_back_io_dataToReg; // @[pipeline.scala 21:38:@1201.4]
  wire [4:0] write_back_io_regInSelector; // @[pipeline.scala 21:38:@1201.4]
  wire  write_back_io_writeRegister; // @[pipeline.scala 21:38:@1201.4]
  wire [31:0] forwarding_unit_io_id_ex_inst; // @[pipeline.scala 22:38:@1204.4]
  wire [31:0] forwarding_unit_io_ex_mem_inst; // @[pipeline.scala 22:38:@1204.4]
  wire [31:0] forwarding_unit_io_mem_wb_inst; // @[pipeline.scala 22:38:@1204.4]
  wire [1:0] forwarding_unit_io_forward_A; // @[pipeline.scala 22:38:@1204.4]
  wire [1:0] forwarding_unit_io_forward_B; // @[pipeline.scala 22:38:@1204.4]
  wire [31:0] hazard_detection_unit_io_id_ex_instr; // @[pipeline.scala 23:38:@1207.4]
  wire [31:0] hazard_detection_unit_io_if_id_instr; // @[pipeline.scala 23:38:@1207.4]
  wire  hazard_detection_unit_io_stall; // @[pipeline.scala 23:38:@1207.4]
  reg [31:0] if_id_NPC_reg; // @[pipeline.scala 26:31:@1210.4]
  reg [31:0] _RAND_0;
  reg [31:0] if_id_IR_reg; // @[pipeline.scala 27:31:@1211.4]
  reg [31:0] _RAND_1;
  reg [31:0] id_ex_NPC_reg; // @[pipeline.scala 35:37:@1214.4]
  reg [31:0] _RAND_2;
  reg [31:0] id_ex_IR_reg; // @[pipeline.scala 36:37:@1215.4]
  reg [31:0] _RAND_3;
  reg [31:0] id_ex_immidiate_reg; // @[pipeline.scala 37:37:@1216.4]
  reg [31:0] _RAND_4;
  reg [9:0] id_ex_funct_reg; // @[pipeline.scala 38:37:@1217.4]
  reg [31:0] _RAND_5;
  reg [31:0] id_ex_A_reg; // @[pipeline.scala 39:37:@1218.4]
  reg [31:0] _RAND_6;
  reg [31:0] id_ex_B_reg; // @[pipeline.scala 40:37:@1219.4]
  reg [31:0] _RAND_7;
  reg [31:0] ex_mem_NPC_reg; // @[pipeline.scala 54:38:@1230.4]
  reg [31:0] _RAND_8;
  reg [31:0] ex_mem_IR_reg; // @[pipeline.scala 55:38:@1231.4]
  reg [31:0] _RAND_9;
  reg  ex_mem_condition_reg; // @[pipeline.scala 56:38:@1232.4]
  reg [31:0] _RAND_10;
  reg [31:0] ex_mem_res_reg; // @[pipeline.scala 57:38:@1233.4]
  reg [31:0] _RAND_11;
  reg [31:0] ex_mem_B_reg; // @[pipeline.scala 58:38:@1234.4]
  reg [31:0] _RAND_12;
  reg [31:0] mem_wb_NPC_reg; // @[pipeline.scala 67:38:@1240.4]
  reg [31:0] _RAND_13;
  reg [31:0] mem_wb_IR_reg; // @[pipeline.scala 68:38:@1241.4]
  reg [31:0] _RAND_14;
  reg [31:0] mem_wb_res_reg; // @[pipeline.scala 69:38:@1242.4]
  reg [31:0] _RAND_15;
  reg [31:0] mem_wb_lmd_reg; // @[pipeline.scala 70:38:@1243.4]
  reg [31:0] _RAND_16;
  wire [29:0] _T_53; // @[pipeline.scala 78:63:@1248.4]
  wire  _T_55; // @[pipeline.scala 121:38:@1279.4]
  wire  _T_57; // @[pipeline.scala 123:44:@1284.6]
  wire [31:0] _GEN_0; // @[pipeline.scala 123:56:@1285.6]
  wire  _T_59; // @[pipeline.scala 129:38:@1291.4]
  wire  _T_61; // @[pipeline.scala 131:44:@1296.6]
  wire [31:0] _GEN_2; // @[pipeline.scala 131:56:@1297.6]
  wire [6:0] _T_62; // @[pipeline.scala 138:23:@1303.4]
  wire  _T_63; // @[pipeline.scala 138:29:@1304.4]
  wire [6:0] _T_64; // @[pipeline.scala 138:62:@1305.4]
  wire  _T_65; // @[pipeline.scala 138:68:@1306.4]
  wire  _T_66; // @[pipeline.scala 138:46:@1307.4]
  wire [4:0] _T_67; // @[pipeline.scala 138:102:@1308.4]
  wire [4:0] _T_68; // @[pipeline.scala 138:126:@1309.4]
  wire  _T_69; // @[pipeline.scala 138:109:@1310.4]
  wire  _T_70; // @[pipeline.scala 138:85:@1311.4]
  wire [31:0] _GEN_5; // @[pipeline.scala 145:40:@1317.4]
  wire [31:0] _GEN_6; // @[pipeline.scala 145:40:@1317.4]
  rv32IF instruction_fetch ( // @[pipeline.scala 15:38:@1183.4]
    .clock(instruction_fetch_clock),
    .reset(instruction_fetch_reset),
    .io_NPCOut(instruction_fetch_io_NPCOut),
    .io_PCOut(instruction_fetch_io_PCOut),
    .io_condIn(instruction_fetch_io_condIn),
    .io_nextPC(instruction_fetch_io_nextPC),
    .io_instrIn(instruction_fetch_io_instrIn),
    .io_stall(instruction_fetch_io_stall)
  );
  InstructionRom instruction_memory ( // @[pipeline.scala 16:38:@1186.4]
    .io_addrIn(instruction_memory_io_addrIn),
    .io_dataOut(instruction_memory_io_dataOut)
  );
  rv32ID instruction_decode ( // @[pipeline.scala 17:38:@1189.4]
    .io_reg1(instruction_decode_io_reg1),
    .io_reg2(instruction_decode_io_reg2),
    .io_immidiate(instruction_decode_io_immidiate),
    .io_funct(instruction_decode_io_funct),
    .io_instrIn(instruction_decode_io_instrIn)
  );
  RegistryFile registers ( // @[pipeline.scala 18:38:@1192.4]
    .clock(registers_clock),
    .reset(registers_reset),
    .io_regOut1(registers_io_regOut1),
    .io_regOut2(registers_io_regOut2),
    .io_regIn(registers_io_regIn),
    .io_reg1Selector(registers_io_reg1Selector),
    .io_reg2Selector(registers_io_reg2Selector),
    .io_regInSelector(registers_io_regInSelector),
    .io_writeEn(registers_io_writeEn)
  );
  rv32EX execute ( // @[pipeline.scala 19:38:@1195.4]
    .io_cond(execute_io_cond),
    .io_res(execute_io_res),
    .io_funct(execute_io_funct),
    .io_reg1(execute_io_reg1),
    .io_reg2(execute_io_reg2),
    .io_immidiate(execute_io_immidiate),
    .io_NPCIn(execute_io_NPCIn),
    .io_instrIn(execute_io_instrIn)
  );
  rv32MEM mem ( // @[pipeline.scala 20:38:@1198.4]
    .io_addrIn(mem_io_addrIn),
    .io_dataIn(mem_io_dataIn),
    .io_dataOut(mem_io_dataOut),
    .io_instrIn(mem_io_instrIn),
    .io_addrOutPipeline(mem_io_addrOutPipeline),
    .io_dataOutPipeline(mem_io_dataOutPipeline),
    .io_dataInPipeline(mem_io_dataInPipeline),
    .io_WE(mem_io_WE)
  );
  rv32WB write_back ( // @[pipeline.scala 21:38:@1201.4]
    .io_instrIn(write_back_io_instrIn),
    .io_res(write_back_io_res),
    .io_dataIn(write_back_io_dataIn),
    .io_NPCIn(write_back_io_NPCIn),
    .io_dataToReg(write_back_io_dataToReg),
    .io_regInSelector(write_back_io_regInSelector),
    .io_writeRegister(write_back_io_writeRegister)
  );
  ForwardingUnit forwarding_unit ( // @[pipeline.scala 22:38:@1204.4]
    .io_id_ex_inst(forwarding_unit_io_id_ex_inst),
    .io_ex_mem_inst(forwarding_unit_io_ex_mem_inst),
    .io_mem_wb_inst(forwarding_unit_io_mem_wb_inst),
    .io_forward_A(forwarding_unit_io_forward_A),
    .io_forward_B(forwarding_unit_io_forward_B)
  );
  HazardDetectionUnit hazard_detection_unit ( // @[pipeline.scala 23:38:@1207.4]
    .io_id_ex_instr(hazard_detection_unit_io_id_ex_instr),
    .io_if_id_instr(hazard_detection_unit_io_if_id_instr),
    .io_stall(hazard_detection_unit_io_stall)
  );
  assign _T_53 = instruction_fetch_io_PCOut[31:2]; // @[pipeline.scala 78:63:@1248.4]
  assign _T_55 = forwarding_unit_io_forward_A == 2'h2; // @[pipeline.scala 121:38:@1279.4]
  assign _T_57 = forwarding_unit_io_forward_A == 2'h1; // @[pipeline.scala 123:44:@1284.6]
  assign _GEN_0 = _T_57 ? write_back_io_dataToReg : id_ex_A_reg; // @[pipeline.scala 123:56:@1285.6]
  assign _T_59 = forwarding_unit_io_forward_B == 2'h2; // @[pipeline.scala 129:38:@1291.4]
  assign _T_61 = forwarding_unit_io_forward_B == 2'h1; // @[pipeline.scala 131:44:@1296.6]
  assign _GEN_2 = _T_61 ? write_back_io_dataToReg : id_ex_B_reg; // @[pipeline.scala 131:56:@1297.6]
  assign _T_62 = ex_mem_IR_reg[6:0]; // @[pipeline.scala 138:23:@1303.4]
  assign _T_63 = _T_62 == 7'h23; // @[pipeline.scala 138:29:@1304.4]
  assign _T_64 = mem_wb_IR_reg[6:0]; // @[pipeline.scala 138:62:@1305.4]
  assign _T_65 = _T_64 == 7'h3; // @[pipeline.scala 138:68:@1306.4]
  assign _T_66 = _T_63 & _T_65; // @[pipeline.scala 138:46:@1307.4]
  assign _T_67 = ex_mem_IR_reg[11:7]; // @[pipeline.scala 138:102:@1308.4]
  assign _T_68 = mem_wb_IR_reg[24:20]; // @[pipeline.scala 138:126:@1309.4]
  assign _T_69 = _T_67 == _T_68; // @[pipeline.scala 138:109:@1310.4]
  assign _T_70 = _T_66 & _T_69; // @[pipeline.scala 138:85:@1311.4]
  assign _GEN_5 = hazard_detection_unit_io_stall ? if_id_IR_reg : instruction_memory_io_dataOut; // @[pipeline.scala 145:40:@1317.4]
  assign _GEN_6 = hazard_detection_unit_io_stall ? 32'h13 : if_id_IR_reg; // @[pipeline.scala 145:40:@1317.4]
  assign io_addrOutPipeline = mem_io_addrOutPipeline; // @[pipeline.scala 101:26:@1267.4]
  assign io_dataOutPipeline = mem_io_dataOutPipeline; // @[pipeline.scala 102:26:@1268.4]
  assign io_WE = mem_io_WE; // @[pipeline.scala 104:26:@1270.4]
  assign instruction_fetch_clock = clock; // @[:@1184.4]
  assign instruction_fetch_reset = reset; // @[:@1185.4]
  assign instruction_fetch_io_condIn = ex_mem_condition_reg; // @[pipeline.scala 80:33:@1250.4]
  assign instruction_fetch_io_nextPC = ex_mem_res_reg; // @[pipeline.scala 81:33:@1251.4]
  assign instruction_fetch_io_instrIn = ex_mem_IR_reg; // @[pipeline.scala 82:33:@1252.4]
  assign instruction_fetch_io_stall = hazard_detection_unit_io_stall; // @[pipeline.scala 83:33:@1253.4]
  assign instruction_memory_io_addrIn = {{2'd0}, _T_53}; // @[pipeline.scala 78:33:@1249.4]
  assign instruction_decode_io_instrIn = if_id_IR_reg; // @[pipeline.scala 85:34:@1254.4]
  assign registers_clock = clock; // @[:@1193.4]
  assign registers_reset = reset; // @[:@1194.4]
  assign registers_io_regIn = write_back_io_dataToReg; // @[pipeline.scala 87:31:@1255.4]
  assign registers_io_reg1Selector = instruction_decode_io_reg1; // @[pipeline.scala 90:31:@1258.4]
  assign registers_io_reg2Selector = instruction_decode_io_reg2; // @[pipeline.scala 91:31:@1259.4]
  assign registers_io_regInSelector = write_back_io_regInSelector; // @[pipeline.scala 88:31:@1256.4]
  assign registers_io_writeEn = write_back_io_writeRegister; // @[pipeline.scala 89:31:@1257.4]
  assign execute_io_funct = id_ex_funct_reg; // @[pipeline.scala 93:25:@1260.4]
  assign execute_io_reg1 = _T_55 ? ex_mem_res_reg : _GEN_0; // @[pipeline.scala 122:23:@1281.6 pipeline.scala 124:23:@1286.8 pipeline.scala 126:23:@1289.8]
  assign execute_io_reg2 = _T_59 ? ex_mem_res_reg : _GEN_2; // @[pipeline.scala 130:23:@1293.6 pipeline.scala 132:23:@1298.8 pipeline.scala 134:23:@1301.8]
  assign execute_io_immidiate = id_ex_immidiate_reg; // @[pipeline.scala 94:25:@1261.4]
  assign execute_io_NPCIn = id_ex_NPC_reg; // @[pipeline.scala 95:25:@1262.4]
  assign execute_io_instrIn = id_ex_IR_reg; // @[pipeline.scala 96:25:@1263.4]
  assign mem_io_addrIn = ex_mem_res_reg; // @[pipeline.scala 98:26:@1264.4]
  assign mem_io_dataIn = _T_70 ? mem_wb_lmd_reg : ex_mem_B_reg; // @[pipeline.scala 99:26:@1265.4 pipeline.scala 139:21:@1313.6]
  assign mem_io_instrIn = ex_mem_IR_reg; // @[pipeline.scala 100:26:@1266.4]
  assign mem_io_dataInPipeline = io_dataInPipeline; // @[pipeline.scala 103:26:@1269.4]
  assign write_back_io_instrIn = mem_wb_IR_reg; // @[pipeline.scala 106:26:@1271.4]
  assign write_back_io_res = mem_wb_res_reg; // @[pipeline.scala 107:26:@1272.4]
  assign write_back_io_dataIn = mem_wb_lmd_reg; // @[pipeline.scala 108:26:@1273.4]
  assign write_back_io_NPCIn = mem_wb_NPC_reg; // @[pipeline.scala 109:26:@1274.4]
  assign forwarding_unit_io_id_ex_inst = id_ex_IR_reg; // @[pipeline.scala 117:35:@1276.4]
  assign forwarding_unit_io_ex_mem_inst = ex_mem_IR_reg; // @[pipeline.scala 118:35:@1277.4]
  assign forwarding_unit_io_mem_wb_inst = mem_wb_IR_reg; // @[pipeline.scala 119:35:@1278.4]
  assign hazard_detection_unit_io_id_ex_instr = id_ex_IR_reg; // @[pipeline.scala 142:41:@1315.4]
  assign hazard_detection_unit_io_if_id_instr = if_id_IR_reg; // @[pipeline.scala 143:41:@1316.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  if_id_NPC_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  if_id_IR_reg = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  id_ex_NPC_reg = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  id_ex_IR_reg = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  id_ex_immidiate_reg = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  id_ex_funct_reg = _RAND_5[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  id_ex_A_reg = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  id_ex_B_reg = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  ex_mem_NPC_reg = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  ex_mem_IR_reg = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  ex_mem_condition_reg = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  ex_mem_res_reg = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  ex_mem_B_reg = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  mem_wb_NPC_reg = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  mem_wb_IR_reg = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  mem_wb_res_reg = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  mem_wb_lmd_reg = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      if_id_NPC_reg <= 32'h0;
    end else begin
      if_id_NPC_reg <= instruction_fetch_io_NPCOut;
    end
    if (reset) begin
      if_id_IR_reg <= 32'h0;
    end else begin
      if (!(hazard_detection_unit_io_stall)) begin
        if_id_IR_reg <= instruction_memory_io_dataOut;
      end
    end
    if (reset) begin
      id_ex_NPC_reg <= 32'h0;
    end else begin
      id_ex_NPC_reg <= if_id_NPC_reg;
    end
    if (reset) begin
      id_ex_IR_reg <= 32'h0;
    end else begin
      if (hazard_detection_unit_io_stall) begin
        id_ex_IR_reg <= 32'h13;
      end else begin
        id_ex_IR_reg <= if_id_IR_reg;
      end
    end
    if (reset) begin
      id_ex_immidiate_reg <= 32'h0;
    end else begin
      id_ex_immidiate_reg <= instruction_decode_io_immidiate;
    end
    if (reset) begin
      id_ex_funct_reg <= 10'h0;
    end else begin
      id_ex_funct_reg <= instruction_decode_io_funct;
    end
    if (reset) begin
      id_ex_A_reg <= 32'h0;
    end else begin
      id_ex_A_reg <= registers_io_regOut1;
    end
    if (reset) begin
      id_ex_B_reg <= 32'h0;
    end else begin
      id_ex_B_reg <= registers_io_regOut2;
    end
    if (reset) begin
      ex_mem_NPC_reg <= 32'h0;
    end else begin
      ex_mem_NPC_reg <= id_ex_NPC_reg;
    end
    if (reset) begin
      ex_mem_IR_reg <= 32'h0;
    end else begin
      ex_mem_IR_reg <= id_ex_IR_reg;
    end
    if (reset) begin
      ex_mem_condition_reg <= 1'h0;
    end else begin
      ex_mem_condition_reg <= execute_io_cond;
    end
    if (reset) begin
      ex_mem_res_reg <= 32'h0;
    end else begin
      ex_mem_res_reg <= execute_io_res;
    end
    if (reset) begin
      ex_mem_B_reg <= 32'h0;
    end else begin
      ex_mem_B_reg <= id_ex_B_reg;
    end
    if (reset) begin
      mem_wb_NPC_reg <= 32'h0;
    end else begin
      mem_wb_NPC_reg <= ex_mem_NPC_reg;
    end
    if (reset) begin
      mem_wb_IR_reg <= 32'h0;
    end else begin
      mem_wb_IR_reg <= ex_mem_IR_reg;
    end
    if (reset) begin
      mem_wb_res_reg <= 32'h0;
    end else begin
      mem_wb_res_reg <= ex_mem_res_reg;
    end
    if (reset) begin
      mem_wb_lmd_reg <= 32'h0;
    end else begin
      mem_wb_lmd_reg <= mem_io_dataOut;
    end
  end
endmodule
module DataMemory( // @[:@1322.2]
  input         clock, // @[:@1323.4]
  input  [31:0] io_addrIn, // @[:@1325.4]
  input  [31:0] io_dataIn, // @[:@1325.4]
  output [31:0] io_dataOut, // @[:@1325.4]
  input         io_load // @[:@1325.4]
);
  reg [31:0] syncMem [0:2047]; // @[instruction_memory.scala 16:22:@1327.4]
  reg [31:0] _RAND_0;
  wire [31:0] syncMem__T_18_data; // @[instruction_memory.scala 16:22:@1327.4]
  wire [10:0] syncMem__T_18_addr; // @[instruction_memory.scala 16:22:@1327.4]
  wire [31:0] syncMem__T_16_data; // @[instruction_memory.scala 16:22:@1327.4]
  wire [10:0] syncMem__T_16_addr; // @[instruction_memory.scala 16:22:@1327.4]
  wire  syncMem__T_16_mask; // @[instruction_memory.scala 16:22:@1327.4]
  wire  syncMem__T_16_en; // @[instruction_memory.scala 16:22:@1327.4]
  assign syncMem__T_18_addr = io_addrIn[10:0];
  assign syncMem__T_18_data = syncMem[syncMem__T_18_addr]; // @[instruction_memory.scala 16:22:@1327.4]
  assign syncMem__T_16_data = io_dataIn;
  assign syncMem__T_16_addr = io_addrIn[10:0];
  assign syncMem__T_16_mask = io_load;
  assign syncMem__T_16_en = io_load;
  assign io_dataOut = syncMem__T_18_data; // @[instruction_memory.scala 23:16:@1335.4]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  _RAND_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2048; initvar = initvar+1)
    syncMem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(syncMem__T_16_en & syncMem__T_16_mask) begin
      syncMem[syncMem__T_16_addr] <= syncMem__T_16_data; // @[instruction_memory.scala 16:22:@1327.4]
    end
  end
endmodule
module Top( // @[:@1337.2]
  input         clock, // @[:@1338.4]
  input         reset, // @[:@1339.4]
  output [31:0] io_res, // @[:@1340.4]
  output        io_LED0 // @[:@1340.4]
);
  wire  pipeline_clock; // @[top.scala 38:25:@1342.4]
  wire  pipeline_reset; // @[top.scala 38:25:@1342.4]
  wire [31:0] pipeline_io_addrOutPipeline; // @[top.scala 38:25:@1342.4]
  wire [31:0] pipeline_io_dataOutPipeline; // @[top.scala 38:25:@1342.4]
  wire [31:0] pipeline_io_dataInPipeline; // @[top.scala 38:25:@1342.4]
  wire  pipeline_io_WE; // @[top.scala 38:25:@1342.4]
  wire  dataMemory_clock; // @[top.scala 51:27:@1358.4]
  wire [31:0] dataMemory_io_addrIn; // @[top.scala 51:27:@1358.4]
  wire [31:0] dataMemory_io_dataIn; // @[top.scala 51:27:@1358.4]
  wire [31:0] dataMemory_io_dataOut; // @[top.scala 51:27:@1358.4]
  wire  dataMemory_io_load; // @[top.scala 51:27:@1358.4]
  reg [31:0] LED0_reg; // @[top.scala 40:28:@1345.4]
  reg [31:0] _RAND_0;
  reg [31:0] cnt; // @[top.scala 41:21:@1346.4]
  reg [31:0] _RAND_1;
  wire [32:0] _T_40; // @[top.scala 42:15:@1347.4]
  wire [31:0] _T_41; // @[top.scala 42:15:@1348.4]
  wire [19:0] _T_47; // @[top.scala 55:36:@1362.4]
  wire  _T_49; // @[top.scala 55:45:@1363.4]
  wire  _T_51; // @[top.scala 55:71:@1364.4]
  wire  _T_52; // @[top.scala 55:53:@1365.4]
  wire  _T_56; // @[top.scala 57:50:@1371.6]
  wire  _T_59; // @[top.scala 57:58:@1373.6]
  wire [31:0] _GEN_1; // @[top.scala 57:87:@1374.6]
  wire [31:0] _GEN_3; // @[top.scala 55:82:@1366.4]
  rv32Ipipeline pipeline ( // @[top.scala 38:25:@1342.4]
    .clock(pipeline_clock),
    .reset(pipeline_reset),
    .io_addrOutPipeline(pipeline_io_addrOutPipeline),
    .io_dataOutPipeline(pipeline_io_dataOutPipeline),
    .io_dataInPipeline(pipeline_io_dataInPipeline),
    .io_WE(pipeline_io_WE)
  );
  DataMemory dataMemory ( // @[top.scala 51:27:@1358.4]
    .clock(dataMemory_clock),
    .io_addrIn(dataMemory_io_addrIn),
    .io_dataIn(dataMemory_io_dataIn),
    .io_dataOut(dataMemory_io_dataOut),
    .io_load(dataMemory_io_load)
  );
  assign _T_40 = cnt + 32'h1; // @[top.scala 42:15:@1347.4]
  assign _T_41 = _T_40[31:0]; // @[top.scala 42:15:@1348.4]
  assign _T_47 = pipeline_io_addrOutPipeline[31:12]; // @[top.scala 55:36:@1362.4]
  assign _T_49 = _T_47 == 20'h0; // @[top.scala 55:45:@1363.4]
  assign _T_51 = pipeline_io_WE; // @[top.scala 55:71:@1364.4]
  assign _T_52 = _T_49 & _T_51; // @[top.scala 55:53:@1365.4]
  assign _T_56 = _T_47 == 20'h1; // @[top.scala 57:50:@1371.6]
  assign _T_59 = _T_56 & _T_51; // @[top.scala 57:58:@1373.6]
  assign _GEN_1 = _T_59 ? pipeline_io_dataOutPipeline : LED0_reg; // @[top.scala 57:87:@1374.6]
  assign _GEN_3 = _T_52 ? LED0_reg : _GEN_1; // @[top.scala 55:82:@1366.4]
  assign io_res = LED0_reg; // @[top.scala 44:11:@1350.4]
  assign io_LED0 = cnt > 32'h5dc; // @[top.scala 46:14:@1353.6 top.scala 48:14:@1356.6]
  assign pipeline_clock = clock; // @[:@1343.4]
  assign pipeline_reset = reset; // @[:@1344.4]
  assign pipeline_io_dataInPipeline = dataMemory_io_dataOut; // @[top.scala 63:31:@1379.4]
  assign dataMemory_clock = clock; // @[:@1359.4]
  assign dataMemory_io_addrIn = pipeline_io_addrOutPipeline; // @[top.scala 61:25:@1377.4]
  assign dataMemory_io_dataIn = pipeline_io_dataOutPipeline; // @[top.scala 62:25:@1378.4]
  assign dataMemory_io_load = _T_49 & _T_51; // @[top.scala 53:23:@1361.4 top.scala 56:26:@1367.6]
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  LED0_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  cnt = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      LED0_reg <= 32'h0;
    end else begin
      if (!(_T_52)) begin
        if (_T_59) begin
          LED0_reg <= pipeline_io_dataOutPipeline;
        end
      end
    end
    if (reset) begin
      cnt <= 32'h0;
    end else begin
      cnt <= _T_41;
    end
  end
endmodule
