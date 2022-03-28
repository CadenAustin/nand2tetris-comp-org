// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// init output to 0
@R2 
M=0

// jump if R0 is greater than 0
@R0
D=M
@LOOP
D;JGT

// no need to loop
@END
0;JMP

(LOOP)
    // move output to D
    @R2
    D=M

    // add R1 to output value
    @R1
    D=D+M

    // store output
    @R2
    M=D

    // decriment loop value
    @R0
    D=M-1
    
    // jump back to loop if still more to loop
    @R0
    M=D
    @LOOP
    D;JGT

    @END
    0;JMP

(END)
    @END
    0;JMP
