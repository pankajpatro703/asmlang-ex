;Palindrome check of a string
.MODEL SMALL
.STACK 100

.DATA
prompt1 DB      "Enter size: $"         ;prompt message for size of string
prompt2 DB	"Enter string: $"       ;prompt message to obtain string
m1      DB	"Not Palindrome$"       ;result message if not palindrome
m2 	DB      "Palindrome$"           ;result message if palindrome
array 	DB	?                  	;memory to store string

.CODE
START:  mov ax,@DATA
        mov ds,ax

        mov ah,09h
        mov DX,OFFSET prompt1
        int 21h                         ;display prompt to get size

        mov ah,01h
        int 21h                         ;get size

        sub al,30h
        inc al
        mov cl,al                       ;convert from ascii to size(n)

        mov ah,02h
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h                         ;print newline

        mov ah,09h
        mov dx,OFFSET prompt2
        int 21h                         ;display prompt to get the string

        mov BYTE PTR array,cl
        mov ah,0ah
        mov dx,OFFSET array
        int 21h                         ;get user entered buffer/string(arr)

        mov ah,02h
        mov dl,0dh
        int 21h
        mov dl,0ah
        int 21h                         ;print newline

        mov ch,00h
        mov di,cx                       ;get n-i
        mov si,0002h                    ;get i

UP:     mov al,array[si]
        mov ah,array[di]
        cmp si,di                       ;compare i with n-i
        jns OUTP
        inc si                          ;i=i+1
        dec di
        cmp al,ah                       ;compare arr[i] and arr[n-i]
        jz UP                           ;repeat if arr[i]==arr[n-i]

        mov ah,09h                      ;if any arr[i]!=arr[n-i]
        mov dx,OFFSET m1
        int 21h                         ;display "Not Palindrome"

        jmp NEXT                        ;end after display

OUTP:   mov ah,09h                      ;all arr[i]==arr[n-i]
        mov dx,OFFSET m2
        int 21h                         ;display "Palindrome"

NEXT:   mov ah,4ch
        int 21h                         ;return to dos
END START
END
