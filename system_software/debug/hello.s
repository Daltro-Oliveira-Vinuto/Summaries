	.file	"hello.c"
	.intel_syntax noprefix
	.text
.Ltext0:
	.file 0 "/home/daltro/Summary/system_software" "src/c/hello.c"
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "src/c/hello.c"
	.loc 1 6 48
	.cfi_startproc
	lea	ecx, 4[esp]
	.cfi_def_cfa 1, 0
	and	esp, -16
	push	DWORD PTR -4[ecx]
	push	ebp
	mov	ebp, esp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	push	ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	sub	esp, 36
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, ecx
	mov	edx, DWORD PTR 4[eax]
	mov	DWORD PTR -28[ebp], edx
	mov	eax, DWORD PTR 8[eax]
	mov	DWORD PTR -32[ebp], eax
	.loc 1 6 48
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR -12[ebp], eax
	xor	eax, eax
	.loc 1 9 7
	mov	DWORD PTR -24[ebp], 5
	.loc 1 10 7
	mov	DWORD PTR -20[ebp], 7
	.loc 1 11 7
	lea	eax, -24[ebp]
	mov	DWORD PTR -16[ebp], eax
	.loc 1 13 5
	mov	eax, DWORD PTR -24[ebp]
	sub	esp, 8
	push	DWORD PTR -20[ebp]
	push	eax
	call	print_hello
	add	esp, 16
	.loc 1 15 12
	mov	eax, 0
	.loc 1 16 1
	mov	edx, DWORD PTR -12[ebp]
	sub	edx, DWORD PTR gs:20
	je	.L3
	call	__stack_chk_fail_local
.L3:
	mov	ecx, DWORD PTR -4[ebp]
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	lea	esp, -4[ecx]
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
.LC0:
	.string	"hello world"
.LC1:
	.string	"%s a=%d b=%d\n"
	.text
	.globl	print_hello
	.type	print_hello, @function
print_hello:
.LFB1:
	.loc 1 18 32
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	sub	esp, 20
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	.loc 1 19 11
	lea	edx, .LC0@GOTOFF[eax]
	mov	DWORD PTR -12[ebp], edx
	.loc 1 21 5
	push	DWORD PTR 12[ebp]
	push	DWORD PTR 8[ebp]
	push	DWORD PTR -12[ebp]
	lea	edx, .LC1@GOTOFF[eax]
	push	edx
	mov	ebx, eax
	call	printf@PLT
	add	esp, 16
	.loc 1 22 1
	nop
	mov	ebx, DWORD PTR -4[ebp]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	print_hello, .-print_hello
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB2:
	.cfi_startproc
	mov	eax, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2:
	.text
.Letext0:
	.file 2 "/usr/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x13e
	.value	0x5
	.byte	0x1
	.byte	0x4
	.long	.Ldebug_abbrev0
	.uleb128 0x6
	.long	.LASF16
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF3
	.uleb128 0x7
	.long	0x2d
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.long	.LASF11
	.uleb128 0x2
	.long	0x2d
	.uleb128 0x9
	.long	.LASF17
	.byte	0x2
	.value	0x164
	.byte	0xc
	.long	0x5c
	.long	0x95
	.uleb128 0xa
	.long	0x95
	.uleb128 0xb
	.byte	0
	.uleb128 0x2
	.long	0x34
	.uleb128 0xc
	.long	.LASF18
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.long	.LFB1
	.long	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0xd6
	.uleb128 0x5
	.string	"a"
	.byte	0x16
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"b"
	.byte	0x1d
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xd
	.long	.LASF15
	.byte	0x1
	.byte	0x13
	.byte	0xb
	.long	0x78
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.long	.LASF19
	.byte	0x1
	.byte	0x6
	.byte	0x5
	.long	0x5c
	.long	.LFB0
	.long	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.long	0x13c
	.uleb128 0x3
	.long	.LASF12
	.byte	0xe
	.long	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x3
	.long	.LASF13
	.byte	0x1a
	.long	0x13c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -28
	.uleb128 0x3
	.long	.LASF14
	.byte	0x28
	.long	0x13c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x4
	.string	"a"
	.byte	0x7
	.byte	0x9
	.long	0x5c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x4
	.string	"b"
	.byte	0x7
	.byte	0xc
	.long	0x5c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x4
	.string	"c"
	.byte	0x8
	.byte	0x9
	.long	0x5c
	.uleb128 0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x2
	.long	0x78
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"long long int"
.LASF5:
	.string	"short unsigned int"
.LASF2:
	.string	"unsigned int"
.LASF4:
	.string	"unsigned char"
.LASF14:
	.string	"envp"
.LASF18:
	.string	"print_hello"
.LASF10:
	.string	"long long unsigned int"
.LASF3:
	.string	"char"
.LASF16:
	.string	"GNU C17 11.4.0 -masm=intel -m32 -mtune=generic -march=i686 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection"
.LASF19:
	.string	"main"
.LASF11:
	.string	"long int"
.LASF6:
	.string	"long unsigned int"
.LASF12:
	.string	"argc"
.LASF17:
	.string	"printf"
.LASF15:
	.string	"hello"
.LASF8:
	.string	"short int"
.LASF7:
	.string	"signed char"
.LASF13:
	.string	"argv"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/daltro/Summary/system_software"
.LASF0:
	.string	"src/c/hello.c"
	.hidden	__stack_chk_fail_local
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
