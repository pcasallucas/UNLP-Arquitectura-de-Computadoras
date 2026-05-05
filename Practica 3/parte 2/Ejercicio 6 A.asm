EOI EQU 20h
IMR EQU 21h
int0 EQU 24h
int1 EQU 25h

cont EQU 10h
comp EQU 11h

N_timer EQU 10
N_F10 EQU 15 

  org 40
  IP_timer dw Rut_timer

  org 60
  IP_F10 dw Rut_F10

  ORG 1000h 
  valor db ?
  salida db ?, ' '
  
  ORG 2000h
    MOV BX, offset valor
    int 6
    
    CLI

    MOV AL, N_TIMER
    OUT INT1, AL

    MOV al, N_F10
    OUT INT0,al

    MOV AL, 0FEh 
    OUT IMR, AL

    STI
    
loop:
      
      JMP loop
      
fin:
    hlt

  ORG 3000h
RUT_F10:
    PUSH AX
    PUSH BX

    MOV AL, 0
    OUT CONT, AL

    MOV AL, 1
    OUT COMP, AL

    MOV al, 0FDh
    OUT IMR, al
    
    Mov al, EOI
    OUT EOI, al

    POP BX
    POP AX
    
    IRET

  
RUT_TIMER:
    PUSH AX
    PUSH BX

    MOV al, valor
    MOV salida, al
    MOV BX, offset salida
    MOV al, 2
    INT 7

    DEC valor

    CMP valor, ' '
    JNZ seguir

    CLI

seguir: 
    MOV al, 0
    OUT CONT, al

    MOV al, EOI
    OUT EOI, al
    
    POP BX
    POP AX
    IRET


end 