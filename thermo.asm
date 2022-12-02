; multi-segment executable file template.

data segment
    ; add your data here! 
    on db 00000001
    off db 00000000
    in1 db ?
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
 ;-----------------------
    mov al,on
    out 127,al   
     
     
   check1:  

       in al,125 
       mov in1,al     
       cmp in1,00011110b  
       jge on1 
    loop check1 
      
    
 on1: 
              mov al,on   
              out 127,al
       check2:
              in al,125
              mov in1,al
              cmp in1,00101000b
              jz off1 
        loop check2   
                
 off1:      
               mov al,off  
               out 127,al  
        check3:     
                          in al,125
                          mov in1,al   
                          cmp in1,00011110b
                          jz on1
          loop check3
   
   
   
     
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
