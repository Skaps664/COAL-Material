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
	mov dh,19
	mov dl,79
	mov bh,11h
	int 10h
ret

done:
	mov ax,4c00h
	int 21h
ret

white1:
	mov ah,07h
	mov al,0
	mov ch,0
	mov cl,12
	mov dh,10
	mov dl,17
	mov bh,77h
	int 10h
ret

white2:
    
	mov al,0
	mov ch,4
	mov cl,0
	mov dh,6
	mov dl,30
	mov bh,77h
	mov ah,07h
	int 10h
ret

white3:
	mov al,0
	mov ch,2
	mov cl,31
	mov dh,3
	mov dl,79
	mov bh,77h
	mov ah,07h
	int 10h
ret

white4:
	mov al,0
	mov ch,7
	mov cl,31
	mov dh,8
	mov dl,79
	mov bh,77h
	mov ah,07h
	int 10h
ret

white5:
	mov al,0
	mov ch,11
	mov cl,0
	mov dh,12
	mov dl,79
	mov bh,77h
	mov ah,07h
	int 10h
ret

white6:
	mov al,0
	mov ch,15
	mov cl,0
	mov dh,16
	mov dl,79
	mov bh,77h
	mov ah,07h
	int 10h
ret
	

start:
	call clear
	call white1
	call white2
	call white3
	call white4
	call white5
	call white6
	call print
	mov ah,00h
	int 16h
	call done