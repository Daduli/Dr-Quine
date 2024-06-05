global _start

extern printf

; section .data
; msg db "hello", 10, 0

section .text

_start:
  push rsp
  mov rbp, rsp

  lea rdi, [rel display]
  xor rax, rax
  push rdi
  call printf wrt ..plt
  pop rdi

  mov rax, 60
  mov rdi, 0
  syscall

display:
  db "hello", 10, 0