package pipelineRV32I


import chisel3._
import chisel3.util._

class registryFile() extends Module(){
   val io = IO(new Bundle{
        val regOut = Vec
   })
}
