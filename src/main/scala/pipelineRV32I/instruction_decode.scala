package pipelineRV32I


import chisel3._
import chisel3.util._
import isRV32.Instructions._

/*
   Instruction decode stage of the pipeline
*/

class rv32ID() extends Module(){
   val io = IO(new Bundle{
       val reg1      = Output(UInt(5.W))
       val reg2      = Output(UInt(5.W))
       val immidiate = Output(UInt(32.W))
       val funct     = Output(UInt(10.W))
       val instrIn   = Input(UInt(32.W))
       val NPCIn     = Input(UInt(32.W))
       val NPCOut    = Output(UInt(32.W))
   })
   
   io.NPCOut := io.NPCIn
   
   //sets register 1 and register 2 selectors
   io.reg1 := io.instrIn(19, 15)
   io.reg2 := io.instrIn(24, 20)   

   //sets functions for the ALU
   val funct7     = io.instrIn(31, 25)
   val funct3     = io.instrIn(14, 12)
   val funct_temp = Cat(funct7, funct3) 
   
   
   io.funct := 0.U
   io.immidiate := 0.U

   //used for sign extension
   val immidiate_temp = Wire(SInt(32.W))
   immidiate_temp := 0.asSInt

   //used for LUI and AUIPC - zeros in the lower 12 bits
   val zeros12 = Wire(UInt(12.W))
   zeros12 := 0.asUInt
   
   //depending on the opcode constructs functions and immidiates
   when(io.instrIn(6, 0) === OPCODE_R_TYPE){
       io.immidiate := 0.U
       io.funct := funct_temp
   }.elsewhen(io.instrIn(6,0) === OPCODE_STORE){												
       immidiate_temp := (Cat(io.instrIn(31,25), io.instrIn(11, 7)).asSInt)
       io.immidiate := immidiate_temp.asUInt
       io.funct     := 0.U
   }.elsewhen(io.instrIn(6,0) === OPCODE_LOAD){
       immidiate_temp := (io.instrIn(31, 20).asSInt)
       io.immidiate := immidiate_temp.asUInt
       io.funct     := 0.U
   }.elsewhen(io.instrIn(6,0) === OPCODE_I_TYPE){
       when(funct3 ==="b001".U ||  funct3 === "b101".U){
	  io.funct := Cat(funct7, funct3)
          io.immidiate := io.instrIn(24, 20).asUInt
       }.otherwise{
          io.funct := Cat(0.U(7.W), funct3)
          immidiate_temp := (io.instrIn(31, 20).asSInt)
	  io.immidiate := immidiate_temp.asUInt
       }
   }.elsewhen(io.instrIn(6,0) === OPCODE_B_TYPE){
       io.funct := 0.U
       immidiate_temp := (Cat(io.instrIn(31), io.instrIn(7), io.instrIn(30, 25), io.instrIn(11,8), 0.U).asSInt)
       io.NPCOut := (io.NPCIn.asSInt + immidiate_temp).asUInt
       io.immidiate := immidiate_temp.asUInt
   }.elsewhen(io.instrIn(6,0) === OPCODE_JAL){
       io.funct := 0.U
       immidiate_temp := (Cat(io.instrIn(31), io.instrIn(19, 12), io.instrIn(20), io.instrIn(30, 21), 0.U).asSInt)
       io.NPCOut := (io.NPCIn.asSInt + immidiate_temp).asUInt
       io.immidiate := immidiate_temp.asUInt
   }.elsewhen(io.instrIn(6,0) === OPCODE_JALR){
       io.funct := 0.U
       immidiate_temp := io.instrIn(31, 20).asSInt
       io.immidiate := immidiate_temp.asUInt
   }.elsewhen(io.instrIn(6,0) === OPCODE_LUI || io.instrIn(6,0) === OPCODE_AUIPC){
       io.funct := 0.U 
       io.immidiate := Cat(io.instrIn(31, 12), zeros12)
       io.reg1 := 0.U
   }
}
