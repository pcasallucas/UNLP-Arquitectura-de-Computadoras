        org 1000h  
        string db "abbcde",0
        char db 'b'
        reem db 'o'


        org 2000h
        mov BX, offset string
        push BX
        mov CL, char
        push CX
        mov CL, reem
        push CX
        call REEMPLAZAR_CHAR
        hlt

        org 3000h
REEMPLAZAR_CHAR:
        push BX
        push AX
        mov CX, 0
        mov DX, 0
        mov BX, SP
        add BX, 6
        mov CL, [BX]
        mov CH, 0
        mov DL, [BX + 2]
        mov BX, [BX + 4]
loop:
        mov AL, [BX]
        cmp AL, 0
        jz subfin

        cmp AL, DL
        jz match
        inc BX
        jmp loop

match:        
        mov [bx], CL  
        inc BX
        jmp loop
subfin:
        pop AX
        pop BX
        ret
        end