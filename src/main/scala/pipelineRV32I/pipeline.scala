package pipelineRV32I

import chisel3._

class rv32Ipipeline(program: Seq[UInt]) extends Module(){
   val io = IO(new Bundle{
       val IROut = Output(UInt(32.W))
   })

   /*val instruction_fetch  = Module(new rv32IF())
   val instruction_memory = Module(new InstructionRom(program))
   val instruction_decode = Module(new rv32ID())
   val registers          = Module(new RegistryFile())
   val execute            = Module(new rv32EX())
   val mem                = Module(new rv32MEM())      

   instruction_memory.io.addrIn := instruction_fetch.io.PCOut >> 2

   instruction_fetch.io.condIn 	:= ex_mem_condition
   instruction_fetch.io.nextPC  := ex_mem_NPC_reg
   instruction_fetch.io.branch  := false.B  
 
   instruction_decode.io.instrIn := if_id_IR_reg

   registers.io.regIn         := 0.U
   registers.io.regInSelector := 0.U
   registers.io.writeEn       := false.B   
   registers.io.reg1Selector  := instruction_decode.io.reg1
   registers.io.reg2Selector  := instruction_decode.io.reg2

   execute.io.funct     := id_ex_funct
   execute.io.reg1      := id_ex_A
   execute.io.reg2      := id_ex_B
   execute.io.immidiate := id_ex_immidiate_reg
   execute.io.NPCIn     := id_ex_NPC_reg
   execute.io.instrIn   := id_ex_IR_reg

   //IF_ID_registers
   val if_id_NPC_reg = RegNext(instruction_fetch.io.NPCOut)
   val if_id_IR_reg  = RegNext(instruction_memory.io.dataOut)
  
   //ID_EX_registers
   val id_ex_NPC_reg       = RegNext(if_id_NPC_reg)
   val id_ex_IR_reg        = RegNext(if_id_IR_reg)
   val id_ex_immidiate_reg = RegNext(instruction_decode.io.immidiate)
   val id_ex_funct_reg     = RegNext(instruction_decode.io.funct)
   val id_ex_A_reg         = RegNext(registers.io.regOut1)
   val id_ex_B_reg         = RegNext(registers.io.regOut2)
 
   //ex_mem registers
   val ex_mem_NPC_reg       = RegNext(id_ex_NPC_reg)
   val ex_mem_IR_reg        = RegNext(id_ex_IR_reg)
   val ex_mem_condition_reg = RegNext(execute.io.cond)
   val ex_mem_res_reg       = RegNext(execute.io.res)
   val ex_mem_B_reg_reg     = RegNext(id_ex_B_reg)

   //mem_wb registers
   val mem_wb_IR_reg        = RegNext(ex_mem_IR_reg)
   val mem_wb_res_reg       = RegNext(ex_mem_res_reg)
   
      io.IROut := if_id_IR_reg

   */

}

