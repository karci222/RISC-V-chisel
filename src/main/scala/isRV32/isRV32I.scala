package isRV32

import chisel3._

object Instructions{
   /*val OPCODE_LUI = Bits(b"0110111")
   val OPCODE_ALUIPC = Bits(b"001011")*/
   val OPCODE_R_TYPE   = "b0110011".U
   //val OPCODE_I_TYPE_1 = Buts(b"
   val OPCODE_B_TYPE   = "b1100011".U
   val OPCODE_STORE    = "b0010011".U
}
