[org 0x0100]

xor ax, ax
xor bx, bx

	mov ax, [tag1]
	mov bx, 5
	add ax, bx
	mov [tag1+2], ax

	sub bx, 0x8000
	add ax, [tag1+2]

	mov ax, bx
	mov bx, tag2
	add bx, 2
	
mov ax, 0x4c00
int 0x21

tag1: dw 11, 6, 3
tag2: dw 0