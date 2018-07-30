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
       val instrIn      = Input(UInt(32.W))
   })

   val alu  = Module(new ALU32())
   
   val useNPCIn = WireInit(false.B)
   val useImmidiate = WireInit(false.B)

   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_STORE || io.instrIn(6,0) === OPCODE_LOAD){
       useImmidiate := true.B
   } 

   val muxA = Mux(useNPCIn, io.NPCIn, io.reg1)
   val muxB = Mux(useImmidiate, io.immidiate, io.reg2)
   
   io.cond := 0.U

   alu.io.funct := io.funct
   alu.io.A     := muxA
   alu.io.B     := muxB
   io.res       := alu.io.res
}




