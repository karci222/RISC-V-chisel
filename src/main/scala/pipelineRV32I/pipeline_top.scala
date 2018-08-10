package pipelineRV32I

import chisel3._

class PipelineTop() extends Module(){
     val io = IO(new Bundle{
     val res = Output(UInt(32.W))
     val LED0 = Output(UInt(1.W))
   })
   val testVec = Array("b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00111110100000000000000100010011".asUInt(32.W),
"b00000000000000000000100100010011".asUInt(32.W),
"b00000000000000000001000110110111".asUInt(32.W),
"b00000000000000000001101100110111".asUInt(32.W),
"b00000000001000001000000010110011".asUInt(32.W),
"b11111110001100001100110011100011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000110010000100100010011".asUInt(32.W),
"b00000001001000000010100000100011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000001000000000010001110000011".asUInt(32.W),
"b00000000011110110010000000100011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00000001100000000000001011100111".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W))

   val pipeline = Module(new rv32Ipipeline(testVec))  
   //res.io := pipeline.io.res
   
   io.LED0 := 1.U
   
   val dataMemory = Module(new DataMemory())  
   
   dataMemory.io.load := false.B

   when(pipeline.io.addrOutPipeline(31, 12) === 0.U && pipeline.io.WE === true.B){
      dataMemory.io.load := true.B
   }.elsewhen(pipeline.io.addrOutPipeline(31,12) === 1.U && pipeline.io.WE === true.B){
      io.res := pipeline.io.dataOutPipeline
   }

   dataMemory.io.addrIn := pipeline.io.addrOutPipeline
   dataMemory.io.dataIn := pipeline.io.dataOutPipeline
   pipeline.io.dataInPipeline := dataMemory.io.dataOut
}



