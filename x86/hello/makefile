hello: hello.o
	ld hello.o -o hello

hello.o: hello.s
	nasm -f elf64 hello.s -o hello.o
