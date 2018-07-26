package pipelineRV32I


import chisel3._
import isRV32.Instructions._

class rv32ID() extends Module(){
   val io = IO(new Bundle{
       val reg1      = Output(UInt(5.W))
       val reg2      = Output(UInt(5.W))
       val immidiate = Output(UInt(32.W))
       val instrIn   = Input(UInt(32.W))
   })

   io.reg1 := io.instrIn(15, 10)
   io.reg2 := io.instrIn(24, 20)
   
   when(io.instrIn(6, 0) === OPCODE_R_TYPE){
       io.immidiate := 0.U
   } 
}
