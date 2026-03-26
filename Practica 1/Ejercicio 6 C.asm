        org 1000h  
        A db 5
        B db 2

mul:
        add DX, AX
        sub BX, 1
        cmp AX, 0
        jnz mul
        ret
        
        org 2000h
        mov AX, offset A
        mov BX, offset B
        mov DX, 0
        cmp AX, 0
        jz fin
        cmp BX, 0
        jz fin
        
        call mul

fin:    hlt
        end

