        org 1000h  
        RES  db ?
        string db "abbcde",0
        char db 'b'


        org 2000h
        mov BX, offset string
        mov CL, char
        call CONTAR_CAR


fin:    mov RES, DL
        hlt

        org 3000h
CONTAR_CAR:
        mov DL, 0
loop:
        mov AL, [BX]
        cmp AL, 0
        jz subfin

        cmp CL, AL
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