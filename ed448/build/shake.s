	.file	"shake.c"
	.section	.text.unlikely.keccakf,"ax",@progbits
.LCOLDB0:
	.section	.text.keccakf,"ax",@progbits
.LHOTB0:
	.p2align 4,,15
	.type	keccakf, @function
keccakf:
.LFB79:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$112, %rsp
	.cfi_def_cfa_offset 168
	cmpb	$23, %sil
	movq	%rdi, 104(%rsp)
	movb	%sil, 39(%rsp)
	ja	.L6
	movq	40(%rdi), %rdx
	movq	%rdi, %rax
	movq	80(%rdi), %r12
	movq	128(%rdi), %r15
	movq	(%rdi), %rcx
	movq	56(%rax), %r13
	movq	136(%rax), %rbp
	movq	%rdx, -80(%rsp)
	movq	120(%rdi), %rdx
	movq	144(%rax), %rbx
	movq	%r13, %r14
	movq	%r12, %r13
	movq	%r15, %r12
	movq	%rdx, -16(%rsp)
	movq	160(%rdi), %rdx
	movq	%rdx, (%rsp)
	movq	8(%rdi), %rdx
	movq	%rdx, -112(%rsp)
	movq	48(%rdi), %rdx
	movq	%rdx, -72(%rsp)
	movq	88(%rdi), %rdx
	movq	%rdx, -48(%rsp)
	movq	168(%rdi), %rdx
	movq	16(%rdi), %rdi
	movq	%rdx, %r8
	movq	%rdi, -104(%rsp)
	movq	96(%rax), %rdi
	movq	%rdi, -40(%rsp)
	movq	176(%rax), %rdi
	movq	%rdi, 8(%rsp)
	movq	24(%rax), %rdi
	movq	%rdi, -96(%rsp)
	movq	64(%rax), %rdi
	movq	%rdi, -64(%rsp)
	movq	104(%rax), %rdi
	movq	%rdi, -32(%rsp)
	movq	184(%rax), %rdi
	movq	%rdi, 16(%rsp)
	movq	32(%rax), %rdi
	movq	%rdi, -88(%rsp)
	movq	72(%rax), %rdi
	movq	%rdi, -56(%rsp)
	movq	112(%rax), %rdi
	movq	%rdi, -24(%rsp)
	movq	152(%rax), %rdi
	movq	192(%rax), %rax
	movq	%rdi, -8(%rsp)
	movq	%rax, %r11
	.p2align 4,,10
	.p2align 3
.L3:
	movq	-104(%rsp), %rdx
	movq	-88(%rsp), %rdi
	xorq	-56(%rsp), %rdi
	movq	-112(%rsp), %rsi
	xorq	-72(%rsp), %rsi
	movq	-80(%rsp), %r15
	xorq	%r14, %rdx
	xorq	-40(%rsp), %rdx
	xorq	-48(%rsp), %rsi
	movq	%rdi, %r9
	xorq	-24(%rsp), %r9
	xorq	%rcx, %r15
	xorq	-8(%rsp), %r9
	xorq	%r13, %r15
	xorq	-16(%rsp), %r15
	xorq	%rbp, %rdx
	xorq	%r12, %rsi
	xorq	(%rsp), %r15
	movq	%rdx, %rax
	xorq	8(%rsp), %rax
	xorq	%r8, %rsi
	rorx	$63, %rsi, %rdi
	xorq	%r11, %r9
	xorq	%r9, %rdi
	movq	%rax, %r10
	movq	-96(%rsp), %rax
	xorq	-64(%rsp), %rax
	xorq	-32(%rsp), %rax
	xorq	%rdi, %rcx
	xorq	%rdi, %r13
	movq	%rcx, -120(%rsp)
	rorx	$63, %r10, %rcx
	rorx	$61, %r13, %r13
	xorq	%r15, %rcx
	rorx	$63, %r15, %r15
	xorq	%rbx, %rax
	xorq	16(%rsp), %rax
	rorx	$63, %rax, %rdx
	xorq	%r15, %rax
	xorq	%rdx, %rsi
	rorx	$63, %r9, %rdx
	movq	-112(%rsp), %r9
	xorq	%rsi, %r14
	xorq	%r10, %rdx
	xorq	%rsi, %rbp
	xorq	%rdx, %rbx
	xorq	%rcx, %r9
	rorx	$43, %rbx, %rbx
	rorx	$63, %r9, %r10
	rorx	$58, %r14, %r9
	movq	-48(%rsp), %r14
	movq	%r10, 40(%rsp)
	movq	%r9, 48(%rsp)
	rorx	$49, %rbp, %r10
	movq	-80(%rsp), %rbp
	movq	%r10, 64(%rsp)
	xorq	%rcx, %r14
	rorx	$54, %r14, %r14
	movq	%r14, 56(%rsp)
	movq	-96(%rsp), %r14
	xorq	%rdx, %r14
	xorq	%rcx, %r12
	xorq	%rdi, %rbp
	rorx	$36, %r14, %r9
	movq	-64(%rsp), %r14
	xorq	%rcx, %r8
	xorq	%rax, %r11
	rorx	$19, %r12, %r15
	rorx	$28, %rbp, %rbp
	rorx	$62, %r8, %r8
	movq	%rbp, 72(%rsp)
	movq	%r15, -48(%rsp)
	xorq	%rdx, %r14
	movq	%r8, 88(%rsp)
	movq	-88(%rsp), %r8
	rorx	$9, %r14, %r14
	movq	%r14, 80(%rsp)
	rorx	$50, %r11, %r14
	movq	-16(%rsp), %r11
	movq	16(%rsp), %r15
	movq	-40(%rsp), %r10
	xorq	%rax, %r8
	xorq	-72(%rsp), %rcx
	movq	-8(%rsp), %rbp
	rorx	$37, %r8, %r8
	xorq	%rdi, %r11
	xorq	(%rsp), %rdi
	xorq	%rdx, %r15
	rorx	$23, %r11, %r11
	xorq	%rsi, %r10
	movq	%r11, 96(%rsp)
	rorx	$8, %r15, %r11
	movq	-104(%rsp), %r15
	rorx	$21, %r10, %r10
	rorx	$20, %rcx, %rcx
	xorq	%rax, %rbp
	movq	%r10, %r12
	xorq	-32(%rsp), %rdx
	rorx	$56, %rbp, %rbp
	xorq	%rsi, %r15
	movq	%r12, 24(%rsp)
	xorq	8(%rsp), %rsi
	rorx	$2, %r15, %r15
	rorx	$46, %rdi, %rdi
	movq	%r15, 16(%rsp)
	movq	-24(%rsp), %r15
	rorx	$39, %rdx, %rdx
	rorx	$3, %rsi, %rsi
	xorq	%rax, %r15
	xorq	-56(%rsp), %rax
	rorx	$25, %r15, %r10
	movq	%r12, %r15
	notq	%r15
	andq	%rbx, %r15
	xorq	%rcx, %r15
	rorx	$44, %rax, %rax
	movq	%r15, -112(%rsp)
	movq	%rbx, %r15
	notq	%r15
	andq	%r14, %r15
	movq	%r15, %r12
	xorq	24(%rsp), %r12
	movq	%r12, -104(%rsp)
	movq	%r14, %r12
	notq	%r12
	movq	%r12, %r15
	andq	-120(%rsp), %r15
	movq	%r15, %r12
	movq	-48(%rsp), %r15
	xorq	%rbx, %r12
	movq	-120(%rsp), %rbx
	movq	%r12, -96(%rsp)
	notq	%rbx
	andq	%rcx, %rbx
	notq	%rcx
	xorq	%r14, %rbx
	movq	%rbx, -88(%rsp)
	movq	%rax, %rbx
	notq	%rbx
	andq	%r13, %rbx
	xorq	%r9, %rbx
	movq	%rbx, -80(%rsp)
	movq	%r13, %rbx
	notq	%rbx
	andq	%r15, %rbx
	xorq	%rax, %rbx
	movq	%rbx, -72(%rsp)
	movq	%r15, %rbx
	notq	%rbx
	andq	%rsi, %rbx
	xorq	%r13, %rbx
	movq	%rbx, %r14
	movq	%rsi, %rbx
	notq	%rbx
	andq	%r9, %rbx
	notq	%r9
	andq	%rax, %r9
	xorq	%r15, %rbx
	movq	%r9, %r12
	movq	48(%rsp), %r9
	movq	%rbx, -64(%rsp)
	xorq	%rsi, %r12
	movq	40(%rsp), %rsi
	movq	%r12, -56(%rsp)
	movq	%rdx, %r12
	notq	%r12
	movq	%r9, %r13
	movq	%r12, %rax
	notq	%r13
	andq	%rbp, %rax
	andq	%rdx, %r13
	movq	%rax, %r12
	xorq	%rsi, %r13
	xorq	%r9, %r12
	movq	%r12, -48(%rsp)
	movq	%rbp, %r12
	notq	%r12
	movq	%r12, %rax
	andq	%rdi, %rax
	movq	%rax, %r12
	movq	%rsi, %rax
	xorq	%rdx, %r12
	notq	%rax
	movq	%r12, -40(%rsp)
	movq	%rdi, %r12
	movq	%rax, %r15
	notq	%r12
	andq	%r9, %r15
	movq	%r12, %rdx
	andq	%rsi, %rdx
	movq	%rdx, %rsi
	xorq	%rbp, %rsi
	movq	%rsi, -32(%rsp)
	movq	%r15, %rsi
	xorq	%rdi, %rsi
	movq	%rsi, -24(%rsp)
	movq	72(%rsp), %rbp
	movq	56(%rsp), %rdi
	movq	16(%rsp), %r9
	movq	%rbp, %rdx
	notq	%rdx
	movq	%rdi, %r12
	movq	%rdx, %rax
	notq	%r12
	movq	%rbp, %rdx
	andq	%rdi, %rax
	movq	%rax, %rsi
	movq	64(%rsp), %rax
	xorq	%r8, %rsi
	movq	%rsi, -16(%rsp)
	movq	%r11, %rsi
	notq	%rsi
	andq	%rax, %r12
	movq	%rsi, %rbx
	xorq	%rbp, %r12
	movq	%rax, %rbp
	andq	%r8, %rbx
	notq	%rbp
	notq	%r8
	xorq	%rax, %rbx
	movq	80(%rsp), %rax
	andq	%r11, %rbp
	xorq	%rdi, %rbp
	andq	%rdx, %r8
	movq	96(%rsp), %rdx
	movq	%r8, %rsi
	movq	%rax, %rdi
	xorq	%r11, %rsi
	notq	%rdi
	movq	%rsi, -8(%rsp)
	movq	%rdx, %rsi
	andq	%r10, %rdi
	notq	%rsi
	xorq	%r9, %rdi
	movq	%rdi, (%rsp)
	movq	%r10, %rdi
	notq	%rdi
	movq	%rdi, %r8
	movq	%rax, %rdi
	andq	%rdx, %r8
	xorq	%rax, %r8
	movq	88(%rsp), %rax
	movq	%rax, %r11
	andq	%rax, %rsi
	notq	%r11
	xorq	%r10, %rsi
	movq	24(%rsp), %r10
	andq	%r9, %r11
	movq	%rsi, 8(%rsp)
	movzbl	39(%rsp), %esi
	xorq	%rdx, %r11
	leaq	RC(%rip), %rdx
	movq	%r11, 16(%rsp)
	movq	%r9, %r11
	notq	%r11
	andq	%rdi, %r11
	andq	%rcx, %r10
	movq	-120(%rsp), %rcx
	xorq	%rax, %r11
	movzbl	%sil, %eax
	xorq	(%rdx,%rax,8), %rcx
	movl	%esi, %eax
	addl	$1, %eax
	movb	%al, 39(%rsp)
	xorq	%r10, %rcx
	cmpb	$24, %al
	jne	.L3
	movq	104(%rsp), %rax
	movq	-112(%rsp), %rdx
	movq	%r12, %r15
	movq	%r13, %r12
	movq	%rdx, 8(%rax)
	movq	-104(%rsp), %rdx
	movq	%r14, 56(%rax)
	movq	%r12, 80(%rax)
	movq	%r15, 128(%rax)
	movq	%rbp, 136(%rax)
	movq	%rdx, 16(%rax)
	movq	-96(%rsp), %rdx
	movq	%rbx, 144(%rax)
	movq	%rdx, 24(%rax)
	movq	-88(%rsp), %rdx
	movq	%rdx, 32(%rax)
	movq	-80(%rsp), %rdx
	movq	%rdx, 40(%rax)
	movq	-72(%rsp), %rdx
	movq	%rdx, 48(%rax)
	movq	-64(%rsp), %rdx
	movq	%rdx, 64(%rax)
	movq	-56(%rsp), %rdx
	movq	%rdx, 72(%rax)
	movq	-48(%rsp), %rdx
	movq	%rdx, 88(%rax)
	movq	-40(%rsp), %rdx
	movq	%rdx, 96(%rax)
	movq	-32(%rsp), %rdx
	movq	%rdx, 104(%rax)
	movq	-24(%rsp), %rdx
	movq	%rdx, 112(%rax)
	movq	-16(%rsp), %rdx
	movq	%rdx, 120(%rax)
	movq	-8(%rsp), %rdx
	movq	%r8, 168(%rax)
	movq	%r11, 192(%rax)
	movq	%rcx, (%rax)
	movq	%rdx, 152(%rax)
	movq	(%rsp), %rdx
	movq	%rdx, 160(%rax)
	movq	8(%rsp), %rdx
	movq	%rdx, 176(%rax)
	movq	16(%rsp), %rdx
	movq	%rdx, 184(%rax)
