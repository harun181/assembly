org 100h

.DATA
A DB 3, 1, 2, 2, 1
INPUT DB 'Enter the value of N:$' 

.CODE
MOV AX, @DATA
MOV DS, AX

XOR AX,AX
MOV SI, OFFSET A

MOV DX, OFFSET INPUT 
LEA DX, INPUT 
MOV AH, 09H 
INT 21h 

MOV AH, 01H
INT 21H
MOV CL, AL
SUB CL, 48 

XOR AL, AL

Loop_1:
ADD AL, [SI]
INC SI
LOOP Loop_1

MOV BL, AL
ADD BL, 48

MOV AH, 02H
MOV DL, 0DH 
INT 21H    

MOV DL, 0AH
INT 21H

MOV DL, BL
INT 21H

MOV AH, 4CH
INT 21H

RET