package isRV32

import chisel3._
import chisel3.util._
import scala.io.Source
import java.io._

class Compiler(file: String) {
   val sourceFileName = file
   val immidiateMask  = 31
   val immidiateMask2 = 4064
   val immidiateMaskB1 = 1008
   val immidiateMaskB2 = 15
   val immidiateMaskB3 = 1024
   val immidiateMaskJ1 = 1023
   val immidiateMaskJ2 = 522240

   def compile(): Array[String] = {
	 	
	val sourceFile = Source.fromFile(sourceFileName)	  
   	val lines = sourceFile.getLines()	
   	var program: Array[String] = new Array[String](1024)
	var j = 0	
	
	  while(lines.hasNext){
	     val line = lines.next()
	     val command = line.split(" ")
	     println("Compiling...")	     

	     //not exactly the most beautiful if I ever wrote, for future generations, try to maybe make it... More beautiful!?
             if(command(0).compareToIgnoreCase(Commands.ADD) == 0 ||
                command(0).compareToIgnoreCase(Commands.SUB) == 0 ||
		command(0).compareToIgnoreCase(Commands.SLL) == 0 ||
		command(0).compareToIgnoreCase(Commands.SLT) == 0 ||
		command(0).compareToIgnoreCase(Commands.SLTU) == 0 ||
		command(0).compareToIgnoreCase(Commands.XOR) == 0 ||
		command(0).compareToIgnoreCase(Commands.SRL) == 0 ||
		command(0).compareToIgnoreCase(Commands.SRA) == 0 ||
		command(0).compareToIgnoreCase(Commands.OR) == 0 ||
		command(0).compareToIgnoreCase(Commands.AND) == 0){
		  val instruction = parseArithmeticRegisterToRegister(command)
		  println(instruction)
		  program(j) = instruction
	     }else if(command(0).compareToIgnoreCase(Commands.SW) == 0){
		 val instruction = parseStore(command)
		 println(instruction)
		 program(j) = instruction
	     }else if(command(0).compareToIgnoreCase(Commands.LW) == 0){
                 val instruction = parseLoad(command)
		 println(instruction)
		 program(j) = instruction
             }else if(command(0).compareToIgnoreCase(Commands.ADDI) == 0 ||
		command(0).compareToIgnoreCase(Commands.SLTI) == 0 ||
		command(0).compareToIgnoreCase(Commands.SLTIU) == 0 ||
		command(0).compareToIgnoreCase(Commands.XORI) == 0 ||
		command(0).compareToIgnoreCase(Commands.ORI) == 0 ||
		command(0).compareToIgnoreCase(Commands.ANDI) == 0){
		  val instruction = parseArithmeticImmidiate(command)
		  println(instruction)
		  program(j) = instruction
	     }else if(command(0).compareToIgnoreCase(Commands.SLLI) == 0 ||
		command(0).compareToIgnoreCase(Commands.SRLI) == 0 ||
		command(0).compareToIgnoreCase(Commands.SRAI) == 0){
		  val instruction = parseArithmeticImmidiate2(command)
		  println(instruction)
		  program(j) = instruction
             }else if (command(0).compareToIgnoreCase(Commands.BEQ) == 0 ||
		command(0).compareToIgnoreCase(Commands.BNE) == 0 ||
		command(0).compareToIgnoreCase(Commands.BLT) == 0 ||
                command(0).compareToIgnoreCase(Commands.BGE) == 0 ||
		command(0).compareToIgnoreCase(Commands.BLTU) == 0 ||
		command(0).compareToIgnoreCase(Commands.BGEU) == 0){
		  val instruction = parseBranch(command)
		  println(instruction)
		  program(j) = instruction
             }else if(command(0).compareToIgnoreCase(Commands.JAL) == 0){
	          val instruction = parseJAL(command)
	          program(j) = instruction
             }else if(command(0).compareToIgnoreCase(Commands.JALR) == 0){
		  val instruction = parseJAR(command)
		  program(j) = instruction
             }else if(command(0).compareToIgnoreCase(Commands.LUI) == 0){
		  val instruction = parseLUI(command)
		  program(j) = instruction
	     }else if(command(0).compareToIgnoreCase(Commands.AUIPC) == 0){
                  val instruction = parseAUIPC(command)
		  program(j) = instruction
             }

	     j = j +1
	  }

	sourceFile.close()	

	val binaryFile = new PrintWriter(new File("binarySource.txt"))
	
	println("File opened")	

	for (i <- 0 until j){
	   binaryFile.write("\""+ program(i) + "\".asUInt(32.W),")
	   binaryFile.println()
        }

	binaryFile.close()

	return program
   }

