org 100h

jmp start

data: db 'KASHMIR'
msg1end:

clearscreen:
mov ah, 07h
xor al, al
xor cx, cx
mov dx, 184Fh 
mov bh, 07h
int 10h
ret

setcursor:
mov dh, 13
mov dl, 35
mov bh, 0
mov ah, 02h
int 10h
mov ah, 00
int 16h
ret

printchr:
mov cx, 5
mov bx, 0007h
mov ah, 09h ; BIOS.WriteCharacterAndAttribute
mov al, 2Ah ; 2a == *, AL is ASCII
int 10h
ret

printstr:
mov cx, msg1end - data;
mov al, 1

mov bh, 0
mov bl, 07

mov dh, 8
mov dl, 13
push cs
pop es
mov bp, data
mov ah, 13h
int 10h


start:

call clearscreen
call printstr

mov ax, 0x4c00 
int 0x21