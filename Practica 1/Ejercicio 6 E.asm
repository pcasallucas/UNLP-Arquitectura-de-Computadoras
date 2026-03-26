        org 1000h  
        RES  db ?
        A db 5
        B db 2

        org 2000h
        cmp A, 0
        jz fin
        cmp B, 0
        jz fin
        mov AX, offset A
        push AX 
        mov AX, offset B
        push AX
        mov DX, 0
        
        call mul
        add sp, 4

fin:    mov RES, DL
        hlt
        
        org 3000h
mul:
        mov BX, SP
        mov CX, [BX + 2]
        mov AX, [BX + 4]
        mov BX, AX
        mov AL,[BX]
        mov BX, CX
        mov CL,[BX]
        
loop:
        add DL, AL
        dec CL
        jnz loop
        ret
        
        
        end