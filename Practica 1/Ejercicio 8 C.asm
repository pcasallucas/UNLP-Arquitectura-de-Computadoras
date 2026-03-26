        org 1000h  
        RES  db ?
        char db 'a'
        

        org 2000h
        mov AL, char
        call LONGITUD

fin:    mov RES, DL
        hlt
        
        org 3000h
LONGITUD:
        mov DL,0
        cmp AL, 0
        jz subfin
        
        cmp AL, 'a'
        jz vocal
        cmp AL, 'A'
        jns vocal
        cmp AL, 'e'
        jz vocal
        cmp AL, 'E'
        jz vocal
        cmp AL, 'i'
        jz vocal
        cmp AL, 'o'
        jz vocal
        cmp AL, 'O'
        jz vocal
        cmp AL, 'u'
        jz vocal
        cmp AL, 'U'
        jz vocal
        jmp subfin
        
vocal:        
        mov DL, 0FFh        
subfin:
        ret
        end