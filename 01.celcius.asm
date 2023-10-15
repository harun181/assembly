org 100h

.DATA  
    F DW 1000
    C DW ?
    A DW 5
    B DW 9          

.CODE
     MOV AX, @DATA              
     MOV DS, AX       
     
     SUB F, 32
     MOV AX, F
     
     MUL A 
     
     DIV B 
     
     ADD AX, 1
         
     MOV C, AX     
  
ret