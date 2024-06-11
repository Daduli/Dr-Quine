global _start

extern system
extern snprintf
extern dprintf

section .bss
count resb 4
filename resb 10
name resb 10
obj resb 10
cmd resb 500

section .text

_start:
  mov rax, 5
  mov [rel count], rax
  lea rdi, [rel filename]
  mov rsi, 10
  lea rdx, [rel arg_filename]
  mov rcx, [rel count]
  mov r8, 's'
  call snprintf wrt ..plt

  lea rdi, [rel name]
  mov rsi, 10
  lea rdx, [rel arg_name]
  mov rcx, [rel count]
  call snprintf wrt ..plt

  lea rdi, [rel obj]
  mov rsi, 10
  lea rdx, [rel arg_filename]
  mov rcx, [rel count]
  mov r8, 'o'
  call snprintf wrt ..plt

  mov rax, 2
  mov rdi, filename
  mov rsi, 0102o
  mov rdx, 0666o
  syscall

  mov rdi, rax
  lea rsi, [rel source]
  mov rdx, 10
  mov rcx, 34
  lea r8, [rel source]
  call dprintf wrt ..plt

  lea rdi, [rel cmd]
  mov rsi, 500
  lea rdx, [rel arg_cmd]
  lea rcx, [rel filename]
  lea r8, [rel name]
  lea r9, [rel obj]
  call snprintf wrt ..plt

  lea rdi, [rel cmd]
  call system wrt ..plt

  mov rax, 60
  mov rdi, 0
  syscall

arg_name:
  db "Sully_%d", 0

arg_filename:
  db "Sully_%d.%c", 0

source:
  db "global _start", 0

arg_cmd:
  db "nasm -f elf64 %1$s -o %3$s && ld -lc -I /lib64/ld-linux-x86-64.so.2 %3$s -o %2$s && ./%2$s", 0