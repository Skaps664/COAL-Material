org 100h

jmp start

data: db 'Kashmir'
msg1end:

BrownRectangular:
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 6      ; Upper left corner CH=row
    mov cl, 20 ; Upper left corner CL=column
    mov dh, 11 ; lower right corner DH=row
    MOV dl, 40  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

GreenRectangle:
	mov ah, 06h
	xor al,al
	mov ch, 6
	mov cl, 41
	mov dh, 11
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret

FirstGreenLine:
	mov ah, 06h
	xor al,al

	mov ch, 12
	mov cl, 20
	mov dh, 12
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret
FirstWhiteLine:
	mov ah, 06h
	xor al,al

	mov ch, 13
	mov cl, 20
	mov dh, 13
	mov dl, 61
	mov bh, 70h
	int 10h
	mov  ah, 00h
	int 16h
ret
SecondGreenLine:
	mov ah, 06h
	xor al,al

	mov ch, 14
	mov cl, 20
	mov dh, 14
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret
SecondWhiteLine:
	mov ah, 06h
	xor al,al

	mov ch, 15
	mov cl, 20
	mov dh, 15
	mov dl, 61
	mov bh, 70h
	int 10h
	mov  ah, 00h
	int 16h
ret
ThirdGreenLine:
	mov ah, 06h
	xor al,al

	mov ch, 16
	mov cl, 20
	mov dh, 16
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret
ThirdWhiteLine:
	mov ah, 06h
	xor al,al

	mov ch, 17
	mov cl, 20
	mov dh, 17
	mov dl, 61
	mov bh, 70h
	int 10h
	mov  ah, 00h
	int 16h
ret
FourthGreenLine:
	mov ah, 06h
	xor al,al

	mov ch, 18
	mov cl, 20
	mov dh, 18
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret
FourthWhiteLine:
	mov ah, 06h
	xor al,al

	mov ch, 19
	mov cl, 20
	mov dh, 19
	mov dl, 61
	mov bh, 70h
	int 10h
	mov  ah, 00h
	int 16h
ret
FifthGreenLine:
	mov ah, 06h
	xor al,al

	mov ch, 20
	mov cl, 20
	mov dh, 20
	mov dl, 61
	mov bh, 20h
	int 10h
	mov  ah, 00h
	int 16h
ret

printstr:
mov cx, msg1end - data;
mov al, 1

mov bh, 0
mov bl, 07

mov dh, 8
mov dl, 22
push cs
pop es
mov bp, data
mov ah, 13h
int 10h

mov ah, 00h
int 16h

ret


start: 

call BrownRectangular
call printstr
call GreenRectangle
call FirstGreenLine
call FirstWhiteLine
call SecondGreenLine
call SecondWhiteLine
call ThirdGreenLine
call ThirdWhiteLine
call FourthGreenLine
call FourthWhiteLine
call FifthGreenLine


mov ax, 0x4c00
int 0x21