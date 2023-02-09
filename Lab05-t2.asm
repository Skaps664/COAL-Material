[org 0x0100]

jmp start

num1: dw 1, 2, 3, 4, 5, 1, 2, 3, 4, 5 
result: dw 0

start:
	xor ax, ax
	xor bx, bx

	outerloop:
		add ax, [num1 +bx]
		add bx, 2
		cmp bx, 20

		jne outerloop
	mov [result], ax

mov ax, 0x4c00
int 0x21