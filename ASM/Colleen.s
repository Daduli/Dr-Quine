global _start
extern printf

section .text

;Main function
_start:
  push rsp
  mov rbp, rsp

  lea rdi, [rel display]
  mov rsi, 10
  lea rdx, [rel display]
  mov rcx, 34
  xor rax, rax
  push rdi
  call printf wrt ..plt
  pop rdi

  ;Exit function
  mov rax, 60
  mov rdi, 0
  syscall

display:
  db "global _start%1$cextern printf%1$c%1$csection .text%1$c%1$c;Main function%1$c_start:%1$c  push rsp%1$c  mov rbp, rsp%1$c%1$c  lea rdi, [rel display]%1$c  mov rsi, 10%1$c  lea rdx, [rel display]%1$c  mov rcx, 34%1$c  xor rax, rax%1$c  push rdi%1$c  call printf wrt ..plt%1$c  pop rdi%1$c%1$c  ;Exit function%1$c  mov rax, 60%1$c  mov rdi, 0%1$c  syscall%1$c%1$cdisplay:%1$c  db %3$c%2$s%3$c, 0%1$c", 0
