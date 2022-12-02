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
    
    
 startcode: 
;-------------------------   
  mov cx,150
go:    
mov ax,100001100001b
out 4,ax 
dec cx
 loop go  

;------------------------- 
  mov cx,100
go2:
mov ax,010001010001b
out 4,ax  
dec cx
 loop go2 
 
;------------------------- 
    mov cx,150
 go3:
mov ax,001100001100b
out 4,ax 
dec cx  
loop go3
;------------------------- 
     mov cx,100
 go4:
mov ax,001010001010b
out 4,ax 
dec cx  
loop go4
;-------------------------


 jmp startcode




    
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
