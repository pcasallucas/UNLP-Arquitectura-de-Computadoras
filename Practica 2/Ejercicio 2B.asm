        CA EQU 32h
        PA EQU 33h
        
        org 1000h 
        on db "Llave prendida"
        off  db "Llave apagada"

        org 2000h
          in al, CA
          cmp al, 80h
          jz match
          
          
match:
          int on
fin:
          hlt
        org 3000h
        end