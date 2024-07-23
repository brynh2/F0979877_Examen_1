	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"pregunta2.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d - Deficiente\012\000"
	.align	2
.LC1:
	.ascii	"%d - Abudante\012\000"
	.align	2
.LC2:
	.ascii	"%d - Perfecto\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	mov	r0, #0
	bl	time
	mov	r2, r0
	mov	r3, r1
	mov	r3, r2
	mov	r0, r3
	bl	srand
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	bl	rand
	mov	r1, r0
	ldr	r3, .L10
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-72]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #14
	ble	.L3
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L8:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	mov	r0, r3
	bl	analizar_numero
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	mov	r1, r3
	ldr	r0, .L10+4
	bl	printf
	b	.L6
.L5:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	ble	.L7
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	mov	r1, r3
	ldr	r0, .L10+8
	bl	printf
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-72]
	mov	r1, r3
	ldr	r0, .L10+12
	bl	printf
.L6:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	cmp	r3, #14
	ble	.L8
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	680390859
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.global	__aeabi_idivmod
	.align	2
	.global	analizar_numero
	.syntax unified
	.arm
	.type	analizar_numero, %function
analizar_numero:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L13
.L15:
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	__aeabi_idivmod
	mov	r3, r1
	cmp	r3, #0
	bne	.L14
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L14:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L13:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L15
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	analizar_numero, .-analizar_numero
	.ident	"GCC: (GNU Arm Embedded Toolchain 10.3-2021.10) 10.3.1 20210824 (release)"
