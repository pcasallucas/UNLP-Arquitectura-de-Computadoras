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
  counter db 5
  
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

    MOV BX, offset counter
    STI

loop:
      CMP counter, 0
      JNZ loop
      CLI
fin:
    hlt

  ORG 3000h
RUT_TIMER:
    PUSH AX
    PUSH BX

    MOV BX, OFFSET msj
    MOV AL, 25
    INT 7

    POP BX
    MOV dl, byte ptr[BX]
    DEC dl
    MOV byte ptr[BX], dl 

    MOV AL, 0
    OUT CONT, AL

    Mov al, EOI
    OUT EOI, al
    
    POP AX
    IRET

end 