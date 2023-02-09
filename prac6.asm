org 100h

jmp start

clearscreen:
	MOV AH, 07h
	XOR AL, AL
	XOR CX, CX
	MOV DX, 184FH
	MOV BH, 07h
	INT 10H
ret

prntstr:
	mov ah, 9
	int 21h
	ret

start:
	call clearscreen
	mov dx, msg
	call prntstr


msg db "Welcome to the Night of pure preparation ", 0x0d, 0x0a, '$'


	mov ax, 0x4c00
	int 21h