        org 1000h  
        RES  db ?
        string db "abcd",0
        

        org 2000h
        mov BX, offset string
        
        call LONGITUD
        add sp, 4

fin:    mov RES, DL
        hlt
        
        org 3000h
LONGITUD:
        mov DL, 0          ; contador = 0

loop:
        mov al, [bx]       ; leer caracter
        cmp al, 0
        jz fin             ; si es 00h → terminar
    
        inc DL             ; contar
        inc bx             ; avanzar puntero
        jmp loop

subfin:
        ret
        end