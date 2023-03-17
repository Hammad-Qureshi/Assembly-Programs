org 100h
.model large
.stack 100h
.data 

msg1 db 'Enter any char: $'
msg2 db 'Capital char is: $'

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
  
sub bl,32

mov ah,02
mov dl,bl
int 21h

main endp
end main
ret