ODD MACRO NUM1  
    MOV SI, OFFSET NUM1
    
    Loop_1:
    MOV AX, [SI] 
    MOV BX, 2
    DIV BX 
    ;MOV REMINDER, DX 

    CMP DX, 0 
    JMP RESULT1
    INC SI
    LOOP Loop_1  
    
    RESULT1: 
     MOV AH, 02H
     INT 21H
    LOOP RESULT1
   
    MOV DX, AX
    MOV AH, 02H
    INT 21H
  
ENDM  


EVEN MACRO NUM2
    MOV SI, OFFSET NUM2
    
    Loop_2:
    MOV AX, [SI] 
    MOV BX, 2
    DIV BX 
    ;MOV REMINDER, DX 

    CMP DX, 0 
    JMP RESULT2
    INC SI
    LOOP Loop_2 
    
    RESULT2: 
     MOV AH, 02H
     INT 21H
    LOOP RESULT2
   
    MOV DX, AX
    MOV AH, 02H
    INT 21H
 
ENDM 


ORG 100H
.DATA
 ARR DB 2, 0, 4, 7, 1, 9
 
.CODE
 MOV AX, @DATA
 MOV DS, AX
 
 ODD ARR
 EVEN ARR  
 
 MOV AH, 04H
 INT 21H
 
RET
