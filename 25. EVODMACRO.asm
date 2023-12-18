WHATNUM MACRO ARRAY_ADDRESS, ARRAY_SIZE

   
    MOV BX, ARRAY_ADDRESS
    MOV CX, ARRAY_SIZE

   
    LOOP_START:
        MOV AL, [BX]   
        TEST AL, 01H   
        JNZ IS_ODD     
        JMP IS_EVEN

    IS_ODD:
        MOV AH, 02H
        INT 21H
        JMP LOOP_CONTINUE

    IS_EVEN:
        MOV AH, 02H
        INT 21H
        JMP LOOP_CONTINUE

    LOOP_CONTINUE:
        INC BX         
        LOOP LOOP_START 
    ENDM


.MODEL SMALL
.STACK 100H

.DATA
ARRAY_SIZE      DW 5           
ARRAY           DB 5 DUP(?)    

.CODE
MAIN PROC

    MOV AX, @DATA
    MOV DS, AX

    
    MOV CX, ARRAY_SIZE
    MOV SI, OFFSET ARRAY
    MOV AH, 01H     

    
    L1:
    INT 21H         
    SUB AL, 30H     
    MOV [SI], AL    
    INC SI
    LOOP L1

    
    LEA SI, ARRAY
    MOV CX, ARRAY_SIZE
    WHATNUM SI, CX

    
    MOV AH, 4CH     
    INT 21H

MAIN ENDP

END MAIN