.L6:
	addq	$112, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE79:
	.size	keccakf, .-keccakf
	.section	.text.unlikely.keccakf
.LCOLDE0:
	.section	.text.keccakf
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/shake.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"sponge->params->rate >= sponge->params->position"
	.section	.text.unlikely.strobe_unduplex,"ax",@progbits
.LCOLDB3:
	.section	.text.strobe_unduplex,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.type	strobe_unduplex, @function
strobe_unduplex:
.LFB97:
	.cfi_startproc
	testq	%rcx, %rcx
	je	.L38
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	202(%rdi), %edx
	movzbl	200(%rdi), %ecx
	cmpb	%dl, %cl
	ja	.L11
	movzbl	%cl, %eax
	movq	%rsi, %r12
	movq	%rdi, %rbx
	subl	%eax, %edx
	leaq	(%rdi,%rax), %r10
	movslq	%edx, %rbp
	cmpq	%rbp, %r15
	jbe	.L43
	testq	%r14, %r14
	je	.L18
	.p2align 4,,10
	.p2align 3
.L45:
	testq	%rbp, %rbp
	je	.L18
	movzbl	(%r14), %eax
	movl	$1, %esi
	movl	%eax, %edx
	xorb	(%r10), %dl
	movb	%dl, (%r12)
	movb	%al, (%r10)
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L21:
	movzbl	(%r14,%rax), %r8d
	leaq	(%r10,%rax), %rdi
	addl	$1, %esi
	movl	%r8d, %r9d
	xorb	(%rdi), %r9b
	movb	%r9b, (%r12,%rax)
	movb	%r8b, (%rdi)
.L25:
	movl	%esi, %eax
	cmpq	%rbp, %rax
	jb	.L21
	xorb	$1, (%r10,%rax)
.L39:
	movzbl	203(%r13), %esi
	movq	%r13, %rdi
	subq	%rbp, %r15
	call	keccakf
	movzbl	202(%r13), %ebp
	movb	$0, 200(%r13)
	cmpq	%r15, %rbp
	jnb	.L44
	testq	%r14, %r14
	movq	%r13, %r10
	jne	.L45
.L18:
	xorb	$1, (%r10)
	jmp	.L39
.L44:
	xorl	%ecx, %ecx
	testq	%r14, %r14
	je	.L17
.L16:
	movzbl	(%r14), %eax
	movl	%eax, %edx
	xorb	(%rbx), %dl
	movb	%dl, (%r12)
	movb	%al, (%rbx)
	movl	$1, %edx
	jmp	.L24
	.p2align 4,,10
	.p2align 3
.L20:
	movzbl	(%r14,%rax), %esi
	leaq	(%rbx,%rax), %rcx
	addl	$1, %edx
	movl	%esi, %edi
	xorb	(%rcx), %dil
	movb	%dil, (%r12,%rax)
	movb	%sil, (%rcx)
.L24:
	movl	%edx, %eax
	cmpq	%r15, %rax
	jb	.L20
	movzbl	200(%r13), %ecx
.L17:
	addl	%r15d, %ecx
	movb	%cl, 200(%r13)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L38:
	rep ret
.L43:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	testq	%r14, %r14
	movq	%r10, %rbx
	jne	.L16
	jmp	.L17
