    org 100h
    
    .model small
    .stack 100h
    .data
    
    array DB 5 dup(0)
    str1 db 13,10,"Enter Value $"
    str2 db 13,10,": $"
    number db '1'
    space db 13,10," $"
    min db 13,10," Min $"
    max db 13,10," Max $"
    
    maximum db '0'
    minimum db '9'   
     
      
    .code
    main proc
    mov bx, offset array
    mov si,0
    mov cx,5
     
    cats:    ;input numbers in  array
    
    mov ah,09h
    mov dx,offset str1
    int 21h
    
    
    mov ah,02h
    mov dl,number
    int 21h
    inc number
    
    
    mov ah,01h    
    int 21h
    mov [bx+si],al
    inc si
        
    loop cats
    ;MINIMUM
    mov cx,4
    mov si,0
    mov di,1
    
    mov ah,09h
    mov dx,offset space
    int 21h 
    meow:
    
    mov dl,[bx+si]
    mov dh,[bx+di]
    cmp dl,dh
    
    jl Less1
    jg Great1
    
    Less1:
    CMP dl,minimum
    jL moveless
    JG exit
    
    moveless:
        mov minimum,dl
        JMP exit
         
    Great1:
    CMP dh,minimum 
    JL movegreat
    JG exit:
    movegreat:
        mov minimum,dh 
        jmp exit
   
    exit: 
        inc si
        inc di
    
    loop meow 
    
    mov ah,09h
    mov dx,offset min
    int 21h
    
    
    mov ah,02
    mov dl,minimum
    int 21h
    
    
    
    ;MAXIMUM
    mov cx,4
    mov si,0
    mov di,1
    
    mov ah,09h
    mov dx,offset space
    int 21h 
    meow2:
    
    mov dl,[bx+si]
    mov dh,[bx+di]
    cmp dl,dh
    
    JG Great2
    JL Less2
    
    Great2:
    CMP dl,maximum
    jG movegreater
    JL exit2
    
    movegreater:
        mov maximum,dl
        JMP exit2
         
    Less2:
    CMP dh,maximum
    JG movegreat2
    JL exit2:
    movegreat2:
        mov maximum,dh 
        jmp exit2
   
    exit2: 
        inc si
        inc di
    
    loop meow2 
    
    mov ah,09h
    mov dx,offset max
    int 21h
    
    
    mov ah,02
    mov dl,maximum
    int 21h
    
    
    main endp
    end main  
    ret