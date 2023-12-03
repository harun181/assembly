.MODEL SMALL
.STACK 100H

.DATA
    MSG1 DB 10,13,"Enter a number: $"
    MSG_ODD DB 10,13,"The number is ODD.$"
    MSG_EVEN DB 10,13,"The number is EVEN.$"
    MSG2 DB 10,13,"Do you want to continue? (Y/N): $"
    INPUT_CHAR DB ?
    NUM DW ?
    REMINDER DB ?
    CONTINUE_FLAG DB 'Y'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

MAIN_LOOP:
    ; Display message asking for input
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Input number
    MOV AH, 01H
    INT 21H
    SUB AL, 30H ; Convert ASCII to numeric value
    MOV NUM, AX

    ; Check if number is odd or even
    MOV AX, NUM
    MOV BX, 2
    DIV BX ; Divide the number by 2
    MOV REMINDER, DL ; Remainder will be in AH

    ; Check if reminder is 0
    CMP REMINDER, 0
    JE RESULT 

    MOV AH, 09H
    LEA DX, MSG_ODD
    INT 21H
    JMP ASK_TO_CONTINUE

RESULT:

    MOV AH, 09H
    LEA DX, MSG_EVEN
    INT 21H

ASK_TO_CONTINUE:
    ; Ask if user wants to continue
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Input character for continuation
    MOV AH, 01H
    INT 21H
    MOV INPUT_CHAR, AL

    ; Check if user wants to continue (Y/y)
    CMP INPUT_CHAR, 'Y'
    JE CONTINUE_PROGRAM
    CMP INPUT_CHAR, 'y'
    JE CONTINUE_PROGRAM   
    
    
    CMP INPUT_CHAR, 'N'
    JMP END_PROGRAM
    CMP INPUT_CHAR, 'n'
    JMP END_PROGRAM


CONTINUE_PROGRAM:
    JMP MAIN_LOOP

END_PROGRAM:
    MOV AH, 4CH ; Terminate program
    INT 21H

MAIN ENDP

END MAIN
