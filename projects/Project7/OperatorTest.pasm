@4
D=A
@SP
A=M
M=D
@SP
M=M-1
@5
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=D+M
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@add
M=D
@SP
A=M
M=D
@SP
M=M-1
@5
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=D-M
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@sub
M=D
@SP
A=M
M=D
@SP
M=M-1
@0
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
D=!D
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@not
M=D
@SP
M=M+1
A=M
AD=M
D=-D
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@neg
M=D
@4
D=A
@SP
A=M
M=D
@SP
M=M-1
@3
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=D-M
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@eq32.TRUE
D;JEQ
@eq32.FALSE
0;JMP
(eq32.TRUE)
D=-1
@eq32.END
0;JMP
(eq32.FALSE)
D=0
@eq32.END
0;JMP
(eq32.END)
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@eq
M=D
@4
D=A
@SP
A=M
M=D
@SP
M=M-1
@3
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=D-M
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@lt44.TRUE
D;JLT
@lt44.FALSE
0;JMP
(lt44.TRUE)
D=-1
@lt44.END
0;JMP
(lt44.FALSE)
D=0
@lt44.END
0;JMP
(lt44.END)
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@lt
M=D
@4
D=A
@SP
A=M
M=D
@SP
M=M-1
@3
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=D-M
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@gt56.TRUE
D;JGT
@gt56.FALSE
0;JMP
(gt56.TRUE)
D=-1
@gt56.END
0;JMP
(gt56.FALSE)
D=0
@gt56.END
0;JMP
(gt56.END)
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@gt
M=D
@6
D=A
@SP
A=M
M=D
@SP
M=M-1
@10
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=M&D
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@and
M=D
@6
D=A
@SP
A=M
M=D
@SP
M=M-1
@10
D=A
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@R15
M=D
@SP
M=M+1
A=M
AD=M
@R15
D=M|D
@SP
A=M
M=D
@SP
M=M-1
@SP
M=M+1
A=M
AD=M
@or
M=D
(halt82.HALT)
@halt82.HALT
0;JMP
