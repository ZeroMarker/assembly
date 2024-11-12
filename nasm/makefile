# Makefile for x86 Assembly Hello World

AS=nasm
LD=ld

ASFLAGS=-f elf
LDFLAGS=-m elf_i386 -s

SRC = hello

all: $(SRC) run clean

$(SRC): $(SRC).o
	$(LD) $(LDFLAGS) -o $@ $<

$(SRC).o: $(SRC).asm
	$(AS) $(ASFLAGS) -o $@ $<

run: $(SRC)
	./$(SRC)

clean:
	rm $(SRC) $(SRC).o

