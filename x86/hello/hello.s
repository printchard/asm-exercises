section .data
  msg db "Hello World!", 0xA, "From Assembly!", 0xA
  len equ $ - msg

section .text
  global _start

_start:
  mov rax, 1          ; syscall: sys_write
  mov rdi, 1          ; file descriptor: stdout
  mov rsi, msg        ; pointer to message
  mov rdx, len        ; message length
  syscall

  mov rax, 60
  mov rdi, 0          ; syscall: sys_exit
  syscall
