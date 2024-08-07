global _start

extern access
extern snprintf
extern dprintf
extern system

section .bss
count resb 4
filename resb 10
name resb 10
obj resb 10
cmd resb 500

section .text

_start:
  push rsp
  mov rbp, rsp

  mov rax, 5
  mov [rel count], rax

  cmp rax, 0
  jne check_file

  mov rax, 60
  mov rdi, 0
  syscall

check_file:
  lea rdi, [rel file_to_check]
  mov rsi, 0x04
  call access wrt ..plt

  cmp rax, 0
  je decrement
  jmp execute

decrement:
  mov rax, [rel count]
  dec rax
  mov [rel count], rax
  jmp execute

execute:
  lea rdi, [rel filename]
  push rdi
  mov rsi, 10
  lea rdx, [rel arg_filename]
  mov rcx, [rel count]
  mov r8, 's'
  call snprintf wrt ..plt
  pop rbx

  lea rdi, [rel name]
  push rdi
  mov rsi, 10
  lea rdx, [rel arg_name]
  mov rcx, [rel count]
  call snprintf wrt ..plt
  pop rbx

  lea rdi, [rel obj]
  push rdi
  mov rsi, 10
  lea rdx, [rel arg_filename]
  mov rcx, [rel count]
  mov r8, 'o'
  call snprintf wrt ..plt
  pop rbx

  lea rdi, [rel cmd]
  push rdi
  mov rsi, 500
  lea rdx, [rel arg_cmd]
  lea rcx, [rel filename]
  lea r8, [rel name]
  lea r9, [rel obj]
  call snprintf wrt ..plt
  pop rbx

  mov rax, 2
  mov rdi, filename
  mov rsi, 0102o
  mov rdx, 0666o
  syscall

  push rax
  mov rdi, rax
  lea rsi, [rel source]
  mov rdx, 10
  mov rcx, 34
  mov r8, [rel count]
  lea r9, [rel source]
  call dprintf wrt ..plt
  pop rdi

  mov rax, 3
  pop rbx
  syscall

  lea rdi, [rel cmd]
  call system wrt ..plt

  mov rax, 60
  mov rdi, 0
  syscall

section .data

arg_name:
  db "Sully_%d", 0

arg_filename:
  db "Sully_%d.%c", 0

arg_cmd:
  db "nasm -f elf64 %1$s -o %3$s && ld -lc -I /lib64/ld-linux-x86-64.so.2 %3$s -o %2$s && ./%2$s", 0

file_to_check:
  db "Sully_5.s", 0

source:
  db "global _start%1$c%1$cextern access%1$cextern snprintf%1$cextern dprintf%1$cextern system%1$c%1$csection .bss%1$ccount resb 4%1$cfilename resb 10%1$cname resb 10%1$cobj resb 10%1$ccmd resb 500%1$c%1$csection .text%1$c%1$c_start:%1$c  push rsp%1$c  mov rbp, rsp%1$c%1$c  mov rax, %3$d%1$c  mov [rel count], rax%1$c%1$c  cmp rax, 0%1$c  jne check_file%1$c%1$c  mov rax, 60%1$c  mov rdi, 0%1$c  syscall%1$c%1$ccheck_file:%1$c  lea rdi, [rel file_to_check]%1$c  mov rsi, 0x04%1$c  call access wrt ..plt%1$c%1$c  cmp rax, 0%1$c  je decrement%1$c  jmp execute%1$c%1$cdecrement:%1$c  mov rax, [rel count]%1$c  dec rax%1$c  mov [rel count], rax%1$c  jmp execute%1$c%1$cexecute:%1$c  lea rdi, [rel filename]%1$c  push rdi%1$c  mov rsi, 10%1$c  lea rdx, [rel arg_filename]%1$c  mov rcx, [rel count]%1$c  mov r8, 's'%1$c  call snprintf wrt ..plt%1$c  pop rbx%1$c%1$c  lea rdi, [rel name]%1$c  push rdi%1$c  mov rsi, 10%1$c  lea rdx, [rel arg_name]%1$c  mov rcx, [rel count]%1$c  call snprintf wrt ..plt%1$c  pop rbx%1$c%1$c  lea rdi, [rel obj]%1$c  push rdi%1$c  mov rsi, 10%1$c  lea rdx, [rel arg_filename]%1$c  mov rcx, [rel count]%1$c  mov r8, 'o'%1$c  call snprintf wrt ..plt%1$c  pop rbx%1$c%1$c  lea rdi, [rel cmd]%1$c  push rdi%1$c  mov rsi, 500%1$c  lea rdx, [rel arg_cmd]%1$c  lea rcx, [rel filename]%1$c  lea r8, [rel name]%1$c  lea r9, [rel obj]%1$c  call snprintf wrt ..plt%1$c  pop rbx%1$c%1$c  mov rax, 2%1$c  mov rdi, filename%1$c  mov rsi, 0102o%1$c  mov rdx, 0666o%1$c  syscall%1$c%1$c  push rax%1$c  mov rdi, rax%1$c  lea rsi, [rel source]%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, [rel count]%1$c  lea r9, [rel source]%1$c  call dprintf wrt ..plt%1$c  pop rdi%1$c%1$c  mov rax, 3%1$c  pop rbx%1$c  syscall%1$c%1$c  lea rdi, [rel cmd]%1$c  call system wrt ..plt%1$c%1$c  mov rax, 60%1$c  mov rdi, 0%1$c  syscall%1$c%1$csection .data%1$c%1$carg_name:%1$c  db %2$cSully_%%d%2$c, 0%1$c%1$carg_filename:%1$c  db %2$cSully_%%d.%%c%2$c, 0%1$c%1$carg_cmd:%1$c  db %2$cnasm -f elf64 %%1$s -o %%3$s && ld -lc -I /lib64/ld-linux-x86-64.so.2 %%3$s -o %%2$s && ./%%2$s%2$c, 0%1$c%1$cfile_to_check:%1$c  db %2$cSully_5.s%2$c, 0%1$c%1$csource:%1$c  db %2$c%4$s%2$c, 0", 0