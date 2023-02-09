[org 0x100]
mov al, 11001100b
rol al,1

mov al, 11001100b
ror al,1

mov al, 11001100b
rcl al,1

mov al, 11001100b
rcr al,1

mov ax,0x4c00
int 0x21
