package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32WB() extends Module(){
   val io = IO(new Bundle{
      val instrIn       = Input(UInt(32.W))
      val res           = Input(UInt(32.W))
      val dataIn        = Input(UInt(32.W))
      val NPCIn         = Input(UInt(32.W))
      val dataToReg     = Output(UInt(32.W))
      val regInSelector = Output(UInt(5.W))
      val writeRegister = Output(Bool())
   })
 
   io.writeRegister := false.B
   io.regInSelector := io.instrIn(11, 7)

   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE || io.instrIn(6,0) === OPCODE_LOAD || io.instrIn(6,0) === OPCODE_LUI || 
        io.instrIn(6,0) === OPCODE_AUIPC || io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_JALR){
      io.writeRegister := true.B
   }

   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE || io.instrIn(6,0) === OPCODE_LUI || 
        io.instrIn(6,0) === OPCODE_AUIPC){
      io.dataToReg := io.res
   }.elsewhen(io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_JALR){
      io.dataToReg := io.NPCIn
   }.otherwise{
      io.dataToReg := io.dataIn
   }
}
