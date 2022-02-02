// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@0 // Write Color
M=0
@2
M=0

(CHECK_KEY)
    @24576
    D=M
    
    @WHITE
    D;JEQ

    @BLACK
    0;JMP

(WHITE)
    @0
    D=M
    @WRITE_W
    D;JNE

    @CHECK_KEY
    0;JMP

(WRITE_W)
    @0
    M=0
    @WRITE
    0;JMP

(BLACK)
    @0
    D=M
    @WRITE_B
    D;JEQ

    
    @CHECK_KEY
    0;JMP

(WRITE_B)
    @0
    M=-1
    @WRITE
    0;JMP

(WRITE)
    @8190
    D=A

    @1
    M=D
    
    (WRITE_LOOP)
        @1
        D=M
        @cord
        M=D
        @SCREEN
        D=A
        @cord
        M=M+D
        
        // Write to cord
        @0
        D=M
        @cord
        A=M
        M=D
       
        //Debug
        @cord
        D=M

        @2
        M=D

        @1
        D=M-1
        M=D

        @WRITE_LOOP
        D;JGT
    

    @CHECK_KEY
    0;JMP
