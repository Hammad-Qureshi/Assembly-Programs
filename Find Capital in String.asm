    org 100h
    
    .model small
    .stack 100h
    .data
     array db 100 dup('$') 
     size DW 0
     space db 13,10,''
     smallest db 05Ah
     biggest  db 041h
     sletter db 13,10, 'The First Capital is: $' 
     bletter db 13,10,'The Last Capital is: $'       
     
      
    .code
    main proc
    mov bx, offset array
    mov si,0
    mov cx,100
    l1:
        mov ah, 01h
        int 21h
        CMP al,0Dh
        JE print
        JNE continue 
        continue:
        mov [bx+si],al
        inc si 
        loop l1
        
        
             
    print:
    
    mov size ,si
    mov bp, offset array
    mov si,0
    mov cx, size
    l2: 
        mov ah,02h
        mov dl,[bp+si]         
        int 21h
        
        mov bl,[bp+si]
        CMP bl,41h
        JGE check
        JL continue2
        check:
            CMP bl,smallest
            JL getsmallest
            JG continue2
            getsmallest:
                mov smallest,dl
                JMP continue2
                 
        continue2:             
        inc si
        loop l2
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        ;Biggest
    mov bp, offset array
    mov si,0
    mov cx, size
    l3: 
        
        mov bl,[bp+si]
        CMP bl,041h
        JGE check1
        JL continue3
        check1:
            CMP bl,biggest
            JGE getlargest
            JL continue3
            getlargest: 
                CMP bl,05Ah
                JLE store
                JG continue3
                store:
                mov biggest,bl
                JMP continue3
                 
        continue3:             
        inc si
        loop l3
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        mov ah,09
        mov dx,offset space
        int 21h
        
        mov ah,09
        mov dx,offset sletter
        int 21h
        
        mov ah,02
        mov dl,smallest
        int 21h

        mov ah,09
        mov dx,offset bletter
        int 21h
        
        mov ah,02
        mov dl,biggest
        int 21h
 
        
             
    main endp
    end main  
    ret