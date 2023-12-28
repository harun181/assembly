ORG 100H

.DATA 
 NAME1 DW "PRANTO"
 INDEX DB 6

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV SI, OFFSET NAME1
    
    
    CONTINUE:
    MOV AL, [SI]
    INC SI
    CMP AL, 65H
    JE FIND_IND
    LOOP CONTINUE 
    
    FIND_IND:
    MOV AL, [SI]
    
    
    MOV AH, 02H 
    MOV DL, AL  
    SUB DL, 113
    INT 21H
    
    MOV AH, 04CH
    INT 21H    

RET