package pipelineRV32I

import chisel3._

class PipelineTop() extends Module(){
     val io = IO(new Bundle{
     val res = Output(UInt(32.W))
     val LED0 = Output(UInt(1.W))
   })
   val testVec = Array()

   val pipeline = Module(new rv32Ipipeline(testVec))  
   //res.io := pipeline.io.res
   val LED0_reg   = RegInit(0.U(32.W)) 
   val cnt = RegInit(0.U(32.W))
   cnt := cnt + 1.U

   io.res := LED0_reg
   when(cnt > 1500.U){
     io.LED0 := 1.U
   }.otherwise{
     io.LED0 := 0.U
   }

   val dataMemory = Module(new DataMemory())  
   
   dataMemory.io.load := false.B

   when(pipeline.io.addrOutPipeline(31, 12) === 0.U && pipeline.io.WE === true.B){
      dataMemory.io.load := true.B
   }.elsewhen(pipeline.io.addrOutPipeline(31,12) === 1.U && pipeline.io.WE === true.B){
      LED0_reg := pipeline.io.dataOutPipeline
   }

   dataMemory.io.addrIn := pipeline.io.addrOutPipeline
   dataMemory.io.dataIn := pipeline.io.dataOutPipeline
   pipeline.io.dataInPipeline := dataMemory.io.dataOut
}



