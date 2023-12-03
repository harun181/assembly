ORG 100H

.DATA
    MSG1 DW 10, 13, 'Enter a number: $'
    MSG2 DW 10, 13, 'RESULT: $'
    NUM DW ?

.CODE
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H   
    LEA DX, MSG1
    INT 21H

    MOV AH, 01H   
    INT 21H
    SUB AL, 30H   

    MOV NUM, AX   

    MOV CX, AX    
    DEC CX        

FACTORIAL_LOOP:
    MUL CX        
    DEC CX        
    LOOP FACTORIAL_LOOP
    

    MOV AH, 4CH  
    INT 21H      

RET
