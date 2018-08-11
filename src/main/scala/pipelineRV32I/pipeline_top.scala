package pipelineRV32I

import chisel3._

class PipelineTop() extends Module(){
     val io = IO(new Bundle{
     val res = Output(UInt(32.W))
     val LED0 = Output(UInt(1.W))
   })
   val testVec = Array("b00000000000000000000000000010011".asUInt(32.W),
"b00000000010100000000000010010011".asUInt(32.W),
"b00000000000100000000000100010011".asUInt(32.W),
"b00000000101000000000000110010011".asUInt(32.W),
"b00000000001000001000000010110011".asUInt(32.W),
"b11111110000100011001110011100011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00000000100000000000001011101111".asUInt(32.W),
"b00000000000100001000000010010011".asUInt(32.W),
"b00000000000100001000000010010011".asUInt(32.W),
"b11111110001000001100101011100011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00000011110000000000001011100111".asUInt(32.W),
"b00000000000100001000000010010011".asUInt(32.W),
"b00000000000100001000000010010011".asUInt(32.W),
"b00000000000100001000000010010011".asUInt(32.W),
"b00000000000100000010001100100011".asUInt(32.W),
"b00000000011000000010100010000011".asUInt(32.W))

   val pipeline = Module(new rv32Ipipeline(testVec))  
   //res.io := pipeline.io.res
   
   io.LED0 := 1.U
   
   val dataMemory = Module(new DataMemory())  
   
   dataMemory.io.load := false.B
   
   io.res := 0.U

   when(pipeline.io.addrOutPipeline(31, 12) === 0.U && pipeline.io.WE === true.B){
      dataMemory.io.load := true.B
   }.elsewhen(pipeline.io.addrOutPipeline(31,12) === 1.U && pipeline.io.WE === true.B){
      io.res := pipeline.io.dataOutPipeline
   }

   dataMemory.io.addrIn := pipeline.io.addrOutPipeline
   dataMemory.io.dataIn := pipeline.io.dataOutPipeline
   pipeline.io.dataInPipeline := dataMemory.io.dataOut
}



