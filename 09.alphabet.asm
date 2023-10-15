org 100h

.DATA
    input DB 10, 13, "Enter a character: $"
    Alphabet DB 10, 13, "This is an alphabet. $"
    Digit DB 10, 13, "This is a digit. $"
    error DB 10, 13, "This is not an alphabet or a digit. $"

.CODE
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, input
    INT 21h

    MOV AH, 1
    INT 21h

    CMP AL, 'A'
    JL checkLowercase
    CMP AL, 'Z'
    JLE isAlphabet

checkLowercase:
    CMP AL, 'a'
    JL checkDigit
    CMP AL, 'z'
    JLE isAlphabet

checkDigit:
    CMP AL, '0'
    JL notAlphabetOrDigit
    CMP AL, '9'
    JLE isDigit

notAlphabetOrDigit:
    MOV AH, 9
    LEA DX, error
    INT 21h
    JMP Exit

isAlphabet:
    MOV AH, 9
    LEA DX, Alphabet
    INT 21h
    JMP Exit

isDigit:
    MOV AH, 9
    LEA DX, Digit
    INT 21h

Exit:
    ; Exit
    MOV AH, 4Ch
    INT 21h

ret
