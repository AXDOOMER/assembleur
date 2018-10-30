; Tab width is 8 spaces

section .data
	msg db 'Hello world 64!',0xa		; 0x0a = \n
	len equ $ - msg

section .text
	global  _start

_start:

	mov rdx, len		; size à écrire
	mov rsi, msg		; le message
	mov rdi, 1		; output standard
	mov rax, 1		; write system call
	syscall

	mov rax, 60		; exit system call
	mov rdi, 0
	syscall
