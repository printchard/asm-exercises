main: main.o add.o
	gcc -o main main.o add.o

main.o: main.c
	gcc -c main.c

add.o: add.s
	nasm -f elf64 -o add.o add.s