   def parseArithmeticRegisterToRegister(command: Array[String]) : String = {
	var opcode = 51	
	var funct3 = 0
	var funct7 = 0	

	if(command(0).compareToIgnoreCase(Commands.ADD) == 0){

        }else if(command(0).compareToIgnoreCase(Commands.SUB) == 0){
	    funct7 = 32
        }else if(command(0).compareToIgnoreCase(Commands.SLL) == 0){
	    funct3 = 1
        }else if(command(0).compareToIgnoreCase(Commands.SLT) == 0){
	    funct3 = 2
	}else if(command(0).compareToIgnoreCase(Commands.SLTU) == 0){
	    funct3 = 3
	}else if(command(0).compareToIgnoreCase(Commands.XOR) == 0){
	    funct3 = 4
	}else if(command(0).compareToIgnoreCase(Commands.SRL) == 0){
	    funct3 = 5
	}else if(command(0).compareToIgnoreCase(Commands.SRA) == 0){
	    funct3 = 5
	    funct7 = 32
	}else if(command(0).compareToIgnoreCase(Commands.OR) == 0){
	    funct3 = 6
	}else if(command(0).compareToIgnoreCase(Commands.AND) == 0){
	    funct3 = 7
	}
	var rd = parseRegister(command(1))
        var rs1 = parseRegister(command(2))
	var rs2 = parseRegister(command(3))
	
	funct3 = funct3 << 12
	funct7 = funct7 << 25
	rd = rd << 7
	rs1 = rs1 << 15
        rs2 = rs2 << 20

	var instruction = 0
	instruction = instruction | opcode	
	instruction = instruction | rd
	instruction = instruction | rs1
	instruction = instruction | rs2
	instruction = instruction | funct3
	instruction = instruction | funct7

	return "b"+toBinary(instruction, 32)
   }

   def parseStore(command: Array[String]): String = {
	var opcode = 35
	var funct3 = 2
	var rs1 = parseRegister(command(1))
	var rs2 = parseRegister(command(2))
	
	var imm1 = command(3).toInt & immidiateMask
	var imm2 = (command(3).toInt & immidiateMask2) >> 5

	//println("Value original: " + command(3).toInt.toBinaryString + "Value converted: " + (imm1 | (imm2 << 5)).toBinaryString)

	imm1 = imm1 << 7
	imm2 = imm2 << 25
	rs1  = rs1  << 15
	rs2  = rs2  << 20
	funct3 = funct3 << 12
	
	var instruction = 0
	instruction = instruction | opcode
	instruction = instruction | imm1
	instruction = instruction | imm2
	instruction = instruction | rs1
	instruction = instruction | rs2
	instruction = instruction | funct3

	return "b" + toBinary(instruction, 32)
   }

   def parseLoad(command: Array[String]) : String = {
	var opcode = 3
	var rd = parseRegister(command(1))
	var rs1 = parseRegister(command(2))
	var funct3 = 2
	var immidiate = command(3).toInt
	

	var instruction = 0
	
	rd = rd << 7
	rs1 = rs1 << 15
	funct3 = funct3 << 12
	immidiate = immidiate << 20

	instruction = instruction | opcode
	instruction = instruction | rd
	instruction = instruction | rs1
	instruction = instruction | funct3
	instruction = instruction | immidiate
	
	return "b"+toBinary(instruction, 32)
   }

