package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32WB() extends Module(){
  val io = IO(new Bundle{
     val opcode   = Input(UInt(32.W))
     val writeReg = Output(Bool())
  })

  io.writeReg := Bool(false)  

  when(io.opcode === OPCODE_R_TYPE || io.opcode === OPCODE_LOAD/*or other not specified yet*/){
     io.writeReg := Bool(true)
  }
}
