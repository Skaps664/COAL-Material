[org 0x100]

jmp start

section .data

enter1 : db "enter the 5 numbers in array: ",0x0a,0x0d,'$'
p: db 20,0
resb 20

prompt: db"The reverse array is: ",0x0a,0x0d,'$'
array: db 20,0
resb 20


section .code
clear:
	mov ah,07h
	xor al,al
	xor cx,cx
	mov dh,22
	mov dl,79
	mov bh,0x07
	int 10h
ret

print:
	mov ah,09
	int 21h
ret
	
getnum:
	mov dx,array
	mov ah,0x0a
	int 21h
ret

reverse:
	mov ah,[array+6]
	mov [p+2],ah
	mov ah,[array+5]
	mov [p+3],ah
	mov ah,[array+4]
	mov [p+4],ah
	mov ah,[array+3]
	mov [p+5],ah
	mov ah,[array+2]
	mov [p+6],ah
ret	

printarray:
	mov ch,0
	mov cl,[array+1]
	mov al,1
	mov bh,0
	mov bl,70h
	mov dh,12
	mov dl,17
	push cs
	pop es
	mov bp,p+2
	mov ah,13h
	int 10h
ret
	
start:
	
	mov dx,enter1
	call print
	call getnum
	call reverse
	call printarray
	mov ax,0x4c00
	int 21h