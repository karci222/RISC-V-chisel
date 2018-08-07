package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32MEM() extends Module(){
   val io = IO(new Bundle {
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val instrIn = Input(UInt(32.W))

       val addrOutPipeline = Output(UInt(32.W))
       val dataOutPipeline = Output(UInt(32.W))
       val dataInPipeline  = Input(UInt(32.W))
       val WE              = Output(UInt(32.W))
   })

   io.WE := false.B

   io.addrOutPipeline := io.addrIn
   io.dataOutPipeline := io.dataIn
   io.dataOut         := io.dataInPipeline

   when(io.instrIn(6,0) === OPCODE_STORE){
     io.WE := true.B
   }
}
