# Assembly Language

- AT&T format
- Intel format

## variable

[variable-name] define-directive initial-value 

command	byte
db	1
dw	2
dd	4
dq	8
dt	10

choice db 'y'
number dw 12345
neg_number dw -12345
big_number dq 123456789
real_number1 dd 1.234
real_number2 dq 123.456

## program structure

section .data
;declare data and constant

section .bss
;declare variable

section .text
	global _start
_start:
;code

## complie && link

nasm -f elf hello.asm

ld -m elf_i386 -s -o hello hello.o

## register

## system call

## address


