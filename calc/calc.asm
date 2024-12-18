section .data
    ; 菜单和提示消息
    menu db "Simple Calculator", 0xA
         db "1. Addition", 0xA
         db "2. Subtraction", 0xA
         db "3. Exit", 0xA
         db "Enter your choice: ", 0
    menu_len equ $ - menu  ; 计算菜单长度

    input1_msg db "Enter the first number: ", 0
    input1_len equ $ - input1_msg

    input2_msg db "Enter the second number: ", 0
    input2_len equ $ - input2_msg

    result_msg db "Result: ", 0
    result_len equ $ - result_msg

    newline db 0xA, 0
    newline_len equ $ - newline

section .bss
    res resb 4      ; 用于存储结果
    choice resb 1   ; 存储用户选择
    num1 resb 1     ; 第一个数字
    num2 resb 1     ; 第二个数字

section .text
    global _start

_start:
    ; 打印菜单
    mov edx, menu_len  ; 菜单长度
    mov ecx, menu      ; 菜单字符串
    call print_string

    ; 读取用户选择
    call read_char
    mov [choice], al

    ; 判断选择
    cmp byte [choice], '1'
    je addition
    cmp byte [choice], '2'
    je subtraction
    cmp byte [choice], '3'
    je exit_program

    ; 无效选择，返回菜单
    jmp _start

addition:
    ; 输入第一个数字
    mov edx, input1_len
    mov ecx, input1_msg
    call print_string
    call read_char
    sub al, '0'  ; 将字符转换为数字
    mov [num1], al

    ; 输入第二个数字
    mov edx, input2_len
    mov ecx, input2_msg
    call print_string
    call read_char
    sub al, '0'
    mov [num2], al

    ; 执行加法
    mov al, [num1]
    add al, [num2]
    mov [res], al

    ; 打印结果
    mov edx, result_len
    mov ecx, result_msg
    call print_string
    call print_result
    jmp _start

subtraction:
    ; 输入第一个数字
    mov edx, input1_len
    mov ecx, input1_msg
    call print_string
    call read_char
    sub al, '0'
    mov [num1], al

    ; 输入第二个数字
    mov edx, input2_len
    mov ecx, input2_msg
    call print_string
    call read_char
    sub al, '0'
    mov [num2], al

    ; 执行减法
    mov al, [num1]
    sub al, [num2]
    mov [res], al

    ; 打印结果
    mov edx, result_len
    mov ecx, result_msg
    call print_string
    call print_result
    jmp _start

exit_program:
    ; 系统调用退出
    mov eax, 60     ; syscall: exit
    xor edi, edi    ; exit code: 0
    syscall

; Helper Functions
print_string:
    mov eax, 4      ; syscall: write
    mov ebx, 1      ; 文件描述符: stdout
    int 0x80
    ret

read_char:
    mov eax, 3      ; syscall: read
    mov ebx, 0      ; 文件描述符: stdin
    lea ecx, [choice]
    mov edx, 1      ; 读取1个字符
    int 0x80
    mov al, [choice]
    ret

print_result:
    mov eax, [res]
    add eax, '0'    ; 将数字转换为字符
    mov [res], eax
    mov edx, 1      ; 输出1个字符
    lea ecx, [res]
    call print_string
    mov edx, newline_len
    lea ecx, [newline]
    call print_string
    ret

