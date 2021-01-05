.386
INCLUDE Irvine32.inc
.model small
.stack 100h
.data


.code
    main proc
    
  PORTA  EQU 00H    ;Address of Port A = 00H
  PORTB  EQU 02H    ;Address of Port B = 02H
 CR EQU 06H    ;Address of Control register = 06H
ORG 100H         ;starts code at address 100H
  
  MOV AL, 10000000B ; means I/O device operates in I/O operatio mode and ports A,C are used as outputs and B as input with mode0
  OUT CR, AL    ;outputs(copies) value of AL 80H=1000000B  to I/O port CR 
  
 
START:          ;THE MAIN CODE

HALFCW:    ;Half mode clockwise 8steps each step is 45ú
   MOV AL, 00001000B  ;moves 08H to AL
  OUT PORTA,AL        ;outputs(copies) value of AL 08H  to I/O port PORTA which means the coil A(for example) is set to 1 
                      ;and the rest 3 coils set to 0
;--------------------
 CALL DELAY ;DELAY
;--------------------
  MOV AL, 00001100B
  OUT PORTA,AL       ;outputs(copies) value of AL 0CH  to I/O port PORTA which means A,B coils (for example) is set to 1 
                      ;and the rest 2 coils set to 0
;--------------------
 CALL DELAY ;DELAY
;--------------------
   MOV AL, 00000100B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY
;--------------------
  MOV AL, 00000110B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY   
;--------------------
 MOV AL, 00000010B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY  
;--------------------
  MOV AL, 00000011B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------
  MOV AL, 00000001B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY  
;--------------------
  MOV AL, 00001001B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY  
;--------------------
JMP HALFCW
;Half mode anti clockwise 
MOV AL, 00001001B      
  OUT PORTA,AL
;--------------------
 CALL DELAY ;DELAY    
;--------------------
  MOV AL, 00000001B
  OUT PORTA,AL
;--------------------
 CALL DELAY ;DELAY    
;--------------------
  MOV AL, 00000011B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------
  MOV AL, 00000010B
  OUT PORTA,AL
;--------------------
  CALL DELAY ;DELAY   
;--------------------
  MOV AL, 00000110B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY    
;--------------------
   MOV AL, 00000100B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY   
;--------------------
  MOV AL, 00001100B
  OUT PORTA,AL
;--------------------
 CALL DELAY ;DELAY  
;--------------------
 MOV AL, 00001000B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY    
;--------------------
;full mode anticlock wise
MOV AL, 00000110B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------
  MOV AL, 00001100B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------    
  MOV AL, 00001001B
  OUT PORTA,AL
;--------------------
 CALL DELAY ;DELAY 
;--------------------    
  MOV AL, 00000011B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;-----------------
FULL:   ;full mode clock wise
MOV AL, 000000011B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------
  MOV AL, 00001001B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
;--------------------    
  MOV AL, 00001100B
  OUT PORTA,AL
;--------------------
 CALL DELAY ;DELAY 
;--------------------    
  MOV AL, 00000110B
  OUT PORTA,AL
;--------------------
CALL DELAY ;DELAY 
JMP FULL
;--------
 DELAY PROC         ; DELAY PROCEDURE  
  MOV CX, 0FFFFH     ;uses counter CX with delay time 0ffffH
  MYLP: LOOP MYLP    ;loops tell CX is zero
  RET                ; retrun to the program
  DELAY ENDP

    invoke ExitProcess,0
    main endp
end main
