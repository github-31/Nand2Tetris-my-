// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every var1;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every var1;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@SCREEN
D=A
@var1
M=D 
@8192 
D=D+A
@screen_end
M=D 

(Take_Input)
    @KBD
    D=M
    @Loop1
    D;JEQ
    @Fill_Black
    0;JMP

(Fill_Black)
    @SCREEN
    D=A
    @var1
    M=D
(RepeatBlack)
    @0
    D=!A
    @var1
    A=M
    M=D
    D=A+1
    @var1
    M=D

    @24576
    D=D-A
    @Take_Input
    D;JEQ
    @RepeatBlack
    0;JMP

(Loop1)
    @SCREEN
    D=A
    @var1
    M=D
(RepeatWhite)
    @var1
    A=M
    M=0
    D=A+1
    @var1
    M=D
    @24576
    D=D-A
    @Take_Input
    D;JEQ
    @RepeatWhite
    0;JMP