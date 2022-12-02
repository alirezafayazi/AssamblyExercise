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
             
 mov cx,7
  
;-----------------          
 go:  
mov ax,0b 
out 9,ax 

mov bl,10
;----------------- 
go2: 
        
 dec bl
 cmp bl,0
 jz go3
  jmp go2
;-----------------        
go3:

mov ax,1b
out 9,ax  
dec cx
cmp cx,0
jz on

 
 mov bl,2
;----------------- 
turn: 
        
 dec bl
 cmp bl,0
 jz go
  jmp turn
;-----------------    
 

on: 
mov ax,00000101b
out 9,ax
            
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
