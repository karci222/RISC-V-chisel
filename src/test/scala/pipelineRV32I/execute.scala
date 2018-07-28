package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class EXTest(dut: rv32EX) extends PeekPokeTester(dut){
    
}

object IDTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new rv32EX) {
    c => new EXTest(c)
  }
}
