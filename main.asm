; main.asm
; @Author: Mark Chen
; @Date: 21-Sept-2023

global _start

section .text:

_start:
	mov eax, 0x4			; use the write syscall
	; man 2 write
	; #include <unistd.h>
    ; ssize_t write(int fd, const void buf[.count], size_t count);
	mov ebx, 1				; use stdout as fd	; man 2 write
	mov ecx, message		; use message as buffer
	mov edx, message_length	; supply the length
	int 0x80				; invoke the syscall

	; now successfully exit
	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data:
	message: db "Hello World", 0xA	; \n
	message_length equ $-message

;nasm -f elf32 -o main.o main.asm
;ld -m elf_i386 -o main main.o
;https://www.youtube.com/watch?v=HgEGAaYdABA