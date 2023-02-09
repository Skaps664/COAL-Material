[org 0x0100]


xor ax, ax
xor bx, bx

mov bx, nums

mov cx, 5

outerloop:
	
	add al, [bx]
	add bx, 2
	sub cx, 1
	jnz outerloop

mov [result], al

mov ax, 0x4c00
int 0x21


nums: dw 1, 2, 3, 1, 2
result: dw 0