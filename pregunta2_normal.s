	.file	"pregunta2.c"
	.text
	.def	time;	.scl	3;	.type	32;	.endef
	.seh_proc	time
time:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	movq	__imp__time64(%rip), %rax
	call	*%rax
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "%d - Deficiente\12\0"
.LC1:
	.ascii "%d - Abudante\12\0"
.LC2:
	.ascii "%d - Perfecto\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	call	__main
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, -4(%rbp)
	jmp	.L4
.L5:
	call	rand
	movslq	%eax, %rdx
	imulq	$680390859, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$4, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$101, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	cltq
	movl	%edx, -80(%rbp,%rax,4)
	addl	$1, -4(%rbp)
.L4:
	cmpl	$14, -4(%rbp)
	jle	.L5
	movl	$0, -8(%rbp)
	jmp	.L6
.L10:
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %ecx
	call	analizar_numero
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	cmpl	%eax, -12(%rbp)
	jge	.L7
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L8
.L7:
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	cmpl	%eax, -12(%rbp)
	jle	.L9
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L8
.L9:
	movl	-8(%rbp), %eax
	cltq
	movl	-80(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L8:
	addl	$1, -8(%rbp)
.L6:
	cmpl	$14, -8(%rbp)
	jle	.L10
	movl	$0, %eax
	addq	$112, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	analizar_numero
	.def	analizar_numero;	.scl	2;	.type	32;	.endef
	.seh_proc	analizar_numero
analizar_numero:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	$0, -4(%rbp)
	movl	$1, -8(%rbp)
	jmp	.L13
.L15:
	movl	16(%rbp), %eax
	cltd
	idivl	-8(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L14
	movl	-8(%rbp), %eax
	addl	%eax, -4(%rbp)
.L14:
	addl	$1, -8(%rbp)
.L13:
	movl	-8(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L15
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
