; multi-segment executable file template.

data segment
    
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

               MOV CL,SEL 
               MUL AL,10 
               MOV SEL,AL
               MOV AX,SEL
               MUL CL
               
               DIV 
               MOV AL,10
               MUL CL
               MOV B.FAR,AX 
       
            
       
       MOV AX,FAR
       MOV BL,18
       DIV BL
       MOV B.SEL,AL
            
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
