[org 0x0100]

xor ax, ax
xor bx, bx

mov ax, 1
mov bx ,1
mov cx ,5

Tag1:
	mul bx
	mov bx, 3
	cmp ax, 81
	loopne Tag1

mov ax, 0x4c00
int 0x21