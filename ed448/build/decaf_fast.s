	.file	"decaf_fast.c"
	.section	.text.unlikely.gf_add,"ax",@progbits
.LCOLDB1:
	.section	.text.gf_add,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.type	gf_add, @function
gf_add:
.LFB4640:
	.cfi_startproc
	vmovdqa	(%rsi), %ymm0
	movabsq	$72057594037927935, %rax
	movq	%rax, %r8
	vpaddq	(%rdx), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	andq	24(%rdi), %r8
	vmovdqa	32(%rsi), %ymm0
	movq	16(%rdi), %rsi
	vpaddq	32(%rdx), %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %ecx
	addq	%rcx, 32(%rdi)
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	addq	%r8, %rdx
	vmovdqu	24(%rdi), %xmm0
	movq	%rdx, 24(%rdi)
	movq	8(%rdi), %rdx
	vinserti128	$0x1, 40(%rdi), %ymm0, %ymm2
	vpermq	$27, 32(%rdi), %ymm0
	movq	%rdx, %r8
	shrq	$56, %r8
	andq	%rax, %rdx
	andq	(%rdi), %rax
	addq	%r8, %rsi
	movq	%rsi, 16(%rdi)
	movl	$56, %esi
	shrx	%rsi, (%rdi), %rsi
	vpand	.LC0(%rip), %ymm0, %ymm1
	addq	%rcx, %rax
	movq	%rax, (%rdi)
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 8(%rdi)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE4640:
	.size	gf_add, .-gf_add
	.section	.text.unlikely.gf_add
.LCOLDE1:
	.section	.text.gf_add
.LHOTE1:
	.section	.text.unlikely.gf_sub,"ax",@progbits
.LCOLDB4:
	.section	.text.gf_sub,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.type	gf_sub, @function
gf_sub:
.LFB4641:
	.cfi_startproc
	vmovdqa	(%rsi), %ymm0
	movabsq	$72057594037927935, %rax
	movq	%rax, %r8
	vpsubq	(%rdx), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	vpaddq	.LC2(%rip), %ymm0, %ymm0
	vmovdqa	32(%rsi), %ymm1
	vpsubq	32(%rdx), %ymm1, %ymm1
	vmovdqa	%ymm0, (%rdi)
	vpaddq	.LC3(%rip), %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %ecx
	movq	16(%rdi), %rsi
	addq	%rcx, 32(%rdi)
	andq	24(%rdi), %r8
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	vmovdqu	24(%rdi), %xmm0
	addq	%r8, %rdx
	movq	%rdx, 24(%rdi)
	movq	8(%rdi), %rdx
	vinserti128	$0x1, 40(%rdi), %ymm0, %ymm2
	vpermq	$27, 32(%rdi), %ymm0
	movq	%rdx, %r8
	shrq	$56, %r8
	andq	%rax, %rdx
	andq	(%rdi), %rax
	addq	%r8, %rsi
	movq	%rsi, 16(%rdi)
	movl	$56, %esi
	shrx	%rsi, (%rdi), %rsi
	vpand	.LC0(%rip), %ymm0, %ymm1
	addq	%rcx, %rax
	movq	%rax, (%rdi)
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 8(%rdi)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE4641:
	.size	gf_sub, .-gf_sub
	.section	.text.unlikely.gf_sub
.LCOLDE4:
	.section	.text.gf_sub
.LHOTE4:
	.section	.text.unlikely.niels_to_pt,"ax",@progbits
.LCOLDB5:
	.section	.text.niels_to_pt,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.type	niels_to_pt, @function
