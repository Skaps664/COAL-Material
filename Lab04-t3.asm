[org 0x0100]

xor ax, ax
xor bx, bx
xor dx, dx

mov bx, dataa
mov dx, 2

mov cx, 12

outerloop:
	cmp dx, [bx]
	jne innerloop1
	je innerloop2
innerloop1;
	add ax, [bx]
	add bx, 2
	sub cx, 1
	jnz outerloop
innerloop2:
	add bx, 2
	sub cx, 1
	jnz outerloop	

mov [result], ax

mov ax, 0x4c00
int 0x21

dataa: dw 1, 2, 3, 2, 1, 2, 3, 0, 1, 2, 1, 1
result: dw 0