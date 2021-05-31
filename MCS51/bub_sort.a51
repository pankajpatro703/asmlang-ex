;Ascending order
ORG 0000H

        mov r3,#0AH             ;moving count(n) of array(arr)
        dec r3                  ;n=n-1
again:  mov a,r3
        mov r1,a                ;storing number of remaining elements(m) in R1
        mov dptr,#0D001H        ;index(i) pointing at location of start of array
up:     movx a,@dptr
        mov r0,a                ;fetch and store arr[i]
        inc dptr                ;index(i) pointing to i+1 location in array
        movx a,@dptr
        mov r2,a                ;fetch and store arr[i+1]
        clr c                   ;prepare for subtraction to compare
        subb a,r0               ;subtract arr[i+1]-arr[i]
        jnc skip                ;skip if arr[i]<arr[i+1]
        mov a,r2
        xch a,r0
        movx @dptr,a
        dec dpl
        mov a,r0
        movx @dptr,a            ;exchange the elements if arr[i]>arr[i+1]
        inc dptr                ;point back to default
skip:   djnz r1,up              ;m=m-1, skip if 0
        djnz r3,again           ;n=n-1, skip if 0
        END
