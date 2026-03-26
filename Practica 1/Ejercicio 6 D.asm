        org 1000h  
        A db 5
        B db 2

mul:
        mov BX, SP
        add BX, 2
        mov AH, byte ptr[BX]
        mov AL, byte ptr[BX]
        add DH, AH
        sub AL, 1
        cmp AL, 0
        jnz mul
        ret
        
        org 2000h
        mov AH, A
        push AX 
        mov AH, B
        push AX
        mov DX, 0
        cmp AX, 0
        jz fin
        cmp BX, 0
        jz fin
        
        call mul

fin:    hlt
        end

