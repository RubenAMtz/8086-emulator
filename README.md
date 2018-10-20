# 8086-Emulator

Emulating the 8086 microcontroller from Intel using C code and readying a program in assambler from a TXT file.

## Try it yourself:

Requirements:
- C compiler (MinGW)

# Install

$git clone https://github.com/RubenAMtz/8086-Emulator

Once you have the files in your local computer, you will have to compile the Emulator.C file. But first make sure you add gcc.exe to the path:
1. Environment variables
2. @System Variables: Look for a variable named Path and edit it
3. Clic on New and add the path of were gcc.exe is located (for example in windows MinGW is installed in C:\MinGW\bin)
4. Save changes

Now compile the file:

1. Open cmd
2. Locate the files of the repo
3. $gcc Emulator.C

A .exe file will be created, this exe will read the file named Matrices.txt and execute the instructions in it. Feel free to change them. The asm program generates a matrix multiplication.

A ASM file may be found within the files, this is an actual assembler file that can be loaded into any online simulator for testing and comparing results against the emulator presented here.

Enjoy.

![alt text](https://github.com/RubenAMtz/8086-Emulator/blob/master/Capture.PNG "Logo Title Text 1")

## ASM instructions developed

From the instruction set:

### MOV: (Move)  

REG, memory  
memory, REG  
REG, REG   
memory, immediate<br>
REG, immediate<br>
SREG, memory<br>
memory, SREG<br>
REG, SREG<br>
SREG, REG<br>

### INC: (Increment)  

REG  
memory  

### CALL: (Transfer control to procedure)  

procedure name  
label  
4-byte address  

### CMP: (Compare)  

REG, memory  
memory, REG  
REG, REG  
memory, immediate  
REG, immediate  

### JZ: (Jump if Zero)  

label  

### DEC: (Decrement)  

REG  
memory  

### JMP: (Unconditional Jump)  

label  
4-byte address  

### JC: (Jump if Carry)  

label1  

ADD: (Add)  

REG, memory  
memory, REG  
REG, REG  
memory, immediate  
REG, immediate  

HLT: (Halt the System)  

No operand  
