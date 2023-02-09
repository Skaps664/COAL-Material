[org 0x100]
jmp start
promt:db 'FUCK ISRAELL!!!!'
msg:


print:	
	mov cx,msg-promt
	mov al,1
	mov bh,0
	mov bl,70h
	mov dh,12
	mov dl,29
	push cs
	pop es
	mov bp,promt
	mov ah,13h
	int 10h
ret
	
clear:
	mov ah,07h
	mov al,0
	xor cx,cx
	mov dh,23
	mov dl,79
	mov bh,07h
	int 10h
ret
done:
	mov ax,4c00h
	int 21h
ret
green:
	mov ah,07h
	mov al,0
	xor cx,cx
	mov dh,22
	mov dl,26
	mov bh,0aah
	int 10h
ret


white:
    
	mov al,0
	mov ch,0
	mov cl,22
	mov dh,22
	mov dl,52
	mov bh,7fh
	mov ah,07h
	int 10h
ret
red:
	mov ah,07h
	mov al,0
	mov ch,0
	mov cl,53
	mov dh,22
	mov dl,79
	mov bh,44h
	int 10h
ret
start:
	call clear
	call green
	call white
	call red
	call print
	mov ah,00h
	int 16h
	call done