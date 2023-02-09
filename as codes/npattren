[org 0x0100]

jmp start

section .data
prompt: db"Enter the number of rows: ",0x0a,0x0d,'$'
new: db 0x0a,'$'
array: db 20,0
resb 20

section .code

neww:
	mov dx,new
	call print
ret

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

done:
	mov ax,4c00h
	int 21h
	
getnum:
	mov dx,array
	mov ah,0x0a
	int 21h
	
ret
star1:
	mov ch,0
	mov bh,00h
	mov bl,07h
	mov ah,09h
	mov al,2ah
	int 10h
	add cl,1
	mov dh,[array+2]
	sub dh,30h
	add dh,1
	cmp cl,dh
	call neww
	je done
	jmp star1
ret

star:
	mov ch,0
	mov bh,00h
	mov bl,07h
	mov ah,09h
	mov al,2ah
	int 10h
	call neww
	sub cl,1
	cmp cl,0
	je done
	jmp star
ret

start:
	;call clear
	mov dx,prompt
	call print
	call getnum
	
	mov cl,[array+2]
	sub cl,30h
	call star

	;mov cl,0
	;call star1
	
	