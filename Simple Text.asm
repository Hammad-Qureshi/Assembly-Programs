org 100h
.model large
.stack 100h
.data
name1 db 'Name: Hammad Qureshi $'
roll db 'Roll No: F2020266337 $'
section db 'Section: v5 $'
.code

main proc
    
mov ah,09h
mov dx,offset name1
int 21h

mov dx,13
mov ah,02
int 21h
mov dx,10
mov ah,02
int 21h  

mov ah,09h
mov dx,offset roll
int 21h

mov dx,13
mov ah,02
int 21h
mov dx,10
mov ah,02
int 21h

mov ah,09h
mov dx,offset section
int 21h

main endp
end main
ret