    org 100h
    
    .model small
    .stack 100h
    .data
    
    array DB '2','4','6','8','10'
    str1 db 13,10,"Enter Number $"
    str2 db 13,10,": $"
    number db '1'
    space db 13,10," $"
    found db 13,10," Number found $"
    notfound db 13,10," Not found $"
    
       
     
      
    .code
    main proc
    mov ah,09h
    mov dx,offset str1
    int 21h
    
    mov ah,01h
    int 21h
    mov number,al
  
    
    mov bx, offset array
    mov si,2
    JMP BINARYSEARCH
    
    BINARYSEARCH:
        mov cl,[bx+si]
        CMP cl,number
        JG searchbelow
        JL searchabove 
        JE resultsuccess
        searchbelow:
        CMP si,0
        JNE continue
        JE resultfail
            continue:
            dec si
            mov cl,[bx+si]
            CMP cl,number
            JG searchbelow
            JL resultfail
            JE resultsuccess
        searchabove:
        CMP si,4
        JNE continues2
        JE resultfail
            continues2:
            inc si
            mov cl,[bx+si]
            CMP cl,number
            JG resultfail
            JL searchabove
            JE resultsuccess  
        
        resultfail:
            mov cl,'0'
            JMP EXIT
        resultsuccess:
            mov cl,'1'
            JMP EXIT
        EXIT:
        
            CMP cl,'1'
            JE Found1
            JNE NF
            Found1:
            mov ah,09h
            mov dx,offset found
            int 21h
            JMP FINALEXIT 
            NF:
            mov ah,09h
            mov dx,offset notfound
            int 21h
            JMP FINALEXIT
     
        FINALEXIT:
    
    
    main endp
    end main  
    ret