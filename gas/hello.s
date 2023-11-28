# AT&T format
# hello.s
.data	# data part declare
	msg : .string "Hello Assembly World!\n"
	len = . - msg
.text	# code part declare
.global _start	# entrence function

_start:	# print a string
	movl $len, %edx	# arg3: len of string
	movl $msg, %ecx # arg2: string
	movl $1, %ebx	# arg1: file descriptor
	movl $4, %eax	# sys_write
	int  $0x80	# call kernel function
			# exit prog
	movl $0, %ebx	# arg1 exit code
	movl $1, %eax	# sys_exit
	int  $0x80	# call kernel function 


# as -o hello.o hello.s
# ld -s -o hello hello.o

