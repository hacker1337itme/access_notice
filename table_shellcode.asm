section .data
    filename db 'hacked.log', 0
    message  db '+-----------------------+', 0xA
             db '| you have been hacked |', 0xA
             db '+-----------------------+', 0xA
    msglen   equ $ - message

section .text
    global _start

_start:
    ; sys_open(filename, O_CREAT | O_WRONLY | O_TRUNC, 0644)
    xor eax, eax
    mov al, 5              ; sys_open
    mov ebx, filename
    mov ecx, 0x241         ; O_CREAT | O_WRONLY | O_TRUNC
    mov edx, 0o644         ; file permission
    int 0x80
    mov ebx, eax           ; save file descriptor

    ; sys_write(fd, message, msglen)
    xor eax, eax
    mov al, 4              ; sys_write
    mov ecx, message
    mov edx, msglen
    int 0x80

    ; sys_close(fd)
    mov al, 6
    int 0x80

    ; sys_exit(0)
    xor eax, eax
    mov al, 1
    xor ebx, ebx
    int 0x80
