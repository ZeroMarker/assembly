section .text
    global print_string, read_number

; 打印字符串
print_string:
    mov eax, 4      ; syscall: write
    mov ebx, 1      ; 文件描述符: stdout
    int 0x80
    ret

; 读取一个整数
read_number:
    mov eax, 3      ; syscall: read
    mov ebx, 0      ; 文件描述符: stdin
    mov edx, 4      ; 读取4个字节
    int 0x80
    ret

