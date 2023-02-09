org 100h

jmp start

section .data

prompt: db"Enter the number of rows: ",0x0a,0x0d,'$'

new: db 0x0a,'$'

array: db 4,0
resb 4

section .code

neww:
	mov dx,new
	call print
ret

print:
	mov ah,09
	int 21h
ret

done:
	mov ax,4c00h
	int 21h
	
getnum:
	mov dx,array
	mov ah,0x0a
	int 21h
	
ret

pattern:
	mov cl,[array+2]
	mov dl, [array+2]
	sub cl, 30h
	mov al, 65
	
	innerloop:
		mov bh,00h
		mov bl,07h
		mov ah, 09h
		int 10h
		add al, 1
		call neww
		sub cl,1
		cmp cl,0
		je done
		jmp innerloop
ret

start:
	
	mov dx,prompt
	call print
	call getnum
	call pattern
	
	