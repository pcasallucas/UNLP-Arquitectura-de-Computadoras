        org 1000h  
          A db 20
          B db 3

        org 2000h
          mov BX, offset A
          push BX
          mov BX, offset B
          push BX
          call swap
          
          
          hlt
        org 3000h
swap:   
        push BX
        mov BX, SP
        add BX, 4
        mov CX, [BX]
        mov DX, [BX+2]
        mov BX, CX
        mov CL, [BX]
        push BX
        mov BX, DX
        mov DL, [BX]
        mov [BX], CL
        pop BX
        mov [BX], DL
fin:    
        pop BX
        ret
        end