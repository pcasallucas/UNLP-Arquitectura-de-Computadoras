        CA EQU 32h
        PA EQU 33h

        DATO EQU 40h
        ESTADO EQU 41h
        
        org 1000h 
        on db "Llave prendida",0
        off  db "Llave apagada",0

        org 2000h
          in al, CA
          AND al, 80h
          jz apagada
prendida:
    mov bx, offset on
    jmp imprimir

apagada:
    mov bx, offset off

imprimir:
    push bx
    pop bx
loop:
    mov al, [bx]
    cmp al, 0
    jz fin

    out DATO, al
    inc bx
    jmp loop
fin:
    hlt
        end