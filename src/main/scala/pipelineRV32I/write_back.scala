package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32WB() extends Module(){
   val io = IO(new Bundle{
      val instrIn       = Input(UInt(32.W))
      val res           = Input(UInt(32.W))
      val dataIn        = Input(UInt(32.W))
      val dataToReg     = Output(UInt(32.W))
      val regInSelector = Output(UInt(5.W))
      val writeRegister = Output(Bool())
   })
 
   io.writeRegister := false.B
   io.regInSelector := io.instrIn(11, 7)

   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE || io.instrIn(6,0) === OPCODE_LOAD){
      io.writeRegister := true.B
   }

   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE){
      io.dataToReg := io.res
   }.otherwise{
      io.dataToReg := io.dataIn
   }
}
