
section .stringdata
mystr1: db "Hello, this is string 1", 13, 10, '$'

section .extra_code
org 0x200
bits 16
more:
   mov si, asciz1
   mov ah, 0x0E
   xor bx, bx
.print:
   lodsb
   test al, al
   jz .end
   int  0x10
   jmp short .print
.end:

   xor ax, ax
   int 0x16

   mov ax, 0x4c00
   int 0x21

section .appspecific
asciz1: db "This is string 2", 0

section .code
org 0x100
bits 16

start:
   mov dx, mystr1
   mov ah, 9
   int 0x21

   xor ax, ax
   int 0x16

   jmp more

