; multi-segment executable file template.

data segment
    ; add your data here!
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

    ; add your code here  
    mov al,'a'
    out 130,al
    mov al,'l'
    out 130,al
    mov al,'i'
    out 130,al
    mov al,'r'
    out 130,al
    mov al,'e'
    out 130,al
    mov al,'z'
    out 130,al
    mov al,'a'
    out 130,al
    mov al,' '
    out 130,al
    mov al,'f'
    out 130,al
    mov al,'a'
    out 130,al
    mov al,'y'
    out 130,al
    mov al,'a'
    out 130,al 
    mov al,'z'
    out 130,al
    mov al,'i'
    out 130,al
    
            
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
