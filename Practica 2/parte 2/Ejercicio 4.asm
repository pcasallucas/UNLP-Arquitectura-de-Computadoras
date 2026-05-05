    PA EQU 30h 
    PB EQU 31h
    CA EQU 32h
    CB EQU 33h
    
  ORG 1000h 
  texto db "organicacion y arquitectura de computadoras"
  caracteres db 44
    
  ORG 2000h
    call ini_pio
    mov BX, offset texto
    mov CL, caracteres
    mov CH, 0
    add CX, BX
imprimir:
    mov al, [Bx]
    call imprimir_caracter
    add BX, 1
    cmp CX, BX
    jnz imprimir
  
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
    push ax
esperar: 
        in al, PA
        AND al, 01h
        jnz esperar
    pop ax
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