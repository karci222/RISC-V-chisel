package pipelineRV32I

import chisel3._

class Top() extends Module(){
  val io = IO(new Bundle{
     val res = Output(UInt(32.W))
     val LED0 = Output(UInt(1.W))
   })
   val testVec = Array("b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00000000000100000000000100010011".asUInt(32.W),
"b00000000000100000000100100010011".asUInt(32.W),
"b00000000001111101000000110110111".asUInt(32.W),
"b00000000000000000001101100110111".asUInt(32.W),
"b00000000001000001000000010110011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b11111110001100001001100011100011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000110010100100100010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000001001010110010000000100011".asUInt(32.W),
"b00000000000000000000000010010011".asUInt(32.W),
"b00000001100000000000001011100111".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W),
"b00000000000000000000000000010011".asUInt(32.W))


   val pipeline = Module(new rv32Ipipeline(testVec))  
   io.res := pipeline.io.res
   val LED0_reg   = RegInit(0.U(1.W)) 

   io.LED0 := LED0_reg

   val dataMemory = Module(new DataMemory())  
   
   dataMemory.io.load := false.B

   when(pipeline.io.addrOutPipeline(31, 12) === 0.U && pipeline.io.WE === true.B){
      dataMemory.io.load := true.B
   }.elsewhen(pipeline.io.addrOutPipeline(31,12) === 1.U){
      LED0_reg := pipeline.io.dataOutPipeline(0)
   }

   dataMemory.io.addrIn := pipeline.io.addrOutPipeline
   dataMemory.io.dataIn := pipeline.io.dataOutPipeline
   pipeline.io.dataInPipeline := dataMemory.io.dataOut
}  

object PipelineMain extends App{
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Top())
}
