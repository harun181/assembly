ORG 100H

.DATA
    SUM DW 0

.CODE
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 0     ; Initialize the sum to 0
    MOV CX, 50    ; Set the loop counter to 50 (since there are 50 terms in the series)
    MOV BX, 1     ; Set the first term to 1

SUM_LOOP:
    ADD AX, BX    ; Add the current term to the sum
    ADD BX, 2     ; Increment BX by 2 to get the next term
    LOOP SUM_LOOP ; Decrement CX and jump to SUM_LOOP if CX is not zero

    MOV SUM, AX   ; Store the sum in the SUM variable

    MOV AH, 4CH   
    INT 21H      
RET
