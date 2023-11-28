# as -o hello.o hello.s
# ld -s -o hello hello.o
SRC = hello

all: src link run clean
src:
	as -o $(SRC).o $(SRC).s
link:
	ld -s -o $(SRC) $(SRC).o
run:
	./$(SRC)
clean:
	rm $(SRC).o $(SRC)

# AS = as
# LD = ld

# ASFLAGS = --32
# LDFLAGS = -m elf_i386 -s

# all: hello

# hello: hello.o
# 	$(LD) $(LDFLAGS) -o $@ $<

# hello.o: hello.s
# 	$(AS) $(ASFLAGS) -o $@ $<

# clean:
# 	rm -f hello hello.o
