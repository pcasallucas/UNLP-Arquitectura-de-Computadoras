        org 1000h  
        A db 5
        B db 2
        
        org 2000h
        mov AL, A
        mov AH, B
        mov DL, 0
        cmp AL, 0
        jz fin
        cmp AH, 0
        jz fin
mul:
        add DL, AL
        sub AH, 1
        cmp AH, 0
        jnz mul

fin:    hlt
        end

