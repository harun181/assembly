org 100h

.DATA
    message DB 10, 13, "Enter a number: $"
    notDiv DB 10, 13, "The number is not divisible by 5. $"
    yesDiv DB 10, 13, "The number is divisible by 5. $"

.CODE
    MOV AX, @DATA
    MOV DS, AX


    MOV AH, 9
    LEA DX, message
    INT 21h


    MOV AH, 1
    INT 21h
    SUB AL, '0'


    MOV AH, 0
    MOV BL, 5

    DIV BL
    CMP AH, 0
    JNZ notDivisible


    MOV AH, 9
    LEA DX, yesDiv
    INT 21h
    JMP Exit

notDivisible:
    MOV AH, 9
    LEA DX, notDiv
    INT 21h

Exit:
    ;
    MOV AH, 4Ch
    INT 21h

ret
