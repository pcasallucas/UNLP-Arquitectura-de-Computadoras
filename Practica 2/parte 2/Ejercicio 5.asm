ESTADO EQU 41h
DATA EQU 40h

  ORG 1000h 
  mensaje db "INGENIERIA E INFORMATICA", 0
  
  ORG 2000h
  mov bx, offset mensaje

loop:
    mov al, [bx]
    cmp al, 0
    jz fin

    call imprimir_caracter_hand

    inc bx
    jmp loop

fin:
    hlt

  ORG 3000h
imprimir_caracter_hand:
    push ax

  poll:
    in al, ESTADO
    and al, 00000001b
    jnz poll

    pop ax
    out DATA, al
    ret
end 