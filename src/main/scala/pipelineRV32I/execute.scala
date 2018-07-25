package pipelineRV32I

import chisel3._


class rv32EX() extends Module(){
   class io = IO(new Bundle{

   }

   val alu = Module(new ALU32())
}




