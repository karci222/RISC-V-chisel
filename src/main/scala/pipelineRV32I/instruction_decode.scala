package pipelineRV32I


import chisel3._
import isRV32._


class rv32ID() extends Module(){
   val io = IO(new Bundle{
       val reg1      = Output(UInt(5.W))
       val reg2      = Output(UInt(5.W))
       val immidiate = Output(UInt(32.W))
       val instrIn   = Input(UInt(32.W))
   })

   reg1 = instrIn(15, 10)
   reg2 = instrIn(24, 20)
   
   when(instrIn(6, 0) === OPCODE_R_TYPE){
       immidiate := 0.U
   } 
}
