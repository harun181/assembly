ORG 100H

MACRO INPUTARR  ARRAY1
    MOV SI, OFFSET ARRAY1
    
    LOOP1:
    MOV AL, [SI]
    INC SI
    TEST AL, 1  ; Check if AL is odd
    JNZ ODD      ; If odd, jump to ODD label
    
    EVEN:
    ADD ESUM, AL
    JMP CONTINUE_LOOP
    
    ODD:
    ADD OSUM, AL
    
    CONTINUE_LOOP:
    DEC INDEX     ; Decrement INDEX
    JNZ LOOP1     ; If INDEX is not zero, continue looping

ENDM

.DATA
    ARRAY DB 8 DUP(?)
    INDEX DB 8
    ESUM DB 0
    OSUM DB 0
    ENUM DB ?
    ONUM DB ?
          
      
.CODE
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV SI, OFFSET ARRAY
    MOV CL, INDEX
    
    INPUTARR:
    MOV AH, 01H
    INT 21H 
    SUB AL, 30H
    
    MOV [SI], AL
    INC SI
    LOOP INPUTARR
    
    INPUTARR ARRAY
    
    MOV AH, 4CH
    INT 21H

RET
