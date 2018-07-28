package pipelineRV32I

import chisel3._

class rv32IF() extends Module(){
   val io = IO(new Bundle{
      val NPCOut 	 = Output(UInt(32.W))
      val PCOut 	 = Output(UInt(32.W))
      val condIn 	 = Input(Bool())
      val nextPC         = Input(UInt(32.W))
      val branch         = Input(Bool())
   })

   val PCReg = RegInit(0.U(32.W))   
   val NPC = Wire(UInt(32.W))


   when(io.condIn === Bool(true) && io.branch === Bool(true)){
     NPC := io.nextPC
   }.otherwise{
     NPC := PCReg + 4.U
   }
  
   io.NPCOut := NPC	
   PCReg := NPC

   io.PCOut := PCReg
}



