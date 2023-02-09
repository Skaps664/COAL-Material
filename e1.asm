[org 0x0100]
mov ax, message 
push ax 
push word [length]
call printstring
 mov ah, 0x1 
; wait for keypress 
int 0x21 

mov ax, 0x4c00 
int 0x21
printstring:
push bp
mov bp, sp
push es
push ax
push cx 
push si 
push di 
mov ax, 0xb800 
mov es, ax 
mov di, 0               
mov si, [bp + 6] ;Hello World
mov cx, [bp + 4] ; 11
mov ah, 0x07
nextchar: 
mov al, [si]
mov [es:di], ax 
add di, 2 
add si, 1 
loop nextchar 
pop di 
pop si 
pop cx 
pop ax 
pop es 
pop bp 
ret 4 
message:     db   'hello world'   
length:      dw   11


