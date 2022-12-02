; multi-segment executable file template.

data segment
   X DW 50
   Y DW 30
   Z DW ?
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

    MOV AX,X
    ADD AX,Y
    
    JP DIVI  
    
   ;_-_-_-_-_-_-_-_-_-_-_-_ DO MULTIPLICATION_-_-_-_-_-_-_-_-_-_-_-_ 
    
                             MOV BL,B.X
                             MOV AL,B.Y
                             MUL BL 
                             MOV Z,AX
     
        JMP ENDCODE
   ;    ^ END
   ;    |   
   ;----
   ;_-_-_-_-_-_-_-_-_-_-_-_    DO DIVISION   _-_-_-_-_-_-_-_-_-_-_-_
DIVI:   
                             MOV BL,B.Y
                             MOV AX,X          
                             DIV BL
                             MOV B.Z,AL

    
   
    
    


ENDCODE:     
            
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
