[org 0x0100]


xor ax, ax

add al, byte[num1]
add al, byte[num2]
add al, [num3]
add al, [num4]

mov [result], al

mov ax, 0x4c00
int 0x21


num1: dw 2
num2: dw 3
num3: db 1
num4: db 2
result: dw 0
