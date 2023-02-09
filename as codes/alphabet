[org 0x0100]

jmp start1

section .data.
u:db 'THE UPPER CASE IS:',0x0d,0x0a,'$'
l: db 'THE lower CASE IS:',0x0d,0x0a,'$'
entry:db 'Enter A Character(A-Z,a-z): ',0x0d,0x0a,'$'
hello:db 'HELLO USER HOW ARE YOU!!!',0x0d,0x0a,'$'
error: db 'WRONG ENTRIES!!!!--PLEASE RE-ENTER',0x0d,0x0a,'$'
prompt: db 'PLEASE ENTER USERNAME:!!',0x0d,0x0a,'$'
prompt1: db 'PLEASE ENTER PASSWORD:!!',0x0d,0x0a,'$'
username:db 'a','h','a','d'
password:db 'h','i','i',
user:db 15,0
resb 15

pass:db 15,0
resb 15

charc:db 15,0
resb 15
checkpass:
	mov ah,[password]
	mov al,[pass+2]
	cmp ah,al
	jne errorfun
	mov ah,[password+1]
	mov al,[pass+3]
	cmp ah,al
	jne errorfun
	mov ah,[password+2]
	mov al,[pass+4]
	cmp ah,al
	jne errorfun
ret
clear:
	mov ah,07h
	xor al,al
	xor cx,cx
	mov dh,23
	mov dl,79
	mov bh,07h
	int 10h
	mov dh,9
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
ret
print:
	mov ah,09
	int 21h
ret
get1:
	mov dx,user
	mov ah,0x0a
	int 21h
ret
get2:
	mov dx,pass
	mov ah,0x0a
	int 21h
ret
get3:
	mov dx,charc
	mov ah,0x0a
	int 21h
ret

errorfun:
	call clear
	mov dh,12
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,error
	call print
	mov ah,00h
	int 16h
	jmp start1
checkuser:
	mov ah,[username]
	mov al,[user+2]
	cmp ah,al
	jne errorfun
	mov ah,[username+1]
	mov al,[user+3]
	cmp ah,al
	jne errorfun
	mov ah,[username+2]
	mov al,[user+4]
	cmp ah,al
	jne errorfun
	mov ah,[username+3]
	mov al,[user+5]
	cmp ah,al
	jne errorfun
ret

	
done: 	
	mov ax,4c00h
	int 21h
start1:
;---------------------------- 
	call clear
	mov dx,prompt
	call print
	call get1
	call checkuser
	mov dh,12
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,prompt1
	call print
	call get2
	call checkpass
	jmp start2
	;jmp done

;--------------------------
start2:
	call clear
	mov dh,2
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,hello
	call print
	mov dh,5
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,entry
	call print
	call get3
	call checkcase
	jmp done
;-------------------------------------
done1:
	mov dx,error
	call print
	jmp start2
checklower:
	mov al,0x7A
	cmp ah,al
	jnl done1
	sub ah,0x20
	mov [charc+2],ah
	mov ch,0
	mov cl,[charc+1]
	mov al, 1    
    mov bh, 0
    mov bl, 07  
    
    mov dh, 18       
    mov dl ,4   	
	;STANDARD PROCESS
    push cs
    pop es
    mov bp,charc+2
    mov ah,13h      
    int  10h
	mov ah,00h
	int 16h
	jmp start2
	
checkhigh:
	mov al,0x5A
	cmp ah,al
	jnl done1
	add ah,0x20
	mov [charc+2],ah
	mov ch,0
	mov cl,[charc+1]
	mov al, 1    
    mov bh, 0
    mov bl, 07  
    
    mov dh, 18       
    mov dl ,4   	
	;STANDARD PROCESS
    push cs
    pop es
    mov bp,charc+2
    mov ah,13h      
    int  10h
	mov ah,00h
	int 16h
	jmp start2
checkcase:
		mov ah,[charc+2]
		mov al,0x61
		cmp ah,al
		je checklower
		jg checklower
		cmp ah,0x0d
		je done
		cmp ah,0x41
		je checkhigh
		jg checkhigh
		mov dx,error
		call print 
		jmp start2
	ret