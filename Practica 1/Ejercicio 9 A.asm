        org 1000h  
          A db 20

        org 2000h
          mov BX, offset A
          call ROTARIZQ
          
          hlt
        org 3000h
ROTARIZQ:
         mov AX, 0
         mov AL, byte ptr [BX]
         add AL, AL
         jnc fin
         add AL, 1
fin:    
        mov[BX],AL
        ret
        end