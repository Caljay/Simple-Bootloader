bits 16

;offset all addresses by 0x7c00
org 0x7c00

; define a label X that is a memory offset of the start of our code
;points to char  B
x:
    db "A"

;move offset of x to bx

mov bx, x

;add ox7c00 to bx - BIOS loads bootloader to this location
;add bx, 0x7c00

;move cotents of bx to al
mov al, [bx]

;prepare interrupt to print a char in TTY mode and issue

mov ah, 0x0e
int 0x10
times 510 - ($-$$) db 0
dw 0xaa55
