        CB EQU 30h
        PB EQU 31h
        
        org 1000h  

        org 2000h
          mov al, 00h
          out CB, al
          mov al, 0C3h
          out PB, al
          hlt
        org 3000h

        end