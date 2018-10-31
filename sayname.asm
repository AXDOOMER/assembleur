; Tab width is 8 spaces

section .data
	msgentnom db 'Entez votre nom: '
	lenentnom equ $ - msgentnom

	msgbonjour db 'Bonjour, '
	lenbonjour equ $ - msgbonjour

	msgexclamation db '!', 0xa
	lenexclamation equ $ - msgexclamation

%define bufsize 50		; directive qui assigne une constante

section .bss
	textbuf resb bufsize

section .text
	global  _start

_start:
	mov rdx, lenentnom	; size à écrire
	mov rsi, msgentnom
	mov rdi, 1		; output standard (stdin file descriptor)
	mov rax, 1		; write system call
	syscall

	mov rax, 0		; read system call, le fd est déjà stdin donc c'est bon
	mov rsi, textbuf
	mov rdx, bufsize
	syscall

	mov r8, rax		; je sauve la longeur de ce qui a été lu

	mov rdx, lenbonjour	; size à écrire
	mov rsi, msgbonjour
	mov rax, 1		; write system call
	syscall

	sub r8, 1		; je fais -1 à la longeur de ce qui a été lu car y'a un \n dedans

	mov rdx, r8		; size à écrire, mais avec le -1
	mov rsi, textbuf	; truc à écrire
	mov rax, 1
	syscall

	mov rdx, lenexclamation
	mov rsi, msgexclamation
	mov rax, 1
	syscall

	je _exit		; jump à la fonction exit

_exit:
	mov rax, 60		; exit system call
	mov rdi, 0
	syscall
