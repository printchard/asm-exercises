adder: adder.o
	ld -o adder adder.o

adder.o: adder.s
	nasm -f elf64 -o adder.o adder.s

