section     .text
global      _start                              ;déclaration de la fonction _start pour le linker

_start:                                         ;point d'entré de la fonction

    mov     edx,len                             ;longeur du message déclarée plus bas dans .data
    mov     ecx,msg                             ;message à écrire, déclaré plus bas dans .data
    mov     ebx,1                               ;descripteur de fichier (stdout)
    mov     eax,4                               ;numéro de l'appel système (sys_write)
    int     0x80                                ;appel au noyau

    mov     eax,1                               ;numéro de l'appel système (sys_exit)
    int     0x80                                ;appel au noyau

section     .data

                                                ;https://www.nasm.us/doc/nasmdoc3.html#section-3.2.4
msg     db  'Hello, world!',0xa                 ;le string qui est notre message
len     equ $ - msg                             ;la longeur de notre string

