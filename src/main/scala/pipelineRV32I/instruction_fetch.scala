package pipelineRV32I

import chisel3._
import isRV32.Instructions._


/*
   instruction fetch stage of the pipeline
*/
class rv32IF() extends Module(){
   val io = IO(new Bundle{
      val NPCOut 	 = Output(UInt(32.W))
      val PCOut 	 = Output(UInt(32.W))
      val condIn 	 = Input(Bool())
      val nextPC         = Input(UInt(32.W))
      val instrIn        = Input(UInt(32.W))
      val stall          = Input(Bool())
   })
   
   //program counter register and next PC
   val PCReg = RegInit(0.U(32.W))   
   val NPC = Wire(UInt(32.W))

   //on jumps and branches directly change the NPC, on stall PC should be the same, otherwise increment PC by 4
   when((io.condIn === true.B && io.instrIn(6,0) === OPCODE_B_TYPE) || (io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_JALR)){
     NPC := io.nextPC
   }.elsewhen(io.stall){
     NPC := PCReg
   }.otherwise{
     NPC := PCReg + 4.U
   }
   
  
   io.NPCOut := NPC	
   PCReg := NPC

   io.PCOut := PCReg
}



