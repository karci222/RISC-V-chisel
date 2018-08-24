package pipelineRV32I

import chisel3._
import isRV32.Instructions._

/*
   Pipeline of the processor
*/

class rv32Ipipeline() extends Module(){
   val io = IO(new Bundle{
       val res = Output(UInt(32.W))//debugging output
       val addrOutPipeline = Output(UInt(32.W))
       val dataOutPipeline = Output(UInt(32.W))
       val dataInPipeline  = Input(UInt(32.W))
       val WE              = Output(Bool())

       //for resetting pipeline
       val pcOut           = Output(UInt(32.W))
       val instrIn         = Input(UInt(32.W))
   })

   //instantiation of all of the modules
   val instruction_fetch     = Module(new rv32IF())
   val instruction_decode    = Module(new rv32ID())
   val registers             = Module(new RegistryFile())
   val execute               = Module(new rv32EX())
   val mem                   = Module(new rv32MEM()) 
   val write_back            = Module(new rv32WB()) 
   val forwarding_unit       = Module(new ForwardingUnit())
   val hazard_detection_unit = Module(new HazardDetectionUnit())

   //IF_ID_registers
   val if_id_NPC_reg = RegInit(0.U(32.W))
   val if_id_IR_reg  = RegInit(0.U(32.W))

   if_id_NPC_reg := instruction_fetch.io.NPCOut
   if_id_IR_reg  := io.instrIn
   

   //ID_EX_registers
   val id_ex_NPC_reg       = RegInit(0.U(32.W))
   val id_ex_IR_reg        = RegInit(0.U(32.W))
   val id_ex_immidiate_reg = RegInit(0.U(32.W))
   val id_ex_funct_reg     = RegInit(0.U(10.W))
   val id_ex_reg1          = RegInit(0.U(5.W))
   val id_ex_reg2          = RegInit(0.U(5.W))
   val id_ex_nextPC_reg    = RegInit(0.U(32.W))
   
   //registers are actaully read in the stage EX because the write from the write back writes the data in the end of the cycle and because of this we would have longer data hazard
   //I am not sure if this is the most correct way to do it and if it is not a wrong workaround.
   id_ex_NPC_reg       := if_id_NPC_reg
   id_ex_IR_reg        := if_id_IR_reg
   id_ex_immidiate_reg := instruction_decode.io.immidiate
   id_ex_funct_reg     := instruction_decode.io.funct
   id_ex_reg1          := instruction_decode.io.reg1
   id_ex_reg2          := instruction_decode.io.reg2
   id_ex_nextPC_reg    := instruction_decode.io.NPCOut

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
   ex_mem_B_reg         := execute.io.reg2Out

   //mem_wb registers
   val mem_wb_NPC_reg       = RegInit(0.U(32.W))
   val mem_wb_IR_reg        = RegInit(0.U(32.W))
   val mem_wb_res_reg       = RegInit(0.U(32.W))
   val mem_wb_lmd_reg       = RegInit(0.U(32.W))

   mem_wb_NPC_reg := ex_mem_NPC_reg
   mem_wb_IR_reg  := ex_mem_IR_reg
   mem_wb_res_reg := ex_mem_res_reg
   mem_wb_lmd_reg := mem.io.dataOut
 
   //since instruction memory is built from 32 bit words I always have to shift the PC register output by 2
   io.pcOut := instruction_fetch.io.PCOut(15,0) >> 2

   //instruction fetch stage inputs
   instruction_fetch.io.condIn 	 := execute.io.cond
   instruction_fetch.io.nextPC   := id_ex_nextPC_reg
   instruction_fetch.io.instrIn  := id_ex_IR_reg
   instruction_fetch.io.stall    := hazard_detection_unit.io.stall
   //for JALR
   instruction_fetch.io.nextPC2  := ex_mem_res_reg
   instruction_fetch.io.instrIn2 := ex_mem_IR_reg
   
   //instruction decode stage inputs, register-register transfers are done in the part where I instantiate registers
   instruction_decode.io.instrIn := if_id_IR_reg
   instruction_decode.io.NPCIn   := if_id_NPC_reg

   //register file inputs
   registers.io.regIn         := write_back.io.dataToReg
   registers.io.regInSelector := write_back.io.regInSelector
   registers.io.writeEn       := write_back.io.writeRegister
   registers.io.reg1Selector  := id_ex_reg1
   registers.io.reg2Selector  := id_ex_reg2

