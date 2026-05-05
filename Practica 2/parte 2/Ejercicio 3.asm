    PA EQU 30h 
    PB EQU 31h
    CA EQU 32h
    CB EQU 33h
    PC EQU 34h
    CC EQU 35h
    
  ORG 1000h 
    si db "Ocupada" 
    no db "Libre" 
    
  ORG 2000H 

    mov al, 0h
    out CB, al
    mov al, 0FFh
    out CA, al 
    in al, PA 
    AND al, 01h
    jnz ocupada 
    mov bx, offset no
    mov al, 5 
    int 7 
    jmp fin 
    
ocupada: mov bx, offset si 
    mov al, 7 
    int 7

fin:     
    int 0  


  org 3000h
set_strobe:
    in al, PB         ; leer estado actual
    xor al, 01h
    out PB, al

    ret
end 