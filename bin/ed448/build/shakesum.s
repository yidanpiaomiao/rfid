	.file	"shakesum.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"shake256"
.LC1:
	.string	"SHAKE256"
.LC2:
	.string	"shake128"
.LC3:
	.string	"SHAKE128"
.LC4:
	.string	"sha3-224"
.LC5:
	.string	"SHA3-224"
.LC6:
	.string	"sha3-256"
.LC7:
	.string	"SHA3-256"
.LC8:
	.string	"sha3-384"
.LC9:
	.string	"SHA3-384"
.LC10:
	.string	"sha3-512"
.LC11:
	.string	"SHA3-512"
.LC12:
	.string	"%02x"
.LC13:
	.string	"\n"
	.section	.text.unlikely.main,"ax",@progbits
.LCOLDB14:
	.section	.text.startup.main,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	main
	.hidden	main
	.type	main, @function
main:
.LFB70:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	$512, %r12d
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edi, %ebx
	subq	$1248, %rsp
	.cfi_def_cfa_offset 1296
	movq	SHAKE256_params_s@GOTPCREL(%rip), %r14
	movq	%rsp, %rdi
	movq	%rsp, %rbp
	movq	%fs:40, %rax
	movq	%rax, 1240(%rsp)
	xorl	%eax, %eax
	movq	%r14, %rsi
	call	sponge_init@PLT
	cmpl	$1, %ebx
	jle	.L2
	movq	8(%r13), %rbx
	leaq	.LC0(%rip), %rdi
	movl	$9, %ecx
	movq	%rbx, %rsi
	repz cmpsb
	je	.L3
	leaq	.LC1(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
.L3:
	movq	%r14, %rsi
	movq	%rbp, %rdi
	movl	$512, %r12d
	call	sponge_init@PLT
.L2:
	leaq	208(%rsp), %rbx
	.p2align 4,,10
	.p2align 3
.L15:
	xorl	%edi, %edi
	movl	$1024, %edx
	movq	%rbx, %rsi
	call	read@PLT
	testq	%rax, %rax
	jle	.L14
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	sha3_update@PLT
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L14:
	movq	%rbp, %rdi
	movl	%r12d, %edx
	movq	%rbx, %rsi
	call	sha3_output@PLT
	movq	%rbp, %rdi
	call	sponge_destroy@PLT
	leal	-1(%r12), %eax
	leaq	1(%rbx,%rax), %rbp
	.p2align 4,,10
	.p2align 3
.L16:
	movzbl	(%rbx), %edx
	leaq	.LC12(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbp, %rbx
	jne	.L16
	leaq	.LC13(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	1240(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L44
	addq	$1248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L4:
	.cfi_restore_state
	leaq	.LC2(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L5
	leaq	.LC3(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L5
	leaq	.LC4(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	leaq	.LC5(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	leaq	.LC6(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L9
	leaq	.LC7(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L9
	leaq	.LC8(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L11
	leaq	.LC9(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L11
	leaq	.LC10(%rip), %rsi
	movq	%rbx, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L13
	leaq	.LC11(%rip), %rsi
	movq	%rbx, %rdi
	movl	$512, %r12d
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2
.L13:
	movq	SHA3_512_params_s@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	movl	$64, %r12d
	call	sponge_init@PLT
	jmp	.L2
.L5:
	movq	SHAKE128_params_s@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	movl	$512, %r12d
	call	sponge_init@PLT
	jmp	.L2
.L7:
	movq	SHA3_224_params_s@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	movl	$28, %r12d
	call	sponge_init@PLT
	jmp	.L2
.L9:
	movq	SHA3_256_params_s@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	movl	$32, %r12d
	call	sponge_init@PLT
	jmp	.L2
.L11:
	movq	SHA3_384_params_s@GOTPCREL(%rip), %rsi
	movq	%rbp, %rdi
	movl	$48, %r12d
	call	sponge_init@PLT
	jmp	.L2
.L44:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE70:
	.size	main, .-main
	.section	.text.unlikely.main
.LCOLDE14:
	.section	.text.startup.main
.LHOTE14:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
