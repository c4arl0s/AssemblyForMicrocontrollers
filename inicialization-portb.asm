; programa para la inicializacion del puerto B y configuracion de los pines a estatus con logica uno,

; Declaracion y configuracion del procesador.
        processor 16f84
        #include "p16f84.inc"

; Directivas
        __CONFIG _CP_OFF & _WDT_OFF & _PWRTE_ON & _XT_OSC

; inicio del programa
        org     0x00            ; vector de reset
        goto    principal       ; ir al inicio del programa principal

        org     0x04            ; vector de interrupcion
        goto    principal       ; rutina de interrupcion no existe, ir a principal

bank0   macro                   ; Macro bank0
        bcf     STATUS,RP0      ; Reset RP0 bit = Bank0; cambia al banco 0 para cambiar registros
        endm                    ; End of macro

bank1   macro                   ; Macro bank1   
        bsf     STATUS,RP0      ; Set RP0 bit = Bank1 ; cambia al banco 1 para cambiar registros
        endm                    ; End of macro

;*******************************

principal
        bank1                   ; cambia al banco 1
        movlw   0x00            ; mueve 00 al registro W
        movwf   TRISB           ; mueve W al puerto B ; Clearing a TRISB bit (= 0) will make the corresponding PORTB pin an output
        bank0                   ; cambia al banco 0
        movlw   0xFF            ; mueve FF al registro W
        movwf   PORTB           ; mueve el registro W al puerto B ; manda encender todos los bits del puerto B

lazo    goto    lazo            ; se queda en un lazo infinito 
        end                     ; termina el programa

;******************************
; The TO and PD status bits in the STATUS register are not affected by a MCLR Reset.
