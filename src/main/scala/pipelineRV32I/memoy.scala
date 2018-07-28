package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32MEM() extends Module(){
   val io = IO(new Bundle {
       val dataLoadedIn    = Input(UInt(32.W))
       val dataToStore     = Input(UInt(32.W))
       val dataToMemory    = Output(UInt(32.W))
       val dataLoadedOut   = Output(UInt(32.W))
       val addressStoreIn  = Input(UInt(32.W)) 
       val addressStoreOut = Output(UInt(32.W))
       val storeInst       = Output(Bool())
       val opcode          = Input(UInt(7.W))
   })

   io.dataToMemory := io.dataToStore
   io.addressStoreOut := io.addressStoreIn
   io.dataLoadedOut := io.dataLoadedIn
   io.storeInst := Bool(false)

   when(io.opcode === OPCODE_STORE){
     io.storeInst := Bool(true)
   }
}
