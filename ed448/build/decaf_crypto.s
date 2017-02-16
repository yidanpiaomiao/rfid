	.file	"decaf_crypto.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"decaf_448_derive_private_key"
	.section	.text.unlikely.decaf_448_derive_private_key,"ax",@progbits
.LCOLDB1:
	.section	.text.decaf_448_derive_private_key,"ax",@progbits
.LHOTB1:
	.p2align 4,,15
	.globl	decaf_448_derive_private_key
	.type	decaf_448_derive_private_key, @function
decaf_448_derive_private_key:
.LFB52:
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
	leaq	-544(%rbp), %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	movq	%rsi, %r13
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdi, %rbx
	movq	%r12, %rdi
	leaq	-608(%rbp), %r14
	subq	$576, %rsp
	movq	SHAKE256_params_s@GOTPCREL(%rip), %r15
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%r15, %rsi
	call	sponge_init@PLT
	movq	%r13, %rsi
	movq	%r12, %rdi
	movl	$32, %edx
	call	sha3_update@PLT
	leaq	.LC0(%rip), %rsi
	movq	%r12, %rdi
	movl	$28, %edx
	call	sha3_update@PLT
	movl	$64, %edx
	movq	%r12, %rdi
	movq	%r14, %rsi
	call	sha3_output@PLT
	movq	%r15, %rsi
	movq	%r12, %rdi
	call	sponge_init@PLT
	movq	%r12, %rdi
	leaq	-336(%rbp), %r12
	call	sponge_destroy@PLT
	movq	0(%r13), %rax
	movl	$64, %edx
	movq	%r14, %rsi
	movq	%rax, (%rbx)
	movq	8(%r13), %rax
	movq	%rax, 8(%rbx)
	movq	16(%r13), %rax
	movq	%rax, 16(%rbx)
	movq	24(%r13), %rax
	leaq	32(%rbx), %r13
	movq	%r13, %rdi
	movq	%rax, 24(%rbx)
	call	decaf_448_scalar_decode_long@PLT
	movq	decaf_448_precomputed_base@GOTPCREL(%rip), %rax
	movq	%r13, %rdx
	movq	%r12, %rdi
	movq	(%rax), %rsi
	call	decaf_448_precomputed_scalarmul@PLT
	leaq	88(%rbx), %rdi
	movq	%r12, %rsi
	call	decaf_448_point_encode@PLT
	movl	$64, %esi
	movq	%r14, %rdi
	call	decaf_bzero@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L6
	addq	$576, %rsp
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
.L6:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE52:
	.size	decaf_448_derive_private_key, .-decaf_448_derive_private_key
	.section	.text.unlikely.decaf_448_derive_private_key
.LCOLDE1:
	.section	.text.decaf_448_derive_private_key
.LHOTE1:
	.section	.text.unlikely.decaf_448_destroy_private_key,"ax",@progbits
.LCOLDB2:
	.section	.text.decaf_448_destroy_private_key,"ax",@progbits
.LHOTB2:
	.p2align 4,,15
	.globl	decaf_448_destroy_private_key
	.type	decaf_448_destroy_private_key, @function
decaf_448_destroy_private_key:
.LFB53:
	.cfi_startproc
	movl	$144, %esi
	jmp	decaf_bzero@PLT
	.cfi_endproc
.LFE53:
	.size	decaf_448_destroy_private_key, .-decaf_448_destroy_private_key
	.section	.text.unlikely.decaf_448_destroy_private_key
.LCOLDE2:
	.section	.text.decaf_448_destroy_private_key
.LHOTE2:
	.section	.text.unlikely.decaf_448_private_to_public,"ax",@progbits
.LCOLDB3:
	.section	.text.decaf_448_private_to_public,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	decaf_448_private_to_public
	.type	decaf_448_private_to_public, @function
decaf_448_private_to_public:
.LFB54:
	.cfi_startproc
	movq	88(%rsi), %rdx
	movq	%rdx, (%rdi)
	movq	96(%rsi), %rdx
	movq	%rdx, 8(%rdi)
	movq	104(%rsi), %rdx
	movq	%rdx, 16(%rdi)
	movq	112(%rsi), %rdx
	movq	%rdx, 24(%rdi)
	movq	120(%rsi), %rdx
	movq	%rdx, 32(%rdi)
	movq	128(%rsi), %rdx
	movq	%rdx, 40(%rdi)
	movq	136(%rsi), %rax
	movq	%rax, 48(%rdi)
	ret
	.cfi_endproc
.LFE54:
	.size	decaf_448_private_to_public, .-decaf_448_private_to_public
	.section	.text.unlikely.decaf_448_private_to_public
.LCOLDE3:
	.section	.text.decaf_448_private_to_public
.LHOTE3:
	.section	.rodata.str1.1
