org 100h
.model large
.stack 100h
.data 

msg1 db 'Enter 1st num: $'
msg2 db 'Enter 2nd num: $'
ans db 'Sum is: $'

.code

main proc
    
mov ah,09h
mov dx,offset msg1
int 21h 

mov ah,01
int 21h

mov bl,al 

mov dx,13
mov ah,02
int 21h
mov dx,10
mov ah,02
int 21h  

mov ah,09h
mov dx,offset msg2
int 21h
  
mov ah,01
int 21h  
 
mov bh,al 

mov dx,13
mov ah,02
int 21h
mov dx,10
mov ah,02
int 21h  

mov ah,09h
mov dx,offset ans
int 21h

add bh,bl 

sub bh,48 

mov ah,2 
mov dl,bh
int 21h

main endp
end main
ret