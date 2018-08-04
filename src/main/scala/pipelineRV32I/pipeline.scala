package pipelineRV32I

import chisel3._

class rv32Ipipeline(program: Seq[UInt]) extends Module(){
   val io = IO(new Bundle{
       val res = Output(UInt(32.W))
   })

   val instruction_fetch  = Module(new rv32IF())
   val instruction_memory = Module(new InstructionRom(program))
   val instruction_decode = Module(new rv32ID())
   val registers          = Module(new RegistryFile())
   val execute            = Module(new rv32EX())
   val mem                = Module(new rv32MEM()) 
   val write_back         = Module(new rv32WB())     

   

   //IF_ID_registers
   val if_id_NPC_reg = RegInit(0.U(32.W))
   val if_id_IR_reg  = RegInit(0.U(32.W))

   if_id_NPC_reg := instruction_fetch.io.NPCOut
   if_id_IR_reg  := instruction_memory.io.dataOut

   //ID_EX_registers
   val id_ex_NPC_reg       = RegInit(0.U(32.W))
   val id_ex_IR_reg        = RegInit(0.U(32.W))
   val id_ex_immidiate_reg = RegInit(0.U(32.W))
   val id_ex_funct_reg     = RegInit(0.U(10.W))
   val id_ex_A_reg         = RegInit(0.U(32.W))
   val id_ex_B_reg         = RegInit(0.U(32.W))

   id_ex_NPC_reg       := if_id_NPC_reg
   id_ex_IR_reg        := if_id_IR_reg
   id_ex_immidiate_reg := instruction_decode.io.immidiate
   id_ex_funct_reg     := instruction_decode.io.funct
   id_ex_A_reg         := registers.io.regOut1
   id_ex_B_reg         := registers.io.regOut2
 
   //ex_mem registers
   val ex_mem_NPC_reg       = RegInit(0.U(32.W))
   val ex_mem_IR_reg        = RegInit(0.U(32.W))
   val ex_mem_condition_reg = RegInit(false.B)
   val ex_mem_res_reg       = RegInit(0.U(32.W))
   val ex_mem_B_reg         = RegInit(0.U(32.W))

   ex_mem_NPC_reg       := id_ex_NPC_reg
   ex_mem_IR_reg        := id_ex_IR_reg
   ex_mem_condition_reg := execute.io.cond
   ex_mem_res_reg       := execute.io.res
   ex_mem_B_reg         := id_ex_B_reg

   //mem_wb registers
   val mem_wb_NPC_reg       = RegInit(0.U(32.W))
   val mem_wb_IR_reg        = RegInit(0.U(32.W))
   val mem_wb_res_reg       = RegInit(0.U(32.W))
   val mem_wb_lmd_reg       = RegInit(0.U(32.W))

   mem_wb_NPC_reg := ex_mem_NPC_reg
   mem_wb_IR_reg  := ex_mem_IR_reg
   mem_wb_res_reg := ex_mem_res_reg
   mem_wb_lmd_reg := mem.io.dataOut
 

   instruction_memory.io.addrIn := instruction_fetch.io.PCOut >> 2

   instruction_fetch.io.condIn 	:= ex_mem_condition_reg
   instruction_fetch.io.nextPC  := ex_mem_res_reg
   instruction_fetch.io.instrIn := ex_mem_IR_reg
 
   instruction_decode.io.instrIn := if_id_IR_reg

   registers.io.regIn         := write_back.io.dataToReg
   registers.io.regInSelector := write_back.io.regInSelector
   registers.io.writeEn       := write_back.io.writeRegister
   registers.io.reg1Selector  := instruction_decode.io.reg1
   registers.io.reg2Selector  := instruction_decode.io.reg2

   execute.io.funct     := id_ex_funct_reg
   execute.io.reg1      := id_ex_A_reg
   execute.io.reg2      := id_ex_B_reg
   execute.io.immidiate := id_ex_immidiate_reg
   execute.io.NPCIn     := id_ex_NPC_reg
   execute.io.instrIn   := id_ex_IR_reg

   mem.io.addrIn  := ex_mem_res_reg
   mem.io.dataIn  := ex_mem_B_reg
   mem.io.instrIn := ex_mem_IR_reg

   write_back.io.instrIn := mem_wb_IR_reg
   write_back.io.res     := mem_wb_res_reg
   write_back.io.dataIn  := mem_wb_lmd_reg
   write_back.io.NPCIn   := mem_wb_NPC_reg

   io.res := execute.io.res
}

