; Tab width is 8 spaces

	extern printf		; imports de libc

section .data
	unarg db 'An arg: %s', 0xa, 0
	lepath db 'The path: %s', 0xa, 0
	nbargs db '# of args: %d', 0xa, 0

section .text
	global main

main:
	sub rsp, 8		; 16 bit stack alignment

	; sauver la valeurs des registres
	mov r12, rdi		; rdi = argc
	mov r13, rsi		; rsi = argv

	; afficher le nombre d'arguments
	mov rax, 0
	mov rdi, nbargs
	mov rsi, r12
	call printf

	; afficher le premier argument (le path)
	mov rbx, 0		; position de l'arg

	mov rax, 0
	mov rdi, lepath
	mov rsi, qword [r13+rbx*8]
	call printf

	; est-ce qu'il y a au moins un arg?
	mov rbx, 1
	cmp rbx, r12		; rbx >= argc ?
	jge EXIT

	; afficher tous les arguments de la ligne de commande
L1:
	mov rax, 0
	mov rdi, unarg
	mov rsi, qword [r13+rbx*8]
	call printf

	inc rbx			; prochain argument

	; condition de la boucle
	cmp rbx, r12
	jl L1

EXIT:
	add rsp, 8		; restaurer le stack
	xor eax, eax
	ret
