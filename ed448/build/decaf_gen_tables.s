	.file	"decaf_gen_tables.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"const API_NS(scalar_t) %s = {{{\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	", "
.LC2:
	.string	"0x%0*llxull"
.LC3:
	.string	"}}};\n\n"
	.section	.text.unlikely.scalar_print,"ax",@progbits
.LCOLDB4:
	.section	.text.scalar_print,"ax",@progbits
.LHOTB4:
	.p2align 4,,15
	.type	scalar_print, @function
scalar_print:
.LFB4652:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC0(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rdx
	xorl	%eax, %eax
	movl	$1, %edi
	movl	$1, %ebp
	call	__printf_chk@PLT
	xorl	%ebx, %ebx
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	addq	$1, %rbx
	addl	$1, %ebp
.L2:
	testq	%rbx, %rbx
	je	.L3
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	(%r12,%rbx,8), %rcx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movl	$16, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	$7, %ebp
	jne	.L4
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
.L3:
	.cfi_restore_state
	movq	(%r12), %rcx
	leaq	.LC2(%rip), %rsi
	movl	$16, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L4
	.cfi_endproc
.LFE4652:
	.size	scalar_print, .-scalar_print
	.section	.text.unlikely.scalar_print
.LCOLDE4:
	.section	.text.scalar_print
.LHOTE4:
	.section	.rodata.str1.1
.LC5:
	.string	"FIELD_LITERAL("
.LC6:
	.string	","
.LC7:
	.string	"0x%016llx"
.LC8:
	.string	")"
.LC9:
	.string	"src/decaf_gen_tables.c"
.LC10:
	.string	"b<8"
	.section	.text.unlikely.field_print,"ax",@progbits
.LCOLDB11:
	.section	.text.field_print,"ax",@progbits
.LHOTB11:
	.p2align 4,,15
	.type	field_print, @function
field_print:
.LFB4653:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$8, %r13d
	movabsq	$72057594037927935, %r12
	subq	$88, %rsp
	.cfi_def_cfa_offset 128
	leaq	16(%rsp), %rbp
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rdi
	leaq	1(%rbp), %rbx
	addq	$56, %rbp
	call	p448_serialize@PLT
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movzbl	16(%rsp), %edx
	xorl	%ecx, %ecx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L22:
	andq	%r12, %rdx
	subl	$48, %r13d
	testl	%ecx, %ecx
	jne	.L20
.L10:
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movzbl	(%rbx), %eax
	movl	$8, %edx
	movl	$1, %ecx
	subl	%r13d, %edx
	shrx	%rdx, %rax, %rdx
.L9:
	addq	$1, %rbx
.L8:
	cmpq	%rbx, %rbp
	je	.L21
	movzbl	(%rbx), %eax
	shlx	%r13, %rax, %rax
	orq	%rax, %rdx
	leal	8(%r13), %eax
	cmpl	$55, %eax
	jg	.L22
	movl	%eax, %r13d
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L20:
	leaq	.LC6(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%rdx, 8(%rsp)
	call	__printf_chk@PLT
	movq	8(%rsp), %rdx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L21:
	leaq	.LC8(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	$7, %r13d
	jg	.L23
	movq	72(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L24
	addq	$88, %rsp
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
.L23:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.27785(%rip), %rcx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	movl	$71, %edx
	call	__assert_fail@PLT
.L24:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4653:
	.size	field_print, .-field_print
	.section	.text.unlikely.field_print
.LCOLDE11:
	.section	.text.field_print
.LHOTE11:
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"/** @warning: this file was automatically generated. */\n"
	.section	.rodata.str1.1
.LC13:
	.string	"#include \"field.h\"\n\n"
.LC14:
	.string	"#include \"decaf.h\"\n\n"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"#define API_NS(_id) decaf_448_##_id\n"
	.align 8
.LC16:
	.string	"#define API_NS2(_pref,_id) _pref##_decaf_448_##_id\n"
	.align 8
.LC17:
	.string	"const API_NS(point_t) API_NS(point_base) = {{\n"
	.section	.rodata.str1.1
.LC18:
	.string	",\n  "
.LC19:
	.string	"{"
.LC20:
	.string	"}"
.LC21:
	.string	"\n}};\n"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"const field_t API_NS(precomputed_base_as_fe)[%d]\n"
	.align 8
.LC23:
	.string	"__attribute__((aligned(%d),visibility(\"hidden\"))) = {\n  "
	.section	.rodata.str1.1
.LC24:
	.string	"\n};\n"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"const field_t API_NS(precomputed_wnaf_as_fe)[%d]\n"
	.align 8
.LC26:
	.string	"API_NS(precomputed_scalarmul_adjustment)"
	.align 8
.LC27:
	.string	"API_NS(point_scalarmul_adjustment)"
	.section	.rodata.str1.1
.LC28:
	.string	"sc_r2"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"const decaf_word_t MONTGOMERY_FACTOR = (decaf_word_t)0x%016llxull;\n\n"
	.section	.text.unlikely.main,"ax",@progbits
.LCOLDB30:
	.section	.text.startup.main,"ax",@progbits
.LHOTB30:
	.p2align 4,,15
	.globl	main
	.hidden	main
	.type	main, @function
main:
.LFB4654:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	leaq	base_point_ser_for_pregen(%rip), %rsi
	xorl	%edx, %edx
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
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	leaq	-336(%rbp), %rbx
	subq	$384, %rsp
	movq	%rbx, %rdi
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	decaf_448_point_decode@PLT
	testl	%eax, %eax
	jne	.L26
.L28:
	movl	$1, %eax
.L27:
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L71
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
.L26:
	.cfi_restore_state
	movq	sizeof_decaf_448_precomputed_s@GOTPCREL(%rip), %rax
	leaq	-416(%rbp), %rdi
	movq	(%rax), %r12
	movq	alignof_decaf_448_precomputed_s@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	%r12, %rdx
	movq	%r14, %rsi
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L28
	movq	-416(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L28
	movq	%rbx, %rsi
	call	decaf_448_precompute@PLT
	movq	sizeof_decaf_448_precomputed_wnafs@GOTPCREL(%rip), %rax
	leaq	-408(%rbp), %rdi
	movq	%r14, %rsi
	movq	(%rax), %r13
	movq	%r13, %rdx
	call	posix_memalign@PLT
	testl	%eax, %eax
	jne	.L28
	movq	-408(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L28
	movq	%rbx, %rsi
	movl	$64, %r15d
	addq	$64, %rbx
	call	decaf_448_precompute_wnafs@PLT
	leaq	.LC12(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC13(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC14(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC15(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC16(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC17(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L29:
	leaq	-64(%rbx), %rax
	cmpl	$64, %r15d
	movq	%rax, -424(%rbp)
	je	.L30
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	-64(%rbx), %rdi
	call	field_print
	leaq	.LC20(%rip), %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	cmpl	$256, %r15d
	je	.L72
.L31:
	addq	$64, %rbx
	addl	$64, %r15d
	jmp	.L29
.L72:
	leaq	.LC21(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-416(%rbp), %rcx
	leaq	.LC22(%rip), %rsi
	movq	%r12, %rdx
	shrq	$6, %rdx
	movl	$1, %edi
	xorl	%eax, %eax
	movq	%rcx, -424(%rbp)
	call	__printf_chk@PLT
	leaq	.LC23(%rip), %rsi
	xorl	%eax, %eax
	movl	%r14d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	testq	%r12, %r12
	je	.L32
	xorl	%ebx, %ebx
	movq	-424(%rbp), %rcx
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L36:
	movq	%r15, %rcx
.L33:
	movq	%rcx, %rdi
	leaq	64(%rcx), %r15
	call	field_print
	leal	64(%rbx), %eax
	cmpq	%rax, %r12
	movq	%rax, %rbx
	jbe	.L32
	testl	%ebx, %ebx
	je	.L36
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L36
.L32:
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC25(%rip), %rsi
	movq	%r13, %rdx
	movl	$1, %edi
	shrq	$6, %rdx
	xorl	%eax, %eax
	movq	-408(%rbp), %r12
	call	__printf_chk@PLT
	leaq	.LC23(%rip), %rsi
	xorl	%eax, %eax
	movl	%r14d, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	testq	%r13, %r13
	je	.L34
	xorl	%ebx, %ebx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%r14, %r12
.L35:
	movq	%r12, %rdi
	leaq	64(%r12), %r14
	call	field_print
	leal	64(%rbx), %eax
	cmpq	%rax, %r13
	movq	%rax, %rbx
	jbe	.L34
	testl	%ebx, %ebx
	je	.L39
	leaq	.LC18(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L39
.L34:
	leaq	.LC24(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	leaq	-400(%rbp), %rbx
	movl	$450, %r12d
	call	__printf_chk@PLT
	movq	decaf_448_scalar_one@GOTPCREL(%rip), %r13
	movl	$14, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	rep movsl
	.p2align 4,,10
	.p2align 3
.L38:
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_add@PLT
	subl	$1, %r12d
	jne	.L38
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_sub@PLT
	leaq	.LC26(%rip), %rdi
	movq	%rbx, %rsi
	movl	$450, %r12d
	call	scalar_print
	movl	$14, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	rep movsl
	.p2align 4,,10
	.p2align 3
.L41:
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_add@PLT
	subl	$1, %r12d
	jne	.L41
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_sub@PLT
	leaq	.LC27(%rip), %rdi
	movq	%rbx, %rsi
	movl	$896, %r12d
	call	scalar_print
	movl	$14, %ecx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	rep movsl
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rbx, %rdx
	movq	%rbx, %rsi
	movq	%rbx, %rdi
	call	decaf_448_scalar_add@PLT
	subl	$1, %r12d
	jne	.L42
	leaq	.LC28(%rip), %rdi
	movq	%rbx, %rsi
	call	scalar_print
	movq	decaf_448_scalar_zero@GOTPCREL(%rip), %rsi
	movq	%r13, %rdx
	movq	%rbx, %rdi
	call	decaf_448_scalar_sub@PLT
	movq	-400(%rbp), %rax
	movl	$6, %ecx
	movl	$1, %edx
	leaq	1(%rax), %rsi
.L43:
	movq	%rsi, %rax
	imulq	%rdx, %rax
	addq	$2, %rax
	imulq	%rax, %rdx
	subl	$1, %ecx
	jne	.L43
	leaq	.LC29(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	jmp	.L27
.L30:
	leaq	.LC19(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	-424(%rbp), %rdi
	call	field_print
	leaq	.LC20(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L31
.L71:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE4654:
	.size	main, .-main
	.section	.text.unlikely.main
.LCOLDE30:
	.section	.text.startup.main
.LHOTE30:
	.section	.rodata.__PRETTY_FUNCTION__.27785,"a",@progbits
	.align 8
	.type	__PRETTY_FUNCTION__.27785, @object
	.size	__PRETTY_FUNCTION__.27785, 12
__PRETTY_FUNCTION__.27785:
	.string	"field_print"
	.hidden	decaf_448_precomputed_wnaf_as_fe
	.comm	decaf_448_precomputed_wnaf_as_fe,8,8
	.comm	decaf_448_point_base,256,32
	.hidden	base_point_ser_for_pregen
	.comm	base_point_ser_for_pregen,56,32
	.hidden	MONTGOMERY_FACTOR
	.globl	MONTGOMERY_FACTOR
	.section	.rodata.MONTGOMERY_FACTOR,"a",@progbits
	.align 8
	.type	MONTGOMERY_FACTOR, @object
	.size	MONTGOMERY_FACTOR, 8
MONTGOMERY_FACTOR:
	.zero	8
	.hidden	sc_r2
	.globl	sc_r2
	.section	.rodata.sc_r2,"a",@progbits
	.align 32
	.type	sc_r2, @object
	.size	sc_r2, 56
sc_r2:
	.zero	56
	.hidden	decaf_448_point_scalarmul_adjustment
	.comm	decaf_448_point_scalarmul_adjustment,56,32
	.hidden	decaf_448_precomputed_scalarmul_adjustment
	.comm	decaf_448_precomputed_scalarmul_adjustment,56,32
	.hidden	decaf_448_precomputed_base_as_fe
	.comm	decaf_448_precomputed_base_as_fe,64,32
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
