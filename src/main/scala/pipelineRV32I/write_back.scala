package pipelineRV32I

import chisel3._
import isRV32.Instructions._

/*
   write back stage of the pipeline.
   responsible for writing data into the registers
*/

class rv32WB() extends Module(){
   val io = IO(new Bundle{
      val instrIn       = Input(UInt(32.W))
      val res           = Input(UInt(32.W))
      val dataIn        = Input(UInt(32.W))
      val NPCIn         = Input(UInt(32.W))
      val dataToReg     = Output(UInt(32.W))
      val regInSelector = Output(UInt(5.W))
      val writeRegister = Output(Bool())
   })
 
   io.writeRegister := false.B//default is that the instruction is not writing to the register
   io.regInSelector := io.instrIn(11, 7)//selector of the destination register
   
   //if the instruction writes to the destination register then activates the signal for write
   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE || io.instrIn(6,0) === OPCODE_LOAD || io.instrIn(6,0) === OPCODE_LUI || 
        io.instrIn(6,0) === OPCODE_AUIPC || io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_JALR){
      io.writeRegister := true.B
   }
   
   /*
     Selects either result from the ALU from immidiate and register-register instructions, NPC (PC+4) register from jumps and 
     data from memory otherwise (on LOAD instructions - for now suffiecient in future probably change of the if statement
    */
   when(io.instrIn(6,0) === OPCODE_I_TYPE || io.instrIn(6,0) === OPCODE_R_TYPE || io.instrIn(6,0) === OPCODE_LUI || 
        io.instrIn(6,0) === OPCODE_AUIPC){
      io.dataToReg := io.res
   }.elsewhen(io.instrIn(6,0) === OPCODE_JAL || io.instrIn(6,0) === OPCODE_JALR){
      io.dataToReg := io.NPCIn
   }.elsewhen(io.instrIn(6,0) === OPCODE_LOAD){
      io.dataToReg := 0.U
      //LB
      when(io.instrIn(14,12) === "b000".U){
         io.dataToReg := ((io.dataIn & "h_ff".U).asSInt).asUInt
      }
      //LH
      .elsewhen(io.instrIn(14,12) === "b001".U){
         io.dataToReg := ((io.dataIn & "h_ffff".U).asSInt).asUInt
      }
      //LW
      .elsewhen(io.instrIn(14,12) === "b010".U){
         io.dataToReg := io.dataIn
      }
      //LBU
      .elsewhen(io.instrIn(14,12) === "b100".U){
         io.dataToReg := io.dataIn & "h_ff".U
      }
      //LHU
      .elsewhen(io.instrIn(14,12) === "b101".U){
         io.dataToReg := io.dataIn & "h_ffff".U
      }
   }.otherwise{
      io.dataToReg := 0.U
   }
}
