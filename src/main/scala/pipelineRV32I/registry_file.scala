package pipelineRV32I


import chisel3._
import chisel3.util._

/*
  Registry file of the processor
  Contains 32 32 bit registers
*/

class RegistryFile() extends Module(){
   val io = IO(new Bundle{
        val regOut1       = Output(UInt(32.W))
	val regOut2       = Output(UInt(32.W))
	val regIn         = Input(UInt(32.W))
	val reg1Selector  = Input(UInt(5.W))
	val reg2Selector  = Input(UInt(5.W))
	val regInSelector = Input(UInt(5.W))
	val writeEn	  = Input(Bool())
   })
   
   //initialization of the registers
   val registers = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
   
   //outputs from the selected registers
   io.regOut1 := registers(io.reg1Selector)
   io.regOut2 := registers(io.reg2Selector)
   
   //writes to the selecting register
   when(io.writeEn){
      registers(io.regInSelector) := io.regIn
   }
}
