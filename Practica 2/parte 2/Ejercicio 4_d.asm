    PA EQU 30h 
    PB EQU 31h
    CA EQU 32h
    CB EQU 33h
    
  ORG 1000h 
    aux db ?
  ORG 2000h
    call ini_pio
    mov CX, 05
loop:
    mov BX, offset aux
    int 6
    mov al, [BX]
imprimir:
    call imprimir_caracter
    dec CX
    jnz loop
  
fin:
    int 0


  ORG 3000h

ini_pio: 
    push ax
    mov al, 00h
    out CB, al

    mov al, 01h
    out CA, al
    pop ax
    ret

poll:
    push AX
esperar: 
        in al, PA
        AND al, 01h
        jnz esperar
    pop AX
    ret

flanco_ascendente:
    in al, PA
    and al, 11111101b   ; poner bit 1 = 0
    out PA, al

    or al, 00000010b    ; poner bit 1 = 1
    out PA, al

    ret

imprimir_caracter:
      call poll
      out PB, al
      call flanco_ascendente
      ret
      
end 