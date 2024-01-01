ORG 100H

.DATA
    num db 0
    temp db 0
    sum db 0
    armstrong_msg db 0ah, 0dh, 'Armstrong number$'
    not_armstrong_msg db 0ah, 0dh, 'Not an Armstrong number$'

.CODE
    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [num], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [temp], al

    mov bl, 100
    mov al, [num]
    mul bl
    add [sum], al

    mov bl, 10
    mov al, [temp]
    mul bl
    add [sum], al

    mov ah, 01h
    int 21h
    sub al, 30h 
    mov [num], al
    add [sum], al

    mov al, [sum]
    mul [sum]
    mov bl, [sum]
    mul bl
    add ax, bx
    mov [sum], al

    mov al, [num]
    cmp al, [sum]
    jne not_armstrong

    mov ah, 09h
    lea dx, armstrong_msg
    int 21h
    jmp exit_program

not_armstrong:
    mov ah, 09h
    lea dx, not_armstrong_msg
    int 21h

exit_program:
    mov ah, 4Ch
    int 21h
    
RET
