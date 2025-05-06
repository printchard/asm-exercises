section .text
  global add_ints

add_ints:
  add rdi, rsi
  mov rax, rdi
  ret
