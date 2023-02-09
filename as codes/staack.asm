[org 0x100]

push 3
push 5
push 7

call f1

mov ax,0x4C00

int 0x21

f1:

push bp

mov bp,sp

mov ax,[bp+6]

mov bx,[bp+4]
mov cx,[bp+8]
add ax,bx

pop bp
ret 6