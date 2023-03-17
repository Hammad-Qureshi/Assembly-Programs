    org 100h
    
    .model small
    .stack 100h
    .data
    
    array DB '3','2','9','5','0'
    darray db 13,10,"Default Array: $"
    sarray db 13,10,"Sorted Array: $"
    number db '0'
    space db 13,10," $"
    
    .code
    main proc
    mov ah,09h
    mov dx,offset darray
    int 21h
    
    mov bp, offset array
         mov si,0
         mov cx,5
         printt:
            mov ah,02h
            mov dl,[bp+si]
            int 21h
            inc si
            
            loop printt
 
    mov bx, offset array
    mov dl,0
    JMP bubblesort
    bubblesort:
    CMP dl,5
    JNE continue
    JE  exit
        continue:
        mov si,0
        mov di,1
        JMP innerloop
        innerloop:
        CMP di,5
        JNE sort
        JE  seconditer
            sort: 
            mov cl,[bx+si]
            mov ch,[bx+di]
            CMP cl,ch
            JG shift
            JL moveahead
            shift:
                xchg cl,ch
                mov [bx+si],cl
                mov [bx+di],ch
                JMP moveahead
            moveahead:
                inc si
                inc di
                JMP innerloop
            seconditer:
                inc dl
                JMP bubblesort
        
        
         exit:
         mov ah,09h
         mov dx,offset space
         int 21h
         mov ah,09h
         mov dx,offset sarray
         int 21h
         mov bp, offset array
         mov si,0
         mov cx,5
         print:
            mov ah,02h
            mov dl,[bp+si]
            int 21h
            inc si
            
            loop print
    main endp
    end main  
    ret