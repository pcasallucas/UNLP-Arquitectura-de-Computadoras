    EOI EQU 20h
    IMR EQU 21h
    INT0 EQU 24h
    
    N_F10 EQU 0Fh
    
        ORG 60
    IP_F10 DW RUT_F10

    
        org 1000h
        msj db "Vamos las interrupciones!"
        count db ?

        org 2000h        
        CLI
        MOV AL, N_F10
        OUT INT0, AL
        MOV AL, 0FEH
        OUT IMR, AL
        STI

        mov BX, offset count
        mov byte ptr [BX], 5
LAZO:
        cmp byte ptr [BX], 0
        JNZ LAZO


finish: hlt

        org 3000h

RUT_F10:
        push BX
        push AX
        mov BX, offset msj
        mov al, 25
        int 7
        pop AX
        pop BX
        mov dl, byte ptr [BX] 
        dec dl
        mov byte ptr [BX], dl
        mov al, EOI
        out EOI, al
        iret
        
        end