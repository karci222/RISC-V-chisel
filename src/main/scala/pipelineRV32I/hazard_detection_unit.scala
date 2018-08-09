package pipelineRV32I

import chisel3._
import isRV32.Instructions._


class HazardDetectionUnit() extends Module(){
   val io = IO(new Bundle{
      val id_ex_instr = Input(UInt(32.W))
      val if_id_instr = Input(UInt(32.W))
      val stall = Output(Bool())
   })

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

   when((io.if_id_instr(6,0) === OPCODE_B_TYPE) || (io.if_id_instr(6,0) === OPCODE_R_TYPE)){
      if_id_rs2 := true.B
   }

   when((id_ex_rd) && (if_id_rs1) && (io.id_ex_instr(11,7) === io.if_id_instr(19,15))){
      io.stall := true.B
   }.elsewhen((id_ex_rd) && (if_id_rs2) && (io.id_ex_instr(11,7) === io.if_id_instr(24,20))){
      io.stall := true.B
   }.otherwise{
      io.stall := false.B
   }
}
