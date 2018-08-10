package pipelineRV32I

import chisel3._

/*
   Arithmetic logic unit of the processor
   Input and output sizes are both 32 bits
   Function is long 10 bits
*/

class ALU32() extends Module(){
   val io = IO(new Bundle{
      val funct = Input(UInt(10.W))
      val A     = Input(UInt(32.W))
      val B     = Input(UInt(32.W))
      val res   = Output(UInt(32.W))
   })
   
   val A = io.A
   val B = io.B

   //temporary results
   val resTemp1 = WireInit(0.U(32.W))
   val resTemp2 = WireInit(0.U(32.W))
   val resTemp3 = WireInit(0.U(32.W))
   val resTemp4 = WireInit(0.U(32.W))
   val resTemp5 = WireInit(0.U(32.W))
   val resTemp6 = WireInit(0.U(32.W))
   val resTemp7 = WireInit(0.U(32.W))
   val resTemp8 = WireInit(0.U(32.W))
   val resTemp9 = WireInit(0.U(32.W))
   val resTemp10 = WireInit(0.U(32.W))

   //Computes all of the operations in parallel
   resTemp1 := A+B
   resTemp2 := A-B
   resTemp3 := A << B(4, 0)
   resTemp4 := A.asSInt < B.asSInt
   resTemp5 := A < B
   resTemp6 := A ^ B
   resTemp7 := A >> B(4,0)
   resTemp8 := (A.asSInt >> B(4,0)).asUInt
   resTemp9 := A | B
   resTemp10 := A & B

   //selects only one output
   when(io.funct === "b0000000000".U){
     //performs addition
     io.res := resTemp1
   }.elsewhen(io.funct === "b0100000000".U){
     //performs subtraction
     io.res := resTemp2
   }.elsewhen(io.funct === "b0000000001".U){
     //SLL
     io.res := resTemp3
   }.elsewhen(io.funct === "b0000000010".U){
     //SLT
     io.res := resTemp4
   }.elsewhen(io.funct === "b0000000011".U){
     //SLTU
     io.res := resTemp5
   }.elsewhen(io.funct === "b0000000100".U){
     //XOR
     io.res := resTemp6
   }.elsewhen(io.funct === "b0000000101".U){
     //SRL
     io.res := resTemp7
   }.elsewhen(io.funct === "b0100000101".U){
     //SRA
     io.res := resTemp8
   }.elsewhen(io.funct === "b0000000110".U){
     //OR
     io.res := resTemp9
   }.elsewhen(io.funct === "b0000000111".U){
     //AND
     io.res := resTemp10
   }.otherwise{
     //this situation probably should not occur considering the instruction decode phase works correctly!
     io.res := 0.U
   }
   
}
