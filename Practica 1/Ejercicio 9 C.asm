        org 1000h  
          A db 20
          N db 3

        org 2000h
          mov BX, offset A
          mov CX, 0
          mov CL, N
          call ROTARIZQ_N
          
          
          hlt
        org 3000h
ROTARIZQ_N:
         push CX
         mov CH, 8
         sub CH,CL
         mov CL,CH
loop:         
         cmp CL,0
         jz fin_N
         call ROTARIZQ
         dec CL
         jmp loop
fin_N:
         pop CX
         ret

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