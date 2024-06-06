%define DEFINE_START global _start
%define START _start:
%define DATA "%%define DEFINE_START global _start%1$c%%define START _start:%1$c%%define DATA %2$c%3$s%2$c, 0%1$c%1$c%%macro code 1%1$cSTART%1$cmov rax, 2%1$cmov rdi, filename%1$cmov rsi, 0102o%1$cmov rdx, 0666o%1$csyscall%1$c%1$cmov rdi, rax%1$clea rsi, [rel source]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel source]%1$ccall dprintf wrt ..plt%1$c%1$cmov rax, 60%1$cmov rdi, %%1%1$csyscall%1$c%%endmacro%1$c%1$c;Main code%1$cDEFINE_START%1$cextern dprintf%1$c%1$csection .text%1$c%1$ccode 0%1$c%1$cfilename:%1$c  db %2$cGrace_kid.s%2$c, 0%1$c%1$csource:%1$c  db DATA", 0

%macro code 1
START
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

mov rax, 60
mov rdi, %1
syscall
%endmacro

;Main code
DEFINE_START
extern dprintf

section .text

code 0

filename:
  db "Grace_kid.s", 0

source:
  db DATA