org 100h  
.model small
.stack 100h
.data 
array db 5 dup(0)   
str1 db "Enter a number: $"
str2 db "Minimum number is: $"
space db 13,10,"$" 
min db 9

.code
main proc  
    mov ax, @data
    mov ds, ax 
    
    mov bx, offset array
    mov si, 0
               
    mov cx, 5
    lp:
       mov dx, offset str1
       mov ah, 9
       int 21h
       
       mov ah, 1
       int 21h
       
       mov [bx+si], al 
       inc si 
       
       mov dx, offset space
       mov ah, 9
       int 21h
       
    loop lp 
    
    mov si, 0
    mov di, 1
    
    
    mov cx, 5   
    comp:   
        mov al, [bx+si]
        mov bl, [bx+di] 
        cmp al, bl 
        
        jle label
        
           cmp al, min
           
               jle label2
                    mov min, al
               label2: 
        
        label:
        
        inc si
        inc di
        
    loop comp
    
    mov dx, offset space
    mov ah, 9
    int 21h
    
    mov dx, offset str2
    mov ah, 9
    int 21h
    
    mov al, min
    mov ah, 02
    int 21h     
    
    exit: 
    
    
main endp
end main
ret