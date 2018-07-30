package pipelineRV32I

import chisel3._

class rv32Ipipeline(program: Seq[UInt]) extends Module(){
   val io = IO(new Bundle{
       val IROut = Output(UInt(32.W))
   })

   val instruction_fetch  = Module(new rv32IF())
   val instruction_memory = Module(new InstructionRom(program))

   instruction_memory.io.addrIn := instruction_fetch.io.PCOut >> 2

   instruction_fetch.io.condIn 	:= false.B
   instruction_fetch.io.nextPC  := 0.U
   instruction_fetch.io.branch  := false.B  
 
   //IF_ID_registers
   val if_id_NPC_reg = RegInit(instruction_fetch.io.NPCOut)
   val if_id_IR_reg  = RegInit(instruction_memory.io.dataOut)
  
   io.IROut := if_id_IR_reg
}