   def parseArithmeticImmidiate(command: Array[String]): String = {
	var opcode = 19
	var funct3 = 0	

	if(command(0).compareToIgnoreCase(Commands.ADDI) == 0){

        }else if(command(0).compareToIgnoreCase(Commands.SLTI) == 0){
	    funct3 = 2
	}else if(command(0).compareToIgnoreCase(Commands.SLTIU) == 0){
	    funct3 = 3
	}else if(command(0).compareToIgnoreCase(Commands.XORI) == 0){
	    funct3 = 4
	}else if(command(0).compareToIgnoreCase(Commands.ORI) == 0){
	    funct3 = 6
	}else if(command(0).compareToIgnoreCase(Commands.ANDI) == 0){
	    funct3 = 7
	}
	var rd = parseRegister(command(1))
        var rs1 = parseRegister(command(2))
	var immidiate = command(3).toInt
	
	var instruction = 0
	
	rd = rd << 7
	rs1 = rs1 << 15
	funct3 = funct3 << 12
	immidiate = immidiate << 20

	instruction = instruction | opcode
	instruction = instruction | rd
	instruction = instruction | rs1
	instruction = instruction | funct3
	instruction = instruction | immidiate
	
	return "b"+toBinary(instruction, 32)
   }

   def parseArithmeticImmidiate2(command: Array[String]): String = {
	var opcode = 19
	var funct3 = 1	
        var funct7 = 0

	if(command(0).compareToIgnoreCase(Commands.SLLI) == 0){

        }else if(command(0).compareToIgnoreCase(Commands.SRLI) == 0){
	    funct3 = 5
	}else if(command(0).compareToIgnoreCase(Commands.SRAI) == 0){
	    funct3 = 5
	    funct7 = 32
	}

	var rd = parseRegister(command(1))
        var rs1 = parseRegister(command(2))
	var immidiate = command(3).toInt
	
	var instruction = 0
	
	rd = rd << 7
	rs1 = rs1 << 15
	funct3 = funct3 << 12
	immidiate = immidiate << 20
        funct7 = funct7 << 25

	instruction = instruction | opcode
	instruction = instruction | rd
	instruction = instruction | rs1
	instruction = instruction | funct3
   	instruction = instruction | immidiate
    	instruction = instruction | funct7
   
	return "b"+toBinary(instruction, 32)
   }

   def parseBranch(command: Array[String]): String = {
        var opcode = 99
        var funct3 = 0
        
        if(command(0).compareToIgnoreCase(Commands.BEQ) == 0){

        }else if(command(0).compareToIgnoreCase(Commands.BNE) == 0){
	    funct3 = 1
	}else if(command(0).compareToIgnoreCase(Commands.BLT) == 0){
	    funct3 = 4
	}else if(command(0).compareToIgnoreCase(Commands.BGE) == 0){
	    funct3 = 5
	}else if(command(0).compareToIgnoreCase(Commands.BLTU) == 0){
	    funct3 = 6
	}else if(command(0).compareToIgnoreCase(Commands.BGEU) == 0){
	    funct3 = 7
	}

        var rs1 = parseRegister(command(1))
        var rs2 = parseRegister(command(2))

        var immidiate = command(3).toInt
        var immidiate1 = immidiate >> 11
        var immidiate2 = (immidiate & immidiateMaskB1) >> 4
        var immidiate3 = (immidiate & immidiateMaskB2)
        var immidiate4 = (immidiate & immidiateMaskB3) >> 10

        var instruction = 0
        
        immidiate4 = immidiate4 << 7
        immidiate3 = immidiate3 << 8
        funct3     = funct3 << 12
        rs1        = rs1 << 15
        rs2        = rs2 << 20
        immidiate2 = immidiate2 << 25
        immidiate1 = immidiate1 << 31

        instruction = instruction | opcode
	instruction = instruction | immidiate4
        instruction = instruction | immidiate3
        instruction = instruction | funct3
        instruction = instruction | rs1
        instruction = instruction | rs2
        instruction = instruction | immidiate2
        instruction = instruction | immidiate1

	return "b"+toBinary(instruction, 32)
   }

