
section .bss

number resb 1 

section .data  

message db "hello money!",0xa, 0xd
MESSAGE_LEN EQU $-message

section .text 

global _start

_start:

	mov eax, 0x4 
	mov ebx, 0x1 
	mov ecx, message  
	mov edx, MESSAGE_LEN
	int 0x80

	mov eax, 1 
	mov ebx, 0 
	int 0x80 