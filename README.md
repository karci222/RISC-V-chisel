# RISC-V pipeline built in Chisel

This project is a result of a special course at the Technical University of Denmark

Project is still in the work and currently supporting these instructions:

### Register-register arithmetic operations

ADD  xrd xrs1 xrs2 -- adds source register 1 with source register 2

SUB  xrd xrs1 xrs2 -- subtracts register 2 from register 1

SLL  xrd xrs1 xrs2 -- logical shift of register 1 by register 2 (uses only first 5 bits!!!)

SLT  xrd xrs1 xrs2 -- sets 1 if register 1 is smaller than register 2

SLTU xrd xrs1 xrs2 -- sets 1 if register 1 is smaller than register 2 but unsigned

XOR  xrd xrs1 xrs2 -- xors

SRL  xrd xrs1 xrs2 -- performs logical shift right of register 1 by register 2

SRA  xrd xrs1 xrs2 -- shift arithmetic right of register 1 by register 2

OR   xrd xrs1 xrs2 -- or

AND  xrd xrs1 xrs2 -- and

### Register-immidiate instructions

ADDI  xrd xrs1 imm - adds register and immidiate

SLTI  xrd xrs1 imm - sets 1 if register is lower than immidiate signed

SLTIU xrd xrs1 imm - sets 1 if register is lower than immidiate unsigned

XORI  xrd xrs1 imm - xor

ORI   xrd xrs1 imm - or

ANDI  xrd xrs1 imm - and

### Load
LW xrd xbase offset - loads word

### Store
SW xbase xsource offset - stores word

## How to run

To test the current state a processor there is created a test class in src/test/scala/pipelineRV32I/PipelineTest1.
For test purposes we modified a pipeline slightly so it outputs results from the ALU.

To create a new test program write a text file with a structure like this:

command xregNumber immidiate - since there are different types of instructions the number of registers can be different however, it is important
to always write x in front of it and then a number of the register.

Also it is important to write the correct instructions since currently we do not have any syntax checks.
Another important thing is to write only one space between instructions otherwise they will not be parsed correctly.
After writing a code (and making sure it is correct) you can create a source for the code:

sbt "runMain isRV32I.Compile fileName"

it will create a file currently named as binarySource.txt. This file contains an array which should then be copied to file pipeline_top.scala.
In there there is a class PipelineTop which contains an array. Copy the contents of the file to construct this array and then prepare the test similar to one in
pipeline test. After making sure you created a proper test run the command:

sbt "test:runMain pipelineRV32I.PipelineTest1Main"

This will run the test of the processor

You can also view the generated waveforms using GTKView. When running the tests Chisel generates .vcd file which can be found in folder test_run_dir in the project folder with name PipelineTest1Main

#### Note: 
running this is not a very comfortable yet, but the project is in really early stage now.
