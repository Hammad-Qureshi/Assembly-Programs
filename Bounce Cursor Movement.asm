    org 100h
    
    .model small
    .stack 100h
    .data
    character db 'O' 
    space db ' '
    row db 10
    col db 10  
    input db ' '
    W db 'W'
    A db 'A'
    S db 'S'
    D db 'D'
    PROMT db 13,10, "Use W for UP, S for DOWN, A for LEFT, D for RIGHT. $"
    PROMT1 db 13,10, "Use E for Top Right, Q for Top Left, Z for Bottom Left, C for Bottom Right. $"
    PROMT2 db 13,10, "PRESS ESC TO EXIT. $"
    PROMT3 db 13,10, "USE CAPTIAL W,A,S,D,E,Q,Z,C ONLY. $" 
      
    .code
    main proc
    mov ah,09h
    mov dx,offset PROMT
    int 21h
    
    mov ah,09h
    mov dx,offset PROMT1
    int 21h
    
    mov ah,09h
    mov dx,offset PROMT2
    int 21h
    
    mov ah,09h
    mov dx,offset PROMT3
    int 21h
    
    mov ah,02
    mov dl,6
    mov dh,20
    int 10h
    
    
    
    JMP game
    game:
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           
           mov ah,08
           int 21h
           mov input,al
           
           mov ah,02
           mov dl,space
           int 21h
           CMP input,01Bh
           JE exit
           JNE continue
           continue:
           
           CMP input,'W'
           JE moveup
           JNE checkdown
           moveup:
           CMP row,0
           JNZ mu
           JZ dmu
           mu:
           dec row
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           dmu:
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           
           checkdown:
           CMP input,'S'
           JE movedown
           JNE checkright
           movedown:
           CMP row,23
           JNE md
           JE dmd
           md:
           inc row
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           dmd:
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           
           checkright:
           CMP input, 'D'
           JE moveright
           JNE checkleft
           moveright:
           CMP col,78
           JNE mr
           JE dmr
           mr:
           inc col
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           dmr:
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           
           checkleft:
           CMP input,'A'
           JE moveleft
           JNE checktopright
           moveleft:
           CMP col,0
           JNZ ml
           JZ dml
           ml: 
           dec col 
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           dml:
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           checktopright:
           CMP input, 'E'
           JE movetopright
           JNE checktopleft
           movetopright:
           inc col
           dec row
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           checktopleft:
           CMP input,'Q'
           JE movetopleft
           JNE checkbottomleft 
           movetopleft:
           dec row
           dec col
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           checkbottomleft:
           CMP input, 'Z'
           JE movebottomleft
           JNE checkbottomright
           movebottomleft:
           dec col
           inc row
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
           checkbottomright:
           CMP input,'C'
           JE movebottomright
           movebottomright:
           JNE game
           inc row
           inc col
           mov ah,02
           mov dh,row
           mov dl,col 
           int 10h
           mov ah,02
           mov dl,character
           int 21h
           JMP game
            
            
            
           
           
    exit:
      
    
    main endp
    end main  
    ret