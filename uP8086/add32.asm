;Addition of two 32-bit numbers
.MODEL SMALL
.STACK 100

.DATA
num1 	DD 01234567h                    ;1st 32-bit number
num2 	DD 10003241h                    ;2nd 32-bit number
result 	DD 00000000h                    ;32-bit result

.CODE
START:  mov ax,@data
        mov ds,ax

        mov dx,0000h                    ;result of carry generated after addition
        mov ax, WORD PTR num1           ;fetch lower word of 1st number
        mov bx, WORD PTR num2           ;fetch lower word of 2nd number
        add ax,bx                       ;add lower words
        mov WORD PTR result, ax         ;store lower word of result
        mov ax, WORD PTR num1+2         ;fetch upper word of 1st number
        mov bx, WORD PTR num2+2         ;fetch upper word of 2nd number
        adc ax,bx                       ;add upper words with carry generated in previous add
        mov WORD PTR result+2,ax        ;store upper word of result
        jnc STAR
        inc dx                          ;point to next word location if carry generated
STAR:   mov WORD PTR result+4, dx       ;store carry generated

        mov ah,4ch
        int 21h                         ;return to dos
END START
END
