# access_notice
access_notice create a log say "you have been hacked"


```shell
nasm -f elf32 table_shellcode.asm -o table_shellcode.o
ld -m elf_i386 -o table_shellcode table_shellcode.o
```
