package pipelineRV32I

import chisel3._

class Top() extends Module(){
     val io = IO(new Bundle{
     val res = Output(UInt(32.W))
     val LED0 = Output(UInt(1.W))
   })
   val testVec = Array(
"h_00000513".asUInt(32.W),
"h_0007a5b7".asUInt(32.W),
"h_12058593".asUInt(32.W),
"h_00000693".asUInt(32.W),
"h_003d2737".asUInt(32.W),
"h_000017b7".asUInt(32.W),
"h_80000837".asUInt(32.W),
"h_00180813".asUInt(32.W),
"h_00b50533".asUInt(32.W),
"h_00082883".asUInt(32.W),
"h_01101a63".asUInt(32.W),
"h_fee54ae3".asUInt(32.W),
"h_00168693".asUInt(32.W),
"h_00d7a023".asUInt(32.W),
"h_fe9ff06f".asUInt(32.W),
"h_00082883".asUInt(32.W),
"h_000880e7".asUInt(32.W)
)

   val pipeline = Module(new rv32Ipipeline())	
   
   io.LED0 := 1.U
   
   val dataMemory = Module(new DataMemory()) 
   val flash      = Module(new InstructionRom(testVec)) 
   

   
   flash.io.addrIn := pipeline.io.pcOut(15, 0)
   pipeline.io.instrIn := "h_13".asUInt(32.W)

   when(pipeline.io.pcOut(31, 16) === 0.U){
      pipeline.io.instrIn := flash.io.dataOut
   }
   
   dataMemory.io.load := false.B
   
   val resReg = RegInit(0.U(32.W))
   io.res := resReg

   when(pipeline.io.addrOutPipeline(31, 12) === 0.U && pipeline.io.WE === true.B){
      dataMemory.io.load := true.B
   }.elsewhen(pipeline.io.addrOutPipeline(31,12) === 1.U && pipeline.io.WE === true.B){
      resReg := pipeline.io.dataOutPipeline
   }	

   dataMemory.io.addrIn := pipeline.io.addrOutPipeline
   dataMemory.io.dataIn := pipeline.io.dataOutPipeline
   pipeline.io.dataInPipeline := dataMemory.io.dataOut
}


object PipelineMain extends App{
  chisel3.Driver.execute(Array("--target-dir", "generated"), () => new Top())
}
