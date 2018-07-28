package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32EX() extends Module(){
   val io = IO(new Bundle{
       val cond         = Output(Bool())
       val res          = Output(UInt(32.W))
       val funct        = Input(UInt(10.W))
       val reg1         = Input(UInt(32.W))
       val reg2         = Input(UInt(32.W))
       val immidiate    = Input(UInt(32.W))
       val NPCIn        = Input(UInt(32.W))
       val useImmidiate = Input(Bool())
       val useNPCIn     = Input(Bool())
   })

   val alu  = Module(new ALU32())
   val muxA = Mux(io.useNPCIn, io.NPCIn, io.reg1)
   val muxB = Mux(io.useImmidiate, io.immidiate, io.reg2)
   
   io.cond := 0.U

   alu.io.funct := io.funct
   alu.io.A     := io.reg1
   alu.io.B     := io.reg2
   io.res       := alu.io.res
}




