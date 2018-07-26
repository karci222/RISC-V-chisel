package pipelineRV32I

import chisel3._


class ALU32() extends Module(){
   val io = IO(new Bundle{
      val funct = Input(UInt(10.W))
      val A     = Input(UInt(32.W))
      val B     = Input(UInt(32.W))
      val res   = Output(UInt(32.W))
      //flags needed to be added
   })
   
  
   val A = io.A
   val B = io.B


   val resTemp = Wire(UInt(33.W))
   resTemp := 0.U

   when(io.funct === "b0000000000".U){
     //performs addition
     resTemp := A+B
   }.elsewhen(io.funct === "b0100000000".U){
     //performs subtraction
     resTemp := A-B
   }.elsewhen(io.funct === "b0000000001".U){
     //SLL
     resTemp := A << B(4, 0)
   }.elsewhen(io.funct === "b0000000010".U){
     //SLT
     resTemp := A.asSInt < B.asSInt
   }.elsewhen(io.funct === "b0000000011".U){
     //SLTU
     resTemp := A < B
   }.elsewhen(io.funct === "b0000000100".U){
     //XOR
     resTemp := A ^ B
   }.elsewhen(io.funct === "b0000000101".U){
     //SRL
     resTemp := A >> B(4,0)
   }.elsewhen(io.funct === "b0100000101".U){
     //SRA
     resTemp := (A.asSInt >> B(4,0)).asUInt
   }.elsewhen(io.funct === "b0000000110".U){
     //OR
     resTemp := A | B
   }.elsewhen(io.funct === "b0000000111".U){
     //AND
     resTemp := A & B
   }
   
   io.res := resTemp(31, 0)
}
