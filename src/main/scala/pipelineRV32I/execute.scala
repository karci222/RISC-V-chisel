package pipelineRV32I

import chisel3._
import isRV32.Instructions._

/*
  Performs ALU operations and condition evaluation
  ALU is currently pretty inefficient, needs to be fixed somehow?
*/

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
       val reg2Out      = Output(UInt(32.W))
   })

   //instantiating ALU
   val alu  = Module(new ALU32())

   val useNPCIn = WireInit(false.B)
   val useImmidiate = WireInit(false.B)
 
   useImmidiate := false.B
   useNPCIn     := false.B
   io.cond      := false.B

   //instructions which are using immidiate operands only
   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_STORE || io.instrIn(6,0) === OPCODE_LOAD || io.instrIn(6,0) === OPCODE_LUI ||
        io.instrIn(6,0) === OPCODE_JALR){
       useImmidiate := true.B
   } 
  
   //branch instructions resolution - all comparisons are done here
   when(io.instrIn(6,0) === OPCODE_B_TYPE){
       useImmidiate := true.B
       useNPCIn     := true.B
       when(io.instrIn(14, 12) === "b000".U){
           io.cond := io.reg1 === io.reg2
       }
       when(io.instrIn(14, 12) === "b001".U){
           io.cond := io.reg1 =/= io.reg2
       }
       when(io.instrIn(14, 12) === "b100".U){
           io.cond := io.reg1.asSInt < io.reg2.asSInt
       }
       when(io.instrIn(14, 12) === "b101".U){
           io.cond := !(io.reg1.asSInt < io.reg2.asSInt)
       }
       when(io.instrIn(14, 12) === "b110".U){
           io.cond := io.reg1 < io.reg2
       }
       when(io.instrIn(14, 12) === "b111".U){
           io.cond := !(io.reg1 < io.reg2)
       }
   }

   //two instructions apart frm the branch that are using immidiate and NPC as well
   when(io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_AUIPC){
       useImmidiate := true.B
       useNPCIn := true.B
   }

   //contents of the register rs2 are forced out - used during store. Must be put through here, otherwise problems with forwarding logic might occur
   io.reg2Out := io.reg2
   
   //multiplexes input to the ALU
   val muxA = Mux(useNPCIn, io.NPCIn, io.reg1)
   val muxB = Mux(useImmidiate, io.immidiate, io.reg2)
   
   //ALU inputs
   alu.io.funct := io.funct
   alu.io.A     := muxA
   alu.io.B     := muxB
   io.res       := alu.io.res
}




