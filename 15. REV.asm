ORG 100H

.DATA
    A DB 1, 2, 3, 4, 5 

.CODE
    MOV AX, @DATA
    MOV DS, AX  
    
    MOV SI, 5
    DEC SI
    
    
    PRINT_LOOP:
        MOV DL, A[SI]
        ADD DL, 30H
           
        MOV AH, 02H
        INT 21H

        DEC SI
    CMP SI, 0
    JGE PRINT_LOOP
    
    MOV AH, 4CH
    INT 21H

RET