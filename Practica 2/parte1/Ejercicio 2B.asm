        CB EQU 30h
        PB EQU 31h
        CA EQU 32h
        PA EQU 33h
        
        org 2000h
          mov al, 0FFh
          out CA, al
          mov al, 0
          out CB, al
          mov dl, 0
          
loop:
          in al, PA
          cmp dl, al
          jz loop

          mov al, al
          out PB, al
          mov dl, al
          jmp loop
          
        hlt
        end