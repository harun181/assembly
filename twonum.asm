org 100h

.DATA
    FN  DB  'Enter the First digit : $'
    SN  DB  'Enter the Second digit : $' 
    F   DB  ?  
    S   DB  ?  
    
.CODE

    MOV AX, @DATA     
    MOV DS, AX


    LEA DX, FN        
    MOV AH, 9         
    INT 21H           

    MOV AH, 1         
    INT 21H           

    SUB AL, 30H      
    MOV F, AL  
    
    MOV DL, 0AH               
    INT 21H       

   
    LEA DX, SN       
    MOV AH, 9         
    INT 21H          

    MOV AH, 1         
    INT 21H           
     
    SUB AL, 30H       
    MOV S, AL         

    ; Addition
    MOV AL, F
    ADD AL, S
    MOV BL, AL        

    ; Subtraction
    MOV AL, F
    SUB AL, S
    MOV CL, AL       

    ; Multiplication
    MOV AL, F
    MUL S
    MOV DL, AL        

    ; Division
    MOV AL, F
    DIV S
    MOV AH, 0        
    MOV BH, 10       
    DIV BH            

    ret          

