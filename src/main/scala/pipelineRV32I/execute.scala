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
 
   useImmidiate := false.B
   useNPCIn     := false.B
   io.cond := false.B


   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_STORE || io.instrIn(6,0) === OPCODE_LOAD){
       useImmidiate := true.B
   } 
  
   
   when(io.instrIn(6,0) === OPCODE_B_TYPE){
       when(io.instrIn(14, 12) === "b000".U){
           io.cond := alu.io.res === 0.U
       }
       when(io.instrIn(14, 12) === "b001".U){
           io.cond := alu.io.res =/= 0.U
       }
       when(io.instrIn(14, 12) === "b100".U){
           io.cond := alu.io.res === 1.U
       }
       when(io.instrIn(14, 12) === "b101".U){
           io.cond := alu.io.res === 0.U
       }
       when(io.instrIn(14, 12) === "b110".U){
           io.cond := alu.io.res === 1.U
       }
       when(io.instrIn(14, 12) === "b111".U){
           io.cond := alu.io.res === 0.U
       }
   }

   val muxA = Mux(useNPCIn, io.NPCIn, io.reg1)
   val muxB = Mux(useImmidiate, io.immidiate, io.reg2)
   
   

   alu.io.funct := io.funct
   alu.io.A     := muxA
   alu.io.B     := muxB
   io.res       := alu.io.res
}




