ORG 0100H

.DATA            
	
.CODE

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
	
	XOR CX, CX
	MOV CX, 5
	
input:
    MOV AH, 1
    INT 21H
    XOR AH, AH   
    MOV BX, AX
    PUSH BX
    LOOP input

	
	XOR CX, CX
	MOV CX, 5

    MOV DL, 0AH
    MOV AH, 2
    INT 21H
    
    MOV DL, 0DH
    MOV AH, 2
    INT 21H
    	       
output:
	POP BX
	MOV DX, BX
    MOV AH, 2
    ADD DX, 32
    INT 21H
    LOOP output
	
	
	MAIN ENDP
END MAIN
RET