global _start

extern system

section .data
cmd db "nasm -f elf64 Sully_X.s && ld Sully_X.o -o Sully_X", 0

section .text

_start:
  mov rax, 2
  mov rdi, filename
  mov rsi, 0102o
  mov rdx, 0666o
  syscall

  mov rdi, cmd
  call system wrt ..plt

  mov rax, 60
  mov rdi, 0
  syscall

filename:
  db "Sully_X.s", 0