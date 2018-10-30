include <p18f25k50.inc>
 
    org     0x2000
    goto    start
 
    org     0x2020
ledRedOn:
    bcf     TRISC, 6
    return
 
ledRedOff:
    bsf     TRISC, 6
    return
 
start:
    bcf     LATC, 6      ; Set up the red LED
 
    ; Enable Timer 0 as a 16-bit timer with 1:256 prescaler:
    ; since the instruction speed is 12 MHz, this overflows about
    ; every 1.4 seconds.
    movlw   b'10000111'
    movwf   T0CON
 
mainLoop:
    movf    TMR0L, W    ; Trigger an update of TMR0H
 
    ; Blink the red LED with a period of 1.4 s.
    btfss   TMR0H, 7
    rcall   ledRedOff
    btfsc   TMR0H, 7
    rcall   ledRedOn
 
    goto    mainLoop
 
    end