niels_to_pt:
.LFB4684:
	.cfi_startproc
	leaq	64(%rsi), %r11
	leaq	64(%rdi), %r10
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %r9
	movq	%rdi, %rbx
	movq	%rsi, %rdx
	movq	%r10, %rdi
	movq	%r11, %rsi
	call	gf_add
	movq	%rbx, %rdi
	movq	%r9, %rdx
	movq	%r11, %rsi
	call	gf_sub
	leaq	192(%rbx), %rdi
	movq	%rbx, %rdx
	movq	%r10, %rsi
	call	p448_mul@PLT
	movq	ONE(%rip), %rax
	movq	%rax, 128(%rbx)
	movq	8+ONE(%rip), %rax
	movq	%rax, 136(%rbx)
	movq	16+ONE(%rip), %rax
	movq	%rax, 144(%rbx)
	movq	24+ONE(%rip), %rax
	movq	%rax, 152(%rbx)
	movq	32+ONE(%rip), %rax
	movq	%rax, 160(%rbx)
	movq	40+ONE(%rip), %rax
	movq	%rax, 168(%rbx)
	movq	48+ONE(%rip), %rax
	movq	%rax, 176(%rbx)
	movq	56+ONE(%rip), %rax
	movq	%rax, 184(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4684:
	.size	niels_to_pt, .-niels_to_pt
	.section	.text.unlikely.niels_to_pt
.LCOLDE5:
	.section	.text.niels_to_pt
.LHOTE5:
	.section	.text.unlikely.add_niels_to_pt,"ax",@progbits
.LCOLDB6:
	.section	.text.add_niels_to_pt,"ax",@progbits
.LHOTB6:
	.p2align 4,,15
	.type	add_niels_to_pt, @function
add_niels_to_pt:
.LFB4685:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-208(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-272(%rbp), %r15
	leaq	64(%rdi), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rsi, %r12
	subq	$320, %rsp
	movq	%rdx, -288(%rbp)
	movq	%r14, %rdx
	vmovdqa	96(%rdi), %ymm0
	vmovdqa	64(%rdi), %ymm1
	vmovdqa	.LC2(%rip), %ymm4
	vpsubq	32(%rdi), %ymm0, %ymm0
	vmovdqa	.LC3(%rip), %ymm3
	vpsubq	(%rdi), %ymm1, %ymm1
	movq	%r15, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpaddq	%ymm4, %ymm1, %ymm1
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm4, -368(%rbp)
	vmovdqa	%ymm1, -208(%rbp)
	vmovdqa	%ymm3, -336(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	(%rbx), %ymm0
	leaq	64(%r12), %rsi
	movq	%r14, %rdx
	movq	%r13, %rdi
	vpaddq	64(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	32(%rbx), %ymm0
	vpaddq	96(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	leaq	192(%rbx), %rax
	leaq	128(%r12), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	movq	%rax, -280(%rbp)
	call	p448_mul@PLT
	vmovdqa	-272(%rbp), %ymm5
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	64(%rbx), %ymm1
	movq	%r15, %rsi
	vmovdqa	-240(%rbp), %ymm2
	vpaddq	%ymm1, %ymm5, %ymm0
	vmovdqa	-368(%rbp), %ymm4
	vpsubq	%ymm5, %ymm1, %ymm1
	vmovdqa	-336(%rbp), %ymm3
	vmovdqa	%ymm0, -144(%rbp)
	vpaddq	%ymm4, %ymm1, %ymm1
	vmovdqa	96(%rbx), %ymm0
	vmovdqa	32(%rbx), %ymm5
	vpaddq	%ymm0, %ymm2, %ymm6
	vmovdqa	%ymm1, -208(%rbp)
	vpsubq	%ymm2, %ymm0, %ymm0
	vmovdqa	128(%rbx), %ymm1
	vpaddq	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm6, -112(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vmovdqa	(%rbx), %ymm6
	vmovdqa	160(%rbx), %ymm0
	vpsubq	%ymm6, %ymm1, %ymm2
	vpaddq	%ymm6, %ymm1, %ymm1
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	%ymm2, 64(%rbx)
	vpsubq	%ymm5, %ymm0, %ymm2
	vpaddq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm3, %ymm2, %ymm2
	vmovdqa	%ymm0, -240(%rbp)
	vmovdqa	%ymm2, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	%rbx, %rdi
	leaq	-144(%rbp), %rbx
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-288(%rbp), %rcx
	movq	-280(%rbp), %rax
	testq	%rcx, %rcx
	jne	.L5
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	p448_mul@PLT
.L5:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L11
	addq	$320, %rsp
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
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4685:
	.size	add_niels_to_pt, .-add_niels_to_pt
	.section	.text.unlikely.add_niels_to_pt
.LCOLDE6:
	.section	.text.add_niels_to_pt
.LHOTE6:
	.section	.text.unlikely.sub_niels_from_pt,"ax",@progbits
.LCOLDB7:
	.section	.text.sub_niels_from_pt,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.type	sub_niels_from_pt, @function
sub_niels_from_pt:
.LFB4686:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-208(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-272(%rbp), %r15
	leaq	64(%rdi), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rsi, %r12
	subq	$320, %rsp
	addq	$64, %rsi
	movq	%rdx, -288(%rbp)
	vmovdqa	96(%rdi), %ymm2
	movq	%r14, %rdx
	vmovdqa	64(%rdi), %ymm0
	vmovdqa	.LC2(%rip), %ymm5
	vpsubq	32(%rdi), %ymm2, %ymm2
	vmovdqa	.LC3(%rip), %ymm4
	vpsubq	(%rdi), %ymm0, %ymm0
	movq	%r15, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpaddq	%ymm5, %ymm0, %ymm0
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	%ymm5, -368(%rbp)
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	%ymm4, -336(%rbp)
	vmovdqa	%ymm2, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	(%rbx), %ymm0
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	vpaddq	64(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -208(%rbp)
	vmovdqa	32(%rbx), %ymm0
	vpaddq	96(%rbx), %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	leaq	192(%rbx), %rax
	leaq	128(%r12), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	movq	%rax, -280(%rbp)
	call	p448_mul@PLT
	vmovdqa	-272(%rbp), %ymm1
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	64(%rbx), %ymm3
	movq	%r15, %rsi
	vmovdqa	-368(%rbp), %ymm5
	vpaddq	%ymm3, %ymm1, %ymm0
	vmovdqa	96(%rbx), %ymm2
	vpsubq	%ymm1, %ymm3, %ymm3
	vmovdqa	-336(%rbp), %ymm4
	vpaddq	%ymm5, %ymm3, %ymm3
	vmovdqa	128(%rbx), %ymm1
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	%ymm3, -208(%rbp)
	vmovdqa	-240(%rbp), %ymm0
	vmovdqa	(%rbx), %ymm3
	vpaddq	%ymm2, %ymm0, %ymm6
	vpsubq	%ymm0, %ymm2, %ymm2
	vpaddq	%ymm4, %ymm2, %ymm2
	vpaddq	%ymm3, %ymm1, %ymm0
	vmovdqa	%ymm2, -176(%rbp)
	vpsubq	%ymm3, %ymm1, %ymm1
	vmovdqa	32(%rbx), %ymm2
	vpaddq	%ymm5, %ymm1, %ymm1
	vmovdqa	%ymm0, 64(%rbx)
	vmovdqa	160(%rbx), %ymm0
	vmovdqa	%ymm6, -112(%rbp)
	vmovdqa	%ymm1, -272(%rbp)
	vpaddq	%ymm2, %ymm0, %ymm6
	vpsubq	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm6, 96(%rbx)
	vpaddq	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%rbx, %rdi
	leaq	-144(%rbp), %rbx
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-288(%rbp), %rcx
	movq	-280(%rbp), %rax
	testq	%rcx, %rcx
	jne	.L12
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rax, %rdi
	call	p448_mul@PLT
.L12:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L17
	addq	$320, %rsp
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
.L17:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4686:
	.size	sub_niels_from_pt, .-sub_niels_from_pt
	.section	.text.unlikely.sub_niels_from_pt
.LCOLDE7:
	.section	.text.sub_niels_from_pt
.LHOTE7:
	.section	.text.unlikely.gf_eq,"ax",@progbits
.LCOLDB8:
	.section	.text.gf_eq,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.type	gf_eq, @function
gf_eq:
.LFB4651:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rsi, %rdx
	movq	%rdi, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	leaq	-112(%rbp), %r9
	subq	$104, %rsp
	movq	%r9, %rdi
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	gf_sub
	movq	%r9, %rdi
	call	p448_strong_reduce@PLT
	vmovdqa	-80(%rbp), %ymm0
	vpxor	%xmm2, %xmm2, %xmm2
	xorl	%edx, %edx
	vpor	-112(%rbp), %ymm0, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm1
	vpor	%ymm0, %ymm1, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm2
	vpalignr	$8, %ymm0, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovq	%xmm0, %rax
	addq	$-1, %rax
	adcq	$-1, %rdx
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L21
	movq	%rdx, %rax
	vzeroupper
	addq	$104, %rsp
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L21:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4651:
	.size	gf_eq, .-gf_eq
	.section	.text.unlikely.gf_eq
.LCOLDE8:
	.section	.text.gf_eq
.LHOTE8:
	.section	.text.unlikely.point_double_internal,"ax",@progbits
.LCOLDB13:
	.section	.text.point_double_internal,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.type	point_double_internal, @function
point_double_internal:
.LFB4671:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-336(%rbp), %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	-208(%rbp), %rdi
	movq	%rsi, %r12
	leaq	192(%rbx), %r13
	subq	$320, %rsp
	movq	%rdx, -344(%rbp)
	leaq	-272(%rbp), %r14
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	64(%r12), %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	vmovdqa	-208(%rbp), %ymm0
	movq	%r13, %rsi
	movq	%r14, %rdi
	vpaddq	-336(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	-176(%rbp), %ymm0
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	64(%r12), %ymm0
	vpaddq	(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%r12), %ymm0
	vpaddq	32(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	-240(%rbp), %ymm0
	leaq	128(%r12), %rsi
	movq	%rbx, %rdi
	vmovdqa	-272(%rbp), %ymm1
	vpsubq	-112(%rbp), %ymm0, %ymm0
	vpaddq	.LC10(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vmovdqa	-304(%rbp), %ymm0
	vpaddq	.LC9(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	-336(%rbp), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	.LC3(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vpaddq	.LC2(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm1
	movq	%r14, %rdx
	movq	%r15, %rsi
	vmovdqa	32(%rbx), %ymm0
	movq	%rbx, %rdi
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	vpsubq	192(%rbx), %ymm1, %ymm1
	vpaddq	%ymm0, %ymm0, %ymm0
	vpaddq	.LC11(%rip), %ymm1, %ymm1
	vmovdqa	%ymm0, 160(%rbx)
	vmovdqa	%ymm1, -336(%rbp)
	vpsubq	224(%rbx), %ymm0, %ymm0
	vpaddq	.LC12(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r12
	call	p448_mul@PLT
	leaq	128(%rbx), %rdi
	movq	%r15, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	leaq	64(%rbx), %rdi
	movq	%r12, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	-344(%rbp), %rax
	testq	%rax, %rax
	jne	.L22
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
.L22:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L27
	addq	$320, %rsp
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
.L27:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4671:
	.size	point_double_internal, .-point_double_internal
	.section	.text.unlikely.point_double_internal
.LCOLDE13:
	.section	.text.point_double_internal
.LHOTE13:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC14:
	.string	"src/decaf_fast.c"
.LC15:
	.string	"n>1"
	.section	.text.unlikely.gf_batch_invert,"ax",@progbits
.LCOLDB16:
	.section	.text.gf_batch_invert,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
	.type	gf_batch_invert, @function
gf_batch_invert:
.LFB4700:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$192, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, -212(%rbp)
	movq	%fs:40, %rcx
	movq	%rcx, -56(%rbp)
	xorl	%ecx, %ecx
	cmpl	$1, %edx
	jbe	.L43
	movl	%edx, %eax
	movq	(%rsi), %rdx
	movq	%rdi, %r14
	subl	$1, %eax
	movq	%rsi, %r12
	cmpl	$1, %eax
	movl	%eax, -216(%rbp)
	movq	%rdx, 64(%rdi)
	movq	8(%rsi), %rdx
	movq	%rdx, 72(%rdi)
	movq	16(%rsi), %rdx
	movq	%rdx, 80(%rdi)
	movq	24(%rsi), %rdx
	movq	%rdx, 88(%rdi)
	movq	32(%rsi), %rdx
	movq	%rdx, 96(%rdi)
	movq	40(%rsi), %rdx
	movq	%rdx, 104(%rdi)
	movq	48(%rsi), %rdx
	movq	%rdx, 112(%rdi)
	movq	56(%rsi), %rdx
	movq	%rdx, 120(%rdi)
	jle	.L44
	movl	-212(%rbp), %eax
	leaq	64(%rdi), %r15
	leaq	64(%rsi), %r13
	leal	-3(%rax), %ebx
	addq	$2, %rbx
	salq	$6, %rbx
	addq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%r15, %rsi
	addq	$64, %r15
	movq	%r13, %rdx
	movq	%r15, %rdi
	addq	$64, %r13
	call	p448_mul@PLT
	cmpq	%rbx, %r15
	jne	.L33
	movl	-216(%rbp), %esi
	leaq	-208(%rbp), %r15
	leaq	-144(%rbp), %rbx
	movq	%r14, %rdi
	salq	$6, %rsi
	leaq	(%r12,%rsi), %rdx
	addq	%r14, %rsi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	movq	%rdx, (%r14)
	movq	-136(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-120(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-112(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-104(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-96(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-88(%rbp), %rdx
	movq	%rdx, 56(%r14)
.L31:
	movslq	-216(%rbp), %r13
	movl	-212(%rbp), %eax
	movq	%r13, %rdx
	salq	$6, %rdx
	leaq	(%r14,%rdx), %r15
	addq	%rdx, %r12
	leal	-2(%rax), %edx
	subq	%rdx, %r13
	salq	$6, %r13
	leaq	-64(%r14,%r13), %r13
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%r15, %rsi
	movq	%r14, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	subq	$64, %r15
	movq	%rdx, 64(%r15)
	movq	-136(%rbp), %rdx
	movq	%rdx, 72(%r15)
	movq	-128(%rbp), %rdx
	movq	%rdx, 80(%r15)
	movq	-120(%rbp), %rdx
	movq	%rdx, 88(%r15)
	movq	-112(%rbp), %rdx
	movq	%rdx, 96(%r15)
	movq	-104(%rbp), %rdx
	movq	%rdx, 104(%r15)
	movq	-96(%rbp), %rdx
	movq	%rdx, 112(%r15)
	movq	-88(%rbp), %rdx
	movq	%rdx, 120(%r15)
	movq	%r12, %rdx
	subq	$64, %r12
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	cmpq	%r13, %r15
	movq	%rdx, (%r14)
	movq	-136(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-120(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-112(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-104(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-96(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-88(%rbp), %rdx
	movq	%rdx, 56(%r14)
	jne	.L35
.L28:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L45
	addq	$192, %rsp
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
.L44:
	.cfi_restore_state
	movl	%eax, %ecx
	leaq	-208(%rbp), %r15
	leaq	-144(%rbp), %rbx
	salq	$6, %rcx
	movl	%eax, %r13d
	leaq	(%rsi,%rcx), %rdx
	leaq	(%rdi,%rcx), %rsi
	call	p448_mul@PLT
	movq	%r14, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	testl	%r13d, %r13d
	movq	%rdx, (%r14)
	movq	-136(%rbp), %rdx
	movq	%rdx, 8(%r14)
	movq	-128(%rbp), %rdx
	movq	%rdx, 16(%r14)
	movq	-120(%rbp), %rdx
	movq	%rdx, 24(%r14)
	movq	-112(%rbp), %rdx
	movq	%rdx, 32(%r14)
	movq	-104(%rbp), %rdx
	movq	%rdx, 40(%r14)
	movq	-96(%rbp), %rdx
	movq	%rdx, 48(%r14)
	movq	-88(%rbp), %rdx
	movq	%rdx, 56(%r14)
	jle	.L28
	jmp	.L31
.L45:
	call	__stack_chk_fail@PLT
.L43:
	leaq	__PRETTY_FUNCTION__.27891(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC15(%rip), %rdi
	movl	$1185, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4700:
	.size	gf_batch_invert, .-gf_batch_invert
	.section	.text.unlikely.gf_batch_invert
.LCOLDE16:
	.section	.text.gf_batch_invert
.LHOTE16:
	.section	.text.unlikely.sc_halve.constprop.8,"ax",@progbits
.LCOLDB17:
	.section	.text.sc_halve.constprop.8,"ax",@progbits
.LHOTB17:
	.p2align 4,,15
	.type	sc_halve.constprop.8, @function
sc_halve.constprop.8:
.LFB4723:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movabsq	$2556006723728458995, %r8
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
	xorl	%r10d, %r10d
	movq	(%rsi), %rax
	movq	%rax, %rcx
	movq	%rax, %r9
	andl	$1, %ecx
	negq	%rcx
	andq	%rcx, %r8
	leaq	(%rax,%r8), %rdx
	movq	%r8, %rax
	movabsq	$2408513697996967765, %r8
	movq	%rdx, (%rdi)
	xorl	%edx, %edx
	addq	%r9, %rax
	adcq	%r10, %rdx
	andq	%rcx, %r8
	xorl	%r10d, %r10d
	movq	%rdx, %rax
	xorl	%edx, %edx
	movq	%rax, %r13
	movq	8(%rsi), %rax
	movq	%rdx, %r14
	xorl	%edx, %edx
	addq	%r8, %rax
	movabsq	$-4301259484579875184, %r8
	adcq	%r10, %rdx
	addq	%r13, %rax
	adcq	%r14, %rdx
	movq	%rax, 8(%rdi)
	andq	%rcx, %r8
	movq	%rdx, %rax
	xorl	%edx, %edx
	xorl	%r14d, %r14d
	movq	%rax, %r9
	movq	16(%rsi), %rax
	movq	%rdx, %r10
	xorl	%edx, %edx
	vmovdqa	(%rdi), %xmm0
	addq	%r8, %rax
	movabsq	$-2201345047, %r8
	adcq	%r14, %rdx
	addq	%r9, %rax
	movq	%rcx, %r9
	adcq	%r10, %rdx
	movq	%rax, 16(%rdi)
	andq	%rcx, %r8
	movq	%rdx, %rax
	xorl	%edx, %edx
	xorl	%r10d, %r10d
	movq	%rax, %r11
	movq	24(%rsi), %rax
	movq	%rdx, %r12
	xorl	%edx, %edx
	addq	%r8, %rax
	adcq	%r10, %rdx
	addq	%r11, %rax
	adcq	%r12, %rdx
	movq	%rax, 24(%rdi)
	xorl	%r10d, %r10d
	movq	%rdx, %rax
	xorl	%edx, %edx
	movq	%rax, %r11
	movq	32(%rsi), %rax
	movq	%rdx, %r12
	vinserti128	$0x1, 16(%rdi), %ymm0, %ymm0
	xorl	%edx, %edx
	addq	%rcx, %rax
	adcq	%r10, %rdx
	addq	%r11, %rax
	movq	%rax, 32(%rdi)
	movq	40(%rsi), %r11
	adcq	%r12, %rdx
	vpsrlq	$1, %ymm0, %ymm1
	xorl	%r14d, %r14d
	vmovdqu	8(%rdi), %xmm0
	xorl	%r12d, %r12d
	addq	%r11, %r9
	vinserti128	$0x1, 24(%rdi), %ymm0, %ymm0
	adcq	%r12, %r10
	addq	%rdx, %r9
	movabsq	$4611686018427387903, %rdx
	movq	%r9, 40(%rdi)
	movq	48(%rsi), %r11
	adcq	%r14, %r10
	xorl	%r12d, %r12d
	andq	%rdx, %rcx
	xorl	%r14d, %r14d
	movq	%r12, -56(%rbp)
	xorl	%r12d, %r12d
	movq	%r10, -64(%rbp)
	addq	%rcx, %r11
	vpsllq	$63, %ymm0, %ymm0
	movq	%r9, %rcx
	adcq	%r14, %r12
	addq	-64(%rbp), %r11
	vpor	%ymm0, %ymm1, %ymm0
	adcq	-56(%rbp), %r12
	salq	$63, %rcx
	shrq	%rax
	shrq	%r9
	orq	%rcx, %rax
	vmovaps	%xmm0, (%rdi)
	vextracti128	$0x1, %ymm0, 16(%rdi)
	movq	%rax, 32(%rdi)
	movq	%r11, %rax
	movq	%r11, %rdx
	salq	$63, %rax
	shrq	%rdx
	orq	%rax, %r9
	movq	%r12, %rax
	movq	%rdx, %rcx
	salq	$63, %rax
	movq	%r9, 40(%rdi)
	orq	%rcx, %rax
	movq	%rax, 48(%rdi)
	vzeroupper
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4723:
	.size	sc_halve.constprop.8, .-sc_halve.constprop.8
	.section	.text.unlikely.sc_halve.constprop.8
.LCOLDE17:
	.section	.text.sc_halve.constprop.8
.LHOTE17:
	.section	.text.unlikely.sc_subx.constprop.9,"ax",@progbits
.LCOLDB18:
	.section	.text.sc_subx.constprop.9,"ax",@progbits
.LHOTB18:
	.p2align 4,,15
	.type	sc_subx.constprop.9, @function
sc_subx.constprop.9:
.LFB4722:
	.cfi_startproc
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
	movq	%rdx, %r8
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%r10d, %r10d
	movq	(%rsi), %rbp
	movq	(%rdx), %rcx
	xorl	%edx, %edx
	movq	%rbp, %r9
	subq	%rcx, %r9
	sbbq	%rdx, %r10
	subq	%rcx, %rbp
	movq	%rbp, (%rdi)
	movq	8(%rsi), %rax
	movq	%r10, %rdx
	movq	8(%r8), %rcx
	sarq	$63, %rdx
	movq	%r10, %r9
	movq	%rdx, %r10
	xorl	%edx, %edx
	addq	%r9, %rax
	adcq	%r10, %rdx
	xorl	%ebx, %ebx
	subq	%rcx, %rax
	movq	%rax, 8(%rdi)
	movq	%rax, %r9
	movq	16(%rsi), %rax
	movq	16(%r8), %rcx
	sbbq	%rbx, %rdx
	movq	%rdx, %r10
	movq	%rdx, %rbx
	xorl	%edx, %edx
	sarq	$63, %rbx
	addq	%r10, %rax
	adcq	%rbx, %rdx
	xorl	%ebx, %ebx
	subq	%rcx, %rax
	movq	%rax, 16(%rdi)
	movq	24(%rsi), %r13
	sbbq	%rbx, %rdx
	movq	24(%r8), %rcx
	movq	%rdx, %rbx
	xorl	%r14d, %r14d
	sarq	$63, %rbx
	addq	%rdx, %r13
	adcq	%rbx, %r14
	xorl	%ebx, %ebx
	subq	%rcx, %r13
	movq	%r13, 24(%rdi)
	movq	32(%rsi), %rcx
	sbbq	%rbx, %r14
	movq	%r14, %r11
	movq	%r14, %r12
	xorl	%ebx, %ebx
	sarq	$63, %r12
	addq	%rcx, %r11
	movq	32(%r8), %rcx
	adcq	%rbx, %r12
	xorl	%ebx, %ebx
	subq	%rcx, %r11
	movq	%r11, 32(%rdi)
	movq	40(%rsi), %rcx
	sbbq	%rbx, %r12
	movq	%r11, %rdx
	movq	%r12, %r11
	xorl	%ebx, %ebx
	sarq	$63, %r12
	addq	%rcx, %r11
	movq	40(%r8), %rcx
	adcq	%rbx, %r12
	xorl	%ebx, %ebx
	subq	%rcx, %r11
	movq	%r11, 40(%rdi)
	movq	48(%rsi), %rcx
	sbbq	%rbx, %r12
	movq	%r11, -24(%rsp)
	movq	%r12, %r11
	movq	%r12, -16(%rsp)
	xorl	%ebx, %ebx
	sarq	$63, %r12
	addq	%rcx, %r11
	movq	48(%r8), %rcx
	movabsq	$2556006723728458995, %r8
	adcq	%rbx, %r12
	xorl	%ebx, %ebx
	subq	%rcx, %r11
	movq	%rbp, %rcx
	sbbq	%rbx, %r12
	xorl	%ebx, %ebx
	movq	%r11, -40(%rsp)
	movq	%r12, %rsi
	movq	%r12, -32(%rsp)
	xorl	%r12d, %r12d
	addq	%r15, %rsi
	movq	%r9, %r11
	andq	%rsi, %r8
	addq	%r8, %rcx
	adcq	%r12, %rbx
	addq	%r8, %rbp
	xorl	%r12d, %r12d
	movq	%rbx, %rcx
	movabsq	$2408513697996967765, %r8
	sarq	$63, %rbx
	addq	%rcx, %r11
	movq	%rbp, (%rdi)
	adcq	%rbx, %r12
	andq	%rsi, %r8
	xorl	%ebx, %ebx
	movq	%r8, %rcx
	movabsq	$4611686018427387903, %r8
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, 8(%rdi)
	xorl	%r12d, %r12d
	movq	%rbx, %rcx
	sarq	$63, %rbx
	addq	%rax, %rcx
	movabsq	$-4301259484579875184, %rax
	adcq	%r12, %rbx
	andq	%rsi, %rax
	xorl	%r12d, %r12d
	addq	%rax, %rcx
	movabsq	$-2201345047, %rax
	adcq	%r12, %rbx
	movq	%rcx, 16(%rdi)
	xorl	%r12d, %r12d
	movq	%rbx, %rcx
	sarq	$63, %rbx
	addq	%r13, %rcx
	adcq	%r12, %rbx
	andq	%rsi, %rax
	xorl	%r12d, %r12d
	addq	%rax, %rcx
	movq	-24(%rsp), %rax
	adcq	%r12, %rbx
	movq	%rcx, 24(%rdi)
	xorl	%r14d, %r14d
	movq	%rbx, %rcx
	sarq	$63, %rbx
	addq	%rdx, %rcx
	adcq	%r14, %rbx
	xorl	%r14d, %r14d
	addq	%rsi, %rcx
	adcq	%r14, %rbx
	movq	%rcx, 32(%rdi)
	xorl	%edx, %edx
	movq	%rbx, %rcx
	sarq	$63, %rbx
	addq	%rcx, %rax
	movq	-40(%rsp), %rcx
	adcq	%rbx, %rdx
	addq	%rsi, %rax
	adcq	%r14, %rdx
	movq	%rax, 40(%rdi)
	movq	%rdx, %rax
	addq	%rcx, %rax
	andq	%r8, %rsi
	addq	%rsi, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%rax, 48(%rdi)
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
.LFE4722:
	.size	sc_subx.constprop.9, .-sc_subx.constprop.9
	.section	.text.unlikely.sc_subx.constprop.9
.LCOLDE18:
	.section	.text.sc_subx.constprop.9
.LHOTE18:
	.section	.text.unlikely.sc_montmul,"ax",@progbits
.LCOLDB19:
	.section	.text.sc_montmul,"ax",@progbits
.LHOTB19:
	.p2align 4,,15
	.type	sc_montmul, @function
sc_montmul:
.LFB4655:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	xorl	%r8d, %r8d
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	xorl	%r13d, %r13d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	56(%rsi), %rbx
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	xorl	%r15d, %r15d
	subq	$544, %rsp
	movq	%rdi, -560(%rbp)
	movq	%rbx, -552(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-144(%rbp), %rax
	movq	$0, -400(%rbp)
	movq	%rax, -568(%rbp)
	movq	MONTGOMERY_FACTOR@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -528(%rbp)
	movq	(%rdx), %rax
	movq	%rax, -520(%rbp)
	movq	8(%rdx), %rax
	movq	%rax, -512(%rbp)
	movq	16(%rdx), %rax
	movq	%rax, -504(%rbp)
	movq	24(%rdx), %rax
	movq	%rax, -496(%rbp)
	movq	32(%rdx), %rax
	movq	%rax, -488(%rbp)
	movq	40(%rdx), %rax
	movq	%rax, -544(%rbp)
	movq	48(%rdx), %rax
	xorl	%edx, %edx
	movq	%rax, -536(%rbp)
	movq	$0, -408(%rbp)
	movq	%r8, -448(%rbp)
	movq	%r13, -432(%rbp)
	movq	%rsi, %r8
	movq	%r14, -416(%rbp)
	movq	%r12, -456(%rbp)
	.p2align 4,,10
	.p2align 3
.L51:
	movq	(%r8), %rax
	movq	%rdx, -464(%rbp)
	movq	-520(%rbp), %rdx
	movq	-448(%rbp), %rdi
	movq	-456(%rbp), %r14
	movq	$0, -152(%rbp)
	movq	$0, -168(%rbp)
	movq	$0, -184(%rbp)
	mulx	%rax, %rcx, %rbx
	movq	-512(%rbp), %rdx
	movq	%rdi, -160(%rbp)
	addq	-160(%rbp), %rcx
	movq	%r14, -176(%rbp)
	adcq	-152(%rbp), %rbx
	xorl	%edi, %edi
	movq	-416(%rbp), %r14
	mulx	%rax, %r9, %r10
	addq	-176(%rbp), %r9
	movq	-504(%rbp), %rdx
	adcq	-168(%rbp), %r10
	movq	$0, -200(%rbp)
	movq	%r14, -192(%rbp)
	addq	%rbx, %r9
	adcq	%rdi, %r10
	mulx	%rax, %rsi, %rdi
	xorl	%r12d, %r12d
	addq	-192(%rbp), %rsi
	movq	-496(%rbp), %rdx
	adcq	-184(%rbp), %rdi
	movq	%r9, -448(%rbp)
	movq	-432(%rbp), %r9
	movq	%r10, -440(%rbp)
	addq	%r10, %rsi
	adcq	%r12, %rdi
	movq	%r9, -208(%rbp)
	mulx	%rax, %r11, %r12
	xorl	%r14d, %r14d
	addq	-208(%rbp), %r11
	adcq	-200(%rbp), %r12
	movq	%r11, %r10
	addq	%rdi, %r10
	movq	%r12, %r11
	movq	%r10, -432(%rbp)
	movq	-488(%rbp), %rdx
	adcq	%r14, %r11
	movq	%r11, %r13
	xorl	%r14d, %r14d
	movq	%r15, -224(%rbp)
	movq	%r11, -424(%rbp)
	movq	$0, -216(%rbp)
	mulx	%rax, %r11, %r12
	addq	-224(%rbp), %r11
	movq	-544(%rbp), %rdx
	adcq	-216(%rbp), %r12
	movq	$0, -232(%rbp)
	movq	-400(%rbp), %r15
	movq	$0, -248(%rbp)
	movq	%rcx, -272(%rbp)
	movq	$0, -264(%rbp)
	addq	%r13, %r11
	adcq	%r14, %r12
	movq	%r11, -480(%rbp)
	xorl	%r14d, %r14d
	movq	%r12, -472(%rbp)
	movq	%r12, %r13
	mulx	%rax, %r11, %r12
	movq	-464(%rbp), %rdx
	movq	%r15, -256(%rbp)
	movq	%rdx, -240(%rbp)
	addq	-240(%rbp), %r11
	adcq	-232(%rbp), %r12
	addq	%r11, %r13
	adcq	%r12, %r14
	xorl	%r11d, %r11d
	mulq	-536(%rbp)
	movq	%r11, %r12
	addq	-256(%rbp), %rax
	adcq	-248(%rbp), %rdx
	addq	%r14, %rax
	adcq	%r12, %rdx
	movq	%rax, %r14
	movq	%rdx, %rax
	xorl	%edx, %edx
	movq	%rdx, -392(%rbp)
	movq	-528(%rbp), %rdx
	movq	%rax, -400(%rbp)
	movq	%rax, -464(%rbp)
	imulq	%rcx, %rdx
	movq	%rdx, %rdi
	movabsq	$2556006723728458995, %rdx
	mulx	%rdi, %rcx, %rbx
	addq	-272(%rbp), %rcx
	movabsq	$2408513697996967765, %rdx
	adcq	-264(%rbp), %rbx
	movq	-448(%rbp), %r9
	mulx	%rdi, %rax, %rdx
	movq	$0, -280(%rbp)
	movq	%rsi, -304(%rbp)
	movq	$0, -296(%rbp)
	movq	$0, -312(%rbp)
	movq	%r9, -288(%rbp)
	movq	$0, -328(%rbp)
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	addq	-288(%rbp), %rax
	adcq	-280(%rbp), %rdx
	movq	%r13, -352(%rbp)
	movq	$0, -344(%rbp)
	movq	%r14, -368(%rbp)
	addq	%rax, %rcx
	movq	-432(%rbp), %rax
	adcq	%rdx, %rbx
	movabsq	$-4301259484579875184, %rdx
	movq	%rcx, -448(%rbp)
	mulx	%rdi, %r11, %r12
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	movq	%r11, %r10
	addq	-304(%rbp), %r10
	movq	%r12, %r11
	adcq	-296(%rbp), %r11
	movabsq	$-2201345047, %rdx
	movq	%rax, -320(%rbp)
	addq	%r10, %rcx
	adcq	%r11, %rbx
	mulx	%rdi, %r11, %r12
	movq	%rcx, -456(%rbp)
	movq	%r11, %r10
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	addq	-320(%rbp), %r10
	movq	%r12, %r11
	movq	$-1, %rdx
	adcq	-312(%rbp), %r11
	movq	-328(%rbp), %r12
	addq	%r10, %rcx
	mulx	%rdi, %r9, %r10
	movq	-480(%rbp), %rdx
	adcq	%r11, %rbx
	movq	%rcx, -416(%rbp)
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	movq	%rdx, -336(%rbp)
	movq	-336(%rbp), %r11
	movabsq	$4611686018427387903, %rdx
	mulx	%rdi, %rax, %rdx
	addq	%r9, %r11
	adcq	%r10, %r12
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, -432(%rbp)
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	addq	-352(%rbp), %r9
	adcq	-344(%rbp), %r10
	movq	$0, -360(%rbp)
	movq	-408(%rbp), %rdi
	movq	-400(%rbp), %rsi
	movq	$0, -376(%rbp)
	addq	%r9, %rcx
	adcq	%r10, %rbx
	movq	%rcx, %r15
	movq	%rdi, -384(%rbp)
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	addq	-368(%rbp), %rax
	adcq	-360(%rbp), %rdx
	movq	-392(%rbp), %rdi
	addq	%rax, %rcx
	adcq	%rdx, %rbx
	movq	%rcx, %rdx
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	addq	-384(%rbp), %rsi
	adcq	-376(%rbp), %rdi
	addq	%rsi, %rcx
	adcq	%rdi, %rbx
	addq	$8, %r8
	cmpq	-552(%rbp), %r8
	movq	%rcx, -400(%rbp)
	movq	%rbx, -408(%rbp)
	jne	.L51
	movq	-416(%rbp), %r14
	movq	-448(%rbp), %r8
	movq	%rbx, %rcx
	movq	-432(%rbp), %r13
	movq	-456(%rbp), %r12
	vmovq	-400(%rbp), %xmm4
	movq	-568(%rbp), %rsi
	movq	%r14, -160(%rbp)
	movq	-560(%rbp), %rdi
	vmovq	-160(%rbp), %xmm2
	movq	%r8, -160(%rbp)
	vmovq	-160(%rbp), %xmm3
	vpinsrq	$1, %r13, %xmm2, %xmm1
	vpinsrq	$1, %r12, %xmm3, %xmm0
	movq	%r15, -160(%rbp)
	vmovq	-160(%rbp), %xmm5
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vpinsrq	$1, -464(%rbp), %xmm4, %xmm1
	vmovdqa	%ymm0, -144(%rbp)
	vpinsrq	$1, %rdx, %xmm5, %xmm0
	leaq	sc_p(%rip), %rdx
	vinserti128	$0x1, %xmm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	call	sc_subx.constprop.9
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L56
	addq	$544, %rsp
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
.L56:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4655:
	.size	sc_montmul, .-sc_montmul
	.section	.text.unlikely.sc_montmul
.LCOLDE19:
	.section	.text.sc_montmul
.LHOTE19:
	.section	.text.unlikely.gf_eq.constprop.10,"ax",@progbits
.LCOLDB20:
	.section	.text.gf_eq.constprop.10,"ax",@progbits
.LHOTB20:
	.p2align 4,,15
	.type	gf_eq.constprop.10, @function
gf_eq.constprop.10:
.LFB4721:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	ZERO(%rip), %rdx
	movq	%rdi, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	leaq	-112(%rbp), %r9
	subq	$104, %rsp
	movq	%r9, %rdi
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	gf_sub
	movq	%r9, %rdi
	call	p448_strong_reduce@PLT
	vmovdqa	-80(%rbp), %ymm0
	vpxor	%xmm2, %xmm2, %xmm2
	xorl	%edx, %edx
	vpor	-112(%rbp), %ymm0, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm1
	vpor	%ymm0, %ymm1, %ymm0
	vperm2i128	$33, %ymm2, %ymm0, %ymm2
	vpalignr	$8, %ymm0, %ymm2, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vmovq	%xmm0, %rax
	addq	$-1, %rax
	adcq	$-1, %rdx
	movq	-24(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L60
	movq	%rdx, %rax
	vzeroupper
	addq	$104, %rsp
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L60:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4721:
	.size	gf_eq.constprop.10, .-gf_eq.constprop.10
	.section	.text.unlikely.gf_eq.constprop.10
.LCOLDE20:
	.section	.text.gf_eq.constprop.10
.LHOTE20:
	.section	.text.unlikely.point_double_internal.constprop.14,"ax",@progbits
.LCOLDB21:
	.section	.text.point_double_internal.constprop.14,"ax",@progbits
.LHOTB21:
	.p2align 4,,15
	.type	point_double_internal.constprop.14, @function
point_double_internal.constprop.14:
.LFB4717:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-336(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	-208(%rbp), %rdi
	movq	%rsi, %r12
	leaq	192(%rbx), %r13
	subq	$288, %rsp
	leaq	-272(%rbp), %r15
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	64(%r12), %rsi
	movq	%r14, %rdi
	call	p448_sqr@PLT
	vmovdqa	-208(%rbp), %ymm0
	movq	%r13, %rsi
	movq	%r15, %rdi
	vpaddq	-336(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	-176(%rbp), %ymm0
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	64(%r12), %ymm0
	vpaddq	(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%r12), %ymm0
	vpaddq	32(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	-240(%rbp), %ymm0
	leaq	128(%r12), %rsi
	movq	%rbx, %rdi
	vmovdqa	-272(%rbp), %ymm1
	vpsubq	-112(%rbp), %ymm0, %ymm0
	vpaddq	.LC10(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vmovdqa	-304(%rbp), %ymm0
	vpaddq	.LC9(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	-336(%rbp), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	.LC3(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vpaddq	.LC2(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm1
	movq	%r15, %rdx
	movq	%r14, %rsi
	vmovdqa	32(%rbx), %ymm0
	movq	%rbx, %rdi
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	vpsubq	192(%rbx), %ymm1, %ymm1
	vpaddq	%ymm0, %ymm0, %ymm0
	vpaddq	.LC11(%rip), %ymm1, %ymm1
	vmovdqa	%ymm0, 160(%rbx)
	vmovdqa	%ymm1, -336(%rbp)
	vpsubq	224(%rbx), %ymm0, %ymm0
	vpaddq	.LC12(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_mul@PLT
	leaq	128(%rbx), %rdi
	movq	%r14, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	leaq	-144(%rbp), %rdx
	leaq	64(%rbx), %rdi
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L65
	addq	$288, %rsp
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
.L65:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4717:
	.size	point_double_internal.constprop.14, .-point_double_internal.constprop.14
	.section	.text.unlikely.point_double_internal.constprop.14
.LCOLDE21:
	.section	.text.point_double_internal.constprop.14
.LHOTE21:
	.section	.text.unlikely.point_double_internal.constprop.15,"ax",@progbits
.LCOLDB22:
	.section	.text.point_double_internal.constprop.15,"ax",@progbits
.LHOTB22:
	.p2align 4,,15
	.type	point_double_internal.constprop.15, @function
point_double_internal.constprop.15:
.LFB4716:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-336(%rbp), %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	-208(%rbp), %rdi
	movq	%rsi, %r12
	leaq	192(%rbx), %r13
	subq	$288, %rsp
	leaq	-272(%rbp), %r14
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_sqr@PLT
	leaq	64(%r12), %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	vmovdqa	-208(%rbp), %ymm0
	movq	%r13, %rsi
	movq	%r14, %rdi
	vpaddq	-336(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	-176(%rbp), %ymm0
	vpaddq	-304(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	vmovdqa	64(%r12), %ymm0
	vpaddq	(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 192(%rbx)
	vmovdqa	96(%r12), %ymm0
	vpaddq	32(%r12), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	-240(%rbp), %ymm0
	leaq	128(%r12), %rsi
	movq	%rbx, %rdi
	vmovdqa	-272(%rbp), %ymm1
	vpsubq	-112(%rbp), %ymm0, %ymm0
	vpaddq	.LC10(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vpsubq	-144(%rbp), %ymm1, %ymm1
	vmovdqa	-304(%rbp), %ymm0
	vpaddq	.LC9(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	-336(%rbp), %ymm1
	vpsubq	-176(%rbp), %ymm0, %ymm0
	vpaddq	.LC3(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 224(%rbx)
	vpsubq	-208(%rbp), %ymm1, %ymm1
	vpaddq	.LC2(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, 192(%rbx)
	vzeroupper
	call	p448_sqr@PLT
	vmovdqa	(%rbx), %ymm1
	movq	%r14, %rdx
	movq	%r15, %rsi
	vmovdqa	32(%rbx), %ymm0
	movq	%rbx, %rdi
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	%ymm1, 128(%rbx)
	vpsubq	192(%rbx), %ymm1, %ymm1
	vpaddq	%ymm0, %ymm0, %ymm0
	vpaddq	.LC11(%rip), %ymm1, %ymm1
	vmovdqa	%ymm0, 160(%rbx)
	vmovdqa	%ymm1, -336(%rbp)
	vpsubq	224(%rbx), %ymm0, %ymm0
	vpaddq	.LC12(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r12
	call	p448_mul@PLT
	leaq	128(%rbx), %rdi
	movq	%r15, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	leaq	64(%rbx), %rdi
	movq	%r12, %rdx
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L70
	addq	$288, %rsp
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
.L70:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4716:
	.size	point_double_internal.constprop.15, .-point_double_internal.constprop.15
	.section	.text.unlikely.point_double_internal.constprop.15
.LCOLDE22:
	.section	.text.point_double_internal.constprop.15
.LHOTE22:
	.section	.text.unlikely.gf_add.constprop.13,"ax",@progbits
.LCOLDB23:
	.section	.text.gf_add.constprop.13,"ax",@progbits
.LHOTB23:
	.p2align 4,,15
	.type	gf_add.constprop.13, @function
gf_add.constprop.13:
.LFB4718:
	.cfi_startproc
	vmovdqa	(%rsi), %ymm0
	movabsq	$72057594037927935, %rax
	movq	%rax, %r8
	vpaddq	ONE(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	andq	24(%rdi), %r8
	vmovdqa	32(%rsi), %ymm0
	movq	16(%rdi), %rsi
	vpaddq	32+ONE(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %ecx
	addq	%rcx, 32(%rdi)
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	addq	%r8, %rdx
	vmovdqu	24(%rdi), %xmm0
	movq	%rdx, 24(%rdi)
	movq	8(%rdi), %rdx
	vinserti128	$0x1, 40(%rdi), %ymm0, %ymm2
	vpermq	$27, 32(%rdi), %ymm0
	movq	%rdx, %r8
	shrq	$56, %r8
	andq	%rax, %rdx
	andq	(%rdi), %rax
	addq	%r8, %rsi
	movq	%rsi, 16(%rdi)
	movl	$56, %esi
	shrx	%rsi, (%rdi), %rsi
	vpand	.LC0(%rip), %ymm0, %ymm1
	addq	%rcx, %rax
	movq	%rax, (%rdi)
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 8(%rdi)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE4718:
	.size	gf_add.constprop.13, .-gf_add.constprop.13
	.section	.text.unlikely.gf_add.constprop.13
.LCOLDE23:
	.section	.text.gf_add.constprop.13
.LHOTE23:
	.section	.text.unlikely.gf_sub.constprop.12,"ax",@progbits
.LCOLDB24:
	.section	.text.gf_sub.constprop.12,"ax",@progbits
.LHOTB24:
	.p2align 4,,15
	.type	gf_sub.constprop.12, @function
gf_sub.constprop.12:
.LFB4719:
	.cfi_startproc
	vmovdqa	ZERO(%rip), %ymm0
	movabsq	$72057594037927935, %rax
	vmovdqa	32+ZERO(%rip), %ymm1
	movq	%rax, %r8
	vpsubq	(%rsi), %ymm0, %ymm0
	vmovdqa	%ymm0, (%rdi)
	vpaddq	.LC2(%rip), %ymm0, %ymm0
	vpsubq	32(%rsi), %ymm1, %ymm1
	vmovdqa	%ymm0, (%rdi)
	vpaddq	.LC3(%rip), %ymm1, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	movzbl	63(%rdi), %ecx
	movq	16(%rdi), %rsi
	addq	%rcx, 32(%rdi)
	andq	24(%rdi), %r8
	movq	%rsi, %rdx
	andq	%rax, %rsi
	shrq	$56, %rdx
	vmovdqu	24(%rdi), %xmm0
	addq	%r8, %rdx
	movq	%rdx, 24(%rdi)
	movq	8(%rdi), %rdx
	vinserti128	$0x1, 40(%rdi), %ymm0, %ymm2
	vpermq	$27, 32(%rdi), %ymm0
	movq	%rdx, %r8
	shrq	$56, %r8
	andq	%rax, %rdx
	andq	(%rdi), %rax
	addq	%r8, %rsi
	movq	%rsi, 16(%rdi)
	movl	$56, %esi
	shrx	%rsi, (%rdi), %rsi
	vpand	.LC0(%rip), %ymm0, %ymm1
	addq	%rcx, %rax
	movq	%rax, (%rdi)
	vpermq	$27, %ymm2, %ymm0
	addq	%rsi, %rdx
	movq	%rdx, 8(%rdi)
	vpsrlq	$56, %ymm0, %ymm0
	vpaddq	%ymm0, %ymm1, %ymm0
	vpermq	$27, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	vzeroupper
	ret
	.cfi_endproc
.LFE4719:
	.size	gf_sub.constprop.12, .-gf_sub.constprop.12
	.section	.text.unlikely.gf_sub.constprop.12
.LCOLDE24:
	.section	.text.gf_sub.constprop.12
.LHOTE24:
	.section	.text.unlikely.prepare_fixed_window.constprop.7,"ax",@progbits
.LCOLDB25:
	.section	.text.prepare_fixed_window.constprop.7,"ax",@progbits
.LHOTB25:
	.p2align 4,,15
	.type	prepare_fixed_window.constprop.7, @function
prepare_fixed_window.constprop.7:
.LFB4724:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-592(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rdi, %r13
	movq	%r12, %rdi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rsi, %rbx
	leaq	64(%r12), %r14
	subq	$672, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	point_double_internal.constprop.15
	leaq	-336(%rbp), %rax
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	movq	%rax, -680(%rbp)
	call	gf_sub
	leaq	64(%r15), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	gf_add
	leaq	192(%r12), %r8
	movq	%r15, %rax
	movl	$78164, %edx
	subq	$-128, %rax
	movq	%r8, %rsi
	movq	%rax, %rdi
	movq	%r8, -704(%rbp)
	movq	%rax, -664(%rbp)
	call	p448_mulw@PLT
	movq	-664(%rbp), %rax
	movq	%rax, %rsi
	movq	%rax, %rdi
	call	gf_sub.constprop.12
	leaq	128(%r12), %rax
	leaq	192(%r15), %r9
	movq	%rax, %rdx
	movq	%rax, %rsi
	movq	%r9, %rdi
	movq	%rax, -696(%rbp)
	movq	%r9, -688(%rbp)
	call	gf_add
	leaq	64(%rbx), %r10
	movq	%rbx, %rdx
	movq	%r13, %rdi
	movq	%r10, %rsi
	call	gf_sub
	leaq	64(%r13), %rdi
	movq	%r10, %rdx
	movq	%rbx, %rsi
	call	gf_add
	leaq	128(%r13), %rcx
	leaq	192(%rbx), %rsi
	movl	$78164, %edx
	movq	%rcx, %rdi
	movq	%rcx, -664(%rbp)
	call	p448_mulw@PLT
	movq	-664(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rcx, %rdi
	call	gf_sub.constprop.12
	leaq	128(%rbx), %rsi
	leaq	192(%r13), %rdi
	movq	%rsi, %rdx
	call	gf_add
	leaq	4096(%r13), %rax
	movq	%rbx, %rsi
	movl	$32, %ecx
	movq	%r12, %rdi
	movq	-704(%rbp), %r8
	leaq	256(%r13), %rbx
	movq	%rax, -664(%rbp)
	leaq	-656(%rbp), %rax
	rep movsq
	movq	%rax, -672(%rbp)
	movq	-696(%rbp), %rax
	movq	%r8, -696(%rbp)
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L74:
	movq	-688(%rbp), %rdx
	movq	-672(%rbp), %rdi
	movq	%r13, %rsi
	leaq	128(%rbx), %r15
	call	p448_mul@PLT
	movq	-656(%rbp), %rax
	movq	-680(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, -464(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -448(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, -440(%rbp)
	movq	-624(%rbp), %rax
	movq	%rax, -432(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	-608(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, -408(%rbp)
	call	add_niels_to_pt
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r14, %rsi
	call	gf_sub
	leaq	64(%rbx), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	gf_add
	movq	-696(%rbp), %rsi
	movl	$78164, %edx
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_sub.constprop.12
	leaq	192(%rbx), %rdi
	movq	%r13, %rdx
	movq	%r13, %rsi
	addq	$256, %rbx
	call	gf_add
	cmpq	-664(%rbp), %rbx
	jne	.L74
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L79
	addq	$672, %rsp
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
.L79:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4724:
	.size	prepare_fixed_window.constprop.7, .-prepare_fixed_window.constprop.7
	.section	.text.unlikely.prepare_fixed_window.constprop.7
.LCOLDE25:
	.section	.text.prepare_fixed_window.constprop.7
.LHOTE25:
	.section	.text.unlikely.deisogenize,"ax",@progbits
.LCOLDB26:
	.section	.text.deisogenize,"ax",@progbits
.LHOTB26:
	.p2align 4,,15
	.type	deisogenize, @function
deisogenize:
.LFB4665:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdx, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rsi, %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	leaq	128(%r13), %r14
	leaq	-208(%rbp), %r15
	subq	$256, %rsp
	movq	%rcx, -304(%rbp)
	movq	%r8, -288(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	64(%rdx), %rax
	movl	$39082, %edx
	movq	%rax, %rsi
	movq	%rax, -280(%rbp)
	call	p448_mulw@PLT
	leaq	192(%r13), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	gf_sub
	movq	-280(%rbp), %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	leaq	-272(%rbp), %r13
	call	gf_add
	movq	-280(%rbp), %rdx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	gf_sub
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movl	$39081, %edx
	movq	%r12, %rsi
	movq	%r13, %rdi
	call	p448_mulw@PLT
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_isr@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movl	$39081, %edx
	call	p448_mulw@PLT
	movq	%rbx, %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	call	gf_add
	movq	%r14, %rdx
	leaq	-144(%rbp), %r14
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	%r13, %rsi
	movq	%r14, %rdi
	andl	$1, %r9d
	negq	%r9
	notq	%r9
	xorq	-288(%rbp), %r9
	call	gf_sub.constprop.12
	vmovdqa	-272(%rbp), %ymm2
	movq	%r12, %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	vpxor	-144(%rbp), %ymm2, %ymm1
	movl	%r9d, -292(%rbp)
	vpbroadcastd	-292(%rbp), %ymm0
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-240(%rbp), %ymm2
	vmovdqa	%ymm1, -272(%rbp)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	%r12, %rsi
	movq	%r14, %rdi
	andl	$1, %r9d
	negq	%r9
	notq	%r9
	xorq	-288(%rbp), %r9
	call	gf_sub.constprop.12
	vmovdqa	(%r12), %ymm2
	movq	-280(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	vpxor	-144(%rbp), %ymm2, %ymm1
	movl	%r9d, -288(%rbp)
	vpbroadcastd	-288(%rbp), %ymm0
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	32(%r12), %ymm2
	vmovdqa	%ymm1, (%r12)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%r12)
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_add
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	-304(%rbp), %rcx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	andl	$1, %r9d
	negq	%r9
	xorq	%rcx, %r9
	call	gf_sub.constprop.12
	vmovdqa	(%rbx), %ymm2
	movl	%r9d, -280(%rbp)
	vpbroadcastd	-280(%rbp), %ymm0
	vpxor	-144(%rbp), %ymm2, %ymm1
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	32(%rbx), %ymm2
	vmovdqa	%ymm1, (%rbx)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rbx)
	jne	.L84
	vzeroupper
	addq	$256, %rsp
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
.L84:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4665:
	.size	deisogenize, .-deisogenize
	.section	.text.unlikely.deisogenize
.LCOLDE26:
	.section	.text.deisogenize
.LHOTE26:
	.section	.text.unlikely.decaf_448_scalar_mul,"ax",@progbits
.LCOLDB27:
	.section	.text.decaf_448_scalar_mul,"ax",@progbits
.LHOTB27:
	.p2align 4,,15
	.globl	decaf_448_scalar_mul
	.type	decaf_448_scalar_mul, @function
decaf_448_scalar_mul:
.LFB4656:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	sc_montmul
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	movq	sc_r2@GOTPCREL(%rip), %rdx
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	sc_montmul
	.cfi_endproc
.LFE4656:
	.size	decaf_448_scalar_mul, .-decaf_448_scalar_mul
	.section	.text.unlikely.decaf_448_scalar_mul
.LCOLDE27:
	.section	.text.decaf_448_scalar_mul
.LHOTE27:
	.section	.text.unlikely.decaf_448_scalar_sub,"ax",@progbits
.LCOLDB28:
	.section	.text.decaf_448_scalar_sub,"ax",@progbits
.LHOTB28:
	.p2align 4,,15
	.globl	decaf_448_scalar_sub
	.type	decaf_448_scalar_sub, @function
decaf_448_scalar_sub:
.LFB4659:
	.cfi_startproc
	xorl	%ecx, %ecx
	jmp	sc_subx.constprop.9
	.cfi_endproc
.LFE4659:
	.size	decaf_448_scalar_sub, .-decaf_448_scalar_sub
	.section	.text.unlikely.decaf_448_scalar_sub
.LCOLDE28:
	.section	.text.decaf_448_scalar_sub
.LHOTE28:
	.section	.text.unlikely.decaf_448_scalar_add,"ax",@progbits
.LCOLDB29:
	.section	.text.decaf_448_scalar_add,"ax",@progbits
.LHOTB29:
	.p2align 4,,15
	.globl	decaf_448_scalar_add
	.type	decaf_448_scalar_add, @function
decaf_448_scalar_add:
.LFB4660:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%r10d, %r10d
	movq	(%rdx), %rcx
	movq	(%rsi), %rax
	xorl	%ebx, %ebx
	movq	%rcx, %r9
	leaq	(%rcx,%rax), %r8
	movq	%rax, %rcx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	movq	%r8, (%rdi)
	movq	8(%rdx), %r9
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	movq	%rcx, %r11
	movq	8(%rsi), %rcx
	movq	%rbx, %r12
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, 8(%rdi)
	movq	16(%rdx), %r9
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	movq	%rcx, %r11
	movq	16(%rsi), %rcx
	movq	%rbx, %r12
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, 16(%rdi)
	movq	24(%rdx), %r9
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	movq	%rcx, %r11
	movq	24(%rsi), %rcx
	movq	%rbx, %r12
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, 24(%rdi)
	movq	32(%rdx), %r9
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	xorl	%r10d, %r10d
	movq	%rcx, %r11
	movq	32(%rsi), %rcx
	movq	%rbx, %r12
	xorl	%ebx, %ebx
	addq	%r9, %rcx
	adcq	%r10, %rbx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	movq	%rcx, 32(%rdi)
	movq	40(%rsi), %r11
	movq	%rbx, %rcx
	xorl	%ebx, %ebx
	xorl	%r12d, %r12d
	movq	%rcx, %r9
	movq	40(%rdx), %rcx
	movq	%rbx, %r10
	xorl	%ebx, %ebx
	addq	%r11, %rcx
	adcq	%r12, %rbx
	addq	%r9, %rcx
	movq	%rcx, 40(%rdi)
	movq	48(%rsi), %r11
	adcq	%r10, %rbx
	movq	48(%rdx), %r9
	xorl	%r12d, %r12d
	movq	%rbx, %rcx
	xorl	%r10d, %r10d
	xorl	%ebx, %ebx
	leaq	sc_p(%rip), %rdx
	movq	%rdi, %rsi
	addq	%r11, %r9
	adcq	%r12, %r10
	addq	%r9, %rcx
	adcq	%r10, %rbx
	movq	%rcx, 48(%rdi)
	movq	%rbx, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	sc_subx.constprop.9
	.cfi_endproc
.LFE4660:
	.size	decaf_448_scalar_add, .-decaf_448_scalar_add
	.section	.text.unlikely.decaf_448_scalar_add
.LCOLDE29:
	.section	.text.decaf_448_scalar_add
.LHOTE29:
	.section	.text.unlikely.decaf_448_scalar_set,"ax",@progbits
.LCOLDB30:
	.section	.text.decaf_448_scalar_set,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	decaf_448_scalar_set
	.type	decaf_448_scalar_set, @function
decaf_448_scalar_set:
.LFB4662:
	.cfi_startproc
	movq	$0, 48(%rdi)
	movq	%rdi, %rdx
	leaq	8(%rdi), %rdi
	movq	%rdx, %rcx
	xorl	%eax, %eax
	andq	$-8, %rdi
	subq	%rdi, %rcx
	addl	$56, %ecx
	shrl	$3, %ecx
	rep stosq
	movq	%rsi, (%rdx)
	ret
	.cfi_endproc
.LFE4662:
	.size	decaf_448_scalar_set, .-decaf_448_scalar_set
	.section	.text.unlikely.decaf_448_scalar_set
.LCOLDE30:
	.section	.text.decaf_448_scalar_set
.LHOTE30:
	.section	.text.unlikely.decaf_448_scalar_eq,"ax",@progbits
.LCOLDB31:
	.section	.text.decaf_448_scalar_eq,"ax",@progbits
.LHOTB31:
	.p2align 4,,15
	.globl	decaf_448_scalar_eq
	.type	decaf_448_scalar_eq, @function
decaf_448_scalar_eq:
.LFB4663:
	.cfi_startproc
	movq	(%rsi), %r8
	xorq	(%rdi), %r8
	movq	8(%rsi), %rax
	xorq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	xorq	16(%rsi), %rcx
	movq	24(%rdi), %rdx
	xorq	24(%rsi), %rdx
	movq	%r8, %r9
	orq	%rax, %r9
	movq	32(%rdi), %rax
	xorq	32(%rsi), %rax
	orq	%r9, %rcx
	movq	%rcx, %r8
	movq	%rdx, %rcx
	orq	%r8, %rcx
	orq	%rcx, %rax
	movq	%rax, %rdx
	movq	40(%rdi), %rax
	xorq	40(%rsi), %rax
	orq	%rdx, %rax
	movq	48(%rdi), %rdx
	xorq	48(%rsi), %rdx
	xorl	%edi, %edi
	orq	%rax, %rdx
	movq	%rdx, %rsi
	addq	$-1, %rsi
	adcq	$-1, %rdi
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE4663:
	.size	decaf_448_scalar_eq, .-decaf_448_scalar_eq
	.section	.text.unlikely.decaf_448_scalar_eq
.LCOLDE31:
	.section	.text.decaf_448_scalar_eq
.LHOTE31:
	.section	.text.unlikely.decaf_448_point_encode,"ax",@progbits
.LCOLDB32:
	.section	.text.decaf_448_point_encode,"ax",@progbits
.LHOTB32:
	.p2align 4,,15
	.globl	decaf_448_point_encode
	.type	decaf_448_point_encode, @function
decaf_448_point_encode:
.LFB4666:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movq	%rsi, %rdx
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	leaq	-208(%rbp), %rbx
	leaq	-144(%rbp), %rsi
	movq	%rdi, %r12
	subq	$184, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	deisogenize
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_serialize@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L96
	addq	$184, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L96:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4666:
	.size	decaf_448_point_encode, .-decaf_448_point_encode
	.section	.text.unlikely.decaf_448_point_encode
.LCOLDE32:
	.section	.text.decaf_448_point_encode
.LHOTE32:
	.section	.text.unlikely.decaf_448_point_decode,"ax",@progbits
.LCOLDB33:
	.section	.text.decaf_448_point_decode,"ax",@progbits
.LHOTB33:
	.p2align 4,,15
	.globl	decaf_448_point_decode
	.type	decaf_448_point_decode, @function
decaf_448_point_decode:
.LFB4668:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-528(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rdi, %r14
	movq	%r12, %rdi
	movq	%rdx, %r13
	subq	$544, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_deserialize@PLT
	movq	%r12, %rdi
	movq	%rax, %rbx
	call	gf_eq.constprop.10
	movq	%rax, -584(%rbp)
	notq	%rax
	movq	%r12, %rdx
	orq	%r13, %rax
	leaq	-144(%rbp), %r13
	movq	%r12, %rsi
	movq	%rax, -552(%rbp)
	movq	%r13, %rdi
	call	gf_add
	movq	%r13, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %rax
	movq	%r12, %rsi
	andl	$1, %eax
	negq	%rax
	notq	%rax
	andq	%rbx, %rax
	movq	%rax, -576(%rbp)
	leaq	-464(%rbp), %rax
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	p448_sqr@PLT
	leaq	128(%r14), %rax
	movq	%rbx, %rdx
	movq	%rbx, -544(%rbp)
	leaq	ONE(%rip), %rsi
	leaq	-400(%rbp), %rbx
	movq	%rax, %r15
	movq	%rax, %rdi
	call	gf_sub
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%r15, -560(%rbp)
	call	p448_sqr@PLT
	leaq	-336(%rbp), %r15
	movq	-544(%rbp), %rsi
	movl	$156328, %edx
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_add
	movq	-544(%rbp), %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	-272(%rbp), %rcx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	movq	%rcx, -536(%rbp)
	call	p448_isr@PLT
	leaq	-208(%rbp), %rax
	movq	-536(%rbp), %rsi
	movq	%rax, %rdi
	movq	%rax, -568(%rbp)
	call	p448_sqr@PLT
	movq	-568(%rbp), %rax
	movq	%rbx, %rdx
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	p448_mul@PLT
	leaq	ONE(%rip), %rsi
	movq	%r13, %rdi
	call	gf_eq
	movq	%r13, %rdi
	movq	%rax, -568(%rbp)
	call	gf_eq.constprop.10
	orq	-568(%rbp), %rax
	movq	-536(%rbp), %rdx
	movq	%r15, %rsi
	andq	-576(%rbp), %rax
	movq	%rbx, %rdi
	andq	-552(%rbp), %rax
	movq	%rax, -568(%rbp)
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	gf_add
	movq	%r13, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	-536(%rbp), %rsi
	movq	%r13, %rdi
	andl	$1, %r9d
	negq	%r9
	call	gf_sub.constprop.12
	vmovdqa	-272(%rbp), %ymm2
	movl	%r9d, -552(%rbp)
	movq	%r12, %rdx
	vpbroadcastd	-552(%rbp), %ymm0
	movq	%r12, %rsi
	movq	%r14, %rdi
	vpxor	-144(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-240(%rbp), %ymm2
	vmovdqa	%ymm1, -272(%rbp)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	gf_add
	movq	-536(%rbp), %rsi
	movq	%r12, %rdx
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	-560(%rbp), %r12
	leaq	TWO(%rip), %rsi
	movq	%rbx, %rdi
	movq	%r12, %rdx
	call	gf_sub
	movq	%rbx, %rsi
	movq	-544(%rbp), %rbx
	movq	%r15, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	64(%r14), %rdi
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	p448_mul@PLT
	leaq	192(%r14), %rdi
	movq	%r14, %rdx
	movq	%rbx, %rsi
	call	p448_mul@PLT
	movq	-584(%rbp), %rcx
	subq	%rcx, 64(%r14)
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	movq	-568(%rbp), %rax
	jne	.L101
	addq	$544, %rsp
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
.L101:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4668:
	.size	decaf_448_point_decode, .-decaf_448_point_decode
	.section	.text.unlikely.decaf_448_point_decode
.LCOLDE33:
	.section	.text.decaf_448_point_decode
.LHOTE33:
	.section	.text.unlikely.decaf_448_point_sub,"ax",@progbits
.LCOLDB34:
	.section	.text.decaf_448_point_sub,"ax",@progbits
.LHOTB34:
	.p2align 4,,15
	.globl	decaf_448_point_sub
	.type	decaf_448_point_sub, @function
decaf_448_point_sub:
.LFB4669:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-336(%rbp), %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-272(%rbp), %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r15, %rdi
	subq	$384, %rsp
	movq	%rdx, -352(%rbp)
	vmovdqa	.LC2(%rip), %ymm3
	vmovdqa	.LC3(%rip), %ymm5
	vmovdqa	96(%rsi), %ymm0
	vmovdqa	64(%rsi), %ymm1
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpsubq	32(%rsi), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	leaq	-208(%rbp), %rax
	vmovdqa	(%rdx), %ymm6
	vpsubq	(%rsi), %ymm1, %ymm1
	vmovdqa	32(%rdx), %ymm4
	vpaddq	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm0, -240(%rbp)
	movq	%rax, %rsi
	movq	%rax, -344(%rbp)
	vmovdqa	96(%rdx), %ymm0
	vmovdqa	%ymm1, -272(%rbp)
	vmovdqa	64(%rdx), %ymm1
	movq	%r12, %rdx
	vmovdqa	%ymm3, -432(%rbp)
	vpsubq	%ymm6, %ymm1, %ymm2
	vmovdqa	%ymm5, -400(%rbp)
	vpaddq	%ymm3, %ymm2, %ymm2
	vpaddq	%ymm6, %ymm1, %ymm1
	vmovdqa	%ymm2, -144(%rbp)
	vpsubq	%ymm4, %ymm0, %ymm2
	vmovdqa	%ymm1, -208(%rbp)
	vpaddq	%ymm5, %ymm2, %ymm2
	vpaddq	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm2, -112(%rbp)
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	leaq	64(%rbx), %r13
	call	p448_mul@PLT
	vmovdqa	64(%r14), %ymm0
	leaq	-144(%rbp), %rsi
	movq	%r12, %rdx
	movq	%r13, %rdi
	vpaddq	(%r14), %ymm0, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	vmovdqa	96(%r14), %ymm0
	vpaddq	32(%r14), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-352(%rbp), %rcx
	leaq	192(%r14), %rdx
	movq	%r12, %rdi
	leaq	192(%rcx), %rsi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$78164, %edx
	call	p448_mulw@PLT
	movq	-352(%rbp), %rcx
	vmovdqa	-336(%rbp), %ymm4
	leaq	128(%r14), %rsi
	vmovdqa	64(%rbx), %ymm1
	movq	%r15, %rdi
	vmovdqa	-304(%rbp), %ymm2
	vpaddq	%ymm1, %ymm4, %ymm0
	vmovdqa	-432(%rbp), %ymm3
	leaq	128(%rcx), %rdx
	vmovdqa	%ymm0, -272(%rbp)
	vpsubq	%ymm4, %ymm1, %ymm1
	vmovdqa	96(%rbx), %ymm0
	vpaddq	%ymm3, %ymm1, %ymm1
	vmovdqa	-400(%rbp), %ymm5
	vpaddq	%ymm0, %ymm2, %ymm6
	vmovdqa	%ymm1, -208(%rbp)
	vpsubq	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm6, -240(%rbp)
	vpaddq	%ymm5, %ymm0, %ymm0
	vmovdqa	%ymm0, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	-336(%rbp), %ymm1
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	-304(%rbp), %ymm0
	movq	%r15, %rsi
	vmovdqa	(%rbx), %ymm4
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	32(%rbx), %ymm2
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	-432(%rbp), %ymm3
	vpsubq	%ymm4, %ymm1, %ymm6
	vpaddq	%ymm1, %ymm4, %ymm1
	vmovdqa	-400(%rbp), %ymm5
	vpaddq	%ymm3, %ymm6, %ymm3
	vmovdqa	%ymm1, -336(%rbp)
	vmovdqa	%ymm3, 64(%rbx)
	vpsubq	%ymm2, %ymm0, %ymm3
	vpaddq	%ymm0, %ymm2, %ymm0
	vpaddq	%ymm5, %ymm3, %ymm5
	vmovdqa	%ymm0, -304(%rbp)
	vmovdqa	%ymm5, 96(%rbx)
	vzeroupper
	call	p448_mul@PLT
	movq	-344(%rbp), %r14
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	leaq	192(%rbx), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L106
	addq	$384, %rsp
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
.L106:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4669:
	.size	decaf_448_point_sub, .-decaf_448_point_sub
	.section	.text.unlikely.decaf_448_point_sub
.LCOLDE34:
	.section	.text.decaf_448_point_sub
.LHOTE34:
	.section	.text.unlikely.decaf_448_point_add,"ax",@progbits
.LCOLDB35:
	.section	.text.decaf_448_point_add,"ax",@progbits
.LHOTB35:
	.p2align 4,,15
	.globl	decaf_448_point_add
	.type	decaf_448_point_add, @function
decaf_448_point_add:
.LFB4670:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-336(%rbp), %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-272(%rbp), %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r15, %rdi
	subq	$384, %rsp
	movq	%rdx, -352(%rbp)
	vmovdqa	.LC2(%rip), %ymm5
	vmovdqa	64(%rsi), %ymm0
	vmovdqa	96(%rsi), %ymm2
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	vpsubq	(%rsi), %ymm0, %ymm0
	vpaddq	%ymm5, %ymm0, %ymm0
	leaq	-208(%rbp), %rax
	vmovdqa	.LC3(%rip), %ymm4
	vpsubq	32(%rsi), %ymm2, %ymm2
	vmovdqa	64(%rdx), %ymm1
	vmovdqa	(%rdx), %ymm6
	movq	%rax, %rsi
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	32(%rdx), %ymm3
	movq	%rax, -344(%rbp)
	vmovdqa	%ymm0, -272(%rbp)
	vmovdqa	96(%rdx), %ymm0
	movq	%r12, %rdx
	vmovdqa	%ymm2, -240(%rbp)
	vpsubq	%ymm6, %ymm1, %ymm2
	vpaddq	%ymm6, %ymm1, %ymm1
	vpaddq	%ymm5, %ymm2, %ymm2
	vmovdqa	%ymm5, -432(%rbp)
	vmovdqa	%ymm2, -208(%rbp)
	vpsubq	%ymm3, %ymm0, %ymm2
	vpaddq	%ymm3, %ymm0, %ymm0
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	%ymm4, -400(%rbp)
	vmovdqa	%ymm2, -176(%rbp)
	vmovdqa	%ymm1, -144(%rbp)
	vmovdqa	%ymm0, -112(%rbp)
	vzeroupper
	leaq	64(%rbx), %r13
	call	p448_mul@PLT
	vmovdqa	64(%r14), %ymm0
	leaq	-144(%rbp), %rsi
	movq	%r12, %rdx
	movq	%r13, %rdi
	vpaddq	(%r14), %ymm0, %ymm0
	vmovdqa	%ymm0, -272(%rbp)
	vmovdqa	96(%r14), %ymm0
	vpaddq	32(%r14), %ymm0, %ymm0
	vmovdqa	%ymm0, -240(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-352(%rbp), %rcx
	leaq	192(%r14), %rdx
	movq	%r12, %rdi
	leaq	192(%rcx), %rsi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$78164, %edx
	call	p448_mulw@PLT
	movq	-352(%rbp), %rcx
	vmovdqa	-336(%rbp), %ymm1
	leaq	128(%r14), %rsi
	vmovdqa	64(%rbx), %ymm3
	movq	%r15, %rdi
	vmovdqa	96(%rbx), %ymm2
	vpaddq	%ymm3, %ymm1, %ymm0
	vmovdqa	-432(%rbp), %ymm5
	leaq	128(%rcx), %rdx
	vmovdqa	%ymm0, -272(%rbp)
	vpsubq	%ymm1, %ymm3, %ymm3
	vmovdqa	-304(%rbp), %ymm0
	vpaddq	%ymm5, %ymm3, %ymm3
	vmovdqa	-400(%rbp), %ymm4
	vpaddq	%ymm2, %ymm0, %ymm6
	vmovdqa	%ymm3, -208(%rbp)
	vpsubq	%ymm0, %ymm2, %ymm2
	vmovdqa	%ymm6, -240(%rbp)
	vpaddq	%ymm4, %ymm2, %ymm2
	vmovdqa	%ymm2, -176(%rbp)
	vzeroupper
	call	p448_mul@PLT
	vmovdqa	-336(%rbp), %ymm1
	leaq	128(%rbx), %rdi
	movq	%r13, %rdx
	vmovdqa	(%rbx), %ymm3
	movq	%r15, %rsi
	vmovdqa	-304(%rbp), %ymm0
	vpaddq	%ymm1, %ymm1, %ymm1
	vmovdqa	-432(%rbp), %ymm5
	vpaddq	%ymm1, %ymm3, %ymm2
	vpsubq	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm2, 64(%rbx)
	vpaddq	%ymm0, %ymm0, %ymm0
	vmovdqa	32(%rbx), %ymm2
	vpaddq	%ymm5, %ymm1, %ymm1
	vmovdqa	-400(%rbp), %ymm4
	vpaddq	%ymm0, %ymm2, %ymm6
	vmovdqa	%ymm1, -336(%rbp)
	vpsubq	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm6, 96(%rbx)
	vpaddq	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-344(%rbp), %r14
	movq	%r13, %rsi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	leaq	192(%rbx), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L111
	addq	$384, %rsp
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
.L111:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4670:
	.size	decaf_448_point_add, .-decaf_448_point_add
	.section	.text.unlikely.decaf_448_point_add
.LCOLDE35:
	.section	.text.decaf_448_point_add
.LHOTE35:
	.section	.text.unlikely.decaf_448_point_double,"ax",@progbits
.LCOLDB36:
	.section	.text.decaf_448_point_double,"ax",@progbits
.LHOTB36:
	.p2align 4,,15
	.globl	decaf_448_point_double
	.type	decaf_448_point_double, @function
decaf_448_point_double:
.LFB4672:
	.cfi_startproc
	jmp	point_double_internal.constprop.15
	.cfi_endproc
.LFE4672:
	.size	decaf_448_point_double, .-decaf_448_point_double
	.section	.text.unlikely.decaf_448_point_double
.LCOLDE36:
	.section	.text.decaf_448_point_double
.LHOTE36:
	.section	.text.unlikely.prepare_wnaf_table.part.1,"ax",@progbits
.LCOLDB37:
	.section	.text.prepare_wnaf_table.part.1,"ax",@progbits
.LHOTB37:
	.p2align 4,,15
	.type	prepare_wnaf_table.part.1, @function
prepare_wnaf_table.part.1:
.LFB4715:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-592(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rdi, %r13
	movq	%r12, %rdi
	leaq	128(%r12), %r14
	subq	$672, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%edx, -688(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_point_double@PLT
	leaq	64(%r12), %rax
	movq	%r12, %rdx
	movq	%rax, %rbx
	leaq	-336(%rbp), %rax
	movq	%rbx, %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	movq	%rax, -664(%rbp)
	call	gf_sub
	leaq	64(%r15), %rdi
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%rbx, -680(%rbp)
	leaq	128(%r15), %rbx
	call	gf_add
	leaq	192(%r12), %rax
	movl	$78164, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%rax, -696(%rbp)
	call	p448_mulw@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	leaq	384(%r13), %rbx
	call	gf_sub.constprop.12
	leaq	192(%r15), %rcx
	movq	%r14, %rdx
	movq	%r14, %rsi
	movq	%rcx, %rdi
	movq	%rcx, -704(%rbp)
	call	gf_add
	leaq	-656(%rbp), %rsi
	leaq	192(%r13), %rdx
	movq	%rsi, %rdi
	movq	%rsi, -672(%rbp)
	movq	%r14, %rsi
	call	p448_mul@PLT
	movq	-656(%rbp), %rdx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%rdx, -464(%rbp)
	movq	-648(%rbp), %rdx
	movq	%rdx, -456(%rbp)
	movq	-640(%rbp), %rdx
	movq	%rdx, -448(%rbp)
	movq	-632(%rbp), %rdx
	movq	%rdx, -440(%rbp)
	movq	-624(%rbp), %rdx
	movq	%rdx, -432(%rbp)
	movq	-616(%rbp), %rdx
	movq	%rdx, -424(%rbp)
	movq	-608(%rbp), %rdx
	movq	%rdx, -416(%rbp)
	movq	-600(%rbp), %rdx
	movq	%rdx, -408(%rbp)
	xorl	%edx, %edx
	call	add_niels_to_pt
	movq	-680(%rbp), %r15
	leaq	256(%r13), %rdi
	movq	%r12, %rdx
	movq	%r15, %rsi
	call	gf_sub
	leaq	320(%r13), %rdi
	movq	%r15, %rdx
	movq	%r12, %rsi
	call	gf_add
	movq	-696(%rbp), %rsi
	movl	$78164, %edx
	movq	%rbx, %rdi
	call	p448_mulw@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_sub.constprop.12
	leaq	448(%r13), %rdi
	movq	%r14, %rdx
	movq	%r14, %rsi
	call	gf_add
	movl	-688(%rbp), %eax
	movl	$1, %edx
	shlx	%eax, %edx, %edx
	cmpl	$2, %edx
	jle	.L113
	leal	-3(%rdx), %eax
	movq	-704(%rbp), %rcx
	leaq	512(%r13), %rbx
	addq	$3, %rax
	salq	$8, %rax
	movq	%rcx, -688(%rbp)
	leaq	0(%r13,%rax), %rsi
	movq	%r14, %r13
	movq	%r15, %r14
	movq	%rsi, -680(%rbp)
	.p2align 4,,10
	.p2align 3
.L115:
	movq	-688(%rbp), %rdx
	movq	-672(%rbp), %rdi
	movq	%r13, %rsi
	leaq	128(%rbx), %r15
	call	p448_mul@PLT
	movq	-656(%rbp), %rax
	movq	-664(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rax, -464(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -456(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -448(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, -440(%rbp)
	movq	-624(%rbp), %rax
	movq	%rax, -432(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, -424(%rbp)
	movq	-608(%rbp), %rax
	movq	%rax, -416(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, -408(%rbp)
	call	add_niels_to_pt
	movq	%rbx, %rdi
	movq	%r12, %rdx
	movq	%r14, %rsi
	call	gf_sub
	leaq	64(%rbx), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	gf_add
	movq	-696(%rbp), %rsi
	movl	$78164, %edx
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_sub.constprop.12
	leaq	192(%rbx), %rdi
	movq	%r13, %rdx
	movq	%r13, %rsi
	addq	$256, %rbx
	call	gf_add
	cmpq	%rbx, -680(%rbp)
	jne	.L115
.L113:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L121
	addq	$672, %rsp
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
.L121:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4715:
	.size	prepare_wnaf_table.part.1, .-prepare_wnaf_table.part.1
	.section	.text.unlikely.prepare_wnaf_table.part.1
.LCOLDE37:
	.section	.text.prepare_wnaf_table.part.1
.LHOTE37:
	.section	.text.unlikely.decaf_448_point_negate,"ax",@progbits
.LCOLDB38:
	.section	.text.decaf_448_point_negate,"ax",@progbits
.LHOTB38:
	.p2align 4,,15
	.globl	decaf_448_point_negate
	.type	decaf_448_point_negate, @function
decaf_448_point_negate:
.LFB4673:
	.cfi_startproc
	movq	%rsi, %r10
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	gf_sub.constprop.12
	movq	64(%r10), %rax
	leaq	192(%r10), %rsi
	leaq	192(%rdi), %rdi
	movq	%rax, -128(%rdi)
	movq	72(%r10), %rax
	movq	%rax, -120(%rdi)
	movq	80(%r10), %rax
	movq	%rax, -112(%rdi)
	movq	88(%r10), %rax
	movq	%rax, -104(%rdi)
	movq	96(%r10), %rax
	movq	%rax, -96(%rdi)
	movq	104(%r10), %rax
	movq	%rax, -88(%rdi)
	movq	112(%r10), %rax
	movq	%rax, -80(%rdi)
	movq	120(%r10), %rax
	movq	%rax, -72(%rdi)
	movq	128(%r10), %rax
	movq	%rax, -64(%rdi)
	movq	136(%r10), %rax
	movq	%rax, -56(%rdi)
	movq	144(%r10), %rax
	movq	%rax, -48(%rdi)
	movq	152(%r10), %rax
	movq	%rax, -40(%rdi)
	movq	160(%r10), %rax
	movq	%rax, -32(%rdi)
	movq	168(%r10), %rax
	movq	%rax, -24(%rdi)
	movq	176(%r10), %rax
	movq	%rax, -16(%rdi)
	movq	184(%r10), %rax
	movq	%rax, -8(%rdi)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	gf_sub.constprop.12
	.cfi_endproc
.LFE4673:
	.size	decaf_448_point_negate, .-decaf_448_point_negate
	.section	.text.unlikely.decaf_448_point_negate
.LCOLDE38:
	.section	.text.decaf_448_point_negate
.LHOTE38:
	.section	.text.unlikely.decaf_448_scalar_decode,"ax",@progbits
.LCOLDB39:
	.section	.text.decaf_448_scalar_decode,"ax",@progbits
.LHOTB39:
	.p2align 4,,15
	.globl	decaf_448_scalar_decode
	.type	decaf_448_scalar_decode, @function
decaf_448_scalar_decode:
.LFB4675:
	.cfi_startproc
	leaq	56(%rdi), %r11
	movq	%rdi, %r10
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L125:
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	cmpl	$56, %edx
	jne	.L133
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L137:
	cmpl	$55, %edx
	ja	.L130
.L133:
	movl	%edx, %ecx
	leal	0(,%rax,8), %r9d
	addl	$1, %eax
	movzbl	(%rsi,%rcx), %ecx
	addl	$1, %edx
	shlx	%r9, %rcx, %rcx
	orq	%rcx, %r8
	cmpl	$7, %eax
	jbe	.L137
.L130:
	movq	%r8, (%r10)
	addq	$8, %r10
	cmpq	%r11, %r10
	jne	.L125
	movq	(%rdi), %rcx
	movabsq	$-2556006723728458995, %rax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	$-1, %rdx
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	movabsq	$-2408513697996967765, %r9
	movq	$-1, %r10
	addq	%rcx, %rax
	movq	8(%rdi), %rcx
	movabsq	$-4611686018427387903, %r13
	adcq	%rbx, %rdx
	xorl	%ebx, %ebx
	movq	$-1, %r14
	movq	%rdx, %rax
	sarq	$63, %rdx
	movq	%rdi, %rsi
	addq	%rcx, %rax
	movq	16(%rdi), %rcx
	adcq	%rbx, %rdx
	addq	%r9, %rax
	movabsq	$4301259484579875184, %r9
	adcq	%r10, %rdx
	xorl	%ebx, %ebx
	movq	$-1, %r10
	movq	%rdx, %rax
	sarq	$63, %rdx
	addq	%rcx, %rax
	movq	24(%rdi), %rcx
	adcq	%rbx, %rdx
	addq	%r9, %rax
	movl	$1, %r9d
	adcq	%r10, %rdx
	xorl	%ebx, %ebx
	movq	$-1, %r10
	movq	%rdx, %rax
	sarq	$63, %rdx
	addq	%rcx, %rax
	movl	$2201345047, %ecx
	adcq	%rbx, %rdx
	addq	%rcx, %rax
	movq	$-1, %rbx
	adcq	%rbx, %rdx
	movq	%rdx, %rax
	sarq	$63, %rdx
	movq	%rax, %rcx
	movq	32(%rdi), %rax
	movq	%rdx, %rbx
	xorl	%edx, %edx
	addq	%rcx, %rax
	movq	40(%rdi), %rcx
	adcq	%rbx, %rdx
	addq	%r9, %rax
	adcq	%r10, %rdx
	xorl	%ebx, %ebx
	movq	%rdx, %rax
	sarq	$63, %rdx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	addq	%r9, %rax
	movq	48(%rdi), %r9
	adcq	%r10, %rdx
	xorl	%r10d, %r10d
	movq	%rdx, %rax
	sarq	$63, %rdx
	addq	%r9, %rax
	adcq	%r10, %rdx
	addq	%rax, %r13
	adcq	%rdx, %r14
	movq	decaf_448_scalar_one@GOTPCREL(%rip), %rdx
	call	decaf_448_scalar_mul@PLT
	movq	%r14, %rax
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4675:
	.size	decaf_448_scalar_decode, .-decaf_448_scalar_decode
	.section	.text.unlikely.decaf_448_scalar_decode
.LCOLDE39:
	.section	.text.decaf_448_scalar_decode
.LHOTE39:
	.section	.text.unlikely.decaf_bzero,"ax",@progbits
.LCOLDB40:
	.section	.text.decaf_bzero,"ax",@progbits
.LHOTB40:
	.p2align 4,,15
	.globl	decaf_bzero
	.type	decaf_bzero, @function
decaf_bzero:
.LFB4676:
	.cfi_startproc
	testq	%rsi, %rsi
	jne	.L163
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L164:
	movb	$0, (%rdi)
	addq	$1, %rdi
	subq	$1, %rsi
	je	.L162
.L163:
	testb	$7, %dil
	jne	.L164
	cmpq	$7, %rsi
	jbe	.L146
	leaq	-8(%rsi), %rax
	shrq	$3, %rax
	leaq	8(%rdi,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L142:
	movq	$0, (%rdi)
	addq	$8, %rdi
	cmpq	%rdi, %rax
	jne	.L142
	andl	$7, %esi
	je	.L165
.L145:
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L144:
	movb	$0, (%rax)
	addq	$1, %rax
	cmpq	%rsi, %rax
	jne	.L144
	rep ret
	.p2align 4,,10
	.p2align 3
.L162:
	rep ret
.L146:
	movq	%rdi, %rax
	jmp	.L145
.L165:
	ret
	.cfi_endproc
.LFE4676:
	.size	decaf_bzero, .-decaf_bzero
	.section	.text.unlikely.decaf_bzero
.LCOLDE40:
	.section	.text.decaf_bzero
.LHOTE40:
	.section	.text.unlikely.decaf_448_scalar_destroy,"ax",@progbits
.LCOLDB41:
	.section	.text.decaf_448_scalar_destroy,"ax",@progbits
.LHOTB41:
	.p2align 4,,15
	.globl	decaf_448_scalar_destroy
	.type	decaf_448_scalar_destroy, @function
decaf_448_scalar_destroy:
.LFB4677:
	.cfi_startproc
	movl	$56, %esi
	jmp	decaf_bzero@PLT
	.cfi_endproc
.LFE4677:
	.size	decaf_448_scalar_destroy, .-decaf_448_scalar_destroy
	.section	.text.unlikely.decaf_448_scalar_destroy
.LCOLDE41:
	.section	.text.decaf_448_scalar_destroy
.LHOTE41:
	.section	.text.unlikely.decaf_448_scalar_invert,"ax",@progbits
.LCOLDB42:
	.section	.text.decaf_448_scalar_invert,"ax",@progbits
.LHOTB42:
	.p2align 4,,15
	.globl	decaf_448_scalar_invert
	.type	decaf_448_scalar_invert, @function
decaf_448_scalar_invert:
.LFB4658:
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
	subq	$664, %rsp
	.cfi_def_cfa_offset 720
	movq	sc_r2@GOTPCREL(%rip), %rdx
	leaq	256(%rsp), %r13
	leaq	64(%rsp), %r15
	movq	%rdi, 8(%rsp)
	leaq	19(%rsp), %rbp
	leaq	63(%rsp), %r12
	movq	%r13, %rdi
	movq	%fs:40, %rax
	movq	%rax, 648(%rsp)
	xorl	%eax, %eax
	call	sc_montmul
	movq	%r13, %rdx
	movq	%r13, %rsi
	movq	%r15, %rdi
	movb	$2, 16(%rsp)
	movb	$0, 17(%rsp)
	movb	$1, 18(%rsp)
	movb	$0, 19(%rsp)
	movb	$3, 20(%rsp)
	movb	$2, 21(%rsp)
	movb	$1, 22(%rsp)
	movb	$0, 23(%rsp)
	movb	$4, 24(%rsp)
	movb	$3, 25(%rsp)
	movb	$1, 26(%rsp)
	movb	$0, 27(%rsp)
	movb	$5, 28(%rsp)
	movb	$4, 29(%rsp)
	movb	$1, 30(%rsp)
	movb	$0, 31(%rsp)
	movb	$1, 32(%rsp)
	movb	$5, 33(%rsp)
	movb	$1, 34(%rsp)
	movb	$0, 35(%rsp)
	movb	$1, 36(%rsp)
	movb	$1, 37(%rsp)
	movb	$3, 38(%rsp)
	movb	$3, 39(%rsp)
	movb	$6, 40(%rsp)
	movb	$1, 41(%rsp)
	movb	$9, 42(%rsp)
	movb	$1, 43(%rsp)
	movb	$1, 44(%rsp)
	movb	$6, 45(%rsp)
	movb	$1, 46(%rsp)
	movb	$0, 47(%rsp)
	movb	$6, 48(%rsp)
	movb	$1, 49(%rsp)
	movb	$18, 50(%rsp)
	movb	$6, 51(%rsp)
	movb	$1, 52(%rsp)
	movb	$6, 53(%rsp)
	movb	$37, 54(%rsp)
	movb	$6, 55(%rsp)
	movb	$1, 56(%rsp)
	movb	$1, 57(%rsp)
	movb	$37, 58(%rsp)
	movb	$6, 59(%rsp)
	movb	$1, 60(%rsp)
	movb	$1, 61(%rsp)
	movb	$111, 62(%rsp)
	movb	$1, 63(%rsp)
	movb	$6, 128(%rsp)
	movb	$5, 129(%rsp)
	movb	$4, 130(%rsp)
	movb	$2, 131(%rsp)
	movb	$3, 132(%rsp)
	movb	$0, 133(%rsp)
	movb	$2, 134(%rsp)
	movb	$0, 135(%rsp)
	movb	$4, 136(%rsp)
	movb	$0, 137(%rsp)
	movb	$8, 138(%rsp)
	movb	$5, 139(%rsp)
	movb	$2, 140(%rsp)
	movb	$0, 141(%rsp)
	movb	$5, 142(%rsp)
	movb	$3, 143(%rsp)
	movb	$4, 144(%rsp)
	movb	$0, 145(%rsp)
	movb	$4, 146(%rsp)
	movb	$0, 147(%rsp)
	movb	$5, 148(%rsp)
	movb	$3, 149(%rsp)
	movb	$3, 150(%rsp)
	movb	$2, 151(%rsp)
	movb	$3, 152(%rsp)
	movb	$2, 153(%rsp)
	movb	$3, 154(%rsp)
	movb	$2, 155(%rsp)
	movb	$2, 156(%rsp)
	movb	$0, 157(%rsp)
	movb	$3, 158(%rsp)
	movb	$0, 159(%rsp)
	movb	$4, 160(%rsp)
	movb	$2, 161(%rsp)
	movb	$2, 162(%rsp)
	movb	$0, 163(%rsp)
	movb	$4, 164(%rsp)
	movb	$3, 165(%rsp)
	movb	$3, 166(%rsp)
	movb	$2, 167(%rsp)
	movb	$2, 168(%rsp)
	movb	$0, 169(%rsp)
	movb	$3, 170(%rsp)
	movb	$2, 171(%rsp)
	movb	$5, 172(%rsp)
	movb	$2, 173(%rsp)
	movb	$3, 174(%rsp)
	movb	$2, 175(%rsp)
	movb	$2, 176(%rsp)
	movb	$0, 177(%rsp)
	movb	$3, 178(%rsp)
	movb	$0, 179(%rsp)
	movb	$7, 180(%rsp)
	movb	$0, 181(%rsp)
	movb	$5, 182(%rsp)
	movb	$0, 183(%rsp)
	movb	$3, 184(%rsp)
	movb	$2, 185(%rsp)
	movb	$3, 186(%rsp)
	movb	$2, 187(%rsp)
	movb	$4, 188(%rsp)
	movb	$2, 189(%rsp)
	movb	$5, 190(%rsp)
	movb	$0, 191(%rsp)
	movb	$5, 192(%rsp)
	movb	$3, 193(%rsp)
	movb	$3, 194(%rsp)
	movb	$0, 195(%rsp)
	movb	$2, 196(%rsp)
	movb	$0, 197(%rsp)
	movb	$5, 198(%rsp)
	movb	$2, 199(%rsp)
	movb	$4, 200(%rsp)
	movb	$3, 201(%rsp)
	movb	$4, 202(%rsp)
	movb	$0, 203(%rsp)
	movb	$3, 204(%rsp)
	movb	$2, 205(%rsp)
	movb	$7, 206(%rsp)
	movb	$4, 207(%rsp)
	movb	$2, 208(%rsp)
	movb	$0, 209(%rsp)
	movb	$2, 210(%rsp)
	movb	$0, 211(%rsp)
	movb	$2, 212(%rsp)
	movb	$0, 213(%rsp)
	movb	$2, 214(%rsp)
	movb	$0, 215(%rsp)
	movb	$3, 216(%rsp)
	movb	$0, 217(%rsp)
	movb	$5, 218(%rsp)
	movb	$2, 219(%rsp)
	movb	$5, 220(%rsp)
	movb	$4, 221(%rsp)
	movb	$5, 222(%rsp)
	movb	$2, 223(%rsp)
	movb	$5, 224(%rsp)
	movb	$0, 225(%rsp)
	movb	$2, 226(%rsp)
	movb	$0, 227(%rsp)
	movb	$3, 228(%rsp)
	movb	$0, 229(%rsp)
	movb	$3, 230(%rsp)
	movb	$0, 231(%rsp)
	movb	$2, 232(%rsp)
	movb	$0, 233(%rsp)
	movb	$2, 234(%rsp)
	movb	$0, 235(%rsp)
	movb	$2, 236(%rsp)
	movb	$0, 237(%rsp)
	movb	$3, 238(%rsp)
	movb	$2, 239(%rsp)
	movb	$2, 240(%rsp)
	movb	$0, 241(%rsp)
	movb	$3, 242(%rsp)
	movb	$2, 243(%rsp)
	movb	$5, 244(%rsp)
	movb	$0, 245(%rsp)
	movb	$4, 246(%rsp)
	movb	$0, 247(%rsp)
	movb	$6, 248(%rsp)
	movb	$4, 249(%rsp)
	movb	$4, 250(%rsp)
	movb	$0, 251(%rsp)
	call	sc_montmul
	.p2align 4,,10
	.p2align 3
.L168:
	movzbl	0(%rbp), %edx
	leaq	0(,%rdx,8), %rcx
	salq	$6, %rdx
	subq	%rcx, %rdx
	movzbl	-3(%rbp), %ecx
	addq	%r13, %rdx
	leaq	0(,%rcx,8), %rsi
	salq	$6, %rcx
	subq	%rsi, %rcx
	movq	%r15, %rsi
	leaq	0(%r13,%rcx), %rdi
	call	sc_montmul
	cmpq	%r12, %rbp
	je	.L189
	movzbl	2(%rbp), %edx
	movq	%r15, %rdi
	leaq	0(,%rdx,8), %rcx
	movq	%rdx, %rsi
	salq	$6, %rsi
	subq	%rcx, %rsi
	leaq	0(%r13,%rsi), %rsi
	movq	%rsi, %rdx
	call	sc_montmul
	movzbl	3(%rbp), %ebx
	cmpl	$1, %ebx
	jbe	.L170
	movl	$1, %r14d
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%r15, %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	addl	$1, %r14d
	call	sc_montmul
	cmpl	%r14d, %ebx
	jne	.L169
.L170:
	addq	$4, %rbp
	jmp	.L168
.L189:
	leaq	128(%rsp), %rbp
	leaq	56(%r13), %r12
	leaq	124(%rbp), %rax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L173:
	movq	%r12, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	sc_montmul
	movzbl	0(%rbp), %ebx
	movl	$1, %r14d
	cmpl	$1, %ebx
	jbe	.L175
	.p2align 4,,10
	.p2align 3
.L180:
	movq	%r15, %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	addl	$1, %r14d
	call	sc_montmul
	cmpl	%ebx, %r14d
	jne	.L180
.L175:
	movzbl	1(%rbp), %edx
	movq	%r15, %rsi
	movq	%r12, %rdi
	addq	$2, %rbp
	leaq	0(,%rdx,8), %rcx
	salq	$6, %rdx
	subq	%rcx, %rdx
	addq	%r13, %rdx
	call	sc_montmul
	cmpq	%rbp, (%rsp)
	jne	.L173
	movq	decaf_448_scalar_one@GOTPCREL(%rip), %rdx
	movq	8(%rsp), %rdi
	leaq	392(%r13), %rbx
	movq	%r12, %rsi
	call	sc_montmul
	.p2align 4,,10
	.p2align 3
.L176:
	movq	%r13, %rdi
	addq	$56, %r13
	call	decaf_448_scalar_destroy@PLT
	cmpq	%r13, %rbx
	jne	.L176
	movq	decaf_448_scalar_zero@GOTPCREL(%rip), %rsi
	movq	8(%rsp), %rdi
	call	decaf_448_scalar_eq@PLT
	movq	648(%rsp), %rcx
	xorq	%fs:40, %rcx
	notq	%rax
	jne	.L190
	addq	$664, %rsp
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
.L190:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4658:
	.size	decaf_448_scalar_invert, .-decaf_448_scalar_invert
	.section	.text.unlikely.decaf_448_scalar_invert
.LCOLDE42:
	.section	.text.decaf_448_scalar_invert
.LHOTE42:
	.section	.rodata.str1.1
.LC43:
	.string	"i==0"
	.section	.text.unlikely.decaf_448_scalar_decode_long,"ax",@progbits
.LCOLDB44:
	.section	.text.decaf_448_scalar_decode_long,"ax",@progbits
.LHOTB44:
	.p2align 4,,15
	.globl	decaf_448_scalar_decode_long
	.type	decaf_448_scalar_decode_long, @function
decaf_448_scalar_decode_long:
.LFB4679:
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
	movq	%rdi, %rbp
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	testq	%rdx, %rdx
	jne	.L192
	movq	decaf_448_scalar_zero@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movq	%rdx, (%rdi)
	movq	8(%rax), %rdx
	movq	%rdx, 8(%rdi)
	movq	16(%rax), %rdx
	movq	%rdx, 16(%rdi)
	movq	24(%rax), %rdx
	movq	%rdx, 24(%rdi)
	movq	32(%rax), %rdx
	movq	%rdx, 32(%rdi)
	movq	40(%rax), %rdx
	movq	48(%rax), %rax
	movq	%rdx, 40(%rdi)
	movq	%rax, 48(%rdi)
.L191:
	movq	120(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L217
	addq	$136, %rsp
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
.L192:
	.cfi_restore_state
	movq	%rdx, %rax
	movq	%rdx, %r10
	movabsq	$2635249153387078803, %rdx
	shrq	$3, %rax
	movl	%r10d, %r8d
	leaq	56(%rsp), %r14
	mulq	%rdx
	leaq	-56(%r10), %rax
	movq	%rsi, %r12
	movq	%rsp, %rbx
	movq	%rsp, %r11
	movq	%rdx, %r13
	salq	$3, %rdx
	salq	$6, %r13
	subq	%rdx, %r13
	cmpq	%r13, %r10
	cmove	%rax, %r13
	xorl	%edx, %edx
	leaq	(%rsi,%r13), %r9
	subl	%r13d, %r8d
	.p2align 4,,10
	.p2align 3
.L195:
	xorl	%esi, %esi
	xorl	%eax, %eax
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L210:
	movl	%edx, %ecx
	leal	0(,%rax,8), %edi
	addl	$1, %eax
	movzbl	(%r9,%rcx), %ecx
	addl	$1, %edx
	shlx	%rdi, %rcx, %rcx
	orq	%rcx, %rsi
	cmpl	$7, %eax
	ja	.L200
.L216:
	cmpl	%edx, %r8d
	ja	.L210
.L200:
	movq	%rsi, (%r11)
	addq	$8, %r11
	cmpq	%r11, %r14
	jne	.L195
	cmpq	$56, %r10
	je	.L201
	testq	%r13, %r13
	leaq	64(%rsp), %r14
	je	.L206
	movq	sc_r2@GOTPCREL(%rip), %r15
	.p2align 4,,10
	.p2align 3
.L205:
	movq	%r15, %rdx
	subq	$56, %r13
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	sc_montmul
	leaq	(%r12,%r13), %rsi
	movq	%r14, %rdi
	call	decaf_448_scalar_decode@PLT
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_add@PLT
	testq	%r13, %r13
	jne	.L205
.L206:
	movq	(%rsp), %rax
	movq	%rbx, %rdi
	movq	%rax, 0(%rbp)
	movq	8(%rsp), %rax
	movq	%rax, 8(%rbp)
	movq	16(%rsp), %rax
	movq	%rax, 16(%rbp)
	movq	24(%rsp), %rax
	movq	%rax, 24(%rbp)
	movq	32(%rsp), %rax
	movq	%rax, 32(%rbp)
	movq	40(%rsp), %rax
	movq	%rax, 40(%rbp)
	movq	48(%rsp), %rax
	movq	%rax, 48(%rbp)
	call	decaf_448_scalar_destroy@PLT
	movq	%r14, %rdi
	call	decaf_448_scalar_destroy@PLT
	jmp	.L191
.L201:
	testq	%r13, %r13
	jne	.L218
	movq	decaf_448_scalar_one@GOTPCREL(%rip), %rdx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	decaf_448_scalar_mul@PLT
	movq	%rbx, %rdi
	call	decaf_448_scalar_destroy@PLT
	jmp	.L191
.L218:
	leaq	__PRETTY_FUNCTION__.27669(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC43(%rip), %rdi
	movl	$687, %edx
	call	__assert_fail@PLT
.L217:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4679:
	.size	decaf_448_scalar_decode_long, .-decaf_448_scalar_decode_long
	.section	.text.unlikely.decaf_448_scalar_decode_long
.LCOLDE44:
	.section	.text.decaf_448_scalar_decode_long
.LHOTE44:
	.section	.text.unlikely.decaf_448_scalar_encode,"ax",@progbits
.LCOLDB45:
	.section	.text.decaf_448_scalar_encode,"ax",@progbits
.LHOTB45:
	.p2align 4,,15
	.globl	decaf_448_scalar_encode
	.type	decaf_448_scalar_encode, @function
decaf_448_scalar_encode:
.LFB4680:
	.cfi_startproc
	movq	(%rsi), %rax
	movb	%al, (%rdi)
	movl	$8, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 1(%rdi)
	movl	$16, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 2(%rdi)
	movl	$24, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 3(%rdi)
	movl	$32, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 4(%rdi)
	movl	$40, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 5(%rdi)
	movl	$48, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 6(%rdi)
	movl	$56, %eax
	shrx	%rax, (%rsi), %rax
	movb	%al, 7(%rdi)
	movq	8(%rsi), %rax
	movb	%al, 8(%rdi)
	movl	$8, %eax
	shrx	%rax, 8(%rsi), %rax
	movb	%al, 9(%rdi)
	movl	$16, %eax
	shrx	%rax, 8(%rsi), %rax
	movb	%al, 10(%rdi)
	movl	$24, %eax
	shrx	%rax, 8(%rsi), %rax
	movb	%al, 11(%rdi)
	movl	12(%rsi), %eax
	movb	%al, 12(%rdi)
	movl	$40, %eax
	shrx	%rax, 8(%rsi), %rax
	movb	%al, 13(%rdi)
	movzwl	14(%rsi), %eax
	movb	%al, 14(%rdi)
	movzbl	15(%rsi), %eax
	movb	%al, 15(%rdi)
	movq	16(%rsi), %rax
	movb	%al, 16(%rdi)
	movl	$8, %eax
	shrx	%rax, 16(%rsi), %rax
	movb	%al, 17(%rdi)
	movl	$16, %eax
	shrx	%rax, 16(%rsi), %rax
	movb	%al, 18(%rdi)
	movl	$24, %eax
	shrx	%rax, 16(%rsi), %rax
	movb	%al, 19(%rdi)
	movl	20(%rsi), %eax
	movb	%al, 20(%rdi)
	movl	$40, %eax
	shrx	%rax, 16(%rsi), %rax
	movb	%al, 21(%rdi)
	movzwl	22(%rsi), %eax
	movb	%al, 22(%rdi)
	movzbl	23(%rsi), %eax
	movb	%al, 23(%rdi)
	movq	24(%rsi), %rax
	movb	%al, 24(%rdi)
	movl	$8, %eax
	shrx	%rax, 24(%rsi), %rax
	movb	%al, 25(%rdi)
	movl	$16, %eax
	shrx	%rax, 24(%rsi), %rax
	movb	%al, 26(%rdi)
	movl	$24, %eax
	shrx	%rax, 24(%rsi), %rax
	movb	%al, 27(%rdi)
	movl	28(%rsi), %eax
	movb	%al, 28(%rdi)
	movl	$40, %eax
	shrx	%rax, 24(%rsi), %rax
	movb	%al, 29(%rdi)
	movzwl	30(%rsi), %eax
	movb	%al, 30(%rdi)
	movzbl	31(%rsi), %eax
	movb	%al, 31(%rdi)
	movq	32(%rsi), %rax
	movb	%al, 32(%rdi)
	movl	$8, %eax
	shrx	%rax, 32(%rsi), %rax
	movb	%al, 33(%rdi)
	movl	$16, %eax
	shrx	%rax, 32(%rsi), %rax
	movb	%al, 34(%rdi)
	movl	$24, %eax
	shrx	%rax, 32(%rsi), %rax
	movb	%al, 35(%rdi)
	movl	36(%rsi), %eax
	movb	%al, 36(%rdi)
	movl	$40, %eax
	shrx	%rax, 32(%rsi), %rax
	movb	%al, 37(%rdi)
	movzwl	38(%rsi), %eax
	movb	%al, 38(%rdi)
	movzbl	39(%rsi), %eax
	movb	%al, 39(%rdi)
	movq	40(%rsi), %rax
	movb	%al, 40(%rdi)
	movl	$8, %eax
	shrx	%rax, 40(%rsi), %rax
	movb	%al, 41(%rdi)
	movl	$16, %eax
	shrx	%rax, 40(%rsi), %rax
	movb	%al, 42(%rdi)
	movl	$24, %eax
	shrx	%rax, 40(%rsi), %rax
	movb	%al, 43(%rdi)
	movl	44(%rsi), %eax
	movb	%al, 44(%rdi)
	movl	$40, %eax
	shrx	%rax, 40(%rsi), %rax
	movb	%al, 45(%rdi)
	movzwl	46(%rsi), %eax
	movb	%al, 46(%rdi)
	movzbl	47(%rsi), %eax
	movb	%al, 47(%rdi)
	movq	48(%rsi), %rax
	movb	%al, 48(%rdi)
	movl	$8, %eax
	shrx	%rax, 48(%rsi), %rax
	movb	%al, 49(%rdi)
	movl	$16, %eax
	shrx	%rax, 48(%rsi), %rax
	movb	%al, 50(%rdi)
	movl	$24, %eax
	shrx	%rax, 48(%rsi), %rax
	movb	%al, 51(%rdi)
	movl	52(%rsi), %eax
	movb	%al, 52(%rdi)
	movl	$40, %eax
	shrx	%rax, 48(%rsi), %rax
	movb	%al, 53(%rdi)
	movzwl	54(%rsi), %eax
	movb	%al, 54(%rdi)
	movzbl	55(%rsi), %eax
	movb	%al, 55(%rdi)
	ret
	.cfi_endproc
.LFE4680:
	.size	decaf_448_scalar_encode, .-decaf_448_scalar_encode
	.section	.text.unlikely.decaf_448_scalar_encode
.LCOLDE45:
	.section	.text.decaf_448_scalar_encode
.LHOTE45:
	.section	.text.unlikely.decaf_448_point_scalarmul,"ax",@progbits
.LCOLDB47:
	.section	.text.decaf_448_point_scalarmul,"ax",@progbits
.LHOTB47:
	.p2align 4,,15
	.globl	decaf_448_point_scalarmul
	.type	decaf_448_point_scalarmul, @function
decaf_448_point_scalarmul:
.LFB4691:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rdx, %rsi
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-720(%rbp), %rbx
	movl	$445, %r14d
	subq	$832, %rsp
	movq	decaf_448_point_scalarmul_adjustment@GOTPCREL(%rip), %rdx
	movq	%rdi, -872(%rbp)
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_scalar_add@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	leaq	-656(%rbp), %rbx
	call	sc_halve.constprop.8
	subq	$4128, %rsp
	movq	%r12, %rsi
	leaq	-336(%rbp), %r12
	leaq	31(%rsp), %r13
	andq	$-32, %r13
	movq	%r13, %rdi
	leaq	4096(%r13), %r15
	call	prepare_fixed_window.constprop.7
	leaq	256(%r13), %rcx
	movl	$61, %eax
	movq	%rbx, -792(%rbp)
	shrx	%rax, -672(%rbp), %rax
	vpxor	%xmm11, %xmm11, %xmm11
	movq	%rcx, -816(%rbp)
	leaq	-592(%rbp), %rcx
	vmovdqa	.LC46(%rip), %ymm12
	movl	$1, %r10d
	leaq	128(%rcx), %rbx
	movq	%rcx, -800(%rbp)
	addq	$192, %rcx
	movq	%rcx, -808(%rbp)
	leaq	128(%r12), %rcx
	movq	%rbx, -856(%rbp)
	movq	%rcx, -864(%rbp)
	.p2align 4,,10
	.p2align 3
.L221:
	andl	$31, %eax
	movq	%rax, %r9
	shrq	$4, %r9
	subq	$1, %r9
	xorq	%r9, %rax
	andl	$15, %eax
	movl	%eax, -752(%rbp)
	movq	-816(%rbp), %rax
	vpbroadcastd	-752(%rbp), %ymm1
	vpcmpeqd	%ymm11, %ymm1, %ymm2
	vpsubd	%ymm12, %ymm1, %ymm1
	vpand	0(%r13), %ymm2, %ymm6
	vpand	32(%r13), %ymm2, %ymm5
	vpand	64(%r13), %ymm2, %ymm4
	vpand	96(%r13), %ymm2, %ymm3
	vpand	128(%r13), %ymm2, %ymm9
	vpand	160(%r13), %ymm2, %ymm8
	vpand	192(%r13), %ymm2, %ymm7
	vpand	224(%r13), %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L223:
	vpcmpeqd	%ymm11, %ymm1, %ymm0
	addq	$256, %rax
	vpsubd	%ymm12, %ymm1, %ymm1
	vpand	-256(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm6, %ymm6
	vpand	-224(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm5, %ymm5
	vpand	-192(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm4, %ymm4
	vpand	-160(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm3, %ymm3
	vpand	-128(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm9, %ymm9
	vpand	-96(%rax), %ymm0, %ymm10
	vpor	%ymm10, %ymm8, %ymm8
	vpand	-64(%rax), %ymm0, %ymm10
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%r15, %rax
	vpor	%ymm10, %ymm7, %ymm7
	vpor	%ymm0, %ymm2, %ymm2
	jne	.L223
	vmovdqa	%xmm6, %xmm0
	vmovdqa	%ymm6, -592(%rbp)
	vmovdqa	%ymm4, -528(%rbp)
	vmovq	%xmm0, %r8
	vmovdqa	%xmm5, %xmm0
	vmovdqa	%ymm5, -560(%rbp)
	vmovq	%xmm0, %rsi
	vmovdqa	%xmm4, %xmm0
	movq	%r8, %rdi
	vmovdqa	%ymm3, -496(%rbp)
	vmovq	%xmm0, %rdx
	vmovdqa	%xmm3, %xmm0
	vmovdqa	%ymm11, -848(%rbp)
	xorq	%rdx, %rdi
	movq	%rdx, %r11
	vmovq	%xmm0, %rax
	andq	%r9, %rdi
	vmovdqa	%ymm12, -784(%rbp)
	xorq	%rdi, %r8
	movq	%rdi, %rdx
	vmovdqa	%ymm9, -464(%rbp)
	movq	%r8, -592(%rbp)
	xorq	%r11, %rdx
	vmovdqa	%ymm8, -432(%rbp)
	movq	-584(%rbp), %r8
	vmovdqa	%ymm7, -400(%rbp)
	movq	-520(%rbp), %r11
	vmovdqa	%ymm2, -368(%rbp)
	movq	%rdx, -528(%rbp)
	movq	%r8, %rdi
	xorq	%r11, %rdi
	andq	%r9, %rdi
	xorq	%rdi, %r8
	movq	%rdi, %rdx
	movq	%r8, -584(%rbp)
	movq	-576(%rbp), %r8
	xorq	%r11, %rdx
	movq	-512(%rbp), %r11
	movq	%rdx, -520(%rbp)
	movq	%r8, %rdi
	xorq	%r11, %rdi
	movq	%rdi, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %r8
	xorq	%r11, %rdx
	movq	-504(%rbp), %r11
	movq	%r8, -576(%rbp)
	movq	-568(%rbp), %r8
	movq	%rdx, -512(%rbp)
	movq	%r8, %rdi
	xorq	%r11, %rdi
	movq	%rdi, %rdx
	movq	%rax, %rdi
	andq	%r9, %rdx
	xorq	%rdx, %r8
	xorq	%r11, %rdx
	movq	%rdx, -504(%rbp)
	movq	%rsi, %rdx
	movq	%r8, -568(%rbp)
	xorq	%rax, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	-488(%rbp), %rdi
	movq	%rsi, -560(%rbp)
	movq	-552(%rbp), %rsi
	movq	%rax, -496(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	-480(%rbp), %rdi
	movq	%rsi, -552(%rbp)
	movq	-544(%rbp), %rsi
	movq	%rax, -488(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	%rsi, -544(%rbp)
	movq	-536(%rbp), %rsi
	movq	-472(%rbp), %rdi
	movq	%rax, -480(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	-792(%rbp), %rdi
	movq	%rsi, -536(%rbp)
	movq	-856(%rbp), %rsi
	movq	%rax, -472(%rbp)
	vzeroupper
	call	gf_sub.constprop.12
	vmovdqa	-464(%rbp), %ymm0
	movl	%r9d, -752(%rbp)
	testl	%r10d, %r10d
	vpbroadcastd	-752(%rbp), %ymm1
	movl	$4, %ebx
	vpxor	-656(%rbp), %ymm0, %ymm2
	vmovdqa	-784(%rbp), %ymm12
	vmovdqa	-848(%rbp), %ymm11
	vpand	%ymm1, %ymm2, %ymm2
	vpxor	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, -464(%rbp)
	vmovdqa	-432(%rbp), %ymm0
	vpxor	-624(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	jne	.L242
.L233:
	movq	%r12, %rsi
	movq	%r12, %rdi
	vmovdqa	%ymm11, -784(%rbp)
	vmovdqa	%ymm12, -752(%rbp)
	vzeroupper
	call	point_double_internal.constprop.14
	subl	$1, %ebx
	vmovdqa	-752(%rbp), %ymm12
	vmovdqa	-784(%rbp), %ymm11
	jne	.L233
	movq	%r12, %rsi
	movq	%r12, %rdi
	vzeroupper
	call	point_double_internal.constprop.15
	movq	-808(%rbp), %rdx
	movq	-864(%rbp), %rsi
	movq	-792(%rbp), %rdi
	call	p448_mul@PLT
	movq	-656(%rbp), %rax
	xorl	%edx, %edx
	movq	-800(%rbp), %rsi
	testl	%r14d, %r14d
	movq	%r12, %rdi
	setne	%dl
	subl	$5, %r14d
	movq	%rax, -208(%rbp)
	movq	-648(%rbp), %rax
	negq	%rdx
	movq	%rax, -200(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-624(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-608(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, -152(%rbp)
	call	add_niels_to_pt
	cmpl	$-5, %r14d
	vmovdqa	-784(%rbp), %ymm11
	vmovdqa	-752(%rbp), %ymm12
	je	.L243
.L227:
	movl	%r14d, %edx
	movl	%r14d, %esi
	sarl	$6, %edx
	andl	$63, %esi
	movslq	%edx, %rax
	cmpl	$58, %esi
	movq	-720(%rbp,%rax,8), %rax
	shrx	%rsi, %rax, %rax
	jle	.L222
	cmpl	$383, %r14d
	jg	.L222
	addl	$1, %edx
	movl	$64, %edi
	movslq	%edx, %rdx
	subl	%esi, %edi
	movq	-720(%rbp,%rdx,8), %rdx
	movl	%edi, %esi
	shlx	%rsi, %rdx, %rdx
	xorq	%rdx, %rax
.L222:
	xorl	%r10d, %r10d
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L242:
	movq	-800(%rbp), %rax
	movq	-792(%rbp), %rdi
	vmovdqa	%ymm11, -784(%rbp)
	vmovdqa	%ymm12, -752(%rbp)
	leaq	64(%rax), %r9
	movq	%rax, %rdx
	movq	%r9, %rsi
	vzeroupper
	call	gf_add
	leaq	64(%r12), %rbx
	movq	-800(%rbp), %rdx
	movq	%r9, %rsi
	subl	$5, %r14d
	movq	%rbx, %rdi
	call	gf_sub
	movq	-792(%rbp), %rdx
	leaq	192(%r12), %rdi
	movq	%rbx, %rsi
	call	p448_mul@PLT
	movq	-808(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-792(%rbp), %rdx
	movq	-808(%rbp), %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-808(%rbp), %rsi
	movq	-864(%rbp), %rdi
	call	p448_sqr@PLT
	cmpl	$-5, %r14d
	vmovdqa	-752(%rbp), %ymm12
	vmovdqa	-784(%rbp), %ymm11
	jne	.L227
.L243:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	movl	$32, %ecx
	movq	-872(%rbp), %rdi
	movq	%r12, %rsi
	rep movsq
	jne	.L244
	vzeroupper
	leaq	-48(%rbp), %rsp
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
.L244:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4691:
	.size	decaf_448_point_scalarmul, .-decaf_448_point_scalarmul
	.section	.text.unlikely.decaf_448_point_scalarmul
.LCOLDE47:
	.section	.text.decaf_448_point_scalarmul
.LHOTE47:
	.section	.text.unlikely.decaf_448_point_double_scalarmul,"ax",@progbits
.LCOLDB48:
	.section	.text.decaf_448_point_double_scalarmul,"ax",@progbits
.LHOTB48:
	.p2align 4,,15
	.globl	decaf_448_point_double_scalarmul
	.type	decaf_448_point_double_scalarmul, @function
decaf_448_point_double_scalarmul:
.LFB4692:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rsi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-784(%rbp), %rbx
	movq	%rdx, %rsi
	movq	%rcx, %r13
	movq	%r8, %r15
	subq	$960, %rsp
	movq	decaf_448_point_scalarmul_adjustment@GOTPCREL(%rip), %r14
	movq	%rdi, -992(%rbp)
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%r14, %rdx
	call	decaf_448_scalar_add@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	leaq	-720(%rbp), %rbx
	call	sc_halve.constprop.8
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_add@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	sc_halve.constprop.8
	subq	$4128, %rsp
	movq	%r12, %rsi
	leaq	31(%rsp), %r15
	subq	$4128, %rsp
	leaq	31(%rsp), %rax
	andq	$-32, %r15
	andq	$-32, %rax
	movq	%r15, %rdi
	leaq	4096(%r15), %r12
	movq	%rax, %rbx
	call	prepare_fixed_window.constprop.7
	movq	%r13, %rsi
	movq	%rbx, %rdi
	leaq	4096(%rbx), %r14
	call	prepare_fixed_window.constprop.7
	leaq	256(%r15), %rdi
	leaq	-656(%rbp), %rsi
	movl	$61, %eax
	movl	$61, %ecx
	shrx	%rax, -736(%rbp), %rax
	shrx	%rcx, -672(%rbp), %rcx
	movq	%rdi, -912(%rbp)
	movq	%rsi, -864(%rbp)
	leaq	-592(%rbp), %rdi
	leaq	256(%rbx), %rsi
	vpxor	%xmm7, %xmm7, %xmm7
	movq	%rdi, -880(%rbp)
	movl	$1, %r10d
	vmovdqa	.LC46(%rip), %ymm8
	movq	%rsi, -984(%rbp)
	leaq	128(%rdi), %rsi
	addq	$192, %rdi
	movq	%rdi, -888(%rbp)
	leaq	-336(%rbp), %r13
	movq	%r14, %rdi
	movl	$445, -852(%rbp)
	movq	%rbx, %r14
	movq	%rsi, -896(%rbp)
	movl	%r10d, -816(%rbp)
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L246:
	andl	$31, %eax
	andl	$31, %ecx
	movq	%rax, %r9
	movq	%rcx, %rdx
	shrq	$4, %r9
	shrq	$4, %rdx
	leaq	-1(%r9), %rdi
	movq	%rdi, %rsi
	leaq	-1(%rdx), %rdi
	xorq	%rsi, %rax
	movq	%rsi, %r9
	andl	$15, %eax
	xorq	%rdi, %rcx
	movq	%rdi, -872(%rbp)
	movl	%eax, -848(%rbp)
	movq	-912(%rbp), %rax
	vpbroadcastd	-848(%rbp), %ymm1
	movq	%rcx, -904(%rbp)
	vpcmpeqd	%ymm7, %ymm1, %ymm2
	vpsubd	%ymm8, %ymm1, %ymm1
	vpand	(%r15), %ymm2, %ymm6
	vpand	32(%r15), %ymm2, %ymm5
	vpand	64(%r15), %ymm2, %ymm4
	vpand	96(%r15), %ymm2, %ymm3
	vpand	128(%r15), %ymm2, %ymm11
	vpand	160(%r15), %ymm2, %ymm10
	vpand	192(%r15), %ymm2, %ymm9
	vpand	224(%r15), %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L248:
	vpcmpeqd	%ymm7, %ymm1, %ymm0
	addq	$256, %rax
	vpsubd	%ymm8, %ymm1, %ymm1
	vpand	-256(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm6, %ymm6
	vpand	-224(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm5, %ymm5
	vpand	-192(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm4, %ymm4
	vpand	-160(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm3, %ymm3
	vpand	-128(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm11, %ymm11
	vpand	-96(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm10, %ymm10
	vpand	-64(%rax), %ymm0, %ymm12
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%r12, %rax
	vpor	%ymm12, %ymm9, %ymm9
	vpor	%ymm0, %ymm2, %ymm2
	jne	.L248
	vmovdqa	%xmm6, %xmm0
	vmovdqa	%ymm6, -592(%rbp)
	vmovdqa	%ymm4, -528(%rbp)
	movl	%r10d, -816(%rbp)
	vmovq	%xmm0, %rdx
	vmovdqa	%xmm5, %xmm0
	vmovdqa	%ymm5, -560(%rbp)
	vmovq	%xmm0, %rcx
	vmovdqa	%xmm4, %xmm0
	vmovdqa	%ymm3, -496(%rbp)
	vmovq	%xmm0, %rsi
	vmovdqa	%xmm3, %xmm0
	vmovdqa	%ymm7, -976(%rbp)
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	vmovq	%xmm0, %rax
	xorq	%rdi, %rsi
	vmovdqa	%ymm8, -944(%rbp)
	andq	%r9, %rsi
	vmovdqa	%ymm11, -464(%rbp)
	xorq	%rsi, %rdx
	xorq	%rdi, %rsi
	movq	-520(%rbp), %rdi
	movq	%rsi, -528(%rbp)
	vmovdqa	%ymm10, -432(%rbp)
	movq	-584(%rbp), %rsi
	movq	%rdx, -592(%rbp)
	vmovdqa	%ymm9, -400(%rbp)
	vmovdqa	%ymm2, -368(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rsi
	xorq	%rdi, %rdx
	movq	-512(%rbp), %rdi
	movq	%rsi, -584(%rbp)
	movq	-576(%rbp), %rsi
	movq	%rdx, -520(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rsi
	xorq	%rdi, %rdx
	movq	-504(%rbp), %rdi
	movq	%rsi, -576(%rbp)
	movq	-568(%rbp), %rsi
	movq	%rdx, -512(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	andq	%r9, %rdx
	xorq	%rdx, %rsi
	xorq	%rdi, %rdx
	movq	%rdx, -504(%rbp)
	movq	%rcx, %rdx
	movq	%rsi, -568(%rbp)
	xorq	%rax, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-488(%rbp), %rsi
	movq	%rcx, -560(%rbp)
	movq	-552(%rbp), %rcx
	movq	%rax, -496(%rbp)
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	%rcx, -552(%rbp)
	movq	-544(%rbp), %rcx
	movq	%rax, -488(%rbp)
	movq	-480(%rbp), %rsi
	movq	-864(%rbp), %rdi
	movq	%r9, -848(%rbp)
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-472(%rbp), %rsi
	movq	%rcx, -544(%rbp)
	movq	-536(%rbp), %rcx
	movq	%rax, -480(%rbp)
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r9, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-896(%rbp), %rsi
	movq	%rcx, -536(%rbp)
	movq	%rax, -472(%rbp)
	vzeroupper
	call	gf_sub.constprop.12
	vmovdqa	-464(%rbp), %ymm0
	movl	-816(%rbp), %edx
	movl	$4, %eax
	vpbroadcastd	-848(%rbp), %ymm1
	vpxor	-656(%rbp), %ymm0, %ymm2
	testl	%edx, %edx
	vmovdqa	-944(%rbp), %ymm8
	vmovdqa	-976(%rbp), %ymm7
	vpand	%ymm1, %ymm2, %ymm2
	vpxor	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, -464(%rbp)
	vmovdqa	-432(%rbp), %ymm0
	vpxor	-624(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	jne	.L269
	movq	%rbx, -944(%rbp)
	movl	%eax, %ebx
.L259:
	movq	%r13, %rsi
	movq	%r13, %rdi
	vmovdqa	%ymm7, -848(%rbp)
	vmovdqa	%ymm8, -816(%rbp)
	vzeroupper
	call	point_double_internal.constprop.14
	subl	$1, %ebx
	vmovdqa	-816(%rbp), %ymm8
	vmovdqa	-848(%rbp), %ymm7
	jne	.L259
	movq	-944(%rbp), %rbx
	movq	%r13, %rsi
	movq	%r13, %rdi
	vzeroupper
	call	point_double_internal.constprop.15
	movq	-888(%rbp), %rdx
	movq	-864(%rbp), %rdi
	leaq	128(%r13), %rsi
	call	p448_mul@PLT
	movq	-656(%rbp), %rax
	movq	-880(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	%rax, -208(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-624(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-608(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, -152(%rbp)
	call	add_niels_to_pt
	vmovdqa	-848(%rbp), %ymm7
	vmovdqa	-816(%rbp), %ymm8
.L250:
	movl	-904(%rbp), %eax
	andl	$15, %eax
	movl	%eax, -816(%rbp)
	movq	-984(%rbp), %rax
	vpbroadcastd	-816(%rbp), %ymm1
	vpcmpeqd	%ymm7, %ymm1, %ymm2
	vpsubd	%ymm8, %ymm1, %ymm1
	vpand	(%r14), %ymm2, %ymm6
	vpand	32(%r14), %ymm2, %ymm5
	vpand	64(%r14), %ymm2, %ymm4
	vpand	96(%r14), %ymm2, %ymm3
	vpand	128(%r14), %ymm2, %ymm11
	vpand	160(%r14), %ymm2, %ymm10
	vpand	192(%r14), %ymm2, %ymm9
	vpand	224(%r14), %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L252:
	vpcmpeqd	%ymm7, %ymm1, %ymm0
	addq	$256, %rax
	vpsubd	%ymm8, %ymm1, %ymm1
	vpand	-256(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm6, %ymm6
	vpand	-224(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm5, %ymm5
	vpand	-192(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm4, %ymm4
	vpand	-160(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm3, %ymm3
	vpand	-128(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm11, %ymm11
	vpand	-96(%rax), %ymm0, %ymm12
	vpor	%ymm12, %ymm10, %ymm10
	vpand	-64(%rax), %ymm0, %ymm12
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%rbx, %rax
	vpor	%ymm12, %ymm9, %ymm9
	vpor	%ymm0, %ymm2, %ymm2
	jne	.L252
	vmovdqa	%xmm6, %xmm0
	movq	-872(%rbp), %r11
	vmovdqa	%ymm6, -592(%rbp)
	vmovq	%xmm0, %rax
	vmovdqa	%xmm5, %xmm0
	vmovdqa	%ymm4, -528(%rbp)
	vmovq	%xmm0, %rcx
	vmovdqa	%xmm4, %xmm0
	movq	%rax, %rdi
	vmovdqa	%ymm5, -560(%rbp)
	vmovq	%xmm0, %rsi
	vmovdqa	%xmm3, %xmm0
	vmovdqa	%ymm3, -496(%rbp)
	xorq	%rsi, %rdi
	movq	%rsi, %r9
	vmovq	%xmm0, %rdx
	andq	%r11, %rdi
	vmovdqa	%ymm7, -848(%rbp)
	xorq	%rdi, %rax
	movq	%rdi, %rsi
	movq	-584(%rbp), %rdi
	xorq	%r9, %rsi
	movq	-520(%rbp), %r9
	vmovdqa	%ymm8, -816(%rbp)
	movq	%rsi, -528(%rbp)
	movq	%rax, -592(%rbp)
	vmovdqa	%ymm11, -464(%rbp)
	movq	%rdi, %rsi
	vmovdqa	%ymm10, -432(%rbp)
	xorq	%r9, %rsi
	vmovdqa	%ymm9, -400(%rbp)
	movq	%rsi, %rax
	vmovdqa	%ymm2, -368(%rbp)
	andq	%r11, %rax
	xorq	%rax, %rdi
	xorq	%r9, %rax
	movq	-512(%rbp), %r9
	movq	%rdi, -584(%rbp)
	movq	-576(%rbp), %rdi
	movq	%rax, -520(%rbp)
	movq	%rdi, %rsi
	xorq	%r9, %rsi
	movq	%rsi, %rax
	andq	%r11, %rax
	xorq	%rax, %rdi
	xorq	%r9, %rax
	movq	-504(%rbp), %r9
	movq	%rdi, -576(%rbp)
	movq	-568(%rbp), %rdi
	movq	%rax, -512(%rbp)
	movq	%rdi, %rsi
	xorq	%r9, %rsi
	movq	%rsi, %rax
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	andq	%r11, %rax
	xorq	%rsi, %rdx
	xorq	%rax, %rdi
	xorq	%r9, %rax
	movq	%rax, -504(%rbp)
	movq	%rdx, %rax
	movq	%rdi, -568(%rbp)
	andq	%r11, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-488(%rbp), %rsi
	movq	%rcx, -560(%rbp)
	movq	-552(%rbp), %rcx
	movq	%rax, -496(%rbp)
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r11, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	%rcx, -552(%rbp)
	movq	-544(%rbp), %rcx
	movq	%rax, -488(%rbp)
	movq	-480(%rbp), %rsi
	movq	-864(%rbp), %rdi
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r11, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-472(%rbp), %rsi
	movq	%rcx, -544(%rbp)
	movq	-536(%rbp), %rcx
	movq	%rax, -480(%rbp)
	movq	%rcx, %rdx
	xorq	%rsi, %rdx
	movq	%rdx, %rax
	andq	%r11, %rax
	xorq	%rax, %rcx
	xorq	%rsi, %rax
	movq	-896(%rbp), %rsi
	movq	%rcx, -536(%rbp)
	movq	%rax, -472(%rbp)
	vzeroupper
	call	gf_sub.constprop.12
	vmovdqa	-464(%rbp), %ymm0
	movq	-888(%rbp), %rdx
	leaq	128(%r13), %rsi
	vpbroadcastd	-872(%rbp), %ymm1
	movq	-864(%rbp), %rdi
	vpxor	-656(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm2
	vpxor	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, -464(%rbp)
	vmovdqa	-432(%rbp), %ymm0
	vpxor	-624(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-656(%rbp), %rax
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	-880(%rbp), %rsi
	movq	%rax, -208(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	-640(%rbp), %rax
	movq	%rax, -192(%rbp)
	movq	-632(%rbp), %rax
	movq	%rax, -184(%rbp)
	movq	-624(%rbp), %rax
	movq	%rax, -176(%rbp)
	movq	-616(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-608(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-600(%rbp), %rax
	movq	%rax, -152(%rbp)
	movl	-852(%rbp), %eax
	testl	%eax, %eax
	setne	%dl
	negq	%rdx
	call	add_niels_to_pt
	subl	$5, -852(%rbp)
	vmovdqa	-816(%rbp), %ymm8
	movl	-852(%rbp), %eax
	vmovdqa	-848(%rbp), %ymm7
	cmpl	$-5, %eax
	je	.L270
	movl	%eax, %edx
	movl	%eax, %esi
	movl	%eax, %edi
	sarl	$6, %edx
	andl	$63, %esi
	movslq	%edx, %rcx
	cmpl	$58, %esi
	shrx	%rsi, -784(%rbp,%rcx,8), %rax
	movq	-720(%rbp,%rcx,8), %rcx
	shrx	%rsi, %rcx, %rcx
	jle	.L247
	cmpl	$383, %edi
	jg	.L247
	addl	$1, %edx
	movl	$64, %edi
	subl	%esi, %edi
	movslq	%edx, %rdx
	movl	%edi, %esi
	shlx	%rsi, -784(%rbp,%rdx,8), %rdi
	movq	-720(%rbp,%rdx,8), %rdx
	shlx	%rsi, %rdx, %rsi
	xorq	%rdi, %rax
	xorq	%rsi, %rcx
.L247:
	movl	$0, -816(%rbp)
	movl	-816(%rbp), %r10d
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L269:
	movq	-880(%rbp), %rax
	movq	-864(%rbp), %rdi
	vmovdqa	%ymm7, -944(%rbp)
	vmovdqa	%ymm8, -848(%rbp)
	leaq	64(%rax), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movq	%rcx, -816(%rbp)
	vzeroupper
	call	gf_add
	leaq	64(%r13), %rax
	movq	-816(%rbp), %rsi
	movq	-880(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rax, -816(%rbp)
	call	gf_sub
	movq	-864(%rbp), %rdx
	movq	-816(%rbp), %rsi
	leaq	192(%r13), %rdi
	call	p448_mul@PLT
	movq	-816(%rbp), %rdx
	movq	-888(%rbp), %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-864(%rbp), %rdx
	movq	-888(%rbp), %rsi
	movq	-816(%rbp), %rdi
	call	p448_mul@PLT
	movq	-888(%rbp), %rsi
	leaq	128(%r13), %rdi
	call	p448_sqr@PLT
	vmovdqa	-848(%rbp), %ymm8
	vmovdqa	-944(%rbp), %ymm7
	jmp	.L250
.L270:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	movl	$32, %ecx
	movq	-992(%rbp), %rdi
	movq	%r13, %rsi
	rep movsq
	jne	.L271
	vzeroupper
	leaq	-48(%rbp), %rsp
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
.L271:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4692:
	.size	decaf_448_point_double_scalarmul, .-decaf_448_point_double_scalarmul
	.section	.text.unlikely.decaf_448_point_double_scalarmul
.LCOLDE48:
	.section	.text.decaf_448_point_double_scalarmul
.LHOTE48:
	.section	.text.unlikely.decaf_448_point_eq,"ax",@progbits
.LCOLDB49:
	.section	.text.decaf_448_point_eq,"ax",@progbits
.LHOTB49:
	.p2align 4,,15
	.globl	decaf_448_point_eq
	.type	decaf_448_point_eq, @function
decaf_448_point_eq:
.LFB4693:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xd,0x2,0x76,0x78
	.cfi_escape 0x10,0xc,0x2,0x76,0x70
	leaq	-208(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x60
	movq	%rsi, %rbx
	leaq	64(%rdi), %rsi
	movq	%rdi, %r13
	subq	$176, %rsp
	movq	%rbx, %rdx
	movq	%r12, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	leaq	64(%rbx), %rsi
	leaq	-144(%rbp), %rbx
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	gf_eq
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L276
	addq	$176, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L276:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4693:
	.size	decaf_448_point_eq, .-decaf_448_point_eq
	.section	.text.unlikely.decaf_448_point_eq
.LCOLDE49:
	.section	.text.decaf_448_point_eq
.LHOTE49:
	.section	.text.unlikely.decaf_448_point_from_hash_nonuniform,"ax",@progbits
.LCOLDB50:
	.section	.text.decaf_448_point_from_hash_nonuniform,"ax",@progbits
.LHOTB50:
	.p2align 4,,15
	.globl	decaf_448_point_from_hash_nonuniform
	.type	decaf_448_point_from_hash_nonuniform, @function
decaf_448_point_from_hash_nonuniform:
.LFB4694:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-144(%rbp), %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-720(%rbp), %rbx
	leaq	-592(%rbp), %r12
	subq	$928, %rsp
	movq	%rdi, -872(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-848(%rbp), %rax
	movq	%rax, %r15
	movq	%rax, %rdi
	call	p448_deserialize@PLT
	movq	%r15, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%rax, -896(%rbp)
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %rax
	movq	%r15, %rdi
	andl	$1, %eax
	negq	%rax
	movq	%rax, -904(%rbp)
	call	p448_strong_reduce@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%r15, -912(%rbp)
	call	p448_sqr@PLT
	leaq	-784(%rbp), %rcx
	leaq	-528(%rbp), %r15
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	movq	%rcx, %r13
	call	gf_sub.constprop.12
	leaq	ONE(%rip), %rsi
	movl	$39081, %edx
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_sub.constprop.12
	movl	$39081, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%r13, -864(%rbp)
	leaq	-656(%rbp), %r13
	call	p448_mulw@PLT
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	gf_sub.constprop.12
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	gf_sub
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_add.constprop.13
	movq	%rbx, %rdi
	call	gf_eq.constprop.10
	movq	-864(%rbp), %rdx
	movq	%r12, %rsi
	movq	%r13, %rdi
	movq	%rax, -944(%rbp)
	call	gf_sub
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	gf_sub
	leaq	-464(%rbp), %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	movq	%rcx, -880(%rbp)
	call	p448_mul@PLT
	movq	-864(%rbp), %r15
	movq	%rbx, %rdi
	movq	%r15, %rsi
	call	gf_add.constprop.13
	leaq	-400(%rbp), %rsi
	movl	$78163, %edx
	movq	%rsi, %r8
	movq	%rbx, %rsi
	movq	%r8, %rdi
	movq	%r8, -888(%rbp)
	call	p448_mulw@PLT
	leaq	-336(%rbp), %r9
	movq	-888(%rbp), %rdx
	movq	%r15, %rsi
	movq	%r15, -864(%rbp)
	movq	%r9, %rdi
	movq	%r9, %r15
	call	p448_mul@PLT
	movq	-880(%rbp), %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%r15, -952(%rbp)
	leaq	-208(%rbp), %r15
	call	p448_mul@PLT
	leaq	-272(%rbp), %rcx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	movq	%rcx, -856(%rbp)
	call	p448_isr@PLT
	movq	-856(%rbp), %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	leaq	ONE(%rip), %rsi
	movq	%r14, %rdi
	call	gf_eq
	movq	%r14, %rdi
	movq	%rax, %r15
	call	gf_eq.constprop.10
	movq	-864(%rbp), %rdi
	call	gf_eq.constprop.10
	orq	-944(%rbp), %r15
	vmovdqa	-848(%rbp), %ymm2
	movl	$78163, %edx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	vpxor	-784(%rbp), %ymm2, %ymm1
	orq	%rax, %r15
	movl	%r15d, -944(%rbp)
	vpbroadcastd	-944(%rbp), %ymm0
	vpand	%ymm0, %ymm1, %ymm1
	vmovdqa	%ymm0, -944(%rbp)
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-816(%rbp), %ymm2
	vmovdqa	%ymm1, -592(%rbp)
	vpxor	-752(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm1, -560(%rbp)
	vzeroupper
	call	p448_mulw@PLT
	movq	%rbx, %rsi
	movq	%r13, %rdi
	movl	$78163, %edx
	call	p448_mulw@PLT
	movq	-864(%rbp), %rsi
	leaq	ONE(%rip), %rdx
	movq	%r12, %rdi
	call	gf_sub
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-856(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r15, %r10
	movq	%r13, %rsi
	movq	%r14, %rdi
	notq	%r10
	movq	%r10, -864(%rbp)
	call	gf_sub.constprop.12
	vmovdqa	-656(%rbp), %ymm3
	movq	-856(%rbp), %rsi
	movq	%r12, %rdx
	vpbroadcastd	-864(%rbp), %ymm1
	movq	%rbx, %rdi
	vpxor	-144(%rbp), %ymm3, %ymm2
	vmovdqa	-944(%rbp), %ymm0
	vpand	%ymm1, %ymm2, %ymm2
	vpxor	%ymm3, %ymm2, %ymm2
	vmovdqa	-624(%rbp), %ymm3
	vmovdqa	%ymm2, -656(%rbp)
	vpxor	-112(%rbp), %ymm3, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vmovdqa	-848(%rbp), %ymm2
	vpxor	%ymm3, %ymm1, %ymm1
	vmovdqa	%ymm1, -624(%rbp)
	vpxor	ONE(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-816(%rbp), %ymm2
	vmovdqa	%ymm1, -592(%rbp)
	vpxor	32+ONE(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	%ymm1, -560(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-880(%rbp), %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	gf_sub
	movq	-912(%rbp), %rdx
	movq	-888(%rbp), %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	vmovdqa	-720(%rbp), %ymm2
	movq	-856(%rbp), %rdx
	movq	%rbx, %rdi
	vmovdqa	-944(%rbp), %ymm0
	movq	-952(%rbp), %rsi
	vpxor	-336(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-688(%rbp), %ymm2
	vmovdqa	%ymm1, -336(%rbp)
	vpxor	-304(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -304(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %rsi
	movq	%r14, %rdi
	andl	$1, %esi
	movq	%rsi, %rax
	movq	%rbx, %rsi
	negq	%rax
	xorq	-864(%rbp), %rax
	movq	%rax, -864(%rbp)
	call	gf_sub.constprop.12
	vmovdqa	-720(%rbp), %ymm2
	movq	%r13, %rdx
	movq	%r13, %rsi
	vpbroadcastd	-864(%rbp), %ymm0
	movq	%r14, %rdi
	vpxor	-144(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-688(%rbp), %ymm2
	vmovdqa	%ymm1, -720(%rbp)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -688(%rbp)
	vzeroupper
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %rsi
	movq	-864(%rbp), %r14
	movq	-888(%rbp), %rdi
	andl	$1, %esi
	movq	%rsi, %rax
	negq	%rax
	xorq	%rax, %r14
	call	gf_eq.constprop.10
	movq	-880(%rbp), %rdi
	notq	%rax
	andq	%rax, %r14
	call	gf_eq.constprop.10
	movq	%r12, %rdi
	orq	%rax, %r14
	call	gf_eq.constprop.10
	vmovdqa	-592(%rbp), %ymm2
	movq	%rax, -864(%rbp)
	movq	%rbx, %rsi
	vpbroadcastd	-864(%rbp), %ymm0
	movq	%r12, %rdi
	vpxor	ONE(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-560(%rbp), %ymm2
	vmovdqa	%ymm1, -656(%rbp)
	vpxor	32+ONE(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -624(%rbp)
	vzeroupper
	andl	$1, %r15d
	call	p448_sqr@PLT
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_add
	movq	-856(%rbp), %rdi
	movq	%r12, %rsi
	xorq	$1, %r15
	call	gf_add.constprop.13
	movq	-872(%rbp), %rdx
	movq	%rbx, %rsi
	leaq	192(%rdx), %rdi
	movq	-856(%rbp), %rdx
	call	p448_mul@PLT
	movq	-872(%rbp), %rdi
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	p448_mul@PLT
	leaq	ONE(%rip), %rsi
	movq	%r12, %rdx
	movq	%rbx, %rdi
	call	gf_sub
	movq	-872(%rbp), %r12
	movq	-856(%rbp), %rsi
	movq	%rbx, %rdx
	leaq	64(%r12), %rdi
	call	p448_mul@PLT
	leaq	128(%r12), %rdi
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	p448_mul@PLT
	movq	-896(%rbp), %rax
	movzbl	-904(%rbp), %edx
	notq	%rax
	andl	$8, %eax
	andl	$4, %edx
	orl	%edx, %eax
	orl	%eax, %r15d
	movl	%r14d, %eax
	andl	$2, %eax
	orl	%r15d, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L281
	addq	$928, %rsp
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
.L281:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4694:
	.size	decaf_448_point_from_hash_nonuniform, .-decaf_448_point_from_hash_nonuniform
	.section	.text.unlikely.decaf_448_point_from_hash_nonuniform
.LCOLDE50:
	.section	.text.decaf_448_point_from_hash_nonuniform
.LHOTE50:
	.section	.text.unlikely.decaf_448_invert_elligator_nonuniform,"ax",@progbits
.LCOLDB51:
	.section	.text.decaf_448_invert_elligator_nonuniform,"ax",@progbits
.LHOTB51:
	.p2align 4,,15
	.globl	decaf_448_invert_elligator_nonuniform
	.type	decaf_448_invert_elligator_nonuniform, @function
decaf_448_invert_elligator_nonuniform:
.LFB4695:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%edx, %r14d
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	shrb	%r14b
	leaq	-336(%rbp), %r13
	leaq	-464(%rbp), %r15
	salq	$63, %r14
	subq	$448, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	sarq	$63, %r14
	leaq	-400(%rbp), %rbx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	%edx, %eax
	shrb	$2, %dl
	movq	%r14, %r8
	andl	$1, %eax
	movq	%rdi, -480(%rbp)
	movq	%rsi, -488(%rbp)
	negl	%eax
	movq	%r15, %rdi
	movq	%rdx, %r12
	movslq	%eax, %r9
	movq	%rsi, %rdx
	movq	%r13, %rsi
	movq	%r9, %rcx
	movq	%r9, -496(%rbp)
	movl	%eax, -472(%rbp)
	call	deisogenize
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	leaq	ONE(%rip), %rsi
	movq	%rbx, %rdx
	movq	%rbx, %rdi
	salq	$63, %r12
	call	gf_sub
	movq	%r15, %rsi
	movq	%r13, %rdi
	sarq	$63, %r12
	call	p448_sqr@PLT
	movq	-488(%rbp), %r10
	movq	%r10, %rdi
	call	gf_eq.constprop.10
	vmovdqa	-336(%rbp), %ymm2
	movl	%r14d, %edx
	movq	-496(%rbp), %r9
	andl	%eax, %edx
	movq	%r13, %rsi
	vpxor	ONE(%rip), %ymm2, %ymm1
	movl	%edx, -488(%rbp)
	orq	%r9, %r14
	movl	$78163, %edx
	vpbroadcastd	-488(%rbp), %ymm0
	notq	%r14
	andl	%r14d, %eax
	leaq	-272(%rbp), %r14
	movl	%eax, -488(%rbp)
	vpand	%ymm0, %ymm1, %ymm1
	movq	%r14, %rdi
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-304(%rbp), %ymm2
	vmovdqa	%ymm1, -336(%rbp)
	vpxor	32+ONE(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	-400(%rbp), %ymm2
	vpxor	ZERO(%rip), %ymm2, %ymm1
	vmovdqa	%ymm0, -304(%rbp)
	vpbroadcastd	-488(%rbp), %ymm0
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-368(%rbp), %ymm2
	vmovdqa	%ymm1, -400(%rbp)
	vpxor	32+ZERO(%rip), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -368(%rbp)
	vzeroupper
	call	p448_mulw@PLT
	movq	%r14, %rsi
	movq	%r14, %rdi
	call	gf_sub.constprop.12
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	gf_add
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	gf_sub
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%r14, %rdx
	call	p448_mul@PLT
	vmovdqa	-272(%rbp), %ymm2
	movq	%rbx, %rsi
	movq	%r13, %rdi
	vpbroadcastd	-472(%rbp), %ymm0
	vpxor	-464(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-240(%rbp), %ymm2
	vmovdqa	%ymm1, -464(%rbp)
	vpxor	-432(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -432(%rbp)
	vzeroupper
	leaq	-144(%rbp), %r14
	call	p448_isr@PLT
	leaq	-208(%rbp), %rax
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, -472(%rbp)
	call	p448_sqr@PLT
	movq	-472(%rbp), %rax
	movq	%rbx, %rdx
	movq	%r14, %rdi
	movq	%rax, %rsi
	call	p448_mul@PLT
	leaq	ONE(%rip), %rsi
	movq	%r14, %rdi
	call	gf_eq
	movq	%r14, %rdi
	movq	%rax, -472(%rbp)
	call	gf_eq.constprop.10
	orq	-472(%rbp), %rax
	movq	%r13, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movq	%rax, -472(%rbp)
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rdi
	call	gf_add
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	%r14, %rdi
	movq	%rbx, %rsi
	andl	$1, %r9d
	negq	%r9
	xorq	%r12, %r9
	call	gf_sub.constprop.12
	vmovdqa	-400(%rbp), %ymm2
	movl	%r9d, -488(%rbp)
	movq	%rbx, %rdi
	vpbroadcastd	-488(%rbp), %ymm0
	vpxor	-144(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-368(%rbp), %ymm2
	vmovdqa	%ymm1, -400(%rbp)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -368(%rbp)
	vzeroupper
	call	gf_eq.constprop.10
	movq	-480(%rbp), %rdi
	andq	%r12, %rax
	movq	%rbx, %rsi
	movq	-472(%rbp), %r12
	notq	%rax
	andq	%rax, %r12
	call	p448_serialize@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L286
	addq	$448, %rsp
	movq	%r12, %rax
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
.L286:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4695:
	.size	decaf_448_invert_elligator_nonuniform, .-decaf_448_invert_elligator_nonuniform
	.section	.text.unlikely.decaf_448_invert_elligator_nonuniform
.LCOLDE51:
	.section	.text.decaf_448_invert_elligator_nonuniform
.LHOTE51:
	.section	.text.unlikely.decaf_448_point_from_hash_uniform,"ax",@progbits
.LCOLDB52:
	.section	.text.decaf_448_point_from_hash_uniform,"ax",@progbits
.LHOTB52:
	.p2align 4,,15
	.globl	decaf_448_point_from_hash_uniform
	.type	decaf_448_point_from_hash_uniform, @function
decaf_448_point_from_hash_uniform:
.LFB4696:
	.cfi_startproc
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
	leaq	-336(%rbp), %r14
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rsi, %rbx
	movq	%rdi, %r13
	subq	$296, %rsp
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_point_from_hash_nonuniform@PLT
	leaq	56(%rbx), %rsi
	movq	%r14, %rdi
	movl	%eax, %r12d
	call	decaf_448_point_from_hash_nonuniform@PLT
	movq	%r14, %rdx
	movl	%eax, %ebx
	movq	%r13, %rsi
	movq	%r13, %rdi
	call	decaf_448_point_add@PLT
	movl	%ebx, %eax
	sall	$4, %eax
	orl	%r12d, %eax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L291
	addq	$296, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L291:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4696:
	.size	decaf_448_point_from_hash_uniform, .-decaf_448_point_from_hash_uniform
	.section	.text.unlikely.decaf_448_point_from_hash_uniform
.LCOLDE52:
	.section	.text.decaf_448_point_from_hash_uniform
.LHOTE52:
	.section	.text.unlikely.decaf_448_invert_elligator_uniform,"ax",@progbits
.LCOLDB53:
	.section	.text.decaf_448_invert_elligator_uniform,"ax",@progbits
.LHOTB53:
	.p2align 4,,15
	.globl	decaf_448_invert_elligator_uniform
	.type	decaf_448_invert_elligator_uniform, @function
decaf_448_invert_elligator_uniform:
.LFB4697:
	.cfi_startproc
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
	movq	%rsi, %r14
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	leaq	-336(%rbp), %rbx
	leaq	56(%rdi), %rsi
	movq	%rdi, %r13
	movl	%edx, %r12d
	subq	$296, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_point_from_hash_nonuniform@PLT
	movq	%rbx, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	decaf_448_point_sub@PLT
	movzbl	%r12b, %edx
	movq	%rbx, %rsi
	movq	%r13, %rdi
	call	decaf_448_invert_elligator_nonuniform@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L296
	addq	$296, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
.L296:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4697:
	.size	decaf_448_invert_elligator_uniform, .-decaf_448_invert_elligator_uniform
	.section	.text.unlikely.decaf_448_invert_elligator_uniform
.LCOLDE53:
	.section	.text.decaf_448_invert_elligator_uniform
.LHOTE53:
	.section	.text.unlikely.decaf_448_point_valid,"ax",@progbits
.LCOLDB54:
	.section	.text.decaf_448_point_valid,"ax",@progbits
.LHOTB54:
	.p2align 4,,15
	.globl	decaf_448_point_valid
	.type	decaf_448_point_valid, @function
decaf_448_point_valid:
.LFB4698:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	64(%rdi), %r8
	movq	%rdi, %rsi
	pushq	-8(%r10)
	pushq	%rbp
	movq	%r8, %rdx
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	leaq	192(%r15), %r14
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-272(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	128(%r15), %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-208(%rbp), %rbx
	movq	%r12, %rdi
	subq	$256, %rsp
	movq	%r8, -288(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	call	p448_mul@PLT
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	gf_eq
	movq	%r15, %rsi
	movq	%r12, %rdi
	movq	%rax, -280(%rbp)
	call	p448_sqr@PLT
	movq	-288(%rbp), %r8
	movq	%rbx, %rdi
	leaq	-144(%rbp), %r15
	movq	%r8, %rsi
	call	p448_sqr@PLT
	movq	%r12, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	gf_sub
	movq	%rbx, %rdi
	movq	%r14, %rsi
	call	p448_sqr@PLT
	movl	$39082, %edx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%rbx, %rdi
	movq	%r13, %rsi
	call	p448_sqr@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_sub
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	gf_eq
	movq	-280(%rbp), %rbx
	movq	%r13, %rdi
	andq	%rax, %rbx
	call	gf_eq.constprop.10
	notq	%rax
	andq	%rbx, %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L301
	addq	$256, %rsp
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
.L301:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4698:
	.size	decaf_448_point_valid, .-decaf_448_point_valid
	.section	.text.unlikely.decaf_448_point_valid
.LCOLDE54:
	.section	.text.decaf_448_point_valid
.LHOTE54:
	.section	.text.unlikely.decaf_448_point_debugging_2torque,"ax",@progbits
.LCOLDB55:
	.section	.text.decaf_448_point_debugging_2torque,"ax",@progbits
.LHOTB55:
	.p2align 4,,15
	.globl	decaf_448_point_debugging_2torque
	.type	decaf_448_point_debugging_2torque, @function
decaf_448_point_debugging_2torque:
.LFB4699:
	.cfi_startproc
	movq	%rsi, %r10
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdi, %r9
	call	gf_sub.constprop.12
	leaq	64(%r10), %rsi
	leaq	64(%rdi), %rdi
	call	gf_sub.constprop.12
	movq	128(%r10), %rax
	movq	%rax, 128(%r9)
	movq	136(%r10), %rax
	movq	%rax, 136(%r9)
	movq	144(%r10), %rax
	movq	%rax, 144(%r9)
	movq	152(%r10), %rax
	movq	%rax, 152(%r9)
	movq	160(%r10), %rax
	movq	%rax, 160(%r9)
	movq	168(%r10), %rax
	movq	%rax, 168(%r9)
	movq	176(%r10), %rax
	movq	%rax, 176(%r9)
	movq	184(%r10), %rax
	movq	%rax, 184(%r9)
	movq	192(%r10), %rax
	movq	%rax, 192(%r9)
	movq	200(%r10), %rax
	movq	%rax, 200(%r9)
	movq	208(%r10), %rax
	movq	%rax, 208(%r9)
	movq	216(%r10), %rax
	movq	%rax, 216(%r9)
	movq	224(%r10), %rax
	movq	%rax, 224(%r9)
	movq	232(%r10), %rax
	movq	%rax, 232(%r9)
	movq	240(%r10), %rax
	movq	%rax, 240(%r9)
	movq	248(%r10), %rax
	movq	%rax, 248(%r9)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE4699:
	.size	decaf_448_point_debugging_2torque, .-decaf_448_point_debugging_2torque
	.section	.text.unlikely.decaf_448_point_debugging_2torque
.LCOLDE55:
	.section	.text.decaf_448_point_debugging_2torque
.LHOTE55:
	.section	.text.unlikely.decaf_448_precompute,"ax",@progbits
.LCOLDB56:
	.section	.text.decaf_448_precompute,"ax",@progbits
.LHOTB56:
	.p2align 4,,15
	.globl	decaf_448_precompute
	.type	decaf_448_precompute, @function
decaf_448_precompute:
.LFB4702:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$32, %ecx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-848(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	leaq	-336(%rbp), %r14
	subq	$960, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, -952(%rbp)
	movq	%r12, %rdi
	subq	$1056, %rsp
	movl	$0, -944(%rbp)
	movq	%r12, -1000(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	31(%rsp), %rax
	subq	$5152, %rsp
	movq	%r12, -984(%rbp)
	leaq	31(%rsp), %r13
	subq	$5152, %rsp
	andq	$-32, %rax
	movq	%rax, -960(%rbp)
	leaq	31(%rsp), %rax
	andq	$-32, %r13
	rep movsq
	andq	$-32, %rax
	movq	%rax, -992(%rbp)
	leaq	-592(%rbp), %rax
	leaq	64(%rax), %rbx
	movq	%rax, %r15
	movq	%rbx, -928(%rbp)
	leaq	64(%r14), %rbx
	movq	%rbx, -968(%rbp)
	leaq	192(%rax), %rbx
	movq	%rbx, -976(%rbp)
.L305:
	movq	-960(%rbp), %rax
	movq	-984(%rbp), %r12
	xorl	%ebx, %ebx
	movq	%r13, -920(%rbp)
	movq	%r14, -936(%rbp)
	movq	%rax, %r13
.L314:
	testl	%ebx, %ebx
	je	.L306
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	decaf_448_point_add@PLT
	cmpl	$4, %ebx
	jne	.L309
	cmpl	$4, -944(%rbp)
	je	.L336
.L309:
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	point_double_internal.constprop.15
	cmpl	$4, %ebx
	je	.L312
.L310:
	movl	$32, %ecx
	movq	%r13, %rdi
	movq	%r12, %rsi
	rep movsq
.L312:
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L313:
	xorl	%edx, %edx
	cmpl	$15, %r14d
	movq	%r12, %rsi
	setbe	%dl
	movq	%r12, %rdi
	addl	$1, %r14d
	call	point_double_internal
	cmpl	$17, %r14d
	jne	.L313
	addl	$1, %ebx
	addq	$256, %r13
	cmpl	$5, %ebx
	jne	.L314
.L336:
	addl	$1, -944(%rbp)
	movq	-936(%rbp), %r14
	xorl	%r8d, %r8d
	movl	-944(%rbp), %eax
	movq	-920(%rbp), %r13
	movq	%r12, -984(%rbp)
	movl	%r8d, %r12d
	movq	%r14, %rbx
	sall	$4, %eax
	subl	$1, %eax
	movl	%eax, -940(%rbp)
	leaq	128(%r14), %rax
	movq	%r13, %r14
	movq	%rax, -920(%rbp)
	.p2align 4,,10
	.p2align 3
.L311:
	movl	-940(%rbp), %r13d
	movq	-928(%rbp), %rsi
	movl	%r12d, %r9d
	shrl	%r9d
	movq	%r15, %rdx
	movq	%rbx, %rdi
	xorl	%r12d, %r9d
	xorl	%r9d, %r13d
	movl	%r9d, -936(%rbp)
	call	gf_sub
	movq	-928(%rbp), %rdx
	movq	-968(%rbp), %rdi
	movq	%r15, %rsi
	movslq	%r13d, %r13
	call	gf_add
	movq	-976(%rbp), %rsi
	movq	-920(%rbp), %rdi
	movl	$78164, %edx
	call	p448_mulw@PLT
	movq	-920(%rbp), %rdi
	movq	%rdi, %rsi
	call	gf_sub.constprop.12
	leaq	128(%r15), %rsi
	leaq	192(%rbx), %rdi
	movq	%rsi, %rdx
	call	gf_add
	leaq	0(%r13,%r13,2), %rcx
	movq	(%rbx), %rax
	movq	%rbx, %rsi
	salq	$6, %r13
	salq	$6, %rcx
	addq	-952(%rbp), %rcx
	movq	%rax, (%rcx)
	leaq	8(%rcx), %rdi
	movq	184(%rbx), %rax
	andq	$-8, %rdi
	movq	%rax, 184(%rcx)
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	$192, %ecx
	shrl	$3, %ecx
	cmpl	$15, %r12d
	rep movsq
	movq	-144(%rbp), %rax
	movq	%rax, (%r14,%r13)
	movq	-136(%rbp), %rax
	movq	%rax, 8(%r14,%r13)
	movq	-128(%rbp), %rax
	movq	%rax, 16(%r14,%r13)
	movq	-120(%rbp), %rax
	movq	%rax, 24(%r14,%r13)
	movq	-112(%rbp), %rax
	movq	%rax, 32(%r14,%r13)
	movq	-104(%rbp), %rax
	movq	%rax, 40(%r14,%r13)
	movq	-96(%rbp), %rax
	movq	%rax, 48(%r14,%r13)
	movq	-88(%rbp), %rax
	movq	%rax, 56(%r14,%r13)
	je	.L315
	addl	$1, %r12d
	movl	-936(%rbp), %r9d
	movl	%r12d, %eax
	shrl	%eax
	xorl	%r9d, %eax
	xorl	%r12d, %eax
	cmpl	$1, %eax
	jbe	.L323
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L317:
	sarl	%eax
	addl	$1, %edx
	cmpl	$1, %eax
	jne	.L317
.L316:
	btl	%edx, %r9d
	jnc	.L318
	salq	$8, %rdx
	addq	-960(%rbp), %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	decaf_448_point_add@PLT
	jmp	.L311
	.p2align 4,,10
	.p2align 3
.L318:
	salq	$8, %rdx
	addq	-960(%rbp), %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	decaf_448_point_sub@PLT
	jmp	.L311
.L323:
	xorl	%edx, %edx
	jmp	.L316
.L315:
	cmpl	$5, -944(%rbp)
	movq	%r14, %r13
	movq	%rbx, %r14
	jne	.L305
	movq	%r13, %rsi
	movq	-992(%rbp), %r13
	movl	$80, %edx
	leaq	-912(%rbp), %r12
	movq	%r13, %rdi
	call	gf_batch_invert
	movq	-952(%rbp), %rbx
	leaq	15360(%rbx), %r14
	.p2align 4,,10
	.p2align 3
.L321:
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rdi
	call	p448_strong_reduce@PLT
	movq	-912(%rbp), %rax
	leaq	64(%rbx), %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	movq	%rax, (%rbx)
	movq	-904(%rbp), %rax
	movq	%rax, 8(%rbx)
	movq	-896(%rbp), %rax
	movq	%rax, 16(%rbx)
	movq	-888(%rbp), %rax
	movq	%rax, 24(%rbx)
	movq	-880(%rbp), %rax
	movq	%rax, 32(%rbx)
	movq	-872(%rbp), %rax
	movq	%rax, 40(%rbx)
	movq	-864(%rbp), %rax
	movq	%rax, 48(%rbx)
	movq	-856(%rbp), %rax
	movq	%rax, 56(%rbx)
	call	p448_mul@PLT
	movq	%r12, %rdi
	call	p448_strong_reduce@PLT
	movq	-912(%rbp), %rax
	leaq	128(%rbx), %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	addq	$192, %rbx
	addq	$64, %r13
	movq	%rax, -128(%rbx)
	movq	-904(%rbp), %rax
	movq	%rax, -120(%rbx)
	movq	-896(%rbp), %rax
	movq	%rax, -112(%rbx)
	movq	-888(%rbp), %rax
	movq	%rax, -104(%rbx)
	movq	-880(%rbp), %rax
	movq	%rax, -96(%rbx)
	movq	-872(%rbp), %rax
	movq	%rax, -88(%rbx)
	movq	-864(%rbp), %rax
	movq	%rax, -80(%rbx)
	movq	-856(%rbp), %rax
	movq	%rax, -72(%rbx)
	call	p448_mul@PLT
	movq	%r12, %rdi
	call	p448_strong_reduce@PLT
	movq	-912(%rbp), %rax
	movq	%rax, -64(%rbx)
	movq	-904(%rbp), %rax
	movq	%rax, -56(%rbx)
	movq	-896(%rbp), %rax
	movq	%rax, -48(%rbx)
	movq	-888(%rbp), %rax
	movq	%rax, -40(%rbx)
	movq	-880(%rbp), %rax
	movq	%rax, -32(%rbx)
	movq	-872(%rbp), %rax
	movq	%rax, -24(%rbx)
	movq	-864(%rbp), %rax
	movq	%rax, -16(%rbx)
	movq	-856(%rbp), %rax
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r14
	jne	.L321
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L337
	leaq	-48(%rbp), %rsp
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
.L306:
	.cfi_restore_state
	movq	%r15, %rdi
	movq	%r12, %rsi
	movl	$32, %ecx
	rep movsq
	movq	-1000(%rbp), %rdi
	movq	%rdi, %rsi
	movq	%rdi, %r12
	call	point_double_internal.constprop.15
	jmp	.L310
.L337:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4702:
	.size	decaf_448_precompute, .-decaf_448_precompute
	.section	.text.unlikely.decaf_448_precompute
.LCOLDE56:
	.section	.text.decaf_448_precompute
.LHOTE56:
	.section	.text.unlikely.decaf_448_precomputed_scalarmul,"ax",@progbits
.LCOLDB57:
	.section	.text.decaf_448_precomputed_scalarmul,"ax",@progbits
.LHOTB57:
	.p2align 4,,15
	.globl	decaf_448_precomputed_scalarmul
	.type	decaf_448_precomputed_scalarmul, @function
decaf_448_precomputed_scalarmul:
.LFB4704:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-400(%rbp), %rbx
	leaq	-272(%rbp), %r14
	movl	$17, %r12d
	subq	$480, %rsp
	movq	%rsi, -512(%rbp)
	movq	%rdx, %rsi
	movq	decaf_448_precomputed_scalarmul_adjustment@GOTPCREL(%rip), %rdx
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_scalar_add@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	sc_halve.constprop.8
	leaq	-336(%rbp), %rax
	vpxor	%xmm9, %xmm9, %xmm9
	vmovdqa	.LC46(%rip), %ymm10
	movq	%rax, -520(%rbp)
	leaq	128(%r14), %rax
	movq	%rax, -528(%rbp)
	.p2align 4,,10
	.p2align 3
.L339:
	leal	72(%r12), %r15d
	leal	522(%r12), %eax
	cmpl	$17, %r12d
	setne	-501(%rbp)
	xorl	%ebx, %ebx
	movl	%eax, -500(%rbp)
	movl	%r15d, %eax
	movl	%r12d, %r15d
	movl	%eax, %r12d
.L340:
	leal	-54(%r12), %ecx
	leal	-36(%r12), %r11d
	leal	-72(%r12), %edi
	leal	-18(%r12), %esi
	movl	%ecx, %eax
	shrl	$6, %eax
	movq	-400(%rbp,%rax,8), %rax
	shrq	%cl, %rax
	movl	%r11d, %ecx
	andl	$1, %eax
	leaq	(%rax,%rax), %r9
	movl	%r11d, %eax
	shrl	$6, %eax
	movq	-400(%rbp,%rax,8), %rdx
	shrq	%cl, %rdx
	movl	%edi, %ecx
	andl	$1, %edx
	leaq	0(,%rdx,4), %rax
	movl	%edi, %edx
	shrl	$6, %edx
	movq	-400(%rbp,%rdx,8), %rdx
	orl	%r9d, %eax
	shrq	%cl, %rdx
	movl	%esi, %ecx
	andl	$1, %edx
	orl	%edx, %eax
	movl	%esi, %edx
	shrl	$6, %edx
	movq	-400(%rbp,%rdx,8), %rdx
	shrq	%cl, %rdx
	andl	$1, %edx
	salq	$3, %rdx
	orl	%eax, %edx
	cmpl	$445, %r12d
	ja	.L347
	movl	%r12d, %eax
	movl	%r12d, %ecx
	shrl	$6, %eax
	movq	-400(%rbp,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	salq	$4, %rax
	orl	%eax, %edx
.L347:
	movl	%edx, %r9d
	movl	%edx, %eax
	movl	%ebx, %edx
	sarl	$4, %r9d
	sall	$4, %edx
	subl	$1, %r9d
	leaq	(%rdx,%rdx,2), %rdx
	xorl	%r9d, %eax
	movslq	%r9d, %rcx
	andl	$15, %eax
	salq	$6, %rdx
	addq	-512(%rbp), %rdx
	movl	%eax, -432(%rbp)
	vpbroadcastd	-432(%rbp), %ymm1
	vpcmpeqd	%ymm9, %ymm1, %ymm2
	leaq	192(%rdx), %rax
	vpsubd	%ymm10, %ymm1, %ymm1
	addq	$3072, %rdx
	vpand	-3072(%rdx), %ymm2, %ymm6
	vpand	-3040(%rdx), %ymm2, %ymm5
	vpand	-3008(%rdx), %ymm2, %ymm4
	vpand	-2976(%rdx), %ymm2, %ymm3
	vpand	-2944(%rdx), %ymm2, %ymm7
	vpand	-2912(%rdx), %ymm2, %ymm2
	.p2align 4,,10
	.p2align 3
.L341:
	vpcmpeqd	%ymm9, %ymm1, %ymm0
	addq	$192, %rax
	vpsubd	%ymm10, %ymm1, %ymm1
	vpand	-192(%rax), %ymm0, %ymm8
	vpor	%ymm8, %ymm6, %ymm6
	vpand	-160(%rax), %ymm0, %ymm8
	vpor	%ymm8, %ymm5, %ymm5
	vpand	-128(%rax), %ymm0, %ymm8
	vpor	%ymm8, %ymm4, %ymm4
	vpand	-96(%rax), %ymm0, %ymm8
	vpor	%ymm8, %ymm3, %ymm3
	vpand	-64(%rax), %ymm0, %ymm8
	vpand	-32(%rax), %ymm0, %ymm0
	cmpq	%rax, %rdx
	vpor	%ymm8, %ymm7, %ymm7
	vpor	%ymm0, %ymm2, %ymm2
	jne	.L341
	vmovdqa	%xmm6, %xmm0
	vmovdqa	%ymm6, -272(%rbp)
	vmovdqa	%ymm4, -208(%rbp)
	vmovq	%xmm0, %rax
	vmovdqa	%xmm5, %xmm0
	vmovdqa	%ymm5, -240(%rbp)
	vmovq	%xmm0, %rsi
	vmovdqa	%xmm4, %xmm0
	vmovdqa	%ymm3, -176(%rbp)
	vmovq	%xmm0, %rdi
	vmovdqa	%xmm3, %xmm0
	vmovdqa	%ymm9, -496(%rbp)
	movq	%rdi, %r11
	movq	%rax, %rdi
	vmovq	%xmm0, %rdx
	xorq	%r11, %rdi
	vmovdqa	%ymm10, -464(%rbp)
	andq	%rcx, %rdi
	vmovdqa	%ymm7, -144(%rbp)
	xorq	%rdi, %rax
	xorq	%r11, %rdi
	movq	-200(%rbp), %r11
	movq	%rdi, -208(%rbp)
	vmovdqa	%ymm2, -112(%rbp)
	movq	-264(%rbp), %rdi
	movq	%rax, -272(%rbp)
	movq	%rdi, %rax
	xorq	%r11, %rax
	andq	%rcx, %rax
	xorq	%rax, %rdi
	xorq	%r11, %rax
	movq	-192(%rbp), %r11
	movq	%rdi, -264(%rbp)
	movq	-256(%rbp), %rdi
	movq	%rax, -200(%rbp)
	movq	%rdi, %rax
	xorq	%r11, %rax
	andq	%rcx, %rax
	xorq	%rax, %rdi
	xorq	%r11, %rax
	movq	-184(%rbp), %r11
	movq	%rdi, -256(%rbp)
	movq	-248(%rbp), %rdi
	movq	%rax, -192(%rbp)
	movq	%rdi, %rax
	xorq	%r11, %rax
	andq	%rcx, %rax
	xorq	%rax, %rdi
	xorq	%r11, %rax
	movq	%rdi, -248(%rbp)
	movq	%rdx, %rdi
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rax, -184(%rbp)
	movq	%rdx, %rax
	andq	%rcx, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	-168(%rbp), %rdi
	movq	%rsi, -240(%rbp)
	movq	-232(%rbp), %rsi
	movq	%rax, -176(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rdx, %rax
	andq	%rcx, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	-160(%rbp), %rdi
	movq	%rsi, -232(%rbp)
	movq	-224(%rbp), %rsi
	movq	%rax, -168(%rbp)
	movq	%rsi, %rdx
	xorq	%rdi, %rdx
	movq	%rdx, %rax
	andq	%rcx, %rax
	xorq	%rax, %rsi
	xorq	%rdi, %rax
	movq	%rsi, -224(%rbp)
	movq	%rax, -160(%rbp)
	movq	-216(%rbp), %rdx
	movq	-152(%rbp), %rsi
	movq	-520(%rbp), %rdi
	movq	%rdx, %rax
	xorq	%rsi, %rax
	andq	%rax, %rcx
	xorq	%rcx, %rdx
	xorq	%rsi, %rcx
	movq	-528(%rbp), %rsi
	movq	%rdx, -216(%rbp)
	movq	%rcx, -152(%rbp)
	vzeroupper
	call	gf_sub.constprop.12
	vmovdqa	-144(%rbp), %ymm0
	movl	%r9d, -432(%rbp)
	testl	%ebx, %ebx
	vpbroadcastd	-432(%rbp), %ymm1
	vpxor	-336(%rbp), %ymm0, %ymm2
	vmovdqa	-464(%rbp), %ymm10
	vmovdqa	-496(%rbp), %ymm9
	vpand	%ymm1, %ymm2, %ymm2
	vpxor	%ymm0, %ymm2, %ymm0
	vmovdqa	%ymm0, -144(%rbp)
	vmovdqa	-112(%rbp), %ymm0
	vpxor	-304(%rbp), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	jne	.L350
	cmpb	$0, -501(%rbp)
	jne	.L350
	movq	%r14, %rsi
	movq	%r13, %rdi
	vmovdqa	%ymm9, -464(%rbp)
	vmovdqa	%ymm10, -432(%rbp)
	vzeroupper
	call	niels_to_pt
	vmovdqa	-464(%rbp), %ymm9
	vmovdqa	-432(%rbp), %ymm10
.L344:
	addl	$1, %ebx
	addl	$90, %r12d
	cmpl	-500(%rbp), %r12d
	jne	.L340
	movl	%r15d, %r12d
	subl	$1, %r12d
	cmpl	$-1, %r12d
	je	.L354
	movq	%r13, %rsi
	movq	%r13, %rdi
	vmovdqa	%ymm9, -464(%rbp)
	vmovdqa	%ymm10, -432(%rbp)
	vzeroupper
	call	point_double_internal.constprop.15
	vmovdqa	-464(%rbp), %ymm9
	vmovdqa	-432(%rbp), %ymm10
	jmp	.L339
	.p2align 4,,10
	.p2align 3
.L350:
	cmpl	$4, %ebx
	movq	%r14, %rsi
	movq	%r13, %rdi
	sete	%al
	xorl	%edx, %edx
	testl	%r15d, %r15d
	setne	%dl
	vmovdqa	%ymm9, -464(%rbp)
	andq	%rax, %rdx
	vmovdqa	%ymm10, -432(%rbp)
	vzeroupper
	call	add_niels_to_pt
	vmovdqa	-432(%rbp), %ymm10
	vmovdqa	-464(%rbp), %ymm9
	jmp	.L344
.L354:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L355
	vzeroupper
	addq	$480, %rsp
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
.L355:
	.cfi_restore_state
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4704:
	.size	decaf_448_precomputed_scalarmul, .-decaf_448_precomputed_scalarmul
	.section	.text.unlikely.decaf_448_precomputed_scalarmul
.LCOLDE57:
	.section	.text.decaf_448_precomputed_scalarmul
.LHOTE57:
	.section	.text.unlikely.decaf_448_direct_scalarmul,"ax",@progbits
.LCOLDB58:
	.section	.text.decaf_448_direct_scalarmul,"ax",@progbits
.LHOTB58:
	.p2align 4,,15
	.globl	decaf_448_direct_scalarmul
	.type	decaf_448_direct_scalarmul, @function
decaf_448_direct_scalarmul:
.LFB4706:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-720(%rbp), %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rcx, %rbx
	subq	$1280, %rsp
	movq	%rdi, -1256(%rbp)
	movq	%rdx, -1232(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-1168(%rbp), %rax
	movq	%rax, %r15
	movq	%rax, %rdi
	movq	%rax, -1224(%rbp)
	call	p448_deserialize@PLT
	movq	%r15, %rdi
	movq	%rax, %r12
	call	gf_eq.constprop.10
	notq	%rax
	movq	%r15, %rsi
	leaq	-592(%rbp), %r15
	orq	%rax, %rbx
	leaq	-1040(%rbp), %rax
	andq	%r12, %rbx
	leaq	-656(%rbp), %r12
	movq	%rax, %rdi
	movq	%rbx, -1240(%rbp)
	movq	%rax, -1192(%rbp)
	call	p448_sqr@PLT
	movq	-1040(%rbp), %rax
	movq	16+ONE(%rip), %r8
	leaq	-848(%rbp), %rbx
	movq	40+ONE(%rip), %rcx
	movq	8+ONE(%rip), %r9
	movq	24+ONE(%rip), %rdi
	movq	32+ONE(%rip), %rsi
	movq	%rax, -1104(%rbp)
	movq	-1032(%rbp), %rax
	movq	48+ONE(%rip), %rdx
	movq	ONE(%rip), %r10
	movq	%r8, -960(%rbp)
	movq	%rcx, -936(%rbp)
	movq	%rax, -1096(%rbp)
	movq	-1024(%rbp), %rax
	movq	%r10, -976(%rbp)
	movq	%r9, -968(%rbp)
	movq	%rdi, -952(%rbp)
	movq	%rsi, -944(%rbp)
	movq	%rax, -1088(%rbp)
	movq	-1016(%rbp), %rax
	movq	%rdx, -928(%rbp)
	movq	%rax, -1080(%rbp)
	movq	-1008(%rbp), %rax
	movq	%rax, -1072(%rbp)
	movq	-1000(%rbp), %rax
	movq	%rax, -1064(%rbp)
	movq	-992(%rbp), %rax
	movq	%rax, -1056(%rbp)
	movq	-984(%rbp), %rax
	movq	%rax, -1048(%rbp)
	movq	56+ONE(%rip), %rax
	movq	%rax, -920(%rbp)
	movq	%r10, -912(%rbp)
	movq	%rax, -856(%rbp)
	movq	ZERO(%rip), %rax
	movq	%rcx, -872(%rbp)
	movl	$445, %ecx
	movq	%r8, -896(%rbp)
	movq	%r9, -904(%rbp)
	movq	%rdi, -888(%rbp)
	xorl	%r8d, %r8d
	movq	%rax, -848(%rbp)
	movq	8+ZERO(%rip), %rax
	movl	%ecx, %r14d
	movq	%rsi, -880(%rbp)
	movq	%rdx, -864(%rbp)
	movq	%rax, -840(%rbp)
	movq	16+ZERO(%rip), %rax
	movq	%rax, -832(%rbp)
	movq	24+ZERO(%rip), %rax
	movq	%rax, -824(%rbp)
	movq	32+ZERO(%rip), %rax
	movq	%rax, -816(%rbp)
	movq	40+ZERO(%rip), %rax
	movq	%rax, -808(%rbp)
	movq	48+ZERO(%rip), %rax
	movq	%rax, -800(%rbp)
	movq	56+ZERO(%rip), %rax
	movq	%rax, -792(%rbp)
	leaq	-912(%rbp), %rax
	movq	%rax, -1176(%rbp)
	leaq	-976(%rbp), %rax
	movq	%rax, -1184(%rbp)
	leaq	-784(%rbp), %rax
	movq	%rax, -1200(%rbp)
	.p2align 4,,10
	.p2align 3
.L357:
	movq	-1232(%rbp), %rcx
	movl	%r14d, %eax
	vmovdqa	-976(%rbp), %ymm1
	sarl	$6, %eax
	vmovdqa	-944(%rbp), %ymm0
	movq	-1192(%rbp), %rsi
	cltq
	vmovdqa	-1040(%rbp), %ymm3
	movq	-1176(%rbp), %rdi
	movq	(%rcx,%rax,8), %rax
	movl	%r14d, %ecx
	vmovdqa	-1008(%rbp), %ymm4
	vmovdqa	-912(%rbp), %ymm9
	vpaddq	%ymm1, %ymm3, %ymm8
	vpsubq	%ymm1, %ymm3, %ymm3
	vmovdqa	-848(%rbp), %ymm2
	vpaddq	%ymm0, %ymm4, %ymm6
	vpsubq	%ymm0, %ymm4, %ymm4
	shrq	%cl, %rax
	vmovdqa	-816(%rbp), %ymm0
	vpaddq	.LC2(%rip), %ymm3, %ymm3
	andl	$1, %eax
	vmovdqa	-880(%rbp), %ymm1
	vpaddq	%ymm2, %ymm9, %ymm7
	negq	%rax
	vmovdqa	%ymm3, -720(%rbp)
	vpsubq	%ymm2, %ymm9, %ymm2
	xorl	%eax, %r8d
	vpaddq	.LC2(%rip), %ymm2, %ymm2
	vpxor	%ymm3, %ymm2, %ymm3
	movl	%r8d, -1208(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm5
	vpsubq	%ymm0, %ymm1, %ymm1
	vpbroadcastd	-1208(%rbp), %ymm0
	vpaddq	.LC3(%rip), %ymm1, %ymm1
	vpaddq	.LC3(%rip), %ymm4, %ymm4
	vmovdqa	%ymm8, -784(%rbp)
	vpxor	%ymm8, %ymm7, %ymm8
	vpand	%ymm0, %ymm3, %ymm3
	vmovdqa	%ymm6, -752(%rbp)
	vmovdqa	%ymm2, -976(%rbp)
	vpxor	%ymm6, %ymm5, %ymm6
	vpand	%ymm0, %ymm8, %ymm8
	vmovdqa	%ymm7, -1040(%rbp)
	vpxor	%ymm2, %ymm3, %ymm3
	vmovdqa	%ymm5, -1008(%rbp)
	vpxor	%ymm4, %ymm1, %ymm2
	vmovdqa	%ymm1, -944(%rbp)
	vpand	%ymm0, %ymm6, %ymm6
	movq	%r13, %rdx
	vpxor	%ymm7, %ymm8, %ymm7
	vmovdqa	%ymm4, -688(%rbp)
	vpand	%ymm0, %ymm2, %ymm0
	movq	%rax, -1216(%rbp)
	vpxor	%ymm5, %ymm6, %ymm5
	vmovdqa	%ymm3, -592(%rbp)
	vmovdqa	%ymm7, -656(%rbp)
	vpxor	%ymm1, %ymm0, %ymm1
	vmovdqa	%ymm5, -624(%rbp)
	vmovdqa	%ymm1, -560(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-1184(%rbp), %rdx
	movq	%rbx, %rdi
	movq	-1200(%rbp), %rsi
	call	p448_mul@PLT
	vmovdqa	-848(%rbp), %ymm2
	movq	-1224(%rbp), %rdx
	movq	%rbx, %rsi
	vmovdqa	-912(%rbp), %ymm3
	movq	%r13, %rdi
	vmovdqa	-880(%rbp), %ymm1
	vpaddq	%ymm2, %ymm3, %ymm0
	vmovdqa	%ymm0, -784(%rbp)
	vpsubq	%ymm2, %ymm3, %ymm2
	vmovdqa	-816(%rbp), %ymm0
	vpaddq	.LC2(%rip), %ymm2, %ymm2
	vmovdqa	%ymm2, -848(%rbp)
	vpaddq	%ymm0, %ymm1, %ymm4
	vpsubq	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm4, -752(%rbp)
	vpaddq	.LC3(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -816(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-1200(%rbp), %rsi
	movq	-1192(%rbp), %rdi
	call	p448_sqr@PLT
	movq	-1184(%rbp), %rdi
	movq	%r13, %rsi
	call	p448_sqr@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	p448_sqr@PLT
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_sqr@PLT
	movq	-1176(%rbp), %rdi
	vmovdqa	-816(%rbp), %ymm0
	movq	%rbx, %rdx
	vmovdqa	-848(%rbp), %ymm1
	movq	%r12, %rsi
	vpsubq	-624(%rbp), %ymm0, %ymm0
	vpaddq	.LC3(%rip), %ymm0, %ymm0
	vmovdqa	%ymm0, -560(%rbp)
	vpsubq	-656(%rbp), %ymm1, %ymm1
	vpaddq	.LC2(%rip), %ymm1, %ymm1
	vmovdqa	%ymm1, -592(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%r15, %rsi
	movq	%rbx, %rdi
	movl	$39082, %edx
	call	p448_mulw@PLT
	vmovdqa	-656(%rbp), %ymm0
	movq	%r15, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	vpaddq	-848(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -656(%rbp)
	vmovdqa	-624(%rbp), %ymm0
	vpaddq	-816(%rbp), %ymm0, %ymm0
	vmovdqa	%ymm0, -624(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-1216(%rbp), %rax
	subl	$1, %r14d
	cmpl	$-1, %r14d
	movq	%rax, %r8
	jne	.L357
	vmovdqa	-912(%rbp), %ymm4
	movq	%rax, -1208(%rbp)
	leaq	-400(%rbp), %rcx
	vmovdqa	-1040(%rbp), %ymm0
	movq	-1200(%rbp), %rsi
	movq	%r13, %rdx
	vpbroadcastq	-1208(%rbp), %ymm3
	movq	%rcx, %rdi
	movq	%rax, -1312(%rbp)
	vpxor	%ymm0, %ymm4, %ymm2
	movq	%rcx, -1304(%rbp)
	vpand	%ymm3, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vpxor	%ymm4, %ymm1, %ymm1
	vmovdqa	-880(%rbp), %ymm4
	vmovdqa	%ymm0, -1040(%rbp)
	vmovdqa	-1008(%rbp), %ymm0
	vmovdqa	%ymm1, -912(%rbp)
	vpxor	%ymm0, %ymm4, %ymm2
	vpand	%ymm3, %ymm2, %ymm1
	vmovdqa	-976(%rbp), %ymm2
	vpxor	%ymm0, %ymm1, %ymm0
	vpxor	%ymm4, %ymm1, %ymm1
	vmovdqa	-816(%rbp), %ymm4
	vmovdqa	%ymm0, -1008(%rbp)
	vmovdqa	-848(%rbp), %ymm0
	vmovdqa	%ymm1, -880(%rbp)
	vpxor	%ymm0, %ymm2, %ymm1
	vpand	%ymm3, %ymm1, %ymm1
	vpxor	%ymm1, %ymm2, %ymm2
	vpxor	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm2, -976(%rbp)
	vmovdqa	-944(%rbp), %ymm2
	vmovdqa	%ymm0, -848(%rbp)
	vpxor	%ymm2, %ymm4, %ymm1
	vpand	%ymm3, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm2
	vpxor	%ymm4, %ymm0, %ymm0
	vmovdqa	%ymm2, -944(%rbp)
	vmovdqa	%ymm0, -816(%rbp)
	vzeroupper
	leaq	-528(%rbp), %r14
	call	p448_mul@PLT
	movq	-1176(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rdi
	leaq	-464(%rbp), %r13
	call	p448_mul@PLT
	movq	-1184(%rbp), %rdx
	movq	-1192(%rbp), %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdi
	call	gf_eq.constprop.10
	movq	%r13, %rdi
	movq	%rax, -1216(%rbp)
	subq	%rax, -528(%rbp)
	call	gf_eq.constprop.10
	orq	-1216(%rbp), %rax
	movq	-1184(%rbp), %rdi
	movq	%rax, -1232(%rbp)
	call	gf_eq.constprop.10
	leaq	-1104(%rbp), %rdx
	movq	%r12, %rdi
	movq	%rax, -1248(%rbp)
	movq	%rdx, %rsi
	movq	%rdx, -1200(%rbp)
	call	gf_add.constprop.13
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_sqr@PLT
	movq	-1200(%rbp), %rsi
	movq	%r12, %rdi
	movl	$156324, %edx
	call	p448_mulw@PLT
	movq	%r12, %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_add
	vmovdqa	-464(%rbp), %ymm1
	movq	-1200(%rbp), %rsi
	movq	%r13, %rdx
	vpbroadcastd	-1232(%rbp), %ymm4
	movq	%r12, %rdi
	vpxor	-592(%rbp), %ymm1, %ymm0
	vmovdqa	%ymm4, -1296(%rbp)
	vpand	%ymm4, %ymm0, %ymm0
	vpxor	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, -464(%rbp)
	vmovdqa	-432(%rbp), %ymm0
	vpxor	-560(%rbp), %ymm0, %ymm1
	vpand	%ymm4, %ymm1, %ymm1
	vpxor	%ymm0, %ymm1, %ymm1
	vmovdqa	%ymm1, -432(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	leaq	-336(%rbp), %rdi
	leaq	-272(%rbp), %r14
	movq	%r15, %rsi
	movq	%rdi, %r13
	call	p448_isr@PLT
	movq	%r13, %rsi
	movq	%r14, %rdi
	movq	%r13, -1208(%rbp)
	call	p448_sqr@PLT
	leaq	-208(%rbp), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	gf_add.constprop.13
	movq	-1224(%rbp), %r11
	leaq	-144(%rbp), %rdi
	movq	%r11, %rdx
	movq	%r11, %rsi
	call	gf_add
	movq	%rdi, -1264(%rbp)
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %rdi
	andl	$1, %edi
	movq	%rdi, %r13
	movq	%r12, %rdi
	call	gf_eq.constprop.10
	movq	-1176(%rbp), %rdx
	movq	-1200(%rbp), %rsi
	negq	%r13
	orq	%rax, %r13
	movq	%r15, %rdi
	notq	%r13
	andq	-1240(%rbp), %r13
	call	p448_mul@PLT
	movq	%r15, %rdx
	movq	%rbx, %rsi
	movq	%r15, %rdi
	call	gf_sub
	movq	-1184(%rbp), %rsi
	movq	%r15, %rdx
	movq	%r12, %rdi
	call	p448_mul@PLT
	movq	-1200(%rbp), %rsi
	movq	%rbx, %rdx
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	-1176(%rbp), %rdx
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_sub
	movq	-1192(%rbp), %rsi
	movq	%r15, %rdx
	movq	%r14, %rdi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	gf_sub
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	gf_add
	movq	-1208(%rbp), %rbx
	movq	%r15, %rsi
	movq	%r14, %rdi
	movq	%rbx, %rdx
	call	p448_mul@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	movq	%rbx, -1208(%rbp)
	call	p448_mul@PLT
	movq	%r15, %rdi
	call	p448_strong_reduce@PLT
	movq	-592(%rbp), %rdi
	andl	$1, %edi
	movq	%rdi, %rbx
	movq	%r14, %rdi
	call	p448_strong_reduce@PLT
	movq	-272(%rbp), %rdi
	negq	%rbx
	vmovdqa	-912(%rbp), %ymm1
	vmovdqa	-880(%rbp), %ymm3
	movq	-1232(%rbp), %rcx
	vpxor	-848(%rbp), %ymm1, %ymm0
	andl	$1, %edi
	vmovdqa	-336(%rbp), %ymm5
	movq	-1312(%rbp), %r8
	movq	%rdi, %rax
	vmovdqa	-1296(%rbp), %ymm4
	movq	%r12, %rdi
	negq	%rax
	xorq	%rax, %rbx
	orl	-1248(%rbp), %ebx
	movl	%ecx, %eax
	orl	%r8d, %eax
	movl	%ebx, -1184(%rbp)
	vpbroadcastd	-1184(%rbp), %ymm2
	movl	%eax, -1184(%rbp)
	movq	%rcx, %rax
	notq	%rax
	vpand	%ymm2, %ymm0, %ymm0
	andl	%eax, %r8d
	vpxor	%ymm1, %ymm0, %ymm1
	vpxor	-816(%rbp), %ymm3, %ymm0
	vmovdqa	%ymm1, -912(%rbp)
	vpand	%ymm2, %ymm0, %ymm2
	vpxor	%ymm3, %ymm2, %ymm0
	vpbroadcastd	-1184(%rbp), %ymm2
	vpxor	-208(%rbp), %ymm5, %ymm3
	movl	%r8d, -1184(%rbp)
	vmovdqa	%ymm0, -880(%rbp)
	vpand	%ymm2, %ymm3, %ymm3
	vpxor	%ymm5, %ymm3, %ymm3
	vmovdqa	-304(%rbp), %ymm5
	vmovdqa	%ymm3, -336(%rbp)
	vpxor	-176(%rbp), %ymm5, %ymm3
	vpand	%ymm2, %ymm3, %ymm2
	vmovdqa	-1136(%rbp), %ymm3
	vpxor	%ymm5, %ymm2, %ymm2
	vmovdqa	%ymm2, -304(%rbp)
	vmovdqa	-400(%rbp), %ymm2
	vpxor	%ymm1, %ymm2, %ymm1
	vpand	%ymm4, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-1168(%rbp), %ymm2
	vmovdqa	%ymm1, -400(%rbp)
	vmovdqa	-368(%rbp), %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpxor	%ymm1, %ymm0, %ymm0
	vpxor	ONE(%rip), %ymm2, %ymm1
	vmovdqa	%ymm0, -368(%rbp)
	vpbroadcastd	-1184(%rbp), %ymm0
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm2
	vpxor	32+ONE(%rip), %ymm3, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpbroadcastd	-1216(%rbp), %ymm1
	vpxor	%ymm3, %ymm0, %ymm0
	vpxor	ZERO(%rip), %ymm2, %ymm3
	movq	-1208(%rbp), %rdx
	movq	-1176(%rbp), %rsi
	vpand	%ymm1, %ymm3, %ymm3
	vpxor	%ymm2, %ymm3, %ymm2
	vmovdqa	%ymm2, -1168(%rbp)
	vpxor	32+ZERO(%rip), %ymm0, %ymm2
	vpand	%ymm1, %ymm2, %ymm1
	vpxor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -1136(%rbp)
	vzeroupper
	call	p448_mul@PLT
	movq	-1224(%rbp), %rdx
	movq	%r12, %rsi
	movq	%r15, %rdi
	call	p448_mul@PLT
	movq	-1304(%rbp), %rcx
	movq	%r15, %rsi
	movq	%r12, %rdi
	movq	%rcx, %rdx
	call	p448_mul@PLT
	movq	-1264(%rbp), %rbx
	movq	%r12, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	gf_add
	movq	%rbx, %rdi
	call	p448_strong_reduce@PLT
	movq	-144(%rbp), %r9
	movq	%r12, %rsi
	movq	%rbx, %rdi
	andl	$1, %r9d
	negq	%r9
	call	gf_sub.constprop.12
	vmovdqa	-656(%rbp), %ymm2
	movl	%r9d, -1176(%rbp)
	movq	%r12, %rsi
	vpbroadcastd	-1176(%rbp), %ymm0
	movq	-1256(%rbp), %rdi
	vpxor	-144(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm1
	vpxor	%ymm2, %ymm1, %ymm1
	vmovdqa	-624(%rbp), %ymm2
	vmovdqa	%ymm1, -656(%rbp)
	vpxor	-112(%rbp), %ymm2, %ymm1
	vpand	%ymm0, %ymm1, %ymm0
	vpxor	%ymm2, %ymm0, %ymm0
	vmovdqa	%ymm0, -624(%rbp)
	vzeroupper
	call	p448_serialize@PLT
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	movq	%r13, %rax
	jne	.L362
	addq	$1280, %rsp
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
.L362:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4706:
	.size	decaf_448_direct_scalarmul, .-decaf_448_direct_scalarmul
	.section	.text.unlikely.decaf_448_direct_scalarmul
.LCOLDE58:
	.section	.text.decaf_448_direct_scalarmul
.LHOTE58:
	.section	.text.unlikely.decaf_448_precompute_wnafs,"ax",@progbits
.LCOLDB59:
	.section	.text.decaf_448_precompute_wnafs,"ax",@progbits
.LHOTB59:
	.p2align 4,,15
	.globl	decaf_448_precompute_wnafs
	.hidden	decaf_448_precompute_wnafs
	.type	decaf_448_precompute_wnafs, @function
decaf_448_precompute_wnafs:
.LFB4709:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	64(%rsi), %r9
	movq	%rsi, %rdx
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	-12368(%rbp), %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rsi, %rbx
	movq	%r9, %rsi
	leaq	64(%r13), %r15
	subq	$12448, %rsp
	movq	%rdi, -12488(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-8272(%rbp), %rax
	movq	%rax, %r14
	movq	%rax, %rdi
	call	gf_sub
	leaq	64(%r14), %rdi
	movq	%r9, %rdx
	leaq	128(%r14), %r12
	movq	%rbx, %rsi
	call	gf_add
	leaq	192(%rbx), %rsi
	movl	$78164, %edx
	movq	%r12, %rdi
	call	p448_mulw@PLT
	movq	%r12, %rsi
	movq	%r12, %rdi
	leaq	192(%r14), %r12
	call	gf_sub.constprop.12
	leaq	128(%rbx), %rsi
	movq	%r12, %rdi
	movq	%r14, -12480(%rbp)
	leaq	128(%r13), %r14
	movq	%rsi, %rdx
	call	gf_add
	movq	%rbx, %rsi
	leaq	-10320(%rbp), %rbx
	movq	%r13, %rdi
	call	decaf_448_point_double@PLT
	movq	%rbx, %rdi
	movq	%r13, %rdx
	movq	%r15, %rsi
	call	gf_sub
	leaq	64(%rbx), %rdi
	movq	%r15, %rdx
	movq	%r13, %rsi
	call	gf_add
	leaq	192(%r13), %rsi
	movq	%rbx, -12448(%rbp)
	subq	$-128, %rbx
	movl	$78164, %edx
	movq	%rbx, %rdi
	movq	%rsi, -12440(%rbp)
	call	p448_mulw@PLT
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	gf_sub.constprop.12
	movq	-12448(%rbp), %rbx
	movq	%r14, %rdx
	movq	%r14, %rsi
	leaq	192(%rbx), %rax
	leaq	-12432(%rbp), %rbx
	movq	%rax, %rdi
	movq	%rax, -12456(%rbp)
	call	gf_add
	movq	%r12, %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	-12432(%rbp), %rdx
	movq	-12480(%rbp), %r12
	movq	%r13, %rdi
	movq	%rdx, -12240(%rbp)
	movq	-12424(%rbp), %rdx
	movq	%r12, %rsi
	movq	%rdx, -12232(%rbp)
	movq	-12416(%rbp), %rdx
	movq	%rdx, -12224(%rbp)
	movq	-12408(%rbp), %rdx
	movq	%rdx, -12216(%rbp)
	movq	-12400(%rbp), %rdx
	movq	%rdx, -12208(%rbp)
	movq	-12392(%rbp), %rdx
	movq	%rdx, -12200(%rbp)
	movq	-12384(%rbp), %rdx
	movq	%rdx, -12192(%rbp)
	movq	-12376(%rbp), %rdx
	movq	%rdx, -12184(%rbp)
	xorl	%edx, %edx
	call	add_niels_to_pt
	leaq	256(%r12), %rdi
	movq	%r13, %rdx
	movq	%r15, %rsi
	call	gf_sub
	leaq	320(%r12), %rdi
	movq	%r15, %rdx
	movq	%r13, %rsi
	call	gf_add
	movq	%r12, -12480(%rbp)
	movq	-12440(%rbp), %rsi
	leaq	384(%r12), %r12
	movl	$78164, %edx
	movq	%r12, %rdi
	call	p448_mulw@PLT
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	gf_sub.constprop.12
	movq	-12480(%rbp), %r12
	movq	%r14, %rsi
	movq	%r14, %rdx
	leaq	448(%r12), %rdi
	call	gf_add
	movq	-12440(%rbp), %rsi
	movq	%r12, %rax
	leaq	512(%r12), %r12
	leaq	8192(%rax), %r8
	movq	%r15, -12464(%rbp)
	movq	%rsi, -12472(%rbp)
	.p2align 4,,10
	.p2align 3
.L364:
	movq	-12456(%rbp), %rdx
	movq	%r14, %rsi
	movq	%rbx, %rdi
	movq	%r8, -12440(%rbp)
	call	p448_mul@PLT
	movq	-12432(%rbp), %rax
	movq	-12448(%rbp), %rsi
	xorl	%edx, %edx
	movq	%r13, %rdi
	movq	%rax, -12240(%rbp)
	movq	-12424(%rbp), %rax
	movq	%rax, -12232(%rbp)
	movq	-12416(%rbp), %rax
	movq	%rax, -12224(%rbp)
	movq	-12408(%rbp), %rax
	movq	%rax, -12216(%rbp)
	movq	-12400(%rbp), %rax
	movq	%rax, -12208(%rbp)
	movq	-12392(%rbp), %rax
	movq	%rax, -12200(%rbp)
	movq	-12384(%rbp), %rax
	movq	%rax, -12192(%rbp)
	movq	-12376(%rbp), %rax
	movq	%rax, -12184(%rbp)
	call	add_niels_to_pt
	movq	-12464(%rbp), %r15
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r15, %rsi
	call	gf_sub
	leaq	64(%r12), %rdi
	movq	%r15, %rdx
	movq	%r13, %rsi
	leaq	128(%r12), %r15
	call	gf_add
	movq	-12472(%rbp), %rsi
	movl	$78164, %edx
	movq	%r15, %rdi
	call	p448_mulw@PLT
	movq	%r15, %rsi
	movq	%r15, %rdi
	call	gf_sub.constprop.12
	leaq	192(%r12), %rdi
	movq	%r14, %rdx
	movq	%r14, %rsi
	addq	$256, %r12
	call	gf_add
	movq	-12440(%rbp), %r8
	cmpq	%r8, %r12
	jne	.L364
	movq	-12488(%rbp), %r9
	movq	-12480(%rbp), %rax
	movq	%r13, %rdx
	.p2align 4,,10
	.p2align 3
.L365:
	movq	(%rax), %rcx
	leaq	8(%r9), %rdi
	movq	%rax, %rsi
	addq	$256, %rax
	addq	$64, %rdx
	andq	$-8, %rdi
	movq	%rcx, (%r9)
	movq	-72(%rax), %rcx
	movq	%rcx, 184(%r9)
	movq	%r9, %rcx
	addq	$192, %r9
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	$192, %ecx
	shrl	$3, %ecx
	rep movsq
	movq	-64(%rax), %rcx
	movq	%rcx, -64(%rdx)
	movq	-56(%rax), %rcx
	movq	%rcx, -56(%rdx)
	movq	-48(%rax), %rcx
	movq	%rcx, -48(%rdx)
	movq	-40(%rax), %rcx
	movq	%rcx, -40(%rdx)
	movq	-32(%rax), %rcx
	movq	%rcx, -32(%rdx)
	movq	-24(%rax), %rcx
	movq	%rcx, -24(%rdx)
	movq	-16(%rax), %rcx
	movq	%rcx, -16(%rdx)
	movq	-8(%rax), %rcx
	movq	%rcx, -8(%rdx)
	cmpq	%rax, %r8
	jne	.L365
	movq	%r13, %rsi
	movq	-12448(%rbp), %r13
	movl	$32, %edx
	movq	%r13, %rdi
	leaq	2048(%r13), %r14
	call	gf_batch_invert
	movq	-12488(%rbp), %r12
	addq	$64, %r12
	.p2align 4,,10
	.p2align 3
.L366:
	leaq	-64(%r12), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	p448_mul@PLT
	movq	%rbx, %rdi
	call	p448_strong_reduce@PLT
	movq	-12432(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movq	%rax, -64(%r12)
	movq	-12424(%rbp), %rax
	movq	%rax, -56(%r12)
	movq	-12416(%rbp), %rax
	movq	%rax, -48(%r12)
	movq	-12408(%rbp), %rax
	movq	%rax, -40(%r12)
	movq	-12400(%rbp), %rax
	movq	%rax, -32(%r12)
	movq	-12392(%rbp), %rax
	movq	%rax, -24(%r12)
	movq	-12384(%rbp), %rax
	movq	%rax, -16(%r12)
	movq	-12376(%rbp), %rax
	movq	%rax, -8(%r12)
	call	p448_mul@PLT
	movq	%rbx, %rdi
	call	p448_strong_reduce@PLT
	movq	-12432(%rbp), %rax
	leaq	64(%r12), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	addq	$64, %r13
	addq	$192, %r12
	movq	%rax, -192(%r12)
	movq	-12424(%rbp), %rax
	movq	%rax, -184(%r12)
	movq	-12416(%rbp), %rax
	movq	%rax, -176(%r12)
	movq	-12408(%rbp), %rax
	movq	%rax, -168(%r12)
	movq	-12400(%rbp), %rax
	movq	%rax, -160(%r12)
	movq	-12392(%rbp), %rax
	movq	%rax, -152(%r12)
	movq	-12384(%rbp), %rax
	movq	%rax, -144(%r12)
	movq	-12376(%rbp), %rax
	movq	%rax, -136(%r12)
	call	p448_mul@PLT
	movq	%rbx, %rdi
	call	p448_strong_reduce@PLT
	movq	-12432(%rbp), %rax
	movq	%rax, -128(%r12)
	movq	-12424(%rbp), %rax
	movq	%rax, -120(%r12)
	movq	-12416(%rbp), %rax
	movq	%rax, -112(%r12)
	movq	-12408(%rbp), %rax
	movq	%rax, -104(%r12)
	movq	-12400(%rbp), %rax
	movq	%rax, -96(%r12)
	movq	-12392(%rbp), %rax
	movq	%rax, -88(%r12)
	movq	-12384(%rbp), %rax
	movq	%rax, -80(%r12)
	movq	-12376(%rbp), %rax
	movq	%rax, -72(%r12)
	cmpq	%r13, %r14
	jne	.L366
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L373
	addq	$12448, %rsp
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
.L373:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4709:
	.size	decaf_448_precompute_wnafs, .-decaf_448_precompute_wnafs
	.section	.text.unlikely.decaf_448_precompute_wnafs
.LCOLDE59:
	.section	.text.decaf_448_precompute_wnafs
.LHOTE59:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC60:
	.string	"position <= SCALAR_BITS/(tableBits+1) + 2"
	.section	.rodata.str1.1
.LC61:
	.string	"control_var[contv].addend"
.LC62:
	.string	"control_pre[contp].addend"
.LC63:
	.string	"contv == ncb_var"
.LC64:
	.string	"contp == ncb_pre"
	.section	.text.unlikely.decaf_448_base_double_scalarmul_non_secret,"ax",@progbits
.LCOLDB65:
	.section	.text.decaf_448_base_double_scalarmul_non_secret,"ax",@progbits
.LHOTB65:
	.p2align 4,,15
	.globl	decaf_448_base_double_scalarmul_non_secret
	.type	decaf_448_base_double_scalarmul_non_secret, @function
decaf_448_base_double_scalarmul_non_secret:
.LFB4710:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r13
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rcx, %r14
	movq	%rdx, %r12
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	xorl	%ebx, %ebx
	xorl	%edi, %edi
	subq	$192, %rsp
	movl	$445, %ecx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, -224(%rbp)
	movl	$2, %eax
	subq	$928, %rsp
	shrx	%rax, %rsp, %r8
	subq	$624, %rsp
	shrx	%rax, %rsp, %rax
	leaq	0(,%r8,4), %r11
	leaq	0(,%rax,4), %r9
	movq	%rax, -152(%rbp)
	.p2align 4,,10
	.p2align 3
.L378:
	movl	%ecx, %eax
	sarl	$6, %eax
	cltq
	movq	(%rsi,%rax,8), %rax
	shrq	%cl, %rax
	andl	$1, %eax
	leal	(%rax,%rdi,2), %edi
	leal	64(%rdi), %eax
	cmpl	$127, %eax
	jbe	.L375
	leal	1(%rdi), %eax
	andl	$1, %edi
	movl	%ecx, %edx
	negl	%edi
	sarl	%eax
	testb	$1, %al
	jne	.L376
	.p2align 4,,10
	.p2align 3
.L377:
	sarl	%eax
	addl	$1, %edx
	testb	$1, %al
	je	.L377
.L376:
	movl	%ebx, %r10d
	addl	$1, %ebx
	addl	$1, %edx
	leaq	(%r9,%r10,8), %r10
	cmpl	$76, %ebx
	movl	%edx, (%r10)
	movl	%eax, 4(%r10)
	ja	.L385
.L375:
	subl	$1, %ecx
	cmpl	$-1, %ecx
	jne	.L378
	testl	%edi, %edi
	je	.L379
	xorl	%eax, %eax
	testb	$1, %dil
	jne	.L380
.L381:
	sarl	%edi
	addl	$1, %eax
	testb	$1, %dil
	je	.L381
.L380:
	movl	%ebx, %edx
	addl	$1, %ebx
	leaq	(%r9,%rdx,8), %rdx
	cmpl	$76, %ebx
	movl	%eax, (%rdx)
	movl	%edi, 4(%rdx)
	ja	.L390
.L379:
	movl	%ebx, %eax
	xorl	%edi, %edi
	movl	$445, %ecx
	leaq	(%r9,%rax,8), %rax
	movl	$-1, (%rax)
	movl	$0, 4(%rax)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L386:
	movl	%ecx, %edx
	sarl	$6, %edx
	movslq	%edx, %rdx
	movq	(%r14,%rdx,8), %rdx
	shrq	%cl, %rdx
	andl	$1, %edx
	leal	(%rdx,%rdi,2), %edi
	leal	16(%rdi), %edx
	cmpl	$31, %edx
	jbe	.L382
	leal	1(%rdi), %edx
	andl	$1, %edi
	movl	%ecx, %esi
	negl	%edi
	sarl	%edx
	testb	$1, %dl
	jne	.L383
	.p2align 4,,10
	.p2align 3
.L384:
	sarl	%edx
	addl	$1, %esi
	testb	$1, %dl
	je	.L384
.L383:
	movl	%eax, %r10d
	addl	$1, %eax
	addl	$1, %esi
	leaq	(%r11,%r10,8), %r10
	cmpl	$113, %eax
	movl	%esi, (%r10)
	movl	%edx, 4(%r10)
	ja	.L385
.L382:
	subl	$1, %ecx
	cmpl	$-1, %ecx
	jne	.L386
	testl	%edi, %edi
	je	.L387
	xorl	%edx, %edx
	testb	$1, %dil
	jne	.L388
.L389:
	sarl	%edi
	addl	$1, %edx
	testb	$1, %dil
	je	.L389
.L388:
	movl	%eax, %ecx
	addl	$1, %eax
	leaq	(%r11,%rcx,8), %rcx
	cmpl	$113, %eax
	movl	%edx, (%rcx)
	movl	%edi, 4(%rcx)
	ja	.L390
.L387:
	movl	%eax, %edx
	subq	$2080, %rsp
	leaq	64(%r12), %r14
	leaq	(%r11,%rdx,8), %rdx
	movq	%r9, -184(%rbp)
	movq	%r8, -176(%rbp)
	movq	%r14, %rsi
	movl	%eax, -164(%rbp)
	movq	%r11, -160(%rbp)
	movl	$-1, (%rdx)
	movl	$0, 4(%rdx)
	leaq	31(%rsp), %rdx
	andq	$-32, %rdx
	movq	%rdx, %r15
	movq	%rdx, -200(%rbp)
	movq	%r12, %rdx
	movq	%r15, %rdi
	call	gf_sub
	leaq	64(%r15), %rdi
	movq	%r14, %rdx
	movq	%r12, %rsi
	leaq	128(%r15), %r14
	call	gf_add
	leaq	192(%r12), %rsi
	movl	$78164, %edx
	movq	%r14, %rdi
	call	p448_mulw@PLT
	movq	%r14, %rsi
	movq	%r14, %rdi
	call	gf_sub.constprop.12
	leaq	128(%r12), %rsi
	leaq	192(%r15), %rdi
	movq	%rsi, %rdx
	call	gf_add
	movq	%r15, %rdi
	movl	$3, %edx
	movq	%r12, %rsi
	call	prepare_wnaf_table.part.1
	movq	-176(%rbp), %r8
	movq	-160(%rbp), %r11
	movl	-164(%rbp), %eax
	movq	-184(%rbp), %r9
	movl	0(,%r8,4), %r15d
	testl	%r15d, %r15d
	js	.L434
	movq	-152(%rbp), %rcx
	movq	%r9, -192(%rbp)
	movq	%r11, -184(%rbp)
	movl	%eax, -176(%rbp)
	movl	0(,%rcx,4), %r12d
	cmpl	%r12d, %r15d
	jg	.L435
	je	.L436
	movq	-152(%rbp), %rax
	movq	%r13, %rdi
	movl	4(,%rax,4), %edx
	sarl	%edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$6, %rsi
	addq	decaf_448_precomputed_wnaf_as_fe@GOTPCREL(%rip), %rsi
	call	niels_to_pt
	movq	-192(%rbp), %r9
	movq	-184(%rbp), %r11
	movl	-176(%rbp), %eax
	movl	$0, -164(%rbp)
	movl	$1, -160(%rbp)
.L394:
	subl	$1, %r12d
	js	.L396
	movslq	%r12d, %rcx
	movl	%eax, -168(%rbp)
	movl	%ebx, -228(%rbp)
	movq	%rcx, -176(%rbp)
	leaq	128(%r13), %rcx
	movq	%r11, -184(%rbp)
	movq	%r9, -192(%rbp)
	movq	%rcx, -208(%rbp)
	leaq	-144(%rbp), %rcx
	movq	%rcx, -216(%rbp)
	jmp	.L406
	.p2align 4,,10
	.p2align 3
.L398:
	cmpl	%r12d, %ebx
	je	.L437
.L402:
	subl	$1, %r12d
	subq	$1, -176(%rbp)
	cmpl	$-1, %r12d
	je	.L438
.L406:
	movslq	-164(%rbp), %rdx
	movq	-184(%rbp), %rax
	leaq	(%rax,%rdx,8), %r14
	movslq	-160(%rbp), %rdx
	movq	-192(%rbp), %rax
	movl	(%r14), %r8d
	leaq	(%rax,%rdx,8), %r15
	cmpl	%r12d, %r8d
	movl	(%r15), %ebx
	sete	%sil
	cmpl	%r12d, %ebx
	sete	%dl
	testl	%r12d, %r12d
	je	.L414
	orl	%esi, %edx
	xorl	$1, %edx
	movzbl	%dl, %edx
.L397:
	movq	%r13, %rsi
	movq	%r13, %rdi
	movl	%r8d, -152(%rbp)
	call	point_double_internal
	movl	-152(%rbp), %r8d
	cmpl	%r12d, %r8d
	jne	.L398
	movl	4(%r14), %edx
	cmpl	$0, %edx
	je	.L439
	jle	.L400
	sarl	%edx
	movq	-208(%rbp), %rsi
	movq	-216(%rbp), %rdi
	movslq	%edx, %r8
	salq	$8, %r8
	addq	-200(%rbp), %r8
	leaq	192(%r8), %rdx
	movq	%r8, -152(%rbp)
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	testl	%r12d, %r12d
	movq	-152(%rbp), %r8
	movq	%r13, %rdi
	movq	%rdx, 128(%r13)
	movq	-136(%rbp), %rdx
	movq	%rdx, 136(%r13)
	movq	-128(%rbp), %rdx
	movq	%rdx, 144(%r13)
	movq	-120(%rbp), %rdx
	movq	%rdx, 152(%r13)
	movq	-112(%rbp), %rdx
	movq	%rdx, 160(%r13)
	movq	-104(%rbp), %rdx
	movq	%rdx, 168(%r13)
	movq	-96(%rbp), %rdx
	movq	%rdx, 176(%r13)
	movq	-88(%rbp), %rdx
	movq	%rdx, 184(%r13)
	setne	%dl
	xorl	%esi, %esi
	cmpl	%r12d, %ebx
	setne	%sil
	andq	%rsi, %rdx
	movq	%r8, %rsi
	call	add_niels_to_pt
.L401:
	addl	$1, -164(%rbp)
	cmpl	%r12d, %ebx
	jne	.L402
.L437:
	movl	4(%r15), %edx
	cmpl	$0, %edx
	je	.L440
	jle	.L404
	sarl	%edx
	movq	%r13, %rdi
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	movq	-176(%rbp), %rdx
	salq	$6, %rsi
	addq	decaf_448_precomputed_wnaf_as_fe@GOTPCREL(%rip), %rsi
	call	add_niels_to_pt
.L405:
	addl	$1, -160(%rbp)
	jmp	.L402
.L400:
	negl	%edx
	movq	-208(%rbp), %rsi
	movq	-216(%rbp), %rdi
	sarl	%edx
	movslq	%edx, %r8
	salq	$8, %r8
	addq	-200(%rbp), %r8
	leaq	192(%r8), %rdx
	movq	%r8, -152(%rbp)
	call	p448_mul@PLT
	movq	-144(%rbp), %rdx
	testl	%r12d, %r12d
	movq	-152(%rbp), %r8
	movq	%r13, %rdi
	movq	%rdx, 128(%r13)
	movq	-136(%rbp), %rdx
	movq	%rdx, 136(%r13)
	movq	-128(%rbp), %rdx
	movq	%rdx, 144(%r13)
	movq	-120(%rbp), %rdx
	movq	%rdx, 152(%r13)
	movq	-112(%rbp), %rdx
	movq	%rdx, 160(%r13)
	movq	-104(%rbp), %rdx
	movq	%rdx, 168(%r13)
	movq	-96(%rbp), %rdx
	movq	%rdx, 176(%r13)
	movq	-88(%rbp), %rdx
	movq	%rdx, 184(%r13)
	setne	%dl
	xorl	%esi, %esi
	cmpl	%r12d, %ebx
	setne	%sil
	andq	%rsi, %rdx
	movq	%r8, %rsi
	call	sub_niels_from_pt
	jmp	.L401
.L404:
	negl	%edx
	movq	%r13, %rdi
	sarl	%edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	movq	-176(%rbp), %rdx
	salq	$6, %rsi
	addq	decaf_448_precomputed_wnaf_as_fe@GOTPCREL(%rip), %rsi
	call	sub_niels_from_pt
	jmp	.L405
.L438:
	movl	-168(%rbp), %eax
	movl	-228(%rbp), %ebx
.L396:
	cmpl	%eax, -164(%rbp)
	jne	.L441
	cmpl	%ebx, -160(%rbp)
	jne	.L442
	movq	-224(%rbp), %rsp
.L374:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L443
	leaq	-48(%rbp), %rsp
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
.L436:
	.cfi_restore_state
	movl	4(,%r8,4), %edx
	movq	-200(%rbp), %rax
	leaq	64(%r13), %r14
	sarl	%edx
	movslq	%edx, %rdx
	salq	$8, %rdx
	leaq	(%rax,%rdx), %r15
	leaq	-144(%rbp), %rax
	leaq	64(%r15), %r10
	movq	%rax, %rdi
	movq	%r15, %rdx
	movq	%rax, -160(%rbp)
	movq	%r10, %rsi
	call	gf_add
	movq	%r15, %rdx
	movq	%r10, %rsi
	movq	%r14, %rdi
	call	gf_sub
	movq	-160(%rbp), %rdx
	leaq	192(%r13), %rdi
	addq	$192, %r15
	movq	%r14, %rsi
	call	p448_mul@PLT
	movq	%r14, %rdx
	movq	%r15, %rsi
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-160(%rbp), %rdx
	movq	%r15, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	leaq	128(%r13), %rdi
	movq	%r15, %rsi
	call	p448_sqr@PLT
	movq	-152(%rbp), %rax
	movslq	%r12d, %rcx
	movq	%r13, %rdi
	movl	4(,%rax,4), %edx
	sarl	%edx
	movslq	%edx, %rdx
	leaq	(%rdx,%rdx,2), %rsi
	movq	%rcx, %rdx
	salq	$6, %rsi
	addq	decaf_448_precomputed_wnaf_as_fe@GOTPCREL(%rip), %rsi
	call	add_niels_to_pt
	movl	$1, -164(%rbp)
	movl	$1, -160(%rbp)
	movl	-176(%rbp), %eax
	movq	-184(%rbp), %r11
	movq	-192(%rbp), %r9
	jmp	.L394
.L435:
	movl	4(,%r8,4), %r12d
	leaq	-144(%rbp), %rax
	leaq	64(%r13), %r14
	movq	%rax, %rdi
	movq	%rax, -152(%rbp)
	sarl	%r12d
	movslq	%r12d, %r12
	salq	$8, %r12
	addq	-200(%rbp), %r12
	leaq	64(%r12), %r10
	movq	%r12, %rdx
	movq	%r10, %rsi
	call	gf_add
	movq	%r12, %rdx
	movq	%r10, %rsi
	movq	%r14, %rdi
	call	gf_sub
	movq	-152(%rbp), %rdx
	leaq	192(%r13), %rdi
	addq	$192, %r12
	movq	%r14, %rsi
	call	p448_mul@PLT
	movq	%r12, %rsi
	movq	%r14, %rdx
	movq	%r13, %rdi
	call	p448_mul@PLT
	movq	-152(%rbp), %rdx
	movq	%r12, %rsi
	movq	%r14, %rdi
	call	p448_mul@PLT
	leaq	128(%r13), %rdi
	movq	%r12, %rsi
	movl	%r15d, %r12d
	call	p448_sqr@PLT
	movl	$1, -164(%rbp)
	movl	$0, -160(%rbp)
	movl	-176(%rbp), %eax
	movq	-184(%rbp), %r11
	movq	-192(%rbp), %r9
	jmp	.L394
.L434:
	movq	decaf_448_point_identity@GOTPCREL(%rip), %rsi
	movl	$32, %ecx
	movq	%r13, %rdi
	rep movsq
	movq	-224(%rbp), %rsp
	jmp	.L374
.L414:
	xorl	%edx, %edx
	jmp	.L397
.L439:
	leaq	__PRETTY_FUNCTION__.28083(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC61(%rip), %rdi
	movl	$1645, %edx
	call	__assert_fail@PLT
.L440:
	leaq	__PRETTY_FUNCTION__.28083(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC62(%rip), %rdi
	movl	$1656, %edx
	call	__assert_fail@PLT
.L441:
	leaq	__PRETTY_FUNCTION__.28083(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC63(%rip), %rdi
	movl	$1667, %edx
	call	__assert_fail@PLT
.L442:
	leaq	__PRETTY_FUNCTION__.28083(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC64(%rip), %rdi
	movl	$1668, %edx
	call	__assert_fail@PLT
.L443:
	call	__stack_chk_fail@PLT
.L385:
	leaq	__PRETTY_FUNCTION__.28030(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC60(%rip), %rdi
	movl	$1536, %edx
	call	__assert_fail@PLT
.L390:
	leaq	__PRETTY_FUNCTION__.28030(%rip), %rcx
	leaq	.LC14(%rip), %rsi
	leaq	.LC60(%rip), %rdi
	movl	$1547, %edx
	call	__assert_fail@PLT
	.cfi_endproc
.LFE4710:
	.size	decaf_448_base_double_scalarmul_non_secret, .-decaf_448_base_double_scalarmul_non_secret
	.section	.text.unlikely.decaf_448_base_double_scalarmul_non_secret
.LCOLDE65:
	.section	.text.decaf_448_base_double_scalarmul_non_secret
.LHOTE65:
	.section	.text.unlikely.decaf_448_point_destroy,"ax",@progbits
.LCOLDB66:
	.section	.text.decaf_448_point_destroy,"ax",@progbits
.LHOTB66:
	.p2align 4,,15
	.globl	decaf_448_point_destroy
	.type	decaf_448_point_destroy, @function
decaf_448_point_destroy:
.LFB4711:
	.cfi_startproc
	movl	$256, %esi
	jmp	decaf_bzero@PLT
	.cfi_endproc
.LFE4711:
	.size	decaf_448_point_destroy, .-decaf_448_point_destroy
	.section	.text.unlikely.decaf_448_point_destroy
.LCOLDE66:
	.section	.text.decaf_448_point_destroy
.LHOTE66:
	.section	.text.unlikely.decaf_memeq,"ax",@progbits
.LCOLDB67:
	.section	.text.decaf_memeq,"ax",@progbits
.LHOTB67:
	.p2align 4,,15
	.globl	decaf_memeq
	.type	decaf_memeq, @function
decaf_memeq:
.LFB4712:
	.cfi_startproc
	testq	%rdx, %rdx
	je	.L466
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	movq	%rdi, %rbx
	negq	%rbx
	andl	$31, %ebx
	cmpq	%rdx, %rbx
	cmova	%rdx, %rbx
	cmpq	$35, %rdx
	ja	.L470
	movq	%rdx, %rbx
.L447:
	leaq	(%rsi,%rbx), %r10
	movq	%rsi, %r8
	movq	%rdi, %rax
	movq	%rdx, %r11
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L449:
	movzbl	(%r8), %r9d
	addq	$1, %r8
	subq	$1, %r11
	xorb	(%rax), %r9b
	addq	$1, %rax
	orl	%r9d, %ecx
	cmpq	%r10, %r8
	jne	.L449
	cmpq	%rbx, %rdx
	je	.L450
.L448:
	movq	%rdx, %r9
	subq	$1, %rdx
	subq	%rbx, %r9
	subq	%rbx, %rdx
	leaq	-32(%r9), %r12
	shrq	$5, %r12
	addq	$1, %r12
	movq	%r12, %r8
	salq	$5, %r8
	cmpq	$30, %rdx
	jbe	.L451
	vpxor	%xmm0, %xmm0, %xmm0
	addq	%rbx, %rdi
	addq	%rbx, %rsi
	xorl	%edx, %edx
	xorl	%ebx, %ebx
.L452:
	vmovdqu	(%rsi,%rdx), %xmm1
	addq	$1, %rbx
	vinserti128	$0x1, 16(%rsi,%rdx), %ymm1, %ymm1
	vpxor	(%rdi,%rdx), %ymm1, %ymm1
	addq	$32, %rdx
	cmpq	%rbx, %r12
	vpor	%ymm1, %ymm0, %ymm0
	ja	.L452
	vpxor	%xmm3, %xmm3, %xmm3
	subq	%r8, %r11
	addq	%r8, %rax
	addq	%r8, %r10
	vperm2i128	$33, %ymm3, %ymm0, %ymm2
	vpor	%ymm2, %ymm0, %ymm0
	vperm2i128	$33, %ymm3, %ymm0, %ymm1
	vpalignr	$8, %ymm0, %ymm1, %ymm1
	vpor	%ymm1, %ymm0, %ymm2
	vperm2i128	$33, %ymm3, %ymm2, %ymm0
	vpalignr	$4, %ymm2, %ymm0, %ymm0
	vpor	%ymm0, %ymm2, %ymm1
	vperm2i128	$33, %ymm3, %ymm1, %ymm0
	vpalignr	$2, %ymm1, %ymm0, %ymm0
	vpor	%ymm0, %ymm1, %ymm0
	vperm2i128	$33, %ymm3, %ymm0, %ymm3
	vpalignr	$1, %ymm0, %ymm3, %ymm3
	vpor	%ymm3, %ymm0, %ymm0
	vpextrb	$0, %xmm0, %edx
	orl	%edx, %ecx
	cmpq	%r8, %r9
	je	.L464
	vzeroupper
.L451:
	addq	%rax, %r11
	.p2align 4,,10
	.p2align 3
.L454:
	movzbl	(%rax), %edx
	addq	$1, %rax
	addq	$1, %r10
	xorb	-1(%r10), %dl
	orl	%edx, %ecx
	cmpq	%r11, %rax
	jne	.L454
.L450:
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	popq	%r10
	.cfi_restore 10
	.cfi_def_cfa 10, 0
	movzbl	%cl, %eax
	xorl	%edx, %edx
	addq	$-1, %rax
	adcq	$-1, %rdx
	popq	%r12
	.cfi_restore 12
	shrdq	$8, %rdx, %rax
	popq	%rbp
	.cfi_restore 6
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L470:
	.cfi_restore_state
	testq	%rbx, %rbx
	jne	.L447
	movq	%rsi, %r10
	movq	%rdi, %rax
	movq	%rdx, %r11
	xorl	%ecx, %ecx
	jmp	.L448
	.p2align 4,,10
	.p2align 3
.L464:
	vzeroupper
	jmp	.L450
	.p2align 4,,10
	.p2align 3
.L466:
	.cfi_def_cfa 7, 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	movq	$-1, %rax
	ret
	.cfi_endproc
.LFE4712:
	.size	decaf_memeq, .-decaf_memeq
	.section	.text.unlikely.decaf_memeq
.LCOLDE67:
	.section	.text.decaf_memeq
.LHOTE67:
	.section	.text.unlikely.decaf_448_precomputed_destroy,"ax",@progbits
.LCOLDB68:
	.section	.text.decaf_448_precomputed_destroy,"ax",@progbits
.LHOTB68:
	.p2align 4,,15
	.globl	decaf_448_precomputed_destroy
	.type	decaf_448_precomputed_destroy, @function
decaf_448_precomputed_destroy:
.LFB4713:
	.cfi_startproc
	movl	$15360, %esi
	jmp	decaf_bzero@PLT
	.cfi_endproc
.LFE4713:
	.size	decaf_448_precomputed_destroy, .-decaf_448_precomputed_destroy
	.section	.text.unlikely.decaf_448_precomputed_destroy
.LCOLDE68:
	.section	.text.decaf_448_precomputed_destroy
.LHOTE68:
	.section	.rodata.__PRETTY_FUNCTION__.28030,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.28030, @object
	.size	__PRETTY_FUNCTION__.28030, 12
__PRETTY_FUNCTION__.28030:
	.string	"recode_wnaf"
	.section	.rodata.__PRETTY_FUNCTION__.28083,"a",@progbits
	.align 32
	.type	__PRETTY_FUNCTION__.28083, @object
	.size	__PRETTY_FUNCTION__.28083, 43
__PRETTY_FUNCTION__.28083:
	.string	"decaf_448_base_double_scalarmul_non_secret"
	.section	.rodata.__PRETTY_FUNCTION__.27891,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27891, @object
	.size	__PRETTY_FUNCTION__.27891, 16
__PRETTY_FUNCTION__.27891:
	.string	"gf_batch_invert"
	.section	.rodata.__PRETTY_FUNCTION__.27669,"a",@progbits
	.align 16
	.type	__PRETTY_FUNCTION__.27669, @object
	.size	__PRETTY_FUNCTION__.27669, 29
__PRETTY_FUNCTION__.27669:
	.string	"decaf_448_scalar_decode_long"
	.hidden	sizeof_decaf_448_precomputed_wnafs
	.globl	sizeof_decaf_448_precomputed_wnafs
	.section	.rodata.sizeof_decaf_448_precomputed_wnafs,"a",@progbits
	.align 8
	.type	sizeof_decaf_448_precomputed_wnafs, @object
	.size	sizeof_decaf_448_precomputed_wnafs, 8
sizeof_decaf_448_precomputed_wnafs:
	.quad	6144
	.globl	decaf_448_point_identity
	.section	.rodata.decaf_448_point_identity,"a",@progbits
	.align 32
	.type	decaf_448_point_identity, @object
	.size	decaf_448_point_identity, 256
decaf_448_point_identity:
	.quad	0
	.zero	56
	.quad	1
	.zero	56
	.quad	1
	.zero	56
	.quad	0
	.zero	56
	.globl	alignof_decaf_448_precomputed_s
	.section	.rodata.alignof_decaf_448_precomputed_s,"a",@progbits
	.align 8
	.type	alignof_decaf_448_precomputed_s, @object
	.size	alignof_decaf_448_precomputed_s, 8
alignof_decaf_448_precomputed_s:
	.quad	32
	.globl	sizeof_decaf_448_precomputed_s
	.section	.rodata.sizeof_decaf_448_precomputed_s,"a",@progbits
	.align 8
	.type	sizeof_decaf_448_precomputed_s, @object
	.size	sizeof_decaf_448_precomputed_s, 8
sizeof_decaf_448_precomputed_s:
	.quad	15360
	.globl	decaf_448_precomputed_base
	.section	.data.rel.decaf_448_precomputed_base,"aw",@progbits
	.align 8
	.type	decaf_448_precomputed_base, @object
	.size	decaf_448_precomputed_base, 8
decaf_448_precomputed_base:
	.quad	decaf_448_precomputed_base_as_fe
	.hidden	base_point_ser_for_pregen
	.globl	base_point_ser_for_pregen
	.section	.rodata.base_point_ser_for_pregen,"a",@progbits
	.align 32
	.type	base_point_ser_for_pregen, @object
	.size	base_point_ser_for_pregen, 56
base_point_ser_for_pregen:
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	1
	.zero	27
	.globl	decaf_448_scalar_zero
	.section	.rodata.decaf_448_scalar_zero,"a",@progbits
	.align 32
	.type	decaf_448_scalar_zero, @object
	.size	decaf_448_scalar_zero, 56
decaf_448_scalar_zero:
	.zero	56
	.globl	decaf_448_scalar_one
	.section	.rodata.decaf_448_scalar_one,"a",@progbits
	.align 32
	.type	decaf_448_scalar_one, @object
	.size	decaf_448_scalar_one, 56
decaf_448_scalar_one:
	.quad	1
	.zero	48
	.section	.rodata.sc_p,"a",@progbits
	.align 32
	.type	sc_p, @object
	.size	sc_p, 56
sc_p:
	.quad	2556006723728458995
	.quad	2408513697996967765
	.quad	-4301259484579875184
	.quad	-2201345047
	.quad	-1
	.quad	-1
	.quad	4611686018427387903
	.section	.rodata.TWO,"a",@progbits
	.align 32
	.type	TWO, @object
	.size	TWO, 64
TWO:
	.quad	2
	.zero	56
	.section	.rodata.ONE,"a",@progbits
	.align 32
	.type	ONE, @object
	.size	ONE, 64
ONE:
	.quad	1
	.zero	56
	.section	.rodata.ZERO,"a",@progbits
	.align 32
	.type	ZERO, @object
	.size	ZERO, 64
ZERO:
	.zero	64
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.quad	72057594037927935
	.align 32
.LC2:
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC3:
	.quad	144115188075855868
	.quad	144115188075855870
	.quad	144115188075855870
	.quad	144115188075855870
	.align 32
.LC9:
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.align 32
.LC10:
	.quad	216172782113783802
	.quad	216172782113783805
	.quad	216172782113783805
	.quad	216172782113783805
	.align 32
.LC11:
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.align 32
.LC12:
	.quad	288230376151711736
	.quad	288230376151711740
	.quad	288230376151711740
	.quad	288230376151711740
	.align 32
.LC46:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
