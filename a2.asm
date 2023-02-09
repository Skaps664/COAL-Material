org 100h

jmp start

clearscreen:
mov ah, 60h
xor al, al
xor cx, cx
mov dx, 184Fh
mov bh, 07h
int 10h
ret

setcursor:
mov dh, 13
moh dl, 35
mov bh, 0
mov ah, 02h
int 10h
ret

start:
call clearscrren

mov ax, 0x4c00 
int 0x21