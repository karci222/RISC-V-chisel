package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

//this part simulates transition from Memory to WB stage
class MemoryWBTop() extends Module(){
   val io = IO(new Bundle {
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataToWB = Output(UInt(32.W))
       val instrIn = Input(UInt(32.W))
   })

  
   val memory = Module(new rv32MEM())
   val mem_wb_reg = RegNext(memory.io.dataOut)
   
   memory.io.addrIn  := io.addrIn
   memory.io.dataIn  := io.dataIn
   memory.io.instrIn := io.instrIn
   
   io.dataToWB := mem_wb_reg
}

class MemoryTest(dut: MemoryWBTop) extends PeekPokeTester(dut){
   poke(dut.io.instrIn, "b00000010001100010010011010100011".asUInt(32.W))
   poke(dut.io.addrIn, 34.U)
   poke(dut.io.dataIn, 12.U)
   step(1)
   poke(dut.io.instrIn, "b00000010001100010010011010100011".asUInt(32.W))
   poke(dut.io.addrIn, 30.U)
   poke(dut.io.dataIn, 14.U)
   step(1)
   poke(dut.io.instrIn, "b00000010001100010010011010100011".asUInt(32.W))
   poke(dut.io.addrIn, 26.U)
   poke(dut.io.dataIn, 120.U)
   step(1)
   poke(dut.io.instrIn, "b00000101011000000010000110000011".asUInt(32.W))
   poke(dut.io.addrIn, 34.U)
   step(1)
   expect(dut.io.dataToWB, 12.U)
   poke(dut.io.instrIn, "b00000101011000000010000110000011".asUInt(32.W))
   poke(dut.io.addrIn, 26.U)
   step(1)
   expect(dut.io.dataToWB, 120.U)
   poke(dut.io.instrIn, "b00000101011000000010000110000011".asUInt(32.W))
   poke(dut.io.addrIn, 30.U)
   step(1)
   expect(dut.io.dataToWB, 14.U)
   step(1)
}

object MemoryTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new MemoryWBTop) {
    c => new MemoryTest(c)
  }
}
