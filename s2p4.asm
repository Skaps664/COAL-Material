[org 0x100]
mov al, 11001100b
shl al,1

mov al, 11001100b
shr al,1

mov al, 11001100b
sal al,1

mov al, 11001100b
sar al,1

mov ax,0x4c00
int 0x21
