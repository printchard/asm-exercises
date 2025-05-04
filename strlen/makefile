strlen: strlen.o
	ld -o strlen strlen.o

strlen.o: strlen.s
	nasm -f elf64 -o strlen.o strlen.s
