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
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L18
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L17
$L18:
	li	$a0,30			# 0x1e
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L19
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L17
$L19:
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	li	$v0,30			# 0x1e
	sw	$v0,4($v1)
	lw	$v0,24($fp)
	sw	$zero,8($v0)
	lw	$v0,24($fp)
	sw	$v0,32($fp)
$L17:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	CrearPila
	.size	CrearPila, .-CrearPila
	.align	2
	.globl	DestruirPila
	.ent	DestruirPila
DestruirPila:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
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
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	lw	$v0,56($fp)
	lw	$v0,8($v0)
	sll	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$v1,56($fp)
	lw	$v0,24($fp)
	sll	$v0,$v0,2
	lw	$a0,0($v1)
	move	$a1,$v0
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L22
	la	$a0,__sF+176
	la	$a1,$LC1
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,32($fp)
	b	$L21
$L22:
	lw	$v1,56($fp)
	lw	$v0,28($fp)
	sw	$v0,0($v1)
	lw	$v1,56($fp)
	lw	$v0,24($fp)
	sw	$v0,4($v1)
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
$L21:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
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
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	move	$v0,$a1
	sb	$v0,24($fp)
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,0($v0)
	lw	$v0,8($v1)
	addu	$v1,$a0,$v0
	lbu	$v0,24($fp)
	sb	$v0,0($v1)
	lw	$v1,56($fp)
	lw	$v0,56($fp)
	lw	$v0,8($v0)
	addu	$v0,$v0,1
	sw	$v0,8($v1)
	lw	$v0,56($fp)
	lw	$v1,56($fp)
	lw	$a0,8($v0)
	lw	$v0,4($v1)
	divu	$0,$a0,$v0
	mflo	$v1
	.set	noreorder
	bne	$v0,$0,1f
	nop
	break	7
1:
	.set	reorder
	mtc1	$v1,$f0
	cvt.d.w	$f0,$f0
	s.d	$f0,32($fp)
	bgez	$v1,$L25
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
	lw	$a0,56($fp)
	la	$t9,RedimensionarPila
	jal	$ra,$t9
	bne	$v0,$zero,$L24
	sw	$zero,28($fp)
	b	$L23
$L24:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
$L23:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	Apilar
	.size	Apilar, .-Apilar
	.align	2
	.globl	PilaEstaVacia
	.ent	PilaEstaVacia
PilaEstaVacia:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L29
	li	$v0,1			# 0x1
	sw	$v0,8($fp)
	b	$L28
$L29:
	sw	$zero,8($fp)
$L28:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	PilaEstaVacia
	.size	PilaEstaVacia, .-PilaEstaVacia
	.align	2
	.globl	Desapilar
	.ent	Desapilar
Desapilar:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	beq	$v0,$zero,$L31
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	lw	$v0,8($v0)
	addu	$v0,$v0,-1
	sw	$v0,8($v1)
	lw	$v0,24($fp)
	lw	$v1,24($fp)
	lw	$a0,0($v0)
	lw	$v0,8($v1)
	addu	$v0,$a0,$v0
	lb	$v0,0($v0)
	sw	$v0,8($fp)
	b	$L30
$L31:
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,8($fp)
$L30:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	Desapilar
	.size	Desapilar, .-Desapilar
	.align	2
	.globl	CambiarDePila
	.ent	CambiarDePila
CambiarDePila:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
$L33:
	lw	$v0,52($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L35
	b	$L34
$L35:
	lw	$a0,52($fp)
	la	$t9,Desapilar
	jal	$ra,$t9
	sb	$v0,24($fp)
	lb	$v0,24($fp)
	lw	$a0,48($fp)
	move	$a1,$v0
	la	$t9,Apilar
	jal	$ra,$t9
	bne	$v0,$zero,$L33
	sw	$zero,28($fp)
	b	$L32
$L34:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
$L32:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	CambiarDePila
	.size	CambiarDePila, .-CambiarDePila
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
