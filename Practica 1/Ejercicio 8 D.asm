        org 1000h  
        RES  db ?
        string db "abcde",0
        

        org 2000h
        mov BX, offset string
        call LONGITUD

fin:    mov RES, DL
        hlt
        
        org 3000h
LONGITUD:
        mov DL, 0
loop:
        mov AL, [BX]
        cmp AL, 0
        jz subfin

        cmp AL, 'a'
        jz vocal
        cmp AL, 'A'
        jz vocal
        cmp AL, 'e'
        jz vocal
        cmp AL, 'E'
        jz vocal
        cmp AL, 'i'
        jz vocal
        cmp AL, 'I'
        jz vocal
        cmp AL, 'o'
        jz vocal
        cmp AL, 'O'
        jz vocal
        cmp AL, 'u'
        jz vocal
        cmp AL, 'U'
        jz vocal
        inc BX
        jmp loop
        
vocal:        
        inc DL  
        inc BX
        jmp loop
subfin:
        ret
        end