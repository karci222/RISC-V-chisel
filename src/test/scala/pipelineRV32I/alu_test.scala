package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class ALUTest(dut: rv32IF) extends PeekPokeTester(dut){

}

object IFTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new ALU32) {
    c => new IFTest(c)
  }
}
