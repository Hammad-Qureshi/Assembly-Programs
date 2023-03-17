org 100h
.model small
.stack 100h
.data

arr1 db 10 dup('$')
arr2 db 10 dup('$')
arr3 db 10 dup('$')

msg1 db 'Enter 3 numbers: $' 
msg2 db 'Enter 3 numbers again: $'
msg3 db 'Answer: $'
  
.code
main proc    
    
    mov ah,09h
    mov dx,offset msg1
    int 21h
    
    mov bx,offset arr1
    mov si,0
    mov cx,3
    
    l1:
    
    mov ah,01h
    int 21h
    mov [bx+si],al
    inc si 
    
    loop l1
    
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h
    
    mov ah,09h
    mov dx,offset msg2
    int 21h
    
    mov bx,offset arr2
    
    mov si,0
    mov cx,3
    
    l2:
    
    mov ah,01h
    int 21h
    mov [bx+si],al
    inc si 
    
    loop l2
    
    mov bx,offset arr1
    mov bp, offset arr2
    mov si,0
    mov cx,3 
    
    l3:
    
    mov al,[bx+si]
    add al,[bp+si]
    sub al,48
    
    mov bx, offset arr3
    mov [bx+si],al
    mov bx,offset arr1
    inc si  
    
    mov dx,13
    mov ah,2
    int 21h  
    mov dx,10
    mov ah,2
    int 21h
    
    loop l3   
            
    mov ah,09h
    mov dx,offset msg3
    int 21h        
            
    mov bx,offset arr3
    mov si,0
    mov cx,3
    
    ans:  
    
    mov ah,02
    mov dl,[bx+si]
    int 21h
    inc si 
    
    loop ans
  

main endp
end main  
ret