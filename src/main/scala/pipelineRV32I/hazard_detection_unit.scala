package pipelineRV32I

import chisel3._
import isRV32.Instructions._

/*
  Hazard detection unit for the pipeline.
  Currently is capable to check for the RAW hazards.
  For future this unit should also be capable of detecting the control hazard, e.g. branches
*/

class HazardDetectionUnit() extends Module(){
   val io = IO(new Bundle{
      val id_ex_instr = Input(UInt(32.W))
      val if_id_instr = Input(UInt(32.W))
      val stall = Output(Bool())
   })
   
   /*
      Checks if the instruction in the id_ex is a load instruction and if instructions in the if_id are using the rs1 and rs2 registers
   */
  
   val id_ex_rd = Wire(Bool())
   id_ex_rd := false.B

   val if_id_rs1 = Wire(Bool())
   val if_id_rs2 = Wire(Bool())
   if_id_rs1 := false.B
   if_id_rs2 := false.B
   
   when(io.id_ex_instr(6,0) === OPCODE_LOAD){
      id_ex_rd := true.B
   }

   when((io.if_id_instr(6,0) === OPCODE_JALR) || (io.if_id_instr(6,0) === OPCODE_B_TYPE) || (io.if_id_instr(6,0) === OPCODE_LOAD) || (io.if_id_instr(6,0) === OPCODE_STORE) ||
         (io.if_id_instr(6,0) === OPCODE_I_TYPE) || (io.if_id_instr(6,0) === OPCODE_R_TYPE)){
      if_id_rs1 := true.B
   }

   //only checks for the branches and register-register instructions since store instruction can have forwarding of the rs 2 from write back into memory stage 
   when((io.if_id_instr(6,0) === OPCODE_B_TYPE) || (io.if_id_instr(6,0) === OPCODE_R_TYPE)){
      if_id_rs2 := true.B
   }

   //performs check if there is a hazard either on rs1 or rs2
   when((id_ex_rd) && (if_id_rs1) && (io.id_ex_instr(11,7) === io.if_id_instr(19,15))){
      io.stall := true.B
   }.elsewhen((id_ex_rd) && (if_id_rs2) && (io.id_ex_instr(11,7) === io.if_id_instr(24,20))){
      io.stall := true.B
   }
   //resolves control hazards
   .elsewhen(io.if_id_instr(6,0) === OPCODE_B_TYPE || io.if_id_instr(6,0) === OPCODE_JAL || io.if_id_instr(6,0) === OPCODE_JALR){
       io.stall := true.B
    }.elsewhen(io.id_ex_instr(6,0) === OPCODE_JALR){
       io.stall := true.B
    }.otherwise{
      io.stall := false.B
   }
}
