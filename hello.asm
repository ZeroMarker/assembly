; intel format
; hello.asm

section .text
	global _start	; ld declare

_start:			; ld start
    mov edx, len	; message length
    mov ecx, msg	; message to write
    mov ebx, 1		; file descriptor 	stdout
    mov eax, 4		; system call number	sys_write
    int 0x80		; call kernel
    
    
    mov eax, 1		; system call number	sys_exit
    int 0x80		; call kernel


section .data 
    msg db "Hello, the Assembly World!", 0xa	; message
    len equ $ - msg				; string len



; nasm -f elf hello.asm
; ld -s -o hello hello.o
; ld -m elf_i386 -s -o hello hello.o