   def parseJAL(command: Array[String]): String = {
      var opcode = 111
      var rd = parseRegister(command(1))
      var immidiate = command(2).toInt
      
      var imm1 = immidiate >> 19
      var imm2 = (immidiate & immidiateMaskJ1)
      var imm3 = (immidiate >> 10) & 1
      var imm4 = (immidiate & immidiateMaskJ2) >> 11

      imm1 = imm1 << 31
      imm2 = imm2 << 21
      imm3 = imm3 << 20
      imm4 = imm4 << 12
      rd   = rd << 7

      var instruction = 0
      instruction = opcode
      instruction = instruction | rd
      instruction = instruction | imm1
      instruction = instruction | imm2
      instruction = instruction | imm3
      instruction = instruction | imm4

      return "b"+toBinary(instruction, 32)
   }

   def parseJAR(command: Array[String]): String = {
      var opcode = 103
      var rd = parseRegister(command(1))
      var rs1 = parseRegister(command(2))
      var immidiate = command(3).toInt
      var funct = 0
      
      immidiate = immidiate << 20
      rs1       = rs1 << 15
      rd        = rd << 7
      funct     = funct << 12 
 
      var instruction = 0
      instruction = opcode
      instruction = instruction | immidiate
      instruction = instruction | rs1
      instruction = instruction | rd
      instruction = instruction | funct

      return "b"+toBinary(instruction, 32)
   }

   def parseLUI(command: Array[String]): String = {
      var opcode = 55
      var rd = parseRegister(command(1))
      var immidiate = command(2).toInt
      
      rd = rd << 7
      immidiate = immidiate << 12
      
      var instruction = 0
      instruction = opcode
      instruction = instruction | rd
      instruction = instruction | immidiate

      return "b"+toBinary(instruction, 32)
   }

   def parseAUIPC(command: Array[String]): String = {
      var opcode = 23
      var rd = parseRegister(command(1))
      var immidiate = command(2).toInt
      
      rd = rd << 7
      immidiate = immidiate << 12
      
      var instruction = 0
      instruction = opcode
      instruction = instruction | rd
      instruction = instruction | immidiate

      return "b"+toBinary(instruction, 32)
   }

   def parseRegister(reg: String): Int = {
	return reg.substring(1).toInt
   }

   def toBinary(i: Int, digits: Int = 8): String ={
    String.format("%" + digits + "s", i.toBinaryString).replace(' ', '0')
   }
}


object Commands{
  val ADD  = "ADD"
  val SUB  = "SUB"
  val SLL  = "SLL"
  val SLT  = "SLT"
  val SLTU = "SLTU"
  val XOR  = "XOR"
  val SRL  = "SRL"
  val SRA  = "SRA"
  val OR   = "OR"
  val AND  = "AND"
  val SW   = "SW"
  val LW   = "LW"
  val ADDI = "ADDI"
  val SLTI = "SLTI"
  val SLTIU = "SLTIU"
  val XORI = "XORI"
  val ORI  = "ORI"
  val ANDI = "ANDI"
  val SLLI = "SLLI"
  val SRLI = "SRLI"
  val SRAI = "SRAI"
  val BEQ  = "BEQ"
  val BNE  = "BNE"
  val BLT  = "BLT"
  val BGE  = "BGE"
  val BLTU = "BLTU"
  val BGEU = "BGEU"
  val JAL  = "JAL"
  val JALR  = "JALR"
  val LUI  = "LUI"
  val AUIPC= "AUIPC"
}

object Compile{
   def main(args: Array[String]){
      
      val compiler = new Compiler(args(0))
      val mArray = compiler.compile()
      for(i <- 0 until 5)
	println(mArray(i))
   }
}
