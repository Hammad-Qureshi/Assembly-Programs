    org 100h
    
    .model small
    .stack 100h
    .data
     num1 db 0
     num2 db 0
     promt dw "Enter Value: $"
     equal dw "The Numbers are equal. $"
     great dw "The Number 1 is greater. $"
     less dw "The Number 1 is less. $"
     space db 13,10,"$" 
    .code
    main proc
        
    mov ah,09h
    mov dx,offset promt
    int 21h 
    
    mov ah, 01h
    int 21h
    mov num1,al
    
    mov ah,09h
    mov dx,offset space
    int 21h
    
    mov ah,09h
    mov dx,offset promt
    int 21h
    
    mov ah, 01h
    int 21h
    mov num2,al
    
    mov ah,09h
    mov dx,offset space
    int 21h
    
    mov cl,num1
    mov bl,num2
    CMP cl,bl
    
    JE eq
    JG greater
    JL lesser
    eq:
    mov ah,09h
    mov dx,offset equal
    int 21h
    JMP exit 
    
    greater:
    mov ah,09h
    mov dx,offset great
    int 21h
    JMP exit
    
    lesser:
    mov ah,09h
    mov dx,offset less
    int 21h
    JMP exit       
    
    exit:  
    
    main endp
    end main  
    ret