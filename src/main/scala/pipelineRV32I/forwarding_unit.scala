package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class ForwardingUnit() extends Module(){
   val io = IO(new Bundle{
      val reg1 = Input(UInt(5.W))
      val reg2 = Input(UInt(5.W))
      val ex_mem_inst = Input(UInt(32.W))
      val mem_wb_inst = Input(UInt(32.W))
      val forward_A = Output(UInt(2.W))
      val forward_B = Output(UInt(2.W))
   })
 
   val ex_mem_inst_rd = Wire(Bool())
   
   ex_mem_inst_rd := false.B

   when((io.ex_mem_inst(6,0) === OPCODE_LUI) || (io.ex_mem_inst(6,0) === OPCODE_AUIPC) || (io.ex_mem_inst(6,0) === OPCODE_JAL) || (io.ex_mem_inst(6,0) === OPCODE_JALR)
                        ||   (io.ex_mem_inst(6,0) === OPCODE_I_TYPE) || (io.ex_mem_inst(6,0) === OPCODE_R_TYPE)){

      ex_mem_inst_rd := true.B
   }

   val mem_wb_inst_rd = Wire(Bool())
  
   mem_wb_inst_rd := false.B
   
   when((io.mem_wb_inst(6,0) === OPCODE_LUI) || (io.mem_wb_inst(6,0) === OPCODE_AUIPC) || (io.mem_wb_inst(6,0) === OPCODE_JAL) || (io.mem_wb_inst(6,0) === OPCODE_JALR)
                        || (io.mem_wb_inst(6,0) === OPCODE_LOAD) ||  (io.mem_wb_inst(6,0) === OPCODE_I_TYPE) || (io.mem_wb_inst(6,0) === OPCODE_R_TYPE)){
       mem_wb_inst_rd := true.B
   }
 
   when(ex_mem_inst_rd && (io.ex_mem_inst(11,7) === io.reg1) && io.reg1 =/= 0.U){
     io.forward_A := "b10".U
   }.elsewhen(mem_wb_inst_rd && (io.mem_wb_inst(11,7) === io.reg1) && io.reg1 =/= 0.U){
     io.forward_A := "b01".U
   }.otherwise{
     io.forward_A := "b00".U
   }

   when(ex_mem_inst_rd && (io.ex_mem_inst(11,7) === io.reg2) && io.reg2 =/= 0.U){
     io.forward_B := "b10".U
   }.elsewhen(mem_wb_inst_rd && (io.mem_wb_inst(11,7) === io.reg2) && io.reg2 =/= 0.U){
     io.forward_B := "b01".U
   }.otherwise{
     io.forward_B := "b00".U
   }
}
