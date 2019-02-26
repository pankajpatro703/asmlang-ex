.model small
.stack 100h
.data
prompt db 'Enter $'
num db 00h
result db 'Factorial is $'

.code
start:
mov ax,@data
mov ds,ax

;display
mov dx,offset prompt
mov ah,09h
int 21h

;take input
mov ah,01h
int 21h

;calculate
sub al,30h
mov num,al
mov cx,0001h
up: cmp num,ch
jz star
inc ch
mov al,ch
mul cl
mov cl,al
jmp up

star: add cl,30h
mov num,cl

;newline
mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

;print message
mov dx,offset result
mov ah,09h
int 21h

;display factorial
mov ah,02h
mov dl,num
int 21h

;return to dos
mov ah,4ch
int 21h
end start
end
