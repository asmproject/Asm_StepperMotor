.386
INCLUDE Irvine32.inc
.model small
.stack 100h
.data


.code
    main proc
    
  PORTA  EQU 00H    ;Address of Port A = 00H
  PORTB  EQU 02H    ;Address of Port B = 02H
  PORTC  EQU 04H    ;Address of Port C = 04H
 CR EQU 06H    ;Address of Control register = 06H
ORG 100H         ;starts code at address 100H
  
  MOV AL, 10000011B ; means I/O device operates in I/O operatio mode and ports A,C are used as outputs and B as input with mode0
  OUT CR, AL    ;outputs(copies) value of AL 80H=1000000B  to I/O port CR 
  
 
START:          ;THE MAIN CODE
   MOV AH, 00H
 IN AL,PORTB
 MOV BL,AL
 MOV CL,AL
CALL MODE       ;if Al = 01H jumps to Full(Full clockwise mode) else compelte the code(goes to HALFCW)     
HALF:
IN AL,PORTB
MOV CL,AL ;CL=portb
MOV DL,1  ;DL=1
SHL DL,1  ;DL=00000010 to check direction
TEST CL,DL 
JNZ HALFACW ;if cl=00000010 go to half anticlockwise
JMP HALFCW ;if cl=00000000 g0 to half clockwise
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
JMP START
HALFACW:           ;Half mode anti clockwise 
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
JMP START
FULL:         ;full mode region

N AL,PORTB
MOV CL,AL     ;CL=PORTB
 MOV DL,1     ;DL=1
 SHL DL,1     ;DL=00000010
 TEST CL,DL   
 JNZ FULLACW  ;if cl=00000011 go to full anticlockwise
 JMP FULLCW   ;if cl=00000001 go to full clockwise
 
 FULLCW:     ;FULL mode clockwise 4steps each step is 90ْ

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
JMP START
;--------
FULLACW:     ;full mode anticlock wise
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
JMP START
;---procedures---
 DELAY PROC         ; DELAY PROCEDURE 
IN AL, PORTC
 CMP BL, AL
 JNE  MODE1
 
  OUT PORTC, AL
  IN AL, PORTB
  MOV CX, Ax    ;uses counter CX with delay time 0ffffH
  MYLP: LOOP MYLP    ;loops tell CX is zero

  RET                ; retrun to the program
 DELAY ENDP
;--------------
MODE1:
 MODE PROC
 IN AL, PORTB   ;Copies value of port B to AL (the value of the 8 bits of portB)
 MOV BL,AL       ;new value of BL 
 TEST BL,1
 JNZ FULL 
 JMP HALF

 MODE ENDP
;-------------


    invoke ExitProcess,0
    main endp
end main