   //execute stage inputs
   execute.io.funct     := id_ex_funct_reg
   execute.io.immidiate := id_ex_immidiate_reg
   execute.io.NPCIn     := id_ex_NPC_reg
   execute.io.instrIn   := id_ex_IR_reg

   //memory stage inputs and outputs from the pipeline
   mem.io.addrIn         := ex_mem_res_reg
   mem.io.dataIn         := ex_mem_B_reg
   mem.io.instrIn        := ex_mem_IR_reg
   mem.io.dataInPipeline := io.dataInPipeline
  
   //memory outputs to the pipeline
   io.WE                 := mem.io.WE
   io.addrOutPipeline    := mem.io.addrOutPipeline
   io.dataOutPipeline    := mem.io.dataOutPipeline

   //write back stage inputs
   write_back.io.instrIn := mem_wb_IR_reg
   write_back.io.res     := mem_wb_res_reg
   write_back.io.dataIn  := mem_wb_lmd_reg
   write_back.io.NPCIn   := mem_wb_NPC_reg

   //inputs formerly used for testing. Not in use anymore, but still kept for simple debugging options
   io.res := instruction_fetch.io.PCOut
  
   //forwarding unit inputs
   forwarding_unit.io.reg1        := id_ex_reg1
   forwarding_unit.io.reg2        := id_ex_reg2
   forwarding_unit.io.ex_mem_inst := ex_mem_IR_reg
   forwarding_unit.io.mem_wb_inst := mem_wb_IR_reg

   //if there is dependence in ex/mem, then forward, then check dependence in write back stage
   when(forwarding_unit.io.forward_A === "b10".U){
      execute.io.reg1 := ex_mem_res_reg
   }.elsewhen(forwarding_unit.io.forward_A === "b01".U){
      execute.io.reg1 := write_back.io.dataToReg
   }.otherwise{
      execute.io.reg1 := registers.io.regOut1
   }

   //if there is dependence in ex/mem, then forward, then check dependence in write back stage
   when(forwarding_unit.io.forward_B === "b10".U){
      execute.io.reg2 := ex_mem_res_reg
   }.elsewhen(forwarding_unit.io.forward_B === "b01".U){
      execute.io.reg2 := write_back.io.dataToReg
   }.otherwise{
      execute.io.reg2 := registers.io.regOut2
   }

   //this can be solved outside the forwarding unit  - fast forwarding between load and store instruction from writeback to memory stage
   when((ex_mem_IR_reg(6,0) === OPCODE_STORE && mem_wb_IR_reg(6,0) === OPCODE_LOAD) && (mem_wb_IR_reg(11,7) === ex_mem_IR_reg(24,20))){
      mem.io.dataIn := mem_wb_lmd_reg
   }
   
   //hazard detection unit - on detecting hazards stalls the pipeline
   hazard_detection_unit.io.id_ex_instr := id_ex_IR_reg
   hazard_detection_unit.io.if_id_instr := if_id_IR_reg
   
   //stalls instruction in the pipeline and keeps it in the if stage
   //forwards only NOP instruction (ADDI x0 x0 0)
   when(hazard_detection_unit.io.stall){
      if_id_IR_reg := if_id_IR_reg
      id_ex_IR_reg := "b00000000000000000000000000010011".asUInt(32.W)
   }
   
   //predict untaken branch - if branch predicted, then fetch from this destination and discard the instruction after that
   when(((id_ex_IR_reg(6,0) === OPCODE_B_TYPE) && execute.io.cond) || id_ex_IR_reg(6,0) === OPCODE_JAL){
      io.pcOut := id_ex_nextPC_reg >> 2
      id_ex_IR_reg := "b00000000000000000000000000010011".asUInt(32.W)
   }
   
   //when JALR - two stalls since it also needs to link register
   //stall 1 - at ID_EX 
   when(id_ex_IR_reg(6,0) === OPCODE_JALR){
      id_ex_IR_reg := "b00000000000000000000000000010011".asUInt(32.W)
   }
   
   //stall 2 - at EX_MEM
   when(ex_mem_IR_reg(6,0) === OPCODE_JALR){
      io.pcOut := ex_mem_res_reg >> 2
      id_ex_IR_reg := "b00000000000000000000000000010011".asUInt(32.W)
   }
}

