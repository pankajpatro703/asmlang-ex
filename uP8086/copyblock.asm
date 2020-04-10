;Move block from data to extra
.MODEL SMALL
.STACK 100

.DATA
array	DB 01H,23H,65H,2FH,3DH  ;data block
arrsize	DB 05H                  ;size of block

.CODE
START:  mov ax,@DATA
        mov ds,ax

        mov ax,3000h
        mov es,ax

        lea si, array           ;index(i) points to start of data array
        mov di,0000h            ;index(j) points to start of extra segment
        mov cl,arrsize          ;store size(n) of block of data
STAR:   cld
REP:    movsb                   ;move elements from data to extra
        dec cl                  ;n=n-1
        jnz STAR                ;repeat if n!=0

        mov ah,4ch
        int 21h                 ;return to dos
END START
END
