;Ascending order using bubble sort
.MODEL SMALL
.STACK 100

.DATA
array 	DB 43H, 12H, 07H, 36H, 11H	;elements in array(arr)
arrsize DB 05H				;size(n) of array(arr)

.CODE
START:  mov ax,@DATA
        mov ds,ax

	mov ch,arrsize			;store size(n) of array
        dec ch				;n=n-1
UP:     lea si,array			;set index(i) to location of start of array
        mov cl,ch			;m=n
LOOPIT: mov al,[si]			;get arr[i]
        cmp al,[si+1]			;compare arr[i] with arr[i+1]
        jc STAR
        mov bl,[si+1]
        mov [si],bl
        mov [si+1],al			;exchange contents if arr[i]>arr[i+1]
STAR:   inc si				;i=i+1
        dec cl				;m=m-1
        jnz LOOPIT			;repeat cycle if m!=0
        dec ch				;n=n-1 on end of cycle
        jnz UP				;repeat iteration if n!=0

	mov ah,4ch
        int 21h				;return to dos
END START
END
