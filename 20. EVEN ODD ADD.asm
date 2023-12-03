ORG 100H

.DATA
    MSG1 DB 10, 13, 'Enter number (0 to end): $'
    MSG_ODD DB 10, 13, 'Sum of odd numbers: $'
    MSG_EVEN DB 10, 13, 'Sum of even numbers: $'
    NUM DW ?  
    N DB ?
    ODD_SUM DW 0
    EVEN_SUM DW 0

.CODE
    MOV AX, @DATA
    MOV DS, AX

INPUT_LOOP:
    MOV AH, 09H   
    LEA DX, MSG1
    INT 21H       ; Display 'Enter number'

    MOV AH, 01H   
    INT 21H       ; Input single digit
    SUB AL, 30H   ; Convert ASCII to numeric value

    CMP AL, 0     ; Check for end condition (0)
    JE DISPLAY_RESULTS

    MOV NUM, AX   ; Store the number in NUM      
    
    MOV BL, 2
    DIV BL
    MOV N, AH 
    
    CMP N, 0       
    JE EVEN_NUMBER
    ; JNZ EVEN_NUMBER
    
    ADD ODD_SUM, AX
    JMP INPUT_LOOP

EVEN_NUMBER:
    ADD EVEN_SUM, AX
    JMP INPUT_LOOP

DISPLAY_RESULTS:
    ; Display Sum of Odd Numbers
    MOV AH, 09H  
    LEA DX, MSG_ODD
    INT 21H      

    MOV AX, ODD_SUM ; Display the sum of odd numbers
    ADD AX, 30H     ; Convert to ASCII
    MOV DL, AH
    
    MOV AH, 02H
    INT 21H     

    ; Display Sum of Even Numbers
    MOV AH, 09H  
    LEA DX, MSG_EVEN
    INT 21H      

    MOV AX, EVEN_SUM ; Display the sum of even numbers
    ADD AX, 30H      ; Convert to ASCII
    MOV DL, AH 
    
    MOV AH, 02H
    INT 21H     

    MOV AH, 4CH  
    INT 21H      ; Terminate the program

RET
