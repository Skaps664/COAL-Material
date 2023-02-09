org 100h

jmp start

data: db 'Assembly Language'
msg1end:
data1: db 'I Love Pakistan'
msg2end:

printstr:

mov cx, msg1end - data;
mov al, 1
mov bh, 0
mov bl, 07
push cs
pop es
mov bp, data
mov ah, 


mov ah, 4ch
int 21h