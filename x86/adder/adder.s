section .bss
  input1 resb 32
  input2 resb 32
  result resb 32

section .text
  global _start

_start:
  mov rax, 0
  mov rdi, 0
  mov rsi, input1
  mov rdx, 32
  syscall

  mov rsi, input1
  call atoi
  mov r12, rax

  mov rax, 0
  mov rdi, 0
  mov rsi, input2
  mov rdx, 32
  syscall

  mov rsi, input2
  call atoi
  mov r13, rax

  add r12, r13

  mov rdi, result
  mov rax, r12
  call itoa

  mov rax, 1
  mov rdi, 1
  mov rsi, result
  mov rdx, rbx
  syscall

  mov rax, 60
  mov rdi, 0
  syscall

atoi:
  xor rax, rax

.next_char:
  mov bl, byte [rsi]
  cmp bl, 10
  je .done
  cmp bl, 0
  je .done

  sub bl, '0'
  imul rax, rax, 10
  add rax, rbx

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
