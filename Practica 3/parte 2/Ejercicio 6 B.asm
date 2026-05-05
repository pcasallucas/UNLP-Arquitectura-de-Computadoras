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
  salida db ?
  bool db ?
  pausa db ?
  
  ORG 2000h
    CLI

    MOV AL, N_TIMER
    OUT INT1, AL

    MOV al, N_F10
    OUT INT0,al

    MOV AL, 0FEh 
    OUT IMR, AL

    MOV AL, 0
    OUT CONT, AL

    MOV AL, 1
    OUT COMP, AL

    MOV booL,1
    MOV pausa, 1
    
    STI
loop:
      JMP loop
      
    hlt

  ORG 3000h
RUT_F10:
    PUSH AX
    PUSH BX

    CMP bool, 1
    JNZ tog_pausa

    MOV valor, '9'
    MOV bool, 0
    MOV pausa, 0

    MOV AL, 0
    OUT CONT, AL

    MOV AL, 0FCh
    OUT IMR, AL
    JMP fin_f10

tog_pausa:
    CMP pausa, 1
    JZ reanudar

pausar: 
    MOV pausa, 1
    MOV AL, 0FEh
    OUT IMR, AL
    JMP fin_F10

reanudar:
    MOV pausa, 0
    
    MOV AL, 0
    OUT CONT, AL
    
    MOV AL, 0FCh
    OUT IMR, AL

fin_F10:
    Mov al, EOI
    OUT EOI, al

    POP BX
    POP AX
    
    IRET

  
RUT_TIMER:
    PUSH AX
    PUSH BX

    CMP pausa, 1
    JZ fin_Timer 
    
    MOV al, valor
    MOV salida, al
    MOV BX, offset salida
    MOV al, 2
    INT 7

    DEC valor

    CMP valor, '/'
    JZ RESET

    MOV al, 0
    OUT CONT, al
    JMP fin_Timer
RESET:
    MOV al, 0FEh
    OUT IMR, al
    
    mov bool, 1
    MOV pausa, 1
fin_Timer:
    MOV al, EOI
    OUT EOI, al
    
    POP BX
    POP AX
    IRET


end 