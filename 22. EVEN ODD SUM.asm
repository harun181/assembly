.MODEL SMALL
.STACK 100H 

.DATA
    ARRAY DB 6 DUP(?)
    COUNT DW 6
    ODDSUM DB ?
    EVENSUM DB ?
    
    
.CODE   
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL GET_INPUT
    CALL FIND_ODDSUM
    CALL FIND_EVENSUM

    MOV AH, 4CH
    INT 21H
MAIN ENDP    

GET_INPUT PROC 
   
    MOV SI, OFFSET ARRAY
    MOV CX, COUNT 
    
    INPUT:
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV [SI], AL
    INC SI
    LOOP INPUT
    RET 
GET_INPUT ENDP    

FIND_ODDSUM PROC
    MOV SI, OFFSET ARRAY
    MOV CX, COUNT 
    MOV ODDSUM, 0
    MOV AL, [SI]  

    OS: 
    MOV BH, AL
    
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    ADD ODDSUM, BH
    LOOP OS
    
    INC SI
    MOV AL, [SI]
    RET
FIND_ODDSUM ENDP

FIND_EVENSUM PROC
    MOV SI, OFFSET ARRAY
    MOV CX, COUNT 
    MOV EVENSUM, 0
    MOV AL, [SI]  

    EVS:
    MOV BH, AL
    
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JE EVEN
    LOOP OS
    
    EVEN:
    ADD EVENSUM, BH
    LOOP EVEN
    
    INC SI
    MOV AL, [SI]
    LOOP EVS
    RET 
FIND_EVENSUM ENDP 


END MAIN