package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._


/*
This is not a real test of the memory, rather testing some stuff that I wanted to make sure about
*/
class DataMemoryTestTop() extends Module(){
   val io = IO(new Bundle{
       val addrIn  = Input(UInt(32.W))
       val dataIn  = Input(UInt(32.W))
       val dataOut = Output(UInt(32.W))
       val load    = Input(Bool())
    })   
 
   val dataMemory = Module(new DataMemory())
   val dataOutReg = RegNext(dataMemory.io.dataOut)

   dataMemory.io.addrIn := io.addrIn
   dataMemory.io.dataIn := io.dataIn
   io.dataOut           := dataOutReg
   dataMemory.io.load   := io.load
}

class DataMemoryTest(dut: DataMemoryTestTop) extends PeekPokeTester(dut){
   for(i <- 0 until 128){
      poke(dut.io.load, true.B)
      poke(dut.io.addrIn, i)
      poke(dut.io.dataIn, i*4)
      step(1)
   }
 
   poke(dut.io.load, false.B)
   poke(dut.io.addrIn, 0)
   step(1)

   for(i <- 1 until 128){
       expect(dut.io.dataOut, (i-1)*4)
       poke(dut.io.addrIn, i)
       step(1)
   }
}

object DataMemoryTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new DataMemoryTestTop) {
    c => new DataMemoryTest(c)
  }
}
