# 定义变量
ASM = nasm
ASM_FLAGS = -f elf64
LD = ld
LD_FLAGS =

# 源文件和目标文件
SRCS = main.asm utils.asm
OBJS = main.o utils.o
OUTPUT = program

# 默认目标
all: $(OUTPUT)

# 链接生成可执行文件
$(OUTPUT): $(OBJS)
	$(LD) $(LD_FLAGS) -o $@ $^

# 汇编源文件生成目标文件
%.o: %.asm
	$(ASM) $(ASM_FLAGS) -o $@ $<

# 清理生成文件
clean:
	rm -f $(OBJS) $(OUTPUT)

# 伪目标，不生成文件
.PHONY: all clean

