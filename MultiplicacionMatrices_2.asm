
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
  
; SI Contiene datos de la primer matriz (1byte por dato)
; DI Contiene datos de la segunda matriz (1byte por dato)
; BP Contiene datos de la matriz de sumas (1 o 2 bytes por dato)
org 100h


MOV AX,600H
MOV DS,AX
MOV	SS,AX
MOV	AX,01H
MOV	SI,AX
MOV	AX,41H
MOV	DI,AX
MOV	AX,61H
MOV	BP,AX
Inicio:	
MOV AH,00H
MOV	AL,[SI]
MOV	BL,[DI]
MOV	CL,BL
MOV	BL,AL
CALL	Multi
JMP	Aqui
RET
Multi	PROC            
CMP CL,00H            ; nueva linea, evita 
JZ MDone2
CMP BL,00H
JZ MDone2             ; multiplicacion por cero
DEC CL
Cont:	JZ	MDone      
ADC	AX,BX     
DEC	CL
JMP	Cont
MDone: RET
MDone2: MOV AL,00H    ; evita resultado
JMP MDone             ; diferente de cero
	Multi	ENDP
Aqui:	MOV	[BP],AX     ; Tengo que considerar una multiplicacion con resultado de mas de 1 byte.
CMP	AL,BL              ; Checar esta instruccion, puede tronar en algun momento.
INC	SI                 
INC	DI
INC	BP
INC BP
CMP	DI,45H
JZ	Fm2
JMP	Inicio
Fm2:	
MOV AH,00H
MOV	AL,41H
MOV	DI,AX
CMP	AL,BL            ; Checar esta instruccion, puede tronar en algun momento.
CMP	BP,81H           ; Se compara con 80 ya que los numeros pueden ser de 2 bytes por lo que ocupan doble espacio 61+F+F+1=80
JZ	Salir
JMP	Inicio


;SI ahora apunta a la nueva matriz de resultados
;BP Apunta a la matriz de sumas

Salir:	MOV	AX,61H
MOV	BP,AX        
MOV DX,00H
MOV	AL,03H
MOV	CL,AL
MOV	AL,81H
MOV	SI,AX
MOV	AL,04H
MOV	BL,AL
CSuma2: MOV	AX,[BP]
CSuma: INC	BP
INC BP
ADD	AX,[BP]
JC Carry
JMP Conti
Carry: INC DX
JMP Conti
Conti: DEC CL
JZ	FSuma
JMP	CSuma
FSuma:	MOV	[SI],AX
CMP	AL,01
INC	SI
INC SI
MOV [SI],DX 
INC SI  
MOV	AL,03H
MOV	CL,AL
INC BP
INC BP  
MOV DL,00H
DEC	BL
JZ	Fin
JMP	CSuma2
Fin:	HLT

ret




