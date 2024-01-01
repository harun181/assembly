ORG 100H

.DATA
    quantity db 0
    price db 0
    total_cost dw 0

    quantity_msg db 0ah, 0dh, 'Enter quantity: $'
    price_msg db 0ah, 0dh, 'Enter price per item: $'
   

.CODE
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, quantity_msg
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov quantity, al

    mov ah, 09h
    lea dx, price_msg
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov price, al

    mov al, quantity
    mov bl, price
    mul bl
    mov total_cost, ax

    mov ah, 4Ch
    int 21h

RET