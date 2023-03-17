    org 100h
    
    .model small
    .stack 100h
    .data
      
     ball db 'O'
     space db ''
     iter dw 0
     row db 2
     col db 0 
     check db 0 
     promt db 13,10,'Enter a char: $'
      
    .code
    main proc
    mov ah,09
    mov dx,offset promt
    int 21h
    
    mov ah,01h
    int 21h
    mov ball, al
    
    mov cx,74
    mov ah,02
    mov dh,row
    mov dl,col
    int 10h
    
    bounce:
        mov ah,02
        mov dh,row
        mov dl,col
        int 10h
         
        mov ah,02
        mov dl,ball
        int 21h
        
        mov ah,02
        mov dh,row
        mov dl,col
        int 10h
        
        mov ah,02
        mov dl,space
        int 21h
        
        
        
        CMP row,23
        JL incr
        JE check1
        incr:
            CMP check,0
            JE conti
            JNE decr
            conti:
            inc row
            inc col
            JMP move
        decr:
            CMP row,0
            JG cont
            JE check0
            cont:
            dec row
            inc col
            JMP move
            check0:
            mov check,0
            inc row
            JMP move
            check1:
            mov check,1
            dec row
            JMP move
        move:
        loop bounce

    main endp
    end main  
    ret