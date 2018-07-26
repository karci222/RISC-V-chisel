package pipelineRV32I

import chisel3._
import isRV32.Instructions._

class rv32EX() extends Module(){
   val io = IO(new Bundle{

   })

   val alu = Module(new ALU32())
}