.LC4:
	.string	"decaf_448_ss_invalid"
	.section	.text.unlikely.decaf_448_shared_secret,"ax",@progbits
.LCOLDB5:
	.section	.text.decaf_448_shared_secret,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	decaf_448_shared_secret
	.type	decaf_448_shared_secret, @function
decaf_448_shared_secret:
.LFB55:
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
	movq	%rdx, %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rcx, %rbx
	xorl	%ecx, %ecx
	subq	$384, %rsp
	movq	%rdi, -328(%rbp)
	movq	%rsi, -336(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rbx,%rax), %esi
	movzbl	88(%r15,%rax), %edx
	addq	$1, %rax
	subl	%esi, %edx
	leal	-1(%rdx), %esi
	andl	%esi, %ecx
	orl	%edx, %ecx
	cmpq	$56, %rax
	jne	.L10
	leaq	-320(%rbp), %r13
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	shrw	$8, %cx
	movl	%ecx, %r14d
	movq	%r13, %rdi
	movl	%r14d, %r12d
	call	sponge_init@PLT
	vmovdqu	(%rbx), %xmm2
	movl	%r14d, %ecx
	notl	%ecx
	xorl	%eax, %eax
	vinserti128	$0x1, 16(%rbx), %ymm2, %ymm2
	movb	%cl, -344(%rbp)
	vpbroadcastb	-344(%rbp), %ymm4
	movb	%r14b, -344(%rbp)
	leaq	-112(%rbp), %r14
	vpbroadcastb	-344(%rbp), %ymm0
	leaq	32(%r14), %rdi
	vpand	%ymm4, %ymm2, %ymm3
	vmovdqu	88(%r15), %xmm2
	vinserti128	$0x1, 104(%r15), %ymm2, %ymm2
	vpand	%ymm0, %ymm2, %ymm2
	vpor	%ymm2, %ymm3, %ymm2
	vmovdqa	%ymm2, -112(%rbp)
	.p2align 4,,10
	.p2align 3
.L11:
	movl	%ecx, %esi
	movl	%r12d, %edx
	andb	32(%rbx,%rax), %sil
	andb	120(%r15,%rax), %dl
	orl	%esi, %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	$24, %rax
	jne	.L11
	movl	$56, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	vmovdqa	%ymm4, -432(%rbp)
	movb	%cl, -344(%rbp)
	vmovdqa	%ymm0, -400(%rbp)
	vzeroupper
	call	sha3_update@PLT
	vmovdqa	-400(%rbp), %ymm0
	leaq	32(%r14), %rdi
	xorl	%eax, %eax
	vmovdqu	(%rbx), %xmm1
	movzbl	-344(%rbp), %ecx
	vinserti128	$0x1, 16(%rbx), %ymm1, %ymm1
	vmovdqa	-432(%rbp), %ymm4
	vpand	%ymm0, %ymm1, %ymm1
	vmovdqu	88(%r15), %xmm0
	vinserti128	$0x1, 104(%r15), %ymm0, %ymm0
	vpand	%ymm4, %ymm0, %ymm0
	vpor	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, -112(%rbp)
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%r12d, %esi
	movl	%ecx, %edx
	andb	32(%rbx,%rax), %sil
	andb	120(%r15,%rax), %dl
	orl	%esi, %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	$24, %rax
	jne	.L12
	movl	$56, %edx
	movq	%r14, %rsi
	movq	%r13, %rdi
	vzeroupper
	call	sha3_update@PLT
	leaq	32(%r15), %rdx
	movq	$-1, %r8
	movq	%r14, %rdi
	xorl	%ecx, %ecx
	movq	%rbx, %rsi
	call	decaf_448_direct_scalarmul@PLT
	movl	%eax, %r8d
	movl	%eax, %edi
	xorl	%edx, %edx
	notl	%r8d
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%r8d, %esi
	andb	(%r15,%rdx), %sil
	orl	%esi, %ecx
	movb	%cl, (%r14,%rdx)
.L14:
	addq	$1, %rdx
	cmpq	$56, %rdx
	je	.L23
.L15:
	movl	%edi, %ecx
	andb	(%r14,%rdx), %cl
	cmpq	$31, %rdx
	movb	%cl, (%r14,%rdx)
	jbe	.L24
	leaq	-32(%rdx), %rsi
	cmpq	$19, %rsi
	ja	.L14
	leaq	-32+.LC4(%rip), %rsi
	movl	%r8d, %ebx
	andb	(%rsi,%rdx), %bl
	movl	%ebx, %esi
	orl	%esi, %ecx
	movb	%cl, (%r14,%rdx)
	addq	$1, %rdx
	cmpq	$56, %rdx
	jne	.L15
