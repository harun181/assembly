org 100h

.DATA

FA DB 'ENTER FIRST LETTER: $'
SA DB 'ENTER SECOND LETTER: $' 
OP DB 'RESULT IS: $'


NEXT DB 0DH, 0AH, '$'

.CODE

MOV AX, @DATA
MOV DS, AX    


;FIRST INPUT

MOV AH, 9

LEA DX, NEXT
INT 21H

LEA DX, FA 
INT 21H 

MOV AH, 1
INT 21H

MOV BL, AL  

;SECOND INPUT

MOV AH, 9

LEA DX, NEXT
INT 21H

LEA DX, SA 
INT 21H 

MOV AH, 1
INT 21H

MOV BH, AL  

;RESULT

MOV AH, 9

LEA DX, NEXT
INT 21H

LEA DX, OP 
INT 21H


;STATMENT  

MOV AH, 2

CMP BL, BH  

JAE BIG  
 
 MOV DL, BL
 INT 21H 
 
 MOV DL, 20H 
 INT 21H
 
 MOV DL, BH
 INT 21H 
 
 JMP END


BIG: 
 MOV DL, BH
 INT 21H
 
 MOV DL, 20H 
 INT 21H
 
 MOV DL, BL
 INT 21H 
 
 JMP END  
 
 
END:
 MOV AH, 4CH
 INT 21H


ret




