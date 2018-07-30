package pipelineRV32I

import chisel3._

class PipelineTop() extends Module(){
   val io = IO(new Bundle{
   })
   val testVec = Array(1.U, 2.U, 3.U, 4.U, 5.U, 6.U, 7.U, 8.U, 9.U, 10.U, 11.U, 12.U, 13.U, 15.U, 24.U)

   val pipeline = Module(new rv32Ipipeline(testVec))  
   
}

