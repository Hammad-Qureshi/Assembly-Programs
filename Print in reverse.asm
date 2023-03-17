org 100h
.model small
.stack 100h
.data

arr db 10 dup('$')
msg db 'Enter characters: $'  
 
  
.code
main proc
    
    mov ah,09h
    mov dx,offset msg
    int 21h
    
    mov bx, offset arr
    mov si,0
    mov cx,10  
    
    input:
    
    mov ah,01h
    int 21h
    mov [bx+si],al
    
    inc si
    
    loop input
    
    
    
    mov ah,02
    mov dh,12
    mov dl,24 
    

    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h

    int 10h
    mov bx,offset arr
    mov si,9
    mov cx,10


    l1:
    
    
    mov ah,02h
    mov dl,[bx+si]
    int 21h
    
    dec si 
    
    loop l1
        

main endp
end main  
ret