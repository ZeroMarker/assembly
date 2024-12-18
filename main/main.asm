section .data
    msg db "Enter a number: ", 0
    msg_len equ $ - msg

section .bss
    num resb 4  ; 用于存储用户输入

section .text
    global _start
    extern print_string, read_number

_start:
    ; 打印提示
    mov edx, msg_len
    mov ecx, msg
    call print_string

    ; 读取数字
    lea ecx, [num]
    call read_number

    ; 退出程序
    mov eax, 60     ; syscall: exit
    xor edi, edi    ; exit code: 0
    syscall

