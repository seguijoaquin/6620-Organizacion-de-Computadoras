	.file	1 "pila.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Fallo el malloc.\n\000"
	.text
	.align	2
	.globl	CrearPila
	.ent	CrearPila
CrearPila:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	li	$4,12			# 0xc
	la	$25,malloc
	jal	$31,$25
	sw	$2,24($fp)
	lw	$2,24($fp)
	bne	$2,$0,$L18
	la	$4,__sF+176
	la	$5,$LC0
	la	$25,fprintf
	jal	$31,$25
	sw	$0,32($fp)
	b	$L17
$L18:
	li	$4,30			# 0x1e
	la	$25,malloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L19
	la	$4,__sF+176
	la	$5,$LC0
	la	$25,fprintf
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,free
	jal	$31,$25
	sw	$0,32($fp)
	b	$L17
$L19:
	lw	$3,24($fp)
	lw	$2,28($fp)
	sw	$2,0($3)
	lw	$3,24($fp)
	li	$2,30			# 0x1e
	sw	$2,4($3)
	lw	$2,24($fp)
	sw	$0,8($2)
	lw	$2,24($fp)
	sw	$2,32($fp)
$L17:
	lw	$2,32($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	CrearPila
	.size	CrearPila, .-CrearPila
	.align	2
	.globl	DestruirPila
	.ent	DestruirPila
DestruirPila:
	.frame	$fp,40,$31		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$31,32($sp)
	sw	$fp,28($sp)
	sw	$28,24($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	lw	$4,0($2)
	la	$25,free
	jal	$31,$25
	lw	$4,40($fp)
	la	$25,free
	jal	$31,$25
	move	$sp,$fp
	lw	$31,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$31
	.end	DestruirPila
	.size	DestruirPila, .-DestruirPila
	.rdata
	.align	2
$LC1:
	.ascii	"Fallo el realloc.\n\000"
	.text
	.align	2
	.globl	RedimensionarPila
	.ent	RedimensionarPila
RedimensionarPila:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	lw	$2,56($fp)
	lw	$2,8($2)
	sll	$2,$2,1
	sw	$2,24($fp)
	lw	$3,56($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$4,0($3)
	move	$5,$2
	la	$25,realloc
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	bne	$2,$0,$L22
	la	$4,__sF+176
	la	$5,$LC1
	la	$25,fprintf
	jal	$31,$25
	sw	$0,32($fp)
	b	$L21
$L22:
	lw	$3,56($fp)
	lw	$2,28($fp)
	sw	$2,0($3)
	lw	$3,56($fp)
	lw	$2,24($fp)
	sw	$2,4($3)
	li	$2,1			# 0x1
	sw	$2,32($fp)
$L21:
	lw	$2,32($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	RedimensionarPila
	.size	RedimensionarPila, .-RedimensionarPila
	.rdata
	.align	3
$LC2:
	.word	0
	.word	1106247680
	.align	3
$LC3:
	.word	-858993459
	.word	1072483532
	.text
	.align	2
	.globl	Apilar
	.ent	Apilar
Apilar:
	.frame	$fp,56,$31		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$31,48($sp)
	sw	$fp,44($sp)
	sw	$28,40($sp)
	move	$fp,$sp
	sw	$4,56($fp)
	move	$2,$5
	sb	$2,24($fp)
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,0($2)
	lw	$2,8($3)
	addu	$3,$4,$2
	lbu	$2,24($fp)
	sb	$2,0($3)
	lw	$3,56($fp)
	lw	$2,56($fp)
	lw	$2,8($2)
	addu	$2,$2,1
	sw	$2,8($3)
	lw	$2,56($fp)
	lw	$3,56($fp)
	lw	$4,8($2)
	lw	$2,4($3)
	divu	$0,$4,$2
	mflo	$3
	.set	noreorder
	bne	$2,$0,1f
	nop
	break	7
1:
	.set	reorder
	mtc1	$3,$f0
	cvt.d.w	$f0,$f0
	s.d	$f0,32($fp)
	bgez	$3,$L25
	l.d	$f0,$LC2
	l.d	$f2,32($fp)
	add.d	$f2,$f2,$f0
	s.d	$f2,32($fp)
$L25:
	l.d	$f0,$LC3
	l.d	$f2,32($fp)
	c.le.d	$f0,$f2
	bc1t	$L26
	b	$L24
$L26:
	lw	$4,56($fp)
	la	$25,RedimensionarPila
	jal	$31,$25
	bne	$2,$0,$L24
	sw	$0,28($fp)
	b	$L23
$L24:
	li	$2,1			# 0x1
	sw	$2,28($fp)
$L23:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	Apilar
	.size	Apilar, .-Apilar
	.align	2
	.globl	PilaEstaVacia
	.ent	PilaEstaVacia
PilaEstaVacia:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	lw	$2,24($fp)
	lw	$2,8($2)
	bne	$2,$0,$L29
	li	$2,1			# 0x1
	sw	$2,8($fp)
	b	$L28
$L29:
	sw	$0,8($fp)
$L28:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	PilaEstaVacia
	.size	PilaEstaVacia, .-PilaEstaVacia
	.align	2
	.globl	Desapilar
	.ent	Desapilar
Desapilar:
	.frame	$fp,24,$31		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$28,16($sp)
	move	$fp,$sp
	sw	$4,24($fp)
	lw	$2,24($fp)
	lw	$2,8($2)
	beq	$2,$0,$L31
	lw	$3,24($fp)
	lw	$2,24($fp)
	lw	$2,8($2)
	addu	$2,$2,-1
	sw	$2,8($3)
	lw	$2,24($fp)
	lw	$3,24($fp)
	lw	$4,0($2)
	lw	$2,8($3)
	addu	$2,$4,$2
	lb	$2,0($2)
	sw	$2,8($fp)
	b	$L30
$L31:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,8($fp)
$L30:
	lw	$2,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$31
	.end	Desapilar
	.size	Desapilar, .-Desapilar
	.align	2
	.globl	CambiarDePila
	.ent	CambiarDePila
CambiarDePila:
	.frame	$fp,48,$31		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$31,40($sp)
	sw	$fp,36($sp)
	sw	$28,32($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	sw	$5,52($fp)
$L33:
	lw	$2,52($fp)
	lw	$2,8($2)
	bne	$2,$0,$L35
	b	$L34
$L35:
	lw	$4,52($fp)
	la	$25,Desapilar
	jal	$31,$25
	sb	$2,24($fp)
	lb	$2,24($fp)
	lw	$4,48($fp)
	move	$5,$2
	la	$25,Apilar
	jal	$31,$25
	bne	$2,$0,$L33
	sw	$0,28($fp)
	b	$L32
$L34:
	li	$2,1			# 0x1
	sw	$2,28($fp)
$L32:
	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	CambiarDePila
	.size	CambiarDePila, .-CambiarDePila
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
