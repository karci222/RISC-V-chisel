package pipelineRV32I

import chisel3._
import isRV32.Instructions._


/*
   Memory stage of the pipeline.
   Only sets the write enabled and forwards data either out of pipeline or to the next stage
*/

class rv32MEM() extends Module(){
   val io = IO(new Bundle {
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val instrIn = Input(UInt(32.W))

       val addrOutPipeline = Output(UInt(32.W))
       val dataOutPipeline = Output(UInt(32.W))
       val dataInPipeline  = Input(UInt(32.W))
       val WE              = Output(Bool())
   })

   io.WE := false.B

   io.addrOutPipeline := io.addrIn
   io.dataOutPipeline := io.dataIn
   io.dataOut         := io.dataInPipeline

   when(io.instrIn(6,0) === OPCODE_STORE){
     //SB
     when(io.instrIn(14,12) === "b000".U){
       io.dataOutPipeline := io.dataIn & "h_ff".U
     }
     //SH
     .elsewhen(io.instrIn(14,12) === "b001".U){
       io.dataOutPipeline := io.dataIn & "h_ffff".U
     }
     //SW
     .elsewhen(io.instrIn(14,12) === "b010".U){
       io.dataOutPipeline := io.dataIn
     }

     io.WE := true.B
   }
}
