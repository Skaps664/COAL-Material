[org 0x0100]
mov al,1
mov bl,2
mov cl,5

Tag1:
add al,bl
cmp al,9
loopz Tag1

Mov ax,0xFFFF

mov ax,0x4c00 
int 0x21
