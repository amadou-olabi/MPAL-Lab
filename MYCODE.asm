
ORG 100H

.DATA
	NUM DB ?
	IRR DB ?
	SUM DB ?
	AVERAGE DB ?
	
	PROMPT_1  DB  'Enter the number from 0 to 9 : $'
	PROMPT_2  DB  0DH,0AH,'Even Digits : $'
	PROMPT_3  DB  0DH,0AH,'Sum : $'
	PROMPT_4  DB  0DH,0AH,'AVERAGE : $'

.CODE

MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	
	LEA DX, PROMPT_1             
    MOV AH, 9
    INT 21H
	
	MOV AH, 01h
	INT 21h
	
	MOV DL, AL
	MOV NUM, DL
	
	MOV DX, 0
	MOV BX, 0
	
	
	START:
		DIV BX, 2
		CMP BX, NUM
		JG RET
		CMP DX, 0
		JG EVEN_SP
		
		LOOP START
	
	EVEN_SP:
		MOV DX, BX
		MOV AH, 02h
		INT 21h
		
		ADD BX, 1
		MOV BX, AX
		
		JMP START
	
	LEA DX, PROMPT_2            
    MOV AH, 9
    INT 21H
	
	
	MAIN ENDP
END MAIN
RET
