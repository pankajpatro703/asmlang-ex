;Ascending order
ORG 0000H

        MOV R3,#0AH             ;moving count(n) of array(arr)
        DEC R3                  ;n=n-1
again:  MOV A,R3                
        MOV R1,A                ;storing number of remaining elements(m) in R1
        MOV DPTR,#0D001H        ;index(i) pointing at location of start of array
up:     MOVX A,@DPTR            
        MOV R0,A                ;fetch and store arr[i]
        INC DPTR                ;index(i) pointing to i+1 location in array
        MOVX A,@DPTR            
        MOV R2,A                ;fetch and store arr[i+1]
        CLR C                   ;prepare for subtraction to compare
        SUBB A,R0               ;subtract arr[i+1]-arr[i]
        JNC skip                ;skip if arr[i]<arr[i+1]
        MOV A,R2                
        XCH A,R0                
        MOVX @DPTR,A            
        DEC DPL                 
        MOV A,R0                
        MOVX @DPTR,A            ;exchange the elements
        INC DPTR                ;point back to default
skip:   DJNZ R1,up              ;m=m-1, skip if 0
        DJNZ R3,again           ;n=n-1, skip if 0
        END
