package pipelineRV32I

import chisel3._

class PipelineTop() extends Module(){
   val io = IO(new Bundle{
     val res = Output(UInt(32.W))
   })
   val testVec = Array("b00000000000000000000000000110011".asUInt(32.W),
"b00000010001000000000000010010011".asUInt(32.W),
"b00000100000100000000000100010011".asUInt(32.W),
"b00000000000100000000111110010011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000001000001000000110110011".asUInt(32.W),
"b01000000001000001000001000110011".asUInt(32.W),
"b00000001111100001001001010110011".asUInt(32.W),
"b00000000001000001010001100110011".asUInt(32.W),
"b00000000001000001011001110110011".asUInt(32.W),
"b00000000001000001100010000110011".asUInt(32.W),
"b00000001111100001101010010110011".asUInt(32.W),
"b01000001111100001101010100110011".asUInt(32.W),
"b00000000001000001110010110110011".asUInt(32.W),
"b00000000001000001111011000110011".asUInt(32.W),
"b00000010000100000010000000100011".asUInt(32.W),
"b00000010000000000010011010000011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000110100000000011100110011".asUInt(32.W),
"b00000010010000001010011110010011".asUInt(32.W),
"b00000001100100001011100000010011".asUInt(32.W),
"b00000100000100010100100010010011".asUInt(32.W),
"b00000000000000001111100100010011".asUInt(32.W),
"b00000000100000010001100110010011".asUInt(32.W),
"b11111110001000001001010011100011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W),
"b00000000000000000000000000110011".asUInt(32.W))

   
   val pipeline = Module(new rv32Ipipeline(testVec))  
   io.res := pipeline.io.res
}

