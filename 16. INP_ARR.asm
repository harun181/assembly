ORG 100H

.DATA
ARR_SIZE EQU 5  
ARRAY DB ARR_SIZE DUP(?)  
NEWLINE DB 0Dh, 0Ah, '$'  

.CODE
MAIN:
MOV AX, @DATA
MOV DS, AX
MOV CX, 0 

INPUT_LOOP:
    
MOV AH, 01h
INT 21h
SUB AL, '0'
MOV DI, CX         
MOV [ARRAY + DI], AL

INC CX

CMP CX, ARR_SIZE
JL INPUT_LOOP           
           
MOV SI, 0 


PRINT_LOOP: 

MOV AH, 09h
LEA DX, NEWLINE
INT 21h 

MOV DI, SI          
MOV DL, [ARRAY + DI]


ADD DL, '0'

MOV AH, 02h
INT 21h



INC SI


CMP SI, CX
JL PRINT_LOOP

RET
