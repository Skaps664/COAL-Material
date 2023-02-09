[org 0x0100]

xor ax, ax
xor dx, dx
mov dx, 2

L1:
	cmp dx, 0
	jz L1
L2:
	sub dx, 1
	cmp dx, 1
	je L4
L3:
	cmp cx, 0
	jne L4
L4:
	cmp dx, 1
	je L3	

mov ax, 0x4c00
int 0x21