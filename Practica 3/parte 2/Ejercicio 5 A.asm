EOI EQU 20h
IMR EQU 21h
int1 EQU 25h

cont EQU 10h
comp EQU 11h

N_timer EQU 10

  org 40
  IP_timer dw Rut_timer

  ORG 1000h 
  msj db "Vamos las interrupciones!", 0
  
  ORG 2000h
  CLI

    MOV AL, N_TIMER
    OUT INT1, AL

    MOV AL, 0FDh        ; 11111101 -> habilita INT1/timer
    OUT IMR, AL

    MOV AL, 0
    OUT CONT, AL

    MOV AL, 2
    OUT COMP, AL      

    STI

loop:
      jmp loop

fin:
    hlt

  ORG 3000h
RUT_TIMER:
    PUSH AX
    PUSH BX

    MOV BX, OFFSET msj
    MOV AL, 25
    INT 7

    MOV AL, 0
    OUT CONT, AL

    Mov al, EOI
    OUT EOI, al

    POP BX
    POP AX
    IRET

end 