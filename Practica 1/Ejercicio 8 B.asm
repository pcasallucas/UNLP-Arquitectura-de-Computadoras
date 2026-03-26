        org 1000h  
        RES  db ?
        string db "abcd",0
        

        org 2000h
        mov BX, offset string
        
        call LONGITUD

fin:    mov RES, DL
        hlt
        
        org 3000h
LONGITUD:
        mov DL, 0          ; contador = 0

loop:
        mov AL, [bx]       ; leer caracter
        cmp AL, 0
        jz subfin             ; si es 00h → terminar

        cmp AL, 'a'
        js skip
        cmp AL, 'z'
        jns skip
        
        inc DL             ; contar
skip:        
        inc bx             ; avanzar puntero
        jmp loop

subfin:
        ret
        end