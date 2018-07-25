package pipelineRV32I

import chisel3._


class ALU32() extends Module(){
   val io = IO(new Bundle{
      val funct = Input(UInt(10.W))
      val A     = Input(UInt(32.W))
      val B     = Input(UInt(32.W))
      val res   = Output(UInt(32.W))
      //flags needed to be added
   }

   val negA := ~A + 1.U
   val negB := ~B + 1.U
   val resTemp := Wire(UInt(33.W))
   

   when(io.funct === Bits(b"0000000000")){
     //performs addition
     resTemp := A+B
   }.elsewhen(io.funct === Bits(b"0100000000")){
     //performs subtraction
     resTemp := A+negB
   }.elsewhen(io.funct === Bits(b"0000000001")){
     //performs left logic shift
     resTemp := A << B
   }.elsewhen(io.funct === Bits(b"0000000010")){
     //SLT
     when(A(31) === 1.U && B(31) === 0.U){
	resTemp := 1.U
     }.elsewhen(A(31) === 1.U && B(31) === 1.U && negA < negB)){
        resTemp := 0.U
     }.elsewhen(A < B){
   	resTemp := 1.U
     }.otherwise{
 	resTemp := 0.U
     }
   }.elsewhen(io.funct === Bits(b"0000000011")){
     //SLTU
     when(A < B){
        resTemp := 1.U
     }.otherwise{
        resTemp := 0.U
     }
   }.elsewhen(io.funct === Bits(b"0000000100")){
     //XOR
     resTemp := A ^ B
   }.elsewhen(io.funct === Bits(b"0000000101")){
     //SRL
     resTemp := A >> B
   }.elsewhen(io.funct === Bits(b"0100000101")){
     //SRA
     resTemp(30, 0) := A >> B
     resTemp(31) := A(31)
   }.elsewhen(io.funct === Bits(b"0000000110")){
     //OR
     resTemp := A | B
   }.elsewhen(io.funct === Bits(b"0000000111"))
     //AND
     resTemp := A & B
   }
   
   res := resTemp(31, 0)
}