.L11:
	leaq	__PRETTY_FUNCTION__.4439(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$530, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE97:
	.size	strobe_unduplex, .-strobe_unduplex
	.section	.text.unlikely.strobe_unduplex
.LCOLDE3:
	.section	.text.strobe_unduplex
.LHOTE3:
	.section	.text.unlikely.strobe_duplex,"ax",@progbits
.LCOLDB4:
	.section	.text.strobe_duplex,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.type	strobe_duplex, @function
strobe_duplex:
.LFB95:
	.cfi_startproc
	testq	%rcx, %rcx
	je	.L83
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movzbl	202(%rdi), %edx
	movzbl	200(%rdi), %eax
	cmpb	%al, %dl
	jb	.L48
	subl	%eax, %edx
	cltq
	movq	%rsi, %rbp
	movslq	%edx, %r13
	movq	%rcx, %r15
	leaq	(%rdi,%rax), %rbx
	cmpq	%r13, %rcx
	jbe	.L86
	movq	%rdi, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L51:
	testq	%r12, %r12
	je	.L55
	xorl	%eax, %eax
	xorl	%edx, %edx
	testq	%r13, %r13
	je	.L58
	.p2align 4,,10
	.p2align 3
.L73:
	movzbl	(%r12,%rax), %esi
	xorb	%sil, (%rbx,%rax)
	leal	1(%rdx), %eax
	cmpq	%r13, %rax
	movq	%rax, %rdx
	jb	.L73
.L58:
	addq	%r13, %r12
.L55:
	testq	%rbp, %rbp
	je	.L59
	movq	%rbp, %rdi
	movq	%r13, %rdx
	movq	%rbx, %rsi
	addq	%r13, %rbp
	call	memcpy@PLT
.L59:
	xorb	$1, (%rbx,%r13)
	movq	%r14, %rdi
	subq	%r13, %r15
	movzbl	203(%r14), %esi
	call	keccakf
	movzbl	202(%r14), %ecx
	movb	$0, 200(%r14)
	movzbl	%cl, %r13d
	cmpq	%r15, %r13
	jnb	.L87
	movq	%r14, %rbx
	jmp	.L51
.L87:
	testq	%r12, %r12
	je	.L52
.L61:
	movq	8(%rsp), %rdi
	movzbl	(%r12), %eax
	movl	$1, %edx
	xorb	%al, (%rdi)
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L53:
	movq	8(%rsp), %rdi
	movzbl	(%r12,%rax), %ecx
	addl	$1, %edx
	xorb	%cl, (%rdi,%rax)
.L62:
	movl	%edx, %eax
	cmpq	%r15, %rax
	jb	.L53
.L52:
	testq	%rbp, %rbp
	je	.L54
	movq	8(%rsp), %rsi
	movq	%r15, %rdx
	movq	%rbp, %rdi
	call	memcpy@PLT
.L54:
	addb	%r15b, 200(%r14)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L83:
	rep ret
.L86:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	testq	%r12, %r12
	movq	%rbx, 8(%rsp)
	jne	.L61
	jmp	.L52
.L48:
	leaq	__PRETTY_FUNCTION__.4414(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC2(%rip), %rdi
	movl	$476, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE95:
	.size	strobe_duplex, .-strobe_duplex
	.section	.text.unlikely.strobe_duplex
.LCOLDE4:
	.section	.text.strobe_duplex
.LHOTE4:
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"sponge->params->position < sponge->params->rate"
	.align 8
.LC6:
	.string	"sponge->params->rate < sizeof(sponge->state)"
	.align 8
.LC7:
	.string	"sponge->params->flags == FLAG_ABSORBING"
	.section	.text.unlikely.sha3_update,"ax",@progbits
.LCOLDB8:
	.section	.text.sha3_update,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	sha3_update
	.type	sha3_update, @function
sha3_update:
.LFB81:
	.cfi_startproc
	testq	%rdx, %rdx
	je	.L151
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	movq	%rdi, %r13
	pushq	%rbx
	subq	$8, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movzbl	200(%rdi), %eax
	movzbl	202(%rdi), %ebx
	cmpb	%bl, %al
	jnb	.L154
	cmpb	$-57, %bl
	ja	.L155
	cmpb	$65, 201(%rdi)
	jne	.L156
	subl	%eax, %ebx
	movq	%rdx, %r14
	movslq	%eax, %rcx
	movslq	%ebx, %rbx
	addq	%rdi, %rcx
	movq	%rsi, %r12
	cmpq	%r14, %rbx
	ja	.L157
	.p2align 4,,10
	.p2align 3
.L94:
	testq	%rbx, %rbx
	je	.L118
	leaq	32(%rcx), %rax
	cmpq	%rax, %r12
	leaq	32(%r12), %rax
	setnb	%dl
	cmpq	%rax, %rcx
	setnb	%al
	orb	%al, %dl
	je	.L122
	cmpq	$34, %rbx
	jbe	.L122
	movq	%rcx, %rsi
	negq	%rsi
	andl	$31, %esi
	cmpq	%rbx, %rsi
	cmova	%rbx, %rsi
	xorl	%eax, %eax
	testq	%rsi, %rsi
	je	.L111
	.p2align 4,,10
	.p2align 3
.L112:
	movzbl	(%r12,%rax), %edi
	xorb	%dil, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jne	.L112
	movq	%rsi, %rax
.L111:
	movq	%rbx, %r8
	leaq	-1(%rbx), %rdi
	subq	%rsi, %r8
	leaq	-32(%r8), %rdx
	subq	%rsi, %rdi
	shrq	$5, %rdx
	addq	$1, %rdx
	movq	%rdx, %r9
	salq	$5, %r9
	cmpq	$30, %rdi
	jbe	.L116
	leaq	(%rcx,%rsi), %r11
	xorl	%edi, %edi
	addq	%r12, %rsi
	xorl	%r10d, %r10d
.L114:
	vmovdqu	(%rsi,%rdi), %xmm0
	addq	$1, %r10
	vinserti128	$0x1, 16(%rsi,%rdi), %ymm0, %ymm0
	vpxor	(%r11,%rdi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%r11,%rdi)
	addq	$32, %rdi
	cmpq	%r10, %rdx
	ja	.L114
	addq	%r9, %rax
	cmpq	%r9, %r8
	je	.L158
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L116:
	movzbl	(%r12,%rax), %esi
	xorb	%sil, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%rax, %rbx
	ja	.L116
.L118:
	movzbl	203(%r13), %esi
	movq	%r13, %rdi
	addq	%rbx, %r12
	call	keccakf
	subq	%rbx, %r14
	movb	$0, 200(%r13)
	je	.L148
	movzbl	202(%r13), %ebx
	xorl	%eax, %eax
	movq	%r13, %rcx
	subl	%eax, %ebx
	movslq	%ebx, %rbx
	cmpq	%r14, %rbx
	jbe	.L94
.L157:
	leaq	32(%r12), %rax
	cmpq	%rax, %rcx
	leaq	32(%rcx), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L124
	cmpq	$34, %r14
	jbe	.L124
	movq	%rcx, %rdx
	negq	%rdx
	andl	$31, %edx
	cmpq	%r14, %rdx
	cmova	%r14, %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L101
	.p2align 4,,10
	.p2align 3
.L102:
	movzbl	(%r12,%rax), %esi
	xorb	%sil, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L102
	movq	%rdx, %rax
.L101:
	movq	%r14, %r8
	leaq	-1(%r14), %rdi
	subq	%rdx, %r8
	leaq	-32(%r8), %rsi
	subq	%rdx, %rdi
	shrq	$5, %rsi
	addq	$1, %rsi
	movq	%rsi, %r9
	salq	$5, %r9
	cmpq	$30, %rdi
	jbe	.L106
	leaq	(%rcx,%rdx), %r11
	xorl	%edi, %edi
	addq	%r12, %rdx
	xorl	%r10d, %r10d
.L104:
	vmovdqu	(%rdx,%rdi), %xmm0
	addq	$1, %r10
	vinserti128	$0x1, 16(%rdx,%rdi), %ymm0, %ymm0
	vpxor	(%r11,%rdi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%r11,%rdi)
	addq	$32, %rdi
	cmpq	%r10, %rsi
	ja	.L104
	addq	%r9, %rax
	cmpq	%r9, %r8
	je	.L159
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L106:
	movzbl	(%r12,%rax), %edx
	xorb	%dl, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%rax, %r14
	ja	.L106
.L109:
	addb	%r14b, 200(%r13)
.L148:
	addq	$8, %rsp
	popq	%rbx
	.cfi_restore 3
	popq	%r10
	.cfi_restore 10
	.cfi_def_cfa 10, 0
	popq	%r12
	.cfi_restore 12
	popq	%r13
	.cfi_restore 13
	popq	%r14
	.cfi_restore 14
	popq	%rbp
	.cfi_restore 6
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
.L151:
	rep ret
	.p2align 4,,10
	.p2align 3
.L122:
	.cfi_escape 0xf,0x3,0x76,0x60,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x68
	.cfi_escape 0x10,0xd,0x2,0x76,0x70
	.cfi_escape 0x10,0xe,0x2,0x76,0x78
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L110:
	movzbl	(%r12,%rax), %edx
	xorb	%dl, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%rax, %rbx
	jne	.L110
	jmp	.L118
	.p2align 4,,10
	.p2align 3
.L158:
	vzeroupper
	jmp	.L118
.L124:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L108:
	movzbl	(%r12,%rax), %edx
	xorb	%dl, (%rcx,%rax)
	addq	$1, %rax
	cmpq	%r14, %rax
	jne	.L108
	jmp	.L109
.L159:
	vzeroupper
	jmp	.L109
.L156:
	leaq	__PRETTY_FUNCTION__.4243(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	movl	$156, %edx
	call	__assert_fail@PLT
.L155:
	leaq	__PRETTY_FUNCTION__.4243(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$155, %edx
	call	__assert_fail@PLT
.L154:
	leaq	__PRETTY_FUNCTION__.4243(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$154, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE81:
	.size	sha3_update, .-sha3_update
	.section	.text.unlikely.sha3_update
.LCOLDE8:
	.section	.text.sha3_update
.LHOTE8:
	.section	.rodata.str1.1
.LC9:
	.string	"sponge->params->maxOut >= len"
.LC10:
	.string	"0"
	.section	.text.unlikely.sha3_output,"ax",@progbits
.LCOLDB11:
	.section	.text.sha3_output,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.globl	sha3_output
	.type	sha3_output, @function
sha3_output:
.LFB82:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movzbl	200(%rdi), %esi
	movzbl	202(%rdi), %eax
	cmpb	%al, %sil
	jnb	.L199
	cmpb	$-57, %al
	ja	.L200
	movzbl	206(%rdi), %eax
	movq	%rdi, %rbp
	movq	%rdx, %r12
	cmpb	$-1, %al
	je	.L163
	movzbl	%al, %edx
	cmpq	%r12, %rdx
	jb	.L201
	subl	%r12d, %eax
	movb	%al, 206(%rdi)
.L163:
	movzbl	201(%rbp), %eax
	cmpb	$65, %al
	je	.L166
	cmpb	$90, %al
	jne	.L202
.L167:
	testq	%r12, %r12
	je	.L195
	movzbl	202(%rbp), %ebx
	movq	%rbp, %r13
	subl	%esi, %ebx
	movslq	%esi, %rsi
	movslq	%ebx, %rbx
	addq	%rbp, %rsi
	cmpq	%rbx, %r12
	jnb	.L172
	jmp	.L203
	.p2align 4,,10
	.p2align 3
.L206:
	testb	$4, %bl
	jne	.L204
	testq	%rbx, %rbx
	je	.L174
	movzbl	(%rsi), %eax
	testb	$2, %bl
	movb	%al, (%r14)
	jne	.L205
.L174:
	movzbl	203(%rbp), %esi
	movq	%rbp, %rdi
	addq	%rbx, %r14
	call	keccakf
	subq	%rbx, %r12
	movb	$0, 200(%rbp)
	je	.L195
	movzbl	202(%rbp), %ebx
	cmpq	%r12, %rbx
	ja	.L170
	movq	%rbp, %rsi
.L172:
	cmpq	$8, %rbx
	jb	.L206
	movq	(%rsi), %rax
	leaq	8(%r14), %rdi
	movq	%r14, %rcx
	andq	$-8, %rdi
	movq	%rax, (%r14)
	movq	-8(%rsi,%rbx), %rax
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addq	%rbx, %rcx
	shrq	$3, %rcx
	movq	%rax, -8(%r14,%rbx)
	rep movsq
	jmp	.L174
.L203:
	movq	%rsi, %r13
	.p2align 4,,10
	.p2align 3
.L170:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
	addb	%r12b, 200(%rbp)
.L195:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L202:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.4261(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$197, %edx
	call	__assert_fail@PLT
	.p2align 4,,10
	.p2align 3
.L204:
	movl	(%rsi), %eax
	movl	%eax, (%r14)
	movl	-4(%rsi,%rbx), %eax
	movl	%eax, -4(%r14,%rbx)
	jmp	.L174
	.p2align 4,,10
	.p2align 3
.L166:
	movzbl	204(%rbp), %eax
	movq	%rbp, %rdi
	xorb	%al, 0(%rbp,%rsi)
	movzbl	202(%rbp), %eax
	movzbl	205(%rbp), %edx
	xorb	%dl, -1(%rbp,%rax)
	movzbl	203(%rbp), %esi
	call	keccakf
	movb	$0, 200(%rbp)
	xorl	%esi, %esi
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L205:
	movzwl	-2(%rsi,%rbx), %eax
	movw	%ax, -2(%r14,%rbx)
	jmp	.L174
.L199:
	leaq	__PRETTY_FUNCTION__.4261(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$178, %edx
	call	__assert_fail@PLT
.L200:
	leaq	__PRETTY_FUNCTION__.4261(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$179, %edx
	call	__assert_fail@PLT
.L201:
	leaq	__PRETTY_FUNCTION__.4261(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC9(%rip), %rdi
	movl	$182, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE82:
	.size	sha3_output, .-sha3_output
	.section	.text.unlikely.sha3_output
.LCOLDE11:
	.section	.text.sha3_output
.LHOTE11:
	.section	.text.unlikely.sponge_destroy,"ax",@progbits
.LCOLDB12:
	.section	.text.sponge_destroy,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	sponge_destroy
	.type	sponge_destroy, @function
sponge_destroy:
.LFB84:
	.cfi_startproc
	movl	$208, %edx
	.p2align 4,,10
	.p2align 3
.L208:
	testb	$7, %dil
	je	.L222
	movb	$0, (%rdi)
	addq	$1, %rdi
	subq	$1, %rdx
	jne	.L208
	rep ret
	.p2align 4,,10
	.p2align 3
.L222:
	cmpq	$7, %rdx
	jbe	.L214
	leaq	-8(%rdx), %rax
	shrq	$3, %rax
	leaq	8(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L211:
	movq	$0, (%rdi)
	addq	$8, %rdi
	cmpq	%rdi, %rax
	jne	.L211
	andl	$7, %edx
	je	.L223
.L210:
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L213:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L213
	rep ret
.L214:
	movq	%rdi, %rax
	jmp	.L210
.L223:
	ret
	.cfi_endproc
.LFE84:
	.size	sponge_destroy, .-sponge_destroy
	.section	.text.unlikely.sponge_destroy
.LCOLDE12:
	.section	.text.sponge_destroy
.LHOTE12:
	.section	.text.unlikely.sponge_init,"ax",@progbits
.LCOLDB13:
	.section	.text.sponge_init,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	sponge_init
	.type	sponge_init, @function
sponge_init:
.LFB85:
	.cfi_startproc
	movq	$0, (%rdi)
	movq	$0, 192(%rdi)
	movq	%rdi, %rdx
	leaq	8(%rdi), %rdi
	movq	%rdx, %rcx
	xorl	%eax, %eax
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	$200, %ecx
	shrl	$3, %ecx
	rep stosq
	movq	(%rsi), %rax
	movq	%rax, 200(%rdx)
	ret
	.cfi_endproc
.LFE85:
	.size	sponge_init, .-sponge_init
	.section	.text.unlikely.sponge_init
.LCOLDE13:
	.section	.text.sponge_init
.LHOTE13:
	.section	.text.unlikely.sponge_hash,"ax",@progbits
.LCOLDB14:
	.section	.text.sponge_hash,"ax",@progbits
.LHOTB14:
	.p2align 4,,15
	.globl	sponge_hash
	.type	sponge_hash, @function
sponge_hash:
.LFB86:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%r8, %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r13
	movq	%rcx, %r12
	movq	%rdx, %rbp
	subq	$224, %rsp
	.cfi_def_cfa_offset 272
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	call	sponge_init@PLT
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rsp, %rdi
	call	sha3_update@PLT
	movq	%r12, %rdx
	movq	%rbp, %rsi
	movq	%rsp, %rdi
	call	sha3_output@PLT
	movq	%rsp, %rdi
	call	sponge_destroy@PLT
	movq	216(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L229
	addq	$224, %rsp
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
.L229:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE86:
	.size	sponge_hash, .-sponge_hash
	.section	.text.unlikely.sponge_hash
.LCOLDE14:
	.section	.text.sponge_hash
.LHOTE14:
	.section	.text.unlikely.sponge_default_output_bytes,"ax",@progbits
.LCOLDB15:
	.section	.text.sponge_default_output_bytes,"ax",@progbits
.LHOTB15:
	.p2align 4,,15
	.globl	sponge_default_output_bytes
	.type	sponge_default_output_bytes, @function
sponge_default_output_bytes:
.LFB87:
	.cfi_startproc
	cmpb	$-1, 206(%rdi)
	movzbl	202(%rdi), %edx
	movl	$200, %eax
	je	.L234
	subl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cltq
	ret
	.p2align 4,,10
	.p2align 3
.L234:
	subl	%edx, %eax
	cltq
	ret
	.cfi_endproc
.LFE87:
	.size	sponge_default_output_bytes, .-sponge_default_output_bytes
	.section	.text.unlikely.sponge_default_output_bytes
.LCOLDE15:
	.section	.text.sponge_default_output_bytes
.LHOTE15:
	.section	.text.unlikely.spongerng_next,"ax",@progbits
.LCOLDB16:
	.section	.text.spongerng_next,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.globl	spongerng_next
	.type	spongerng_next, @function
spongerng_next:
.LFB89:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movzbl	200(%rdi), %edx
	movzbl	202(%rdi), %eax
	cmpb	%al, %dl
	jnb	.L311
	cmpb	$-57, %al
	ja	.L312
	movzbl	201(%rdi), %ecx
	movq	%rdi, %r13
	movq	%rsi, %r14
	cmpb	$82, %cl
	je	.L239
	jbe	.L313
	cmpb	$100, %cl
	je	.L241
	cmpb	$114, %cl
	jne	.L238
.L241:
	movzbl	204(%r13), %eax
	movq	%r13, %rdi
	xorb	%al, 0(%r13,%rdx)
	movzbl	202(%r13), %eax
	movzbl	205(%r13), %edx
	xorb	%dl, -1(%r13,%rax)
	movzbl	203(%r13), %esi
	call	keccakf
	cmpb	$100, 201(%r13)
	movl	$68, %edx
	movl	$82, %eax
	movb	$0, 200(%r13)
	cmove	%edx, %eax
	testq	%r15, %r15
	movb	%al, 201(%r13)
	je	.L243
	movzbl	202(%r13), %eax
	movq	%r13, %r8
	xorl	%edx, %edx
.L244:
	subl	%edx, %eax
	movslq	%eax, %rbp
	cmpq	%rbp, %r15
	jb	.L314
	movl	$1, %eax
	movq	%r13, %r12
#APP
# 285 "src/shake.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	%ecx, %ebx
	shrl	$30, %ebx
	andl	$1, %ebx
	jmp	.L248
	.p2align 4,,10
	.p2align 3
.L320:
	testb	$4, %bpl
	jne	.L315
	testq	%rbp, %rbp
	je	.L251
	movzbl	(%r8), %eax
	testb	$2, %bpl
	movb	%al, (%r14)
	jne	.L316
.L251:
	cmpq	$8, %rbp
	jnb	.L254
.L321:
	testb	$4, %bpl
	jne	.L317
	testq	%rbp, %rbp
	je	.L255
	testb	$2, %bpl
	movb	$0, (%r8)
	jne	.L318
.L255:
	cmpb	$82, 201(%r13)
	je	.L319
.L259:
	movzbl	203(%r13), %esi
	movq	%r13, %rdi
	addq	%rbp, %r14
	call	keccakf
	subq	%rbp, %r15
	movb	$0, 200(%r13)
	je	.L243
	movzbl	202(%r13), %ebp
	cmpq	%r15, %rbp
	ja	.L246
	movq	%r13, %r8
.L248:
	cmpq	$8, %rbp
	jb	.L320
	movq	(%r8), %rax
	leaq	8(%r14), %rdi
	movq	%r14, %rcx
	movq	%r8, %rsi
	andq	$-8, %rdi
	subq	%rdi, %rcx
	movq	%rax, (%r14)
	movq	-8(%r8,%rbp), %rax
	subq	%rcx, %rsi
	addq	%rbp, %rcx
	shrq	$3, %rcx
	cmpq	$8, %rbp
	movq	%rax, -8(%r14,%rbp)
	rep movsq
	jb	.L321
.L254:
	leaq	8(%r8), %rdi
	movq	$0, (%r8)
	movq	$0, -8(%r8,%rbp)
	xorl	%eax, %eax
	andq	$-8, %rdi
	subq	%rdi, %r8
	leaq	0(%rbp,%r8), %rcx
	shrq	$3, %rcx
	rep stosq
	cmpb	$82, 201(%r13)
	jne	.L259
.L319:
	cmpb	$0, tested.4315(%rip)
	jne	.L260
	testb	%bl, %bl
	movb	%bl, have_rdrand.4316(%rip)
	movb	$1, tested.4315(%rip)
	je	.L262
.L261:
	movq	%r13, %r8
	movl	$4, %r9d
	movl	$104, %edx
	xorl	%edi, %edi
	jmp	.L263
	.p2align 4,,10
	.p2align 3
.L322:
	testb	%cl, %cl
	je	.L273
.L263:
	movq	%rdi, %rax
#APP
# 301 "src/shake.c" 1
	rdrand %rsi
	setc %al
# 0 "" 2
#NO_APP
	subl	$1, %edx
	setne	%cl
	testq	%rax, %rax
	je	.L322
.L273:
	xorq	%rsi, (%r8)
	addq	$8, %r8
	subq	$1, %r9
	je	.L259
	testb	%cl, %cl
	jne	.L263
	jmp	.L259
	.p2align 4,,10
	.p2align 3
.L313:
	cmpb	$68, %cl
	je	.L239
.L238:
	leaq	__PRETTY_FUNCTION__.4337(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$336, %edx
	call	__assert_fail@PLT
.L260:
	cmpb	$0, have_rdrand.4316(%rip)
	jne	.L261
.L262:
#APP
# 307 "src/shake.c" 1
	rdtsc
# 0 "" 2
#NO_APP
	xorq	%rax, 0(%r13)
	jmp	.L259
.L315:
	movl	(%r8), %eax
	movl	%eax, (%r14)
	movl	-4(%r8,%rbp), %eax
	movl	%eax, -4(%r14,%rbp)
	jmp	.L251
.L317:
	movl	$0, (%r8)
	movl	$0, -4(%r8,%rbp)
	jmp	.L255
.L239:
	testq	%r15, %r15
	je	.L245
	movslq	%edx, %r8
	addq	%r13, %r8
	jmp	.L244
.L314:
	movq	%r8, %r12
.L246:
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	memcpy@PLT
	movq	%r15, %rdx
	xorl	%esi, %esi
	movq	%r12, %rdi
	call	memset@PLT
	addb	%r15b, 200(%r13)
.L308:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L316:
	.cfi_restore_state
	movzwl	-2(%r8,%rbp), %eax
	movw	%ax, -2(%r14,%rbp)
	jmp	.L251
.L318:
	xorl	%eax, %eax
	movw	%ax, -2(%r8,%rbp)
	jmp	.L255
.L245:
	cmpb	$31, %dl
	ja	.L308
.L243:
	movq	$0, 0(%r13)
	movq	$0, 8(%r13)
	movq	$0, 16(%r13)
	movq	$0, 24(%r13)
	movb	$32, 200(%r13)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L312:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.4337(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$323, %edx
	call	__assert_fail@PLT
.L311:
	leaq	__PRETTY_FUNCTION__.4337(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$322, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE89:
	.size	spongerng_next, .-spongerng_next
	.section	.text.unlikely.spongerng_next
.LCOLDE16:
	.section	.text.spongerng_next
.LHOTE16:
	.section	.text.unlikely.spongerng_stir,"ax",@progbits
.LCOLDB17:
	.section	.text.spongerng_stir,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.globl	spongerng_stir
	.type	spongerng_stir, @function
spongerng_stir:
.LFB90:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rdx, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movzbl	200(%rdi), %eax
	movzbl	202(%rdi), %edx
	cmpb	%dl, %al
	jnb	.L416
	cmpb	$-57, %dl
	ja	.L417
	movq	%rsi, %r12
	movzbl	201(%rdi), %esi
	movq	%rdi, %r14
	leal	-68(%rsi), %ecx
	cmpb	$49, %cl
	ja	.L326
	movl	$1, %edx
	movabsq	$633357352304640, %rdi
	shlx	%rcx, %rdx, %rdx
	testq	%rdi, %rdx
	jne	.L327
	testb	%cl, %cl
	jne	.L418
.L329:
	cmpb	$68, %sil
	movzbl	203(%r14), %esi
	movl	$100, %edx
	movl	$114, %eax
	movq	%r14, %rdi
	cmove	%edx, %eax
	movb	%al, 201(%r14)
	call	keccakf
	movb	$0, 200(%r14)
	xorl	%eax, %eax
.L327:
	testq	%r15, %r15
	je	.L411
	movzbl	202(%r14), %r13d
	movq	%r14, %rbx
	subl	%eax, %r13d
	cltq
	movslq	%r13d, %r13
	leaq	(%r14,%rax), %rdx
	cmpq	%r13, %r15
	jb	.L419
	.p2align 4,,10
	.p2align 3
.L342:
	testq	%r13, %r13
	je	.L365
	leaq	32(%rdx), %rax
	cmpq	%rax, %r12
	leaq	32(%r12), %rax
	setnb	%cl
	cmpq	%rax, %rdx
	setnb	%al
	orb	%al, %cl
	je	.L357
	cmpq	$34, %r13
	jbe	.L357
	movq	%rdx, %rcx
	negq	%rcx
	andl	$31, %ecx
	cmpq	%r13, %rcx
	cmova	%r13, %rcx
	xorl	%eax, %eax
	testq	%rcx, %rcx
	je	.L358
	.p2align 4,,10
	.p2align 3
.L359:
	movzbl	(%r12,%rax), %esi
	xorb	%sil, (%rdx,%rax)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L359
	movq	%rcx, %rax
.L358:
	movq	%r13, %r8
	leaq	-1(%r13), %rdi
	subq	%rcx, %r8
	leaq	-32(%r8), %rsi
	subq	%rcx, %rdi
	shrq	$5, %rsi
	addq	$1, %rsi
	movq	%rsi, %r9
	salq	$5, %r9
	cmpq	$30, %rdi
	jbe	.L363
	leaq	(%rdx,%rcx), %r10
	xorl	%edi, %edi
	addq	%r12, %rcx
	xorl	%r11d, %r11d
.L361:
	vmovdqu	(%rcx,%rdi), %xmm0
	addq	$1, %r11
	vinserti128	$0x1, 16(%rcx,%rdi), %ymm0, %ymm0
	vpxor	(%r10,%rdi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%r10,%rdi)
	addq	$32, %rdi
	cmpq	%r11, %rsi
	ja	.L361
	addq	%r9, %rax
	cmpq	%r9, %r8
	je	.L420
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L363:
	movzbl	(%r12,%rax), %ecx
	xorb	%cl, (%rdx,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	ja	.L363
.L365:
	movzbl	203(%r14), %esi
	movq	%r14, %rdi
	addq	%r13, %r12
	call	keccakf
	subq	%r13, %r15
	movb	$0, 200(%r14)
	je	.L411
	movzbl	202(%r14), %r13d
	cmpq	%r15, %r13
	ja	.L340
	movq	%r14, %rdx
	jmp	.L342
	.p2align 4,,10
	.p2align 3
.L357:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L366:
	movzbl	(%r12,%rax), %ecx
	xorb	%cl, (%rdx,%rax)
	addq	$1, %rax
	cmpq	%rax, %r13
	jne	.L366
	jmp	.L365
	.p2align 4,,10
	.p2align 3
.L420:
	vzeroupper
	jmp	.L365
.L423:
	vzeroupper
.L356:
	addb	%r15b, 200(%r14)
.L411:
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L418:
	.cfi_restore_state
	andb	$64, %dh
	je	.L326
	cmpb	$0, tested.4315(%rip)
	je	.L421
	cmpb	$0, have_rdrand.4316(%rip)
	je	.L332
.L331:
	movq	%r14, %r8
	movl	$4, %r9d
	movl	$104, %edx
	xorl	%edi, %edi
	jmp	.L333
	.p2align 4,,10
	.p2align 3
.L422:
	testb	%cl, %cl
	je	.L372
.L333:
	movq	%rdi, %rax
#APP
# 301 "src/shake.c" 1
	rdrand %rsi
	setc %al
# 0 "" 2
#NO_APP
	subl	$1, %edx
	setne	%cl
	testq	%rax, %rax
	je	.L422
.L372:
	xorq	%rsi, (%r8)
	addq	$8, %r8
	subq	$1, %r9
	je	.L373
	testb	%cl, %cl
	jne	.L333
.L373:
	movzbl	201(%r14), %esi
	jmp	.L329
	.p2align 4,,10
	.p2align 3
.L419:
	movq	%rdx, %rbx
.L340:
	leaq	32(%r12), %rax
	cmpq	%rax, %rbx
	leaq	32(%rbx), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L346
	cmpq	$34, %r15
	jbe	.L346
	testq	%r15, %r15
	movl	$1, %esi
	movq	%rbx, %rdx
	cmovne	%r15, %rsi
	negq	%rdx
	andl	$31, %edx
	cmpq	%rsi, %rdx
	cmova	%rsi, %rdx
	xorl	%eax, %eax
	testq	%rdx, %rdx
	je	.L347
	.p2align 4,,10
	.p2align 3
.L348:
	movzbl	(%r12,%rax), %ecx
	xorb	%cl, (%rbx,%rax)
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L348
	cmpq	%rsi, %rdx
	je	.L356
	movq	%rdx, %rax
.L347:
	subq	%rdx, %rsi
	leaq	-1(%r15), %rdi
	movl	$0, %r9d
	leaq	-32(%rsi), %rcx
	shrq	$5, %rcx
	addq	$1, %rcx
	movq	%rcx, %r8
	salq	$5, %r8
	testq	%r15, %r15
	cmove	%r9, %rdi
	subq	%rdx, %rdi
	cmpq	$30, %rdi
	jbe	.L353
	leaq	(%rbx,%rdx), %r10
	xorl	%edi, %edi
	addq	%r12, %rdx
.L351:
	vmovdqu	(%rdx,%rdi), %xmm0
	addq	$1, %r9
	vinserti128	$0x1, 16(%rdx,%rdi), %ymm0, %ymm0
	vpxor	(%r10,%rdi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%r10,%rdi)
	addq	$32, %rdi
	cmpq	%rcx, %r9
	jb	.L351
	addq	%r8, %rax
	cmpq	%rsi, %r8
	je	.L423
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L353:
	movzbl	(%r12,%rax), %edx
	xorb	%dl, (%rbx,%rax)
	addq	$1, %rax
	cmpq	%r15, %rax
	jb	.L353
	jmp	.L356
.L421:
	movl	$1, %eax
	movb	$1, tested.4315(%rip)
#APP
# 285 "src/shake.c" 1
	cpuid
# 0 "" 2
#NO_APP
	movl	%ecx, %eax
	shrl	$30, %eax
	andl	$1, %eax
	testb	%al, %al
	movb	%al, have_rdrand.4316(%rip)
	jne	.L331
.L332:
#APP
# 307 "src/shake.c" 1
	rdtsc
# 0 "" 2
#NO_APP
	xorq	%rax, (%r14)
	jmp	.L329
.L346:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L355:
	movzbl	(%r12,%rax), %edx
	xorb	%dl, (%rbx,%rax)
	addq	$1, %rax
	cmpq	%r15, %rax
	jb	.L355
	addb	%r15b, 200(%r14)
	jmp	.L411
.L417:
	leaq	__PRETTY_FUNCTION__.4355(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$371, %edx
	call	__assert_fail@PLT
.L416:
	leaq	__PRETTY_FUNCTION__.4355(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	movl	$370, %edx
	call	__assert_fail@PLT
.L326:
	leaq	__PRETTY_FUNCTION__.4355(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$383, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE90:
	.size	spongerng_stir, .-spongerng_stir
	.section	.text.unlikely.spongerng_stir
.LCOLDE17:
	.section	.text.spongerng_stir
.LHOTE17:
	.section	.text.unlikely.spongerng_init_from_buffer,"ax",@progbits
.LCOLDB18:
	.section	.text.spongerng_init_from_buffer,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.globl	spongerng_init_from_buffer
	.type	spongerng_init_from_buffer, @function
spongerng_init_from_buffer:
.LFB91:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbp
	leaq	spongerng_params(%rip), %rsi
	movq	%rdi, %rbx
	movq	%rdx, %r12
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	sponge_init@PLT
	cmpl	$1, %r13d
	movq	%r12, %rdx
	movq	%rbp, %rsi
	sbbl	%eax, %eax
	movq	%rbx, %rdi
	andl	$14, %eax
	addl	$100, %eax
	movb	%al, 201(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	spongerng_stir@PLT
	.cfi_endproc
.LFE91:
	.size	spongerng_init_from_buffer, .-spongerng_init_from_buffer
	.section	.text.unlikely.spongerng_init_from_buffer
.LCOLDE18:
	.section	.text.spongerng_init_from_buffer
.LHOTE18:
	.section	.text.unlikely.spongerng_init_from_file,"ax",@progbits
.LCOLDB19:
	.section	.text.spongerng_init_from_file,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.globl	spongerng_init_from_file
	.type	spongerng_init_from_file, @function
spongerng_init_from_file:
.LFB92:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	leaq	spongerng_params(%rip), %rsi
	movq	%rdx, %rbx
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	movl	%ecx, 12(%rsp)
	call	sponge_init@PLT
	cmpl	$1, %r14d
	sbbl	%eax, %eax
	andl	$14, %eax
	addl	$103, %eax
	testq	%rbx, %rbx
	movb	%al, 201(%r12)
	movl	$-2, %eax
	je	.L430
	xorl	%esi, %esi
	movq	%rbp, %rdi
	xorl	%eax, %eax
	call	open@PLT
	testl	%eax, %eax
	movl	%eax, %r13d
	leaq	16(%rsp), %rbp
	movl	$128, %r14d
	js	.L445
	.p2align 4,,10
	.p2align 3
.L440:
	cmpq	$128, %rbx
	movq	%r14, %rdx
	movl	$128, %ecx
	cmovbe	%rbx, %rdx
	movq	%rbp, %rsi
	movl	%r13d, %edi
	call	__read_chk@PLT
	testq	%rax, %rax
	movq	%rax, %r15
	jle	.L447
	movq	%rax, %rdx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	spongerng_stir@PLT
	subq	%r15, %rbx
	jne	.L440
	movl	%r13d, %edi
	call	close@PLT
	cmpl	$1, 12(%rsp)
	sbbl	%eax, %eax
	andl	$14, %eax
	addl	$100, %eax
	movb	%al, 201(%r12)
	xorl	%eax, %eax
.L430:
	movq	152(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L448
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L447:
	.cfi_restore_state
	movl	%r13d, %edi
	call	close@PLT
.L445:
	call	__errno_location@PLT
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L430
	movl	$-1, %eax
	jmp	.L430
.L448:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE92:
	.size	spongerng_init_from_file, .-spongerng_init_from_file
	.section	.text.unlikely.spongerng_init_from_file
.LCOLDE19:
	.section	.text.spongerng_init_from_file
.LHOTE19:
	.section	.rodata.str1.1
.LC20:
	.string	"/dev/urandom"
	.section	.text.unlikely.spongerng_init_from_dev_urandom,"ax",@progbits
.LCOLDB21:
	.section	.text.spongerng_init_from_dev_urandom,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.globl	spongerng_init_from_dev_urandom
	.type	spongerng_init_from_dev_urandom, @function
spongerng_init_from_dev_urandom:
.LFB93:
	.cfi_startproc
	leaq	.LC20(%rip), %rsi
	xorl	%ecx, %ecx
	movl	$64, %edx
	jmp	spongerng_init_from_file@PLT
	.cfi_endproc
.LFE93:
	.size	spongerng_init_from_dev_urandom, .-spongerng_init_from_dev_urandom
	.section	.text.unlikely.spongerng_init_from_dev_urandom
.LCOLDE21:
	.section	.text.spongerng_init_from_dev_urandom
.LHOTE21:
	.section	.text.unlikely.strobe_init,"ax",@progbits
.LCOLDB22:
	.section	.text.strobe_init,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.globl	strobe_init
	.type	strobe_init, @function
strobe_init:
.LFB94:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edx, %ebp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	sponge_init@PLT
	testb	%bpl, %bpl
	setne	207(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE94:
	.size	strobe_init, .-strobe_init
	.section	.text.unlikely.strobe_init
.LCOLDE22:
	.section	.text.strobe_init
.LHOTE22:
	.section	.text.unlikely.strobe_encrypt,"ax",@progbits
.LCOLDB23:
	.section	.text.strobe_encrypt,"ax",@progbits
.LHOTB23:
	.p2align 4,,15
	.globl	strobe_encrypt
	.type	strobe_encrypt, @function
strobe_encrypt:
.LFB99:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$1, 207(%rdi)
	sbbl	%edx, %edx
	andl	$-128, %edx
	addl	$5, %edx
	cmpb	$-57, 202(%rdi)
	movb	%dl, 7(%rsp)
	ja	.L463
	testb	%r8b, %r8b
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rcx, %r14
	je	.L464
	movzbl	201(%rdi), %ecx
	cmpb	%cl, %dl
	setne	%bpl
	testb	%cl, %cl
	setne	%al
	andl	%eax, %ebp
	xorl	$1, %ebp
	movzbl	%bpl, %ebp
	negq	%rbp
.L456:
	movb	%dl, 201(%rbx)
	movq	%rbx, %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	strobe_duplex
	cmpb	$0, 204(%rbx)
	movl	$0, %eax
	cmove	%rax, %rbp
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L465
	addq	$16, %rsp
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
	.p2align 4,,10
	.p2align 3
.L464:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %edx
	jmp	.L456
.L463:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L465:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE99:
	.size	strobe_encrypt, .-strobe_encrypt
	.section	.text.unlikely.strobe_encrypt
.LCOLDE23:
	.section	.text.strobe_encrypt
.LHOTE23:
	.section	.text.unlikely.strobe_decrypt,"ax",@progbits
.LCOLDB24:
	.section	.text.strobe_decrypt,"ax",@progbits
.LHOTB24:
	.p2align 4,,15
	.globl	strobe_decrypt
	.type	strobe_decrypt, @function
strobe_decrypt:
.LFB100:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$1, 207(%rdi)
	sbbl	%edx, %edx
	andl	$-128, %edx
	subl	$123, %edx
	cmpb	$-57, 202(%rdi)
	movb	%dl, 7(%rsp)
	ja	.L477
	testb	%r8b, %r8b
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rcx, %r14
	je	.L478
	movzbl	201(%rdi), %ecx
	cmpb	%cl, %dl
	setne	%bpl
	testb	%cl, %cl
	setne	%al
	andl	%eax, %ebp
	xorl	$1, %ebp
	movzbl	%bpl, %ebp
	negq	%rbp
.L470:
	movb	%dl, 201(%rbx)
	movq	%rbx, %rdi
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	call	strobe_unduplex
	cmpb	$0, 204(%rbx)
	movl	$0, %eax
	cmove	%rax, %rbp
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L479
	addq	$16, %rsp
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
	.p2align 4,,10
	.p2align 3
.L478:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %edx
	jmp	.L470
.L477:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L479:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE100:
	.size	strobe_decrypt, .-strobe_decrypt
	.section	.text.unlikely.strobe_decrypt
.LCOLDE24:
	.section	.text.strobe_decrypt
.LHOTE24:
	.section	.text.unlikely.strobe_plaintext,"ax",@progbits
.LCOLDB25:
	.section	.text.strobe_plaintext,"ax",@progbits
.LHOTB25:
	.p2align 4,,15
	.globl	strobe_plaintext
	.type	strobe_plaintext, @function
strobe_plaintext:
.LFB101:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movzbl	207(%rdi), %edx
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	xorl	%eax, %eax
	testb	%cl, %cl
	setne	%al
	cmpl	%eax, %edx
	movl	$4, %edx
	movl	$-124, %eax
	cmovne	%eax, %edx
	cmpb	$-57, 202(%rdi)
	movb	%dl, 7(%rsp)
	ja	.L489
	testb	%r8b, %r8b
	movq	%rdi, %rbx
	movq	%rsi, %r12
	je	.L490
	movzbl	201(%rdi), %ecx
	cmpb	%cl, %dl
	setne	%bpl
	testb	%cl, %cl
	setne	%al
	andl	%eax, %ebp
	xorl	$1, %ebp
	movzbl	%bpl, %ebp
	negq	%rbp
.L484:
	movb	%dl, 201(%rbx)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	strobe_duplex
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L491
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L490:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %edx
	jmp	.L484
.L489:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L491:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE101:
	.size	strobe_plaintext, .-strobe_plaintext
	.section	.text.unlikely.strobe_plaintext
.LCOLDE25:
	.section	.text.strobe_plaintext
.LHOTE25:
	.section	.text.unlikely.strobe_key,"ax",@progbits
.LCOLDB26:
	.section	.text.strobe_key,"ax",@progbits
.LHOTB26:
	.p2align 4,,15
	.globl	strobe_key
	.type	strobe_key, @function
strobe_key:
.LFB102:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$-57, 202(%rdi)
	movb	$1, 7(%rsp)
	ja	.L499
	testb	%cl, %cl
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	je	.L500
	xorl	%ebp, %ebp
	cmpb	$1, 201(%rdi)
	movl	$1, %eax
	setbe	%bpl
	negq	%rbp
.L495:
	movb	%al, 201(%rbx)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	strobe_duplex
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movb	$1, 204(%rbx)
	movq	%rbp, %rax
	jne	.L501
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L500:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %eax
	jmp	.L495
.L499:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L501:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE102:
	.size	strobe_key, .-strobe_key
	.section	.text.unlikely.strobe_key
.LCOLDE26:
	.section	.text.strobe_key
.LHOTE26:
	.section	.text.unlikely.strobe_nonce,"ax",@progbits
.LCOLDB27:
	.section	.text.strobe_nonce,"ax",@progbits
.LHOTB27:
	.p2align 4,,15
	.globl	strobe_nonce
	.type	strobe_nonce, @function
strobe_nonce:
.LFB103:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$-57, 202(%rdi)
	movb	$2, 7(%rsp)
	ja	.L509
	testb	%cl, %cl
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	je	.L510
	xorl	%ebp, %ebp
	testb	$-3, 201(%rdi)
	movl	$2, %eax
	sete	%bpl
	negq	%rbp
.L505:
	movb	%al, 201(%rbx)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	strobe_duplex
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L511
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L510:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %eax
	jmp	.L505
.L509:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L511:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE103:
	.size	strobe_nonce, .-strobe_nonce
	.section	.text.unlikely.strobe_nonce
.LCOLDE27:
	.section	.text.strobe_nonce
.LHOTE27:
	.section	.text.unlikely.strobe_ad,"ax",@progbits
.LCOLDB28:
	.section	.text.strobe_ad,"ax",@progbits
.LHOTB28:
	.p2align 4,,15
	.globl	strobe_ad
	.type	strobe_ad, @function
strobe_ad:
.LFB104:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$-57, 202(%rdi)
	movb	$3, 7(%rsp)
	ja	.L519
	testb	%cl, %cl
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	je	.L520
	movzbl	201(%rdi), %edx
	cmpb	$3, %dl
	setne	%bpl
	testb	%dl, %dl
	setne	%al
	andl	%eax, %ebp
	movl	$3, %eax
	xorl	$1, %ebp
	movzbl	%bpl, %ebp
	negq	%rbp
.L515:
	movb	%al, 201(%rbx)
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	strobe_duplex
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L521
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L520:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %eax
	jmp	.L515
.L519:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L521:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE104:
	.size	strobe_ad, .-strobe_ad
	.section	.text.unlikely.strobe_ad
.LCOLDE28:
	.section	.text.strobe_ad
.LHOTE28:
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"sponge->params->position <= sponge->params->rate"
	.section	.text.unlikely.strobe_produce_auth,"ax",@progbits
.LCOLDB30:
	.section	.text.strobe_produce_auth,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	strobe_produce_auth
	.type	strobe_produce_auth, @function
strobe_produce_auth:
.LFB105:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movb	%dl, -48(%rbp)
	movb	$32, -47(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpb	$1, 207(%rdi)
	sbbl	%eax, %eax
	andl	$-128, %eax
	addl	$6, %eax
	cmpb	$-57, 202(%rdi)
	movb	%al, -46(%rbp)
	ja	.L548
	movq	%rdx, %rbx
	leaq	-48(%rbp), %rdx
	movq	%rdi, %r12
	movl	$3, %ecx
	movq	%rsi, %r13
	xorl	%esi, %esi
	call	strobe_duplex
	movzbl	200(%r12), %eax
	movq	%r12, %rdi
	xorb	$1, (%r12,%rax)
	movzbl	202(%r12), %eax
	xorb	$2, (%r12,%rax)
	movzbl	203(%r12), %esi
	call	keccakf
	movzbl	-46(%rbp), %eax
	xorl	%edx, %edx
	movb	$0, 200(%r12)
	movq	%rbx, %rcx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movb	%al, 201(%r12)
	call	strobe_duplex
	movzbl	202(%r12), %eax
	cmpb	$-57, %al
	ja	.L549
	movzbl	200(%r12), %edx
	cmpb	%dl, %al
	jb	.L550
	movl	$200, %ecx
	subq	%rax, %rcx
	cmpq	$31, %rcx
	jbe	.L551
	addq	$32, %rdx
	cmpq	%rdx, %rax
	jb	.L552
.L536:
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	$0, 24(%r12)
	movb	$32, 200(%r12)
.L530:
	xorl	%eax, %eax
	cmpb	$0, 204(%r12)
	setne	%al
	negq	%rax
	movq	-40(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L553
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L551:
	.cfi_restore_state
	movq	%rsp, %r13
	subq	$32, %rsp
	xorl	%edx, %edx
	movl	$32, %ecx
	movq	%rsp, %rsi
	movq	%r12, %rdi
	call	strobe_duplex
	cmpb	$0, 200(%r12)
	movq	%rsp, %rbx
	jne	.L554
.L528:
	xorl	%edx, %edx
	movl	$32, %ecx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	strobe_duplex
	movl	$32, %edx
	.p2align 4,,10
	.p2align 3
.L529:
	testb	$7, %bl
	je	.L555
	movb	$0, (%rbx)
	addq	$1, %rbx
	subq	$1, %rdx
	jne	.L529
.L534:
	movq	%r13, %rsp
	jmp	.L530
	.p2align 4,,10
	.p2align 3
.L552:
	movzbl	203(%r12), %esi
	movq	%r12, %rdi
	call	keccakf
	jmp	.L536
	.p2align 4,,10
	.p2align 3
.L554:
	movzbl	203(%r12), %esi
	movq	%r12, %rdi
	call	keccakf
	movb	$0, 200(%r12)
	jmp	.L528
	.p2align 4,,10
	.p2align 3
.L555:
	cmpq	$7, %rdx
	jbe	.L539
	leaq	-8(%rdx), %rax
	shrq	$3, %rax
	leaq	8(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L533:
	movq	$0, (%rbx)
	addq	$8, %rbx
	cmpq	%rbx, %rax
	jne	.L533
	andl	$7, %edx
	je	.L534
.L532:
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L535:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L535
	movq	%r13, %rsp
	jmp	.L530
.L539:
	movq	%rbx, %rax
	jmp	.L532
.L553:
	call	__stack_chk_fail@PLT
.L549:
	leaq	__PRETTY_FUNCTION__.4430(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$504, %edx
	call	__assert_fail@PLT
.L550:
	leaq	__PRETTY_FUNCTION__.4430(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	movl	$505, %edx
	call	__assert_fail@PLT
.L548:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE105:
	.size	strobe_produce_auth, .-strobe_produce_auth
	.section	.text.unlikely.strobe_produce_auth
.LCOLDE30:
	.section	.text.strobe_produce_auth
.LHOTE30:
	.section	.text.unlikely.strobe_prng,"ax",@progbits
.LCOLDB31:
	.section	.text.strobe_prng,"ax",@progbits
.LHOTB31:
	.p2align 4,,15
	.globl	strobe_prng
	.type	strobe_prng, @function
strobe_prng:
.LFB106:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpb	$-57, 202(%rdi)
	movb	$8, 7(%rsp)
	ja	.L565
	testb	%cl, %cl
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %r13
	je	.L566
	xorl	%ebp, %ebp
	testb	$-9, 201(%rdi)
	movl	$8, %eax
	sete	%bpl
	negq	%rbp
.L559:
	movb	%al, 201(%rbx)
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movq	%r13, %rcx
	movq	%r12, %rsi
	call	strobe_duplex
	cmpb	$0, 204(%rbx)
	movl	$0, %eax
	cmove	%rax, %rbp
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	movq	%rbp, %rax
	jne	.L567
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L566:
	.cfi_restore_state
	leaq	7(%rsp), %rdx
	movl	$1, %ecx
	xorl	%esi, %esi
	movq	$-1, %rbp
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movb	$0, 200(%rbx)
	movzbl	7(%rsp), %eax
	jmp	.L559
.L565:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L567:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE106:
	.size	strobe_prng, .-strobe_prng
	.section	.text.unlikely.strobe_prng
.LCOLDE31:
	.section	.text.strobe_prng
.LHOTE31:
	.section	.text.unlikely.strobe_verify_auth,"ax",@progbits
.LCOLDB32:
	.section	.text.strobe_verify_auth,"ax",@progbits
.LHOTB32:
	.p2align 4,,15
	.globl	strobe_verify_auth
	.type	strobe_verify_auth, @function
strobe_verify_auth:
.LFB107:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movb	%dl, -64(%rbp)
	movb	$32, -63(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	cmpb	$1, 207(%rdi)
	sbbl	%eax, %eax
	andl	$-128, %eax
	subl	$122, %eax
	cmpb	$-57, 202(%rdi)
	movb	%al, -62(%rbp)
	ja	.L601
	movq	%rdx, %r13
	leaq	-64(%rbp), %rdx
	movq	%rdi, %r12
	movl	$3, %ecx
	movq	%rsi, %rbx
	xorl	%esi, %esi
	call	strobe_duplex
	movzbl	200(%r12), %eax
	movq	%r12, %rdi
	xorb	$1, (%r12,%rax)
	movzbl	202(%r12), %eax
	xorb	$2, (%r12,%rax)
	movzbl	203(%r12), %esi
	call	keccakf
	movzbl	-62(%rbp), %eax
	movb	$0, 200(%r12)
	movq	%r13, %rcx
	movq	%rbx, %rdx
	movq	%r12, %rdi
	movb	%al, 201(%r12)
	leaq	15(%r13), %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %rsi
	movq	%rsp, %r15
	call	strobe_unduplex
	movzbl	202(%r12), %eax
	cmpb	$-57, %al
	ja	.L602
	movzbl	200(%r12), %edx
	cmpb	%dl, %al
	jb	.L603
	movl	$200, %ecx
	subq	%rax, %rcx
	cmpq	$31, %rcx
	jbe	.L604
	addq	$32, %rdx
	cmpq	%rdx, %rax
	jb	.L605
.L582:
	movq	$0, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movq	$0, 24(%r12)
	movb	$32, 200(%r12)
.L576:
	testq	%r13, %r13
	movq	$-1, %rax
	je	.L583
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L584:
	movzbl	(%r15,%rax), %eax
	orq	%rax, %rcx
	leal	1(%rdx), %eax
	cmpq	%rax, %r13
	movq	%rax, %rdx
	ja	.L584
	movq	%rcx, %rax
	xorl	%edx, %edx
	addq	$-1, %rax
	adcq	$-1, %rdx
	movq	%rdx, %rax
.L583:
	cmpb	$0, 204(%r12)
	movl	$0, %edx
	cmove	%rdx, %rax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L606
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L604:
	.cfi_restore_state
	movq	%rsp, %r14
	subq	$32, %rsp
	xorl	%edx, %edx
	movl	$32, %ecx
	movq	%rsp, %rsi
	movq	%r12, %rdi
	call	strobe_duplex
	cmpb	$0, 200(%r12)
	movq	%rsp, %rbx
	jne	.L607
.L574:
	xorl	%edx, %edx
	movl	$32, %ecx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	strobe_duplex
	movl	$32, %edx
	.p2align 4,,10
	.p2align 3
.L575:
	testb	$7, %bl
	je	.L608
	movb	$0, (%rbx)
	addq	$1, %rbx
	subq	$1, %rdx
	jne	.L575
.L580:
	movq	%r14, %rsp
	jmp	.L576
	.p2align 4,,10
	.p2align 3
.L605:
	movzbl	203(%r12), %esi
	movq	%r12, %rdi
	call	keccakf
	jmp	.L582
	.p2align 4,,10
	.p2align 3
.L607:
	movzbl	203(%r12), %esi
	movq	%r12, %rdi
	call	keccakf
	movb	$0, 200(%r12)
	jmp	.L574
	.p2align 4,,10
	.p2align 3
.L608:
	cmpq	$7, %rdx
	jbe	.L588
	leaq	-8(%rdx), %rax
	shrq	$3, %rax
	leaq	8(%rbx,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L579:
	movq	$0, (%rbx)
	addq	$8, %rbx
	cmpq	%rax, %rbx
	jne	.L579
	andl	$7, %edx
	je	.L580
.L578:
	addq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L581:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rax, %rdx
	jne	.L581
	movq	%r14, %rsp
	jmp	.L576
.L588:
	movq	%rbx, %rax
	jmp	.L578
.L606:
	call	__stack_chk_fail@PLT
.L602:
	leaq	__PRETTY_FUNCTION__.4430(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$504, %edx
	call	__assert_fail@PLT
.L603:
	leaq	__PRETTY_FUNCTION__.4430(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC29(%rip), %rdi
	movl	$505, %edx
	call	__assert_fail@PLT
.L601:
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE107:
	.size	strobe_verify_auth, .-strobe_verify_auth
	.section	.text.unlikely.strobe_verify_auth
.LCOLDE32:
	.section	.text.strobe_verify_auth
.LHOTE32:
	.section	.text.unlikely.strobe_respec,"ax",@progbits
.LCOLDB33:
	.section	.text.strobe_respec,"ax",@progbits
.LHOTB33:
	.p2align 4,,15
	.globl	strobe_respec
	.type	strobe_respec, @function
strobe_respec:
.LFB108:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movzbl	2(%rsi), %eax
	cmpb	$-57, 202(%rdi)
	movb	$11, 2(%rsp)
	movb	%al, (%rsp)
	movzbl	3(%rsi), %eax
	movb	%al, 1(%rsp)
	ja	.L614
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movq	%rsp, %rdx
	movl	$3, %ecx
	xorl	%esi, %esi
	call	strobe_duplex
	movzbl	200(%rbx), %eax
	movq	%rbx, %rdi
	xorb	$1, (%rbx,%rax)
	movzbl	202(%rbx), %eax
	xorb	$2, (%rbx,%rax)
	movzbl	203(%rbx), %esi
	call	keccakf
	movzbl	2(%rsp), %eax
	movb	$0, 200(%rbx)
	movb	%al, 201(%rbx)
	movzbl	2(%rbp), %edx
	xorl	%eax, %eax
	cmpb	$0, 204(%rbx)
	movb	%dl, 202(%rbx)
	movzbl	3(%rbp), %edx
	setne	%al
	negq	%rax
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	movb	%dl, 203(%rbx)
	jne	.L615
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L614:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.4471(%rip), %rcx
	leaq	.LC1(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	movl	$565, %edx
	call	__assert_fail@PLT
.L615:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE108:
	.size	strobe_respec, .-strobe_respec
	.section	.text.unlikely.strobe_respec
.LCOLDE33:
	.section	.text.strobe_respec
.LHOTE33:
	.section	.rodata.__PRETTY_FUNCTION__.4430,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4430, @object
	.size	__PRETTY_FUNCTION__.4430, 14
__PRETTY_FUNCTION__.4430:
	.string	"strobe_forget"
	.section	.rodata.__PRETTY_FUNCTION__.4439,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.4439, @object
	.size	__PRETTY_FUNCTION__.4439, 16
__PRETTY_FUNCTION__.4439:
	.string	"strobe_unduplex"
	.section	.rodata.__PRETTY_FUNCTION__.4414,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4414, @object
	.size	__PRETTY_FUNCTION__.4414, 14
__PRETTY_FUNCTION__.4414:
	.string	"strobe_duplex"
	.section	.rodata.__PRETTY_FUNCTION__.4471,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.4471, @object
	.size	__PRETTY_FUNCTION__.4471, 20
__PRETTY_FUNCTION__.4471:
	.string	"strobe_control_word"
	.section	.rodata.__PRETTY_FUNCTION__.4355,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4355, @object
	.size	__PRETTY_FUNCTION__.4355, 15
__PRETTY_FUNCTION__.4355:
	.string	"spongerng_stir"
	.section	.bss.have_rdrand.4316,"aw",@nobits
	.type	have_rdrand.4316, @object
	.size	have_rdrand.4316, 1
have_rdrand.4316:
	.zero	1
	.section	.bss.tested.4315,"aw",@nobits
	.type	tested.4315, @object
	.size	tested.4315, 1
tested.4315:
	.zero	1
	.section	.rodata.__PRETTY_FUNCTION__.4337,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4337, @object
	.size	__PRETTY_FUNCTION__.4337, 15
__PRETTY_FUNCTION__.4337:
	.string	"spongerng_next"
	.section	.rodata.__PRETTY_FUNCTION__.4261,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4261, @object
	.size	__PRETTY_FUNCTION__.4261, 12
__PRETTY_FUNCTION__.4261:
	.string	"sha3_output"
	.section	.rodata.__PRETTY_FUNCTION__.4243,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.4243, @object
	.size	__PRETTY_FUNCTION__.4243, 12
__PRETTY_FUNCTION__.4243:
	.string	"sha3_update"
	.globl	STROBE_KEYED_128
	.section	.rodata.STROBE_KEYED_128,"a",@progbits
	.align 8
	.type	STROBE_KEYED_128, @object
	.size	STROBE_KEYED_128, 8
STROBE_KEYED_128:
	.byte	0
	.byte	0
	.byte	-88
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	STROBE_KEYED_256
	.section	.rodata.STROBE_KEYED_256,"a",@progbits
	.align 8
	.type	STROBE_KEYED_256, @object
	.size	STROBE_KEYED_256, 8
STROBE_KEYED_256:
	.byte	0
	.byte	0
	.byte	-120
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	STROBE_256
	.section	.rodata.STROBE_256,"a",@progbits
	.align 8
	.type	STROBE_256, @object
	.size	STROBE_256, 8
STROBE_256:
	.byte	0
	.byte	0
	.byte	-120
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	STROBE_128
	.section	.rodata.STROBE_128,"a",@progbits
	.align 8
	.type	STROBE_128, @object
	.size	STROBE_128, 8
STROBE_128:
	.byte	0
	.byte	0
	.byte	-88
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.rodata.spongerng_params,"a",@progbits
	.align 8
	.type	spongerng_params, @object
	.size	spongerng_params, 8
spongerng_params:
	.byte	0
	.byte	117
	.byte	-120
	.byte	0
	.byte	6
	.byte	-128
	.byte	-1
	.byte	0
	.globl	SHA3_512_params_s
	.section	.rodata.SHA3_512_params_s,"a",@progbits
	.align 8
	.type	SHA3_512_params_s, @object
	.size	SHA3_512_params_s, 8
SHA3_512_params_s:
	.byte	0
	.byte	65
	.byte	72
	.byte	0
	.byte	6
	.byte	-128
	.byte	64
	.byte	0
	.globl	SHA3_384_params_s
	.section	.rodata.SHA3_384_params_s,"a",@progbits
	.align 8
	.type	SHA3_384_params_s, @object
	.size	SHA3_384_params_s, 8
SHA3_384_params_s:
	.byte	0
	.byte	65
	.byte	104
	.byte	0
	.byte	6
	.byte	-128
	.byte	48
	.byte	0
	.globl	SHA3_256_params_s
	.section	.rodata.SHA3_256_params_s,"a",@progbits
	.align 8
	.type	SHA3_256_params_s, @object
	.size	SHA3_256_params_s, 8
SHA3_256_params_s:
	.byte	0
	.byte	65
	.byte	-120
	.byte	0
	.byte	6
	.byte	-128
	.byte	32
	.byte	0
	.globl	SHA3_224_params_s
	.section	.rodata.SHA3_224_params_s,"a",@progbits
	.align 8
	.type	SHA3_224_params_s, @object
	.size	SHA3_224_params_s, 8
SHA3_224_params_s:
	.byte	0
	.byte	65
	.byte	-112
	.byte	0
	.byte	6
	.byte	-128
	.byte	28
	.byte	0
	.globl	SHAKE256_params_s
	.section	.rodata.SHAKE256_params_s,"a",@progbits
	.align 8
	.type	SHAKE256_params_s, @object
	.size	SHAKE256_params_s, 8
SHAKE256_params_s:
	.byte	0
	.byte	65
	.byte	-120
	.byte	0
	.byte	31
	.byte	-128
	.byte	-1
	.byte	0
	.globl	SHAKE128_params_s
	.section	.rodata.SHAKE128_params_s,"a",@progbits
	.align 8
	.type	SHAKE128_params_s, @object
	.size	SHAKE128_params_s, 8
SHAKE128_params_s:
	.byte	0
	.byte	65
	.byte	-88
	.byte	0
	.byte	31
	.byte	-128
	.byte	-1
	.byte	0
	.section	.rodata.RC,"a",@progbits
	.align 32
	.type	RC, @object
	.size	RC, 192
RC:
	.quad	1
	.quad	32898
	.quad	-9223372036854742902
	.quad	-9223372034707259392
	.quad	32907
	.quad	2147483649
	.quad	-9223372034707259263
	.quad	-9223372036854743031
	.quad	138
	.quad	136
	.quad	2147516425
	.quad	2147483658
	.quad	2147516555
	.quad	-9223372036854775669
	.quad	-9223372036854742903
	.quad	-9223372036854743037
	.quad	-9223372036854743038
	.quad	-9223372036854775680
	.quad	32778
	.quad	-9223372034707292150
	.quad	-9223372034707259263
	.quad	-9223372036854742912
	.quad	2147483649
	.quad	-9223372034707259384
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
