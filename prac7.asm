org 100h

jmp start

msg db "21P8033"
msg1end:

firsthalf:
	mov ah, 06h
	xor al, al

	xor cx, cx
	mov dh, 12
	mov dl, 80
	mov bh, 70h
	int 10h
ret

secondhalf:
	mov ah, 06h
	xor al, al

	mov ch, 13
	mov cl, 00
	mov dh, 25
	mov dl, 80
	mov bh, 50h
	int 10h
ret

printstr:
	mov cx, msg1end - msg
	mov al, 1
	mov bh, 0
	mov bl, 07
	mov dh, 13
	mov dl, 33
	push cs
	pop es
	mov bp, msg
	mov ah, 13h
	int 10h
ret

start:

call firsthalf

call secondhalf
call printstr


mov ax, 0x4c00
int 21h