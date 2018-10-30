; archivo enciende.asm
; Assembly code for PIC16F84 microcontroller
; Turns on an LED connected to B0.
; Uses RC oscillator, about 100 kHz.
; CPU configuration
; (It’s a 16F84, RC oscillator,
; watchdog timer off, power-up timer on.

processor 16f84

include <p16f84.inc>

; aqui es el inicio del programa

        org     0x00       ; start at address 0

        ; en el inicio, todos los puertos son entradas. Poner el puerto B como salidas.

MOVLW   B’00000000’     ; mueve 0000000 al registro w := binary 00000000
TRISB     PORTB           ; copy w to port B control reg

        ; pone un 1, en el bit mas bajo del puerto B.

movlw   B’00000001’     ; w := binary 00000001
movwf   PORTB           ; copy w to port B itself

fin:    goto    fin
        end             ; fin


