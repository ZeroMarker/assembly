hello: hello.o
	ld -m elf_i386 -s -o hello hello.o

hello.o: hello.asm
	nasm -f elf hello.asm

clean:
	rm *.o hello
