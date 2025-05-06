section .bss
  input resb 100
  output resb 32

section .text
  global _start

_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, input
  mov rdx, 100
  syscall
  
  mov rsi, input
  call strlen
  mov r8, rax

  mov rdi, output
  mov rax, r8
  call itoa

  mov rax, 1
  mov rdi, 1
  mov rsi, output
  mov rdx, rbx
  syscall

  mov rax, 60
  mov rdi, 0
  syscall

strlen:
  xor rax, rax

.next_char:
  mov bl, byte [rsi]
  cmp bl, 10
  je .done
  cmp bl, 0
  je .done

  inc rax
  inc rsi
  jmp .next_char

.done:
  ret

itoa:
  mov rcx, 10
  xor rbx, rbx
  mov rsi, rdi

.reverse:
  xor rdx, rdx
  div rcx
  add dl, '0'
  push rdx
  inc rbx
  test rax, rax
  jnz .reverse

.write_digits:
  pop rax
  mov byte [rsi], al
  inc rsi
  dec rbx
  jnz .write_digits

  mov byte [rsi], 10
  inc rsi
  sub rsi, rdi
  mov rbx, rsi
  ret
