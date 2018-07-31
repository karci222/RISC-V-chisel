package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32MEM() extends Module(){
   val io = IO(new Bundle {
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val instrIn = Input(UInt(32.W))
   })

   val dataMemory = Module(new DataMemory())   

   dataMemory.io.addrIn := io.addrIn
   dataMemory.io.dataIn := io.dataIn
   io.dataOut           := dataMemory.io.dataOut
   dataMemory.io.load   := false.B

   when(io.instrIn(6,0) === OPCODE_STORE){
     dataMemory.io.load := true.B
   }
}
