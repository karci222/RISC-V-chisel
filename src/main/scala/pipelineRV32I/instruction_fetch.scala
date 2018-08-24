package pipelineRV32I

import chisel3._
import isRV32.Instructions._


/*
   instruction fetch stage of the pipeline
*/
class rv32IF() extends Module(){
   val io = IO(new Bundle{
      val NPCOut   = Output(UInt(32.W))
      val PCOut    = Output(UInt(32.W))
      val condIn   = Input(Bool())
      val nextPC   = Input(UInt(32.W))
      val nextPC2  = Input(UInt(32.W))//for JALR
      val instrIn  = Input(UInt(32.W))
      val instrIn2 = Input(UInt(32.W))//for JALR
      val stall    = Input(Bool())
   })
   
   //program counter register and next PC
   val PCReg = RegInit(0.U(32.W))   
   val NPC = WireInit(0.U(32.W))

   val nextPC  = WireInit(0.U(32.W))
   val nextPC2 = WireInit(0.U(32.W))

   nextPC  := io.nextPC
   nextPC2 := io.nextPC2

   //on jumps and branches directly change the NPC, on stall PC should be the same, otherwise increment PC by 4
   when((io.condIn === true.B && io.instrIn(6,0) === OPCODE_B_TYPE) || (io.instrIn(6,0) === OPCODE_JAL )){
     NPC := nextPC + 4.U
   }.elsewhen(io.instrIn2(6,0) === OPCODE_JALR){
     NPC := nextPC2 + 4.U
   }.elsewhen(io.stall){
     NPC := PCReg
   }.otherwise{
     NPC := PCReg + 4.U
   }
   
   
  
   io.NPCOut := NPC	
   PCReg := NPC

   io.PCOut := PCReg
}



