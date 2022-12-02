; multi-segment executable file template.

data segment
    X DB 25H,13H,17H,40H,39H
    Y DB 10H,15H,10H,58H,30H
    Z DB  5 DUP(?)
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax  
    
    ;SUM FIRST  
    
    MOV AL,X
    ADD AL,Y 
    DAA
    MOV Z,AL 
    
    
    ;LOAD EFFECTIVE ADDRESS

    LEA DI,X
    LEA SI,Z
    LEA BX,Y 
    
;-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
MOV CX,5   
SUM:
     INC DI
     INC SI
     INC BX
     MOV AL,[DI]
     ADD AL,[BX]
     DAA
     MOV [SI],AL
     LOOP SUM      

    

   
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
