%define DEFINE_START global _start
%define START _start:
%define DATA

%macro code 1
mov rax, 2
mov rdi, filetoopen
mov rsi, 0102o
mov rdx, 0666o
syscall

mov rax, 60
mov rdi, %1
syscall
%endmacro

DEFINE_START

section .data

textoutput db "Hello world!", 10
lentext equ $ - textoutput
filetoopen db "hi.txt", 0

section .text

START
  code 0