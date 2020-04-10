;Ascending order using bubble sort
jmp START

arr: 	 DB 43H, 12H, 07H, 36H, 11H     ;elements in array(arr)
arrsize: DB 05H                     	;size(n) of array(arr)

START:  nop
        lda arrsize
        mov c,a                     	;store size(n) of array
        dcr c                       	;n=n-1
AGAIN:  lxi h,arr                   	;set index(i) to location of start of array
        mov d,c                     	;m=n
UP:     mov a,m                     	;get arr[i]
        inx h                       	;i=i+1
        cmp m                       	;compare arr[i] with arr[i+1]
        jc SKIP
        mov b,m
        mov m,a
        dcx h
        mov m,b
        inx h                       	;exchange contents if arr[i]>arr[i+1]
SKIP:   dcr d                       	;m=m-1
        jnz UP                      	;repeat cycle if m!=0
        dcr c                       	;n=n-1 on end of cycle
        jnz AGAIN                   	;repeat iteration if n!=0
hlt
