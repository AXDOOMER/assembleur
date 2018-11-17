; Tab width is 8 spaces

	extern printf		; imports de libc
	extern scanf
	extern exit

section .data
	entrez db 'Entrez un nombre: ', 0
	votren db 'Votre nombre est %d', 0xa, 0
	inputfmt db "%d", 0
;	number dq 0

section .bss			; statically-allocated variables
	number resb 4


section .text
	global main

main:
	sub  rsp, 8		; aligner le stack avant les appels de fonctions pour éviter des segfaults
				; https://stackoverflow.com/a/38335743
	mov rax, 0
	mov rdi, entrez
	call printf

	mov rax, 0
	mov rdi, inputfmt
	mov rsi, number
	call scanf

	mov rax, 0
	mov rdi, votren
	mov rsi, [number]
	call printf

	add rsp, 8		; restaurer le stack
	ret
