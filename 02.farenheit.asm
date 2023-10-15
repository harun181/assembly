org 100h

.DATA  
    F DW ?
    C DW 260
    A DW 5
    B DW 9   
    D DW 32        

.CODE
     MOV AX, @DATA              
     MOV DS, AX       
     
     MOV AX, C
     MUL B 
     
     DIV A
     
     ADD AX, D      
     MOV F, AX     
  
ret