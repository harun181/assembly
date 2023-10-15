org 100h

.DATA
    input DB 10, 13, "Enter a character: $"
    Vowel DB 10, 13, "It's a vowel. $"
    notV DB 10, 13, "It is not a vowel. $"

.CODE
    MOV AX, @DATA
    MOV DS, AX


    MOV AH, 9
    LEA DX, input
    INT 21h


    MOV AH, 1
    INT 21h

    CMP AL, 'a'
    JE isVowel
    CMP AL, 'e'
    JE isVowel
    CMP AL, 'i'
    JE isVowel
    CMP AL, 'o'
    JE isVowel
    CMP AL, 'u'
    JE isVowel


    CMP AL, 'A'
    JE isVowel
    CMP AL, 'E'
    JE isVowel
    CMP AL, 'I'
    JE isVowel
    CMP AL, 'O'
    JE isVowel
    CMP AL, 'U'
    JE isVowel

notVowel:
    MOV AH, 9
    LEA DX, notV
    INT 21h
    JMP exit

isVowel:
    MOV AH, 9
    LEA DX, Vowel
    INT 21h

exit:
    ; Exit
    MOV AH, 4Ch
    INT 21h

ret
