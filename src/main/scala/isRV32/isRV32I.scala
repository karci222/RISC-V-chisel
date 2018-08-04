package isRV32

import chisel3._

object Instructions{
   val OPCODE_R_TYPE   = "b0110011".U
   val OPCODE_B_TYPE   = "b1100011".U
   val OPCODE_STORE    = "b0100011".U
   val OPCODE_LOAD     = "b0000011".U
   val OPCODE_JAL      = "b1101111".U
   val OPCODE_I_TYPE   = "b0010011".U
   val OPCODE_JALR     = "b1100111".U
   val OPCODE_LUI      = "b0110111".U
   val OPCODE_AUIPC    = "b0010111".U	
}


