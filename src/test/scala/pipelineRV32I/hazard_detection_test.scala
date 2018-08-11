package pipelineRV32I

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class HazarDetectionUnitTest(dut: HazardDetectionUnit) extends PeekPokeTester(dut){
   //load instruction causing stall on rs1
   poke(dut.io.id_ex_instr, "b00000000111100000010001000000011".asUInt(32.W))
   poke(dut.io.if_id_instr, "b00000000100100100000000100010011".asUInt(32.W))
   expect(dut.io.stall, true.B)
   step(1)

   //load instruction causing stall on rs2
   poke(dut.io.id_ex_instr, "b00000000111100000010001000000011".asUInt(32.W))
   poke(dut.io.if_id_instr, "b01000000010000011000000100110011".asUInt(32.W))
   expect(dut.io.stall, true.B)
   step(1)

   //not load instruction
   poke(dut.io.id_ex_instr, "b00000000010000010000000100110011".asUInt(32.W))
   poke(dut.io.if_id_instr, "b01000000010000011000000100110011".asUInt(32.W))
   expect(dut.io.stall, false.B)
   step(1)

   //no dependency at all
   poke(dut.io.id_ex_instr, "b00000000111100000010001000000011".asUInt(32.W))
   poke(dut.io.if_id_instr, "b00000000100101000000001100110011".asUInt(32.W))
   expect(dut.io.stall, false.B)
   step(1)

   //control hazard on branch
   poke(dut.io.if_id_instr, "b11111110001100001100110011100011".asUInt(32.W))
   poke(dut.io.id_ex_instr, "b00000000000000000000000000010011".asUInt(32.W))
   expect(dut.io.stall, true.B)
   step(1)

   //control hazard on jump
   poke(dut.io.if_id_instr, "b00000010010000000000001001101111".asUInt(32.W))
   poke(dut.io.id_ex_instr, "h_13".U)
   expect(dut.io.stall, true.B)
   step(1)

   //control hazard due to JALR
   poke(dut.io.if_id_instr, "b00000001100000000000001011100111".asUInt(32.W))
   poke(dut.io.id_ex_instr, "h_13".U)
   expect(dut.io.stall, true.B)
   step(1)
   poke(dut.io.if_id_instr, "h_13".U)
   poke(dut.io.id_ex_instr, "b00000001100000000000001011100111".asUInt(32.W))
   expect(dut.io.stall, true.B)
   step(1)

   //not a control hazard - branch is in the execute stage
   poke(dut.io.if_id_instr, "h_13".U)
   poke(dut.io.id_ex_instr, "b11111110001100001100110011100011".asUInt(32.W))
   expect(dut.io.stall, false.B)
   step(1)

}

object HazardDetectionUnitTestMain extends App {
  iotesters.Driver.execute(Array("--fint-write-vcd"), () => new HazardDetectionUnit) {
    c => new HazarDetectionUnitTest(c)
  }
} 