.L23:
	movq	%r14, %rsi
	movq	%r13, %rdi
	movq	%rax, -344(%rbp)
	call	sha3_update@PLT
	movq	-336(%rbp), %rdx
	movq	-328(%rbp), %rsi
	movq	%r13, %rdi
	call	sha3_output@PLT
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%r13, %rdi
	call	sponge_init@PLT
	movq	%r13, %rdi
	call	sponge_destroy@PLT
	movq	%r14, %rdi
	movl	$56, %esi
	call	decaf_bzero@PLT
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	movq	-344(%rbp), %rax
	jne	.L25
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
.L25:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	decaf_448_shared_secret, .-decaf_448_shared_secret
	.section	.text.unlikely.decaf_448_shared_secret
.LCOLDE5:
	.section	.text.decaf_448_shared_secret
.LHOTE5:
	.section	.rodata.str1.1
.LC6:
	.string	"decaf_448_sign_shake"
	.section	.text.unlikely.decaf_448_sign_shake,"ax",@progbits
.LCOLDB7:
	.section	.text.decaf_448_sign_shake,"ax",@progbits
.LHOTB7:
	.p2align 4,,15
	.globl	decaf_448_sign_shake
	.type	decaf_448_sign_shake, @function
decaf_448_sign_shake:
.LFB56:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$26, %ecx
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
	movq	%rsi, %r14
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-576(%rbp), %rbx
	movq	%rdx, %rsi
	leaq	-640(%rbp), %r13
	leaq	-768(%rbp), %r12
	subq	$768, %rsp
	movq	%rdi, -792(%rbp)
	movq	%rbx, %rdi
	rep movsq
	movq	%rdx, -784(%rbp)
	movq	%rbx, %rdi
	movl	$32, %edx
	movq	%r14, %rsi
	leaq	-112(%rbp), %r15
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	sha3_update@PLT
	leaq	.LC6(%rip), %rsi
	movq	%rbx, %rdi
	movl	$20, %edx
	call	sha3_update@PLT
	movl	$64, %edx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	call	sha3_output@PLT
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%rbx, %rdi
	call	sponge_init@PLT
	movl	$64, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	decaf_448_scalar_decode_long@PLT
	movq	decaf_448_precomputed_base@GOTPCREL(%rip), %rsi
	leaq	-368(%rbp), %rcx
	movq	%r12, %rdx
	movq	%rcx, %rdi
	movq	%rcx, -776(%rbp)
	movq	(%rsi), %rsi
	call	decaf_448_precomputed_scalarmul@PLT
	movq	-776(%rbp), %rcx
	movq	%r15, %rdi
	movq	%rcx, %rsi
	call	decaf_448_point_encode@PLT
	movq	-784(%rbp), %r8
	movq	%rbx, %rdi
	movl	$26, %ecx
	movl	$56, %edx
	movq	%r8, %rsi
	rep movsq
	leaq	88(%r14), %rsi
	movq	%rbx, %rdi
	call	sha3_update@PLT
	movq	%rbx, %rdi
	movl	$56, %edx
	movq	%r15, %rsi
	call	sha3_update@PLT
	movl	$64, %edx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	call	sha3_output@PLT
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%rbx, %rdi
	call	sponge_init@PLT
	movq	%rbx, %rdi
	leaq	-704(%rbp), %rbx
	call	sponge_destroy@PLT
	movl	$64, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_decode_long@PLT
	leaq	32(%r14), %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_mul@PLT
	movq	%rbx, %rdx
	movq	%r12, %rsi
	movq	%r12, %rdi
	call	decaf_448_scalar_sub@PLT
	movq	-792(%rbp), %rax
	movq	-112(%rbp), %rdx
	movq	%r12, %rsi
	movq	%rdx, (%rax)
	movq	-104(%rbp), %rdx
	leaq	56(%rax), %rdi
	movq	%rdx, 8(%rax)
	movq	-96(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-88(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-80(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-72(%rbp), %rdx
	movq	%rdx, 40(%rax)
	movq	-64(%rbp), %rdx
	movq	%rdx, 48(%rax)
	call	decaf_448_scalar_encode@PLT
	movq	%r12, %rdi
	call	decaf_448_scalar_destroy@PLT
	movq	%rbx, %rdi
	call	decaf_448_scalar_destroy@PLT
	movl	$64, %esi
	movq	%r13, %rdi
	call	decaf_bzero@PLT
	movl	$56, %esi
	movq	%r15, %rdi
	call	decaf_bzero@PLT
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L30
	addq	$768, %rsp
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
.L30:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE56:
	.size	decaf_448_sign_shake, .-decaf_448_sign_shake
	.section	.text.unlikely.decaf_448_sign_shake
.LCOLDE7:
	.section	.text.decaf_448_sign_shake
.LHOTE7:
	.section	.text.unlikely.decaf_448_verify_shake,"ax",@progbits
.LCOLDB8:
	.section	.text.decaf_448_verify_shake,"ax",@progbits
.LHOTB8:
	.p2align 4,,15
	.globl	decaf_448_verify_shake
	.type	decaf_448_verify_shake, @function
decaf_448_verify_shake:
.LFB57:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	movl	$26, %ecx
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
	movq	%rsi, %r15
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-800(%rbp), %rbx
	movq	%rdi, %r12
	movq	%rdx, %rsi
	leaq	-864(%rbp), %r13
	subq	$960, %rsp
	movq	%rbx, %rdi
	movl	$56, %edx
	rep movsq
	movq	%r15, %rsi
	movq	%rbx, %rdi
	leaq	-592(%rbp), %r14
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	sha3_update@PLT
	movq	%r12, %rsi
	movq	%rbx, %rdi
	movl	$56, %edx
	call	sha3_update@PLT
	movl	$64, %edx
	movq	%r13, %rsi
	movq	%rbx, %rdi
	call	sha3_output@PLT
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%rbx, %rdi
	call	sponge_init@PLT
	movq	%rbx, %rdi
	leaq	-336(%rbp), %rbx
	call	sponge_destroy@PLT
	leaq	-992(%rbp), %rcx
	movq	%r13, %rsi
	movl	$64, %edx
	movq	%rcx, %rdi
	movq	%rcx, -1000(%rbp)
	call	decaf_448_scalar_decode_long@PLT
	movq	%r12, %rsi
	movq	$-1, %rdx
	movq	%r14, %rdi
	call	decaf_448_point_decode@PLT
	xorl	%edx, %edx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	leaq	-928(%rbp), %r15
	movq	%rax, %r13
	call	decaf_448_point_decode@PLT
	leaq	56(%r12), %rsi
	movq	%r15, %rdi
	andq	%rax, %r13
	movq	%r13, %r12
	call	decaf_448_scalar_decode@PLT
	movq	-1000(%rbp), %rcx
	movq	%rbx, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	andq	%rax, %r12
	call	decaf_448_base_double_scalarmul_non_secret@PLT
	movq	%r14, %rsi
	movq	%rbx, %rdi
	call	decaf_448_point_eq@PLT
	andq	%r12, %rax
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L35
	addq	$960, %rsp
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
.L35:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE57:
	.size	decaf_448_verify_shake, .-decaf_448_verify_shake
	.section	.text.unlikely.decaf_448_verify_shake
.LCOLDE8:
	.section	.text.decaf_448_verify_shake
.LHOTE8:
	.section	.text.unlikely.decaf_448_sign,"ax",@progbits
.LCOLDB9:
	.section	.text.decaf_448_sign,"ax",@progbits
.LHOTB9:
	.p2align 4,,15
	.globl	decaf_448_sign
	.type	decaf_448_sign, @function
decaf_448_sign:
.LFB58:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rcx, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdx, %r13
	movq	%rdi, %rbp
	subq	$224, %rsp
	.cfi_def_cfa_offset 272
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	call	sponge_init@PLT
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rsp, %rdi
	call	sha3_update@PLT
	movq	%rsp, %rdx
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	decaf_448_sign_shake@PLT
	movq	%rsp, %rdi
	call	sponge_destroy@PLT
	movq	216(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L40
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
.L40:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE58:
	.size	decaf_448_sign, .-decaf_448_sign
	.section	.text.unlikely.decaf_448_sign
.LCOLDE9:
	.section	.text.decaf_448_sign
.LHOTE9:
	.section	.text.unlikely.decaf_448_verify,"ax",@progbits
.LCOLDB10:
	.section	.text.decaf_448_verify,"ax",@progbits
.LHOTB10:
	.p2align 4,,15
	.globl	decaf_448_verify
	.type	decaf_448_verify, @function
decaf_448_verify:
.LFB59:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rcx, %r14
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbp
	movq	%rdx, %r13
	subq	$224, %rsp
	.cfi_def_cfa_offset 272
	movq	SHAKE256_params_s@GOTPCREL(%rip), %rsi
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 216(%rsp)
	xorl	%eax, %eax
	call	sponge_init@PLT
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rsp, %rdi
	call	sha3_update@PLT
	movq	%rbp, %rdi
	movq	%rsp, %rdx
	movq	%r12, %rsi
	call	decaf_448_verify_shake@PLT
	movq	%rsp, %rdi
	movq	%rax, %rbp
	call	sponge_destroy@PLT
	movq	216(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L45
	addq	$224, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbp, %rax
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
.L45:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE59:
	.size	decaf_448_verify, .-decaf_448_verify
	.section	.text.unlikely.decaf_448_verify
.LCOLDE10:
	.section	.text.decaf_448_verify
.LHOTE10:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
