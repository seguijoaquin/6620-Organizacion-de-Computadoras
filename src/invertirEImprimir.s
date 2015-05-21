	.file	1 "invertirEImprimir.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	InvertirEImprimir
	.ent	InvertirEImprimir
InvertirEImprimir:
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
	la	$25,CrearPila
	jal	$31,$25
	sw	$2,24($fp)
	la	$25,CrearPila
	jal	$31,$25
	sw	$2,28($fp)
	lw	$2,28($fp)
	beq	$2,$0,$L19
	lw	$2,24($fp)
	bne	$2,$0,$L18
$L19:
	lw	$2,28($fp)
	bne	$2,$0,$L20
	lw	$2,24($fp)
	bne	$2,$0,$L20
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
	b	$L21
$L20:
	lw	$2,28($fp)
	bne	$2,$0,$L22
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	b	$L21
$L22:
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
$L21:
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L17
$L18:
	.set	noreorder
	nop
	.set	reorder
$L24:
	lw	$2,56($fp)
	lhu	$2,12($2)
	srl	$2,$2,5
	andi	$2,$2,0x1
	beq	$2,$0,$L26
	b	$L25
$L26:
	lw	$4,56($fp)
	la	$25,fgetc
	jal	$31,$25
	sw	$2,32($fp)
	lw	$3,32($fp)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L24
	lb	$2,32($fp)
	lw	$4,24($fp)
	move	$5,$2
	la	$25,Apilar
	jal	$31,$25
	bne	$2,$0,$L28
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L17
$L28:
	lw	$3,32($fp)
	li	$2,10			# 0xa
	bne	$3,$2,$L24
	lw	$4,28($fp)
	lw	$5,24($fp)
	la	$25,CambiarDePila
	jal	$31,$25
	bne	$2,$0,$L24
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L17
$L25:
	lw	$4,24($fp)
	la	$25,PilaEstaVacia
	jal	$31,$25
	bne	$2,$0,$L31
	lw	$4,28($fp)
	lw	$5,24($fp)
	la	$25,CambiarDePila
	jal	$31,$25
	bne	$2,$0,$L31
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L17
$L31:
	lw	$4,24($fp)
	la	$25,DestruirPila
	jal	$31,$25
$L33:
	lw	$4,28($fp)
	la	$25,PilaEstaVacia
	jal	$31,$25
	beq	$2,$0,$L35
	b	$L34
$L35:
	lw	$4,28($fp)
	la	$25,Desapilar
	jal	$31,$25
	sw	$2,32($fp)
	lw	$4,32($fp)
	la	$5,__sF+88
	la	$25,__sputc
	jal	$31,$25
	move	$3,$2
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L33
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	li	$2,1			# 0x1
	sw	$2,36($fp)
	b	$L17
$L34:
	lw	$4,28($fp)
	la	$25,DestruirPila
	jal	$31,$25
	sw	$0,36($fp)
$L17:
	lw	$2,36($fp)
	move	$sp,$fp
	lw	$31,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$31
	.end	InvertirEImprimir
	.size	InvertirEImprimir, .-InvertirEImprimir
	.align	2
	.ent	__sputc
__sputc:
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
	lw	$3,52($fp)
	lw	$2,52($fp)
	lw	$2,8($2)
	addu	$2,$2,-1
	sw	$2,8($3)
	bgez	$2,$L3
	lw	$2,52($fp)
	lw	$3,52($fp)
	lw	$4,8($2)
	lw	$2,24($3)
	slt	$2,$4,$2
	bne	$2,$0,$L2
	lb	$3,48($fp)
	li	$2,10			# 0xa
	bne	$3,$2,$L3
	b	$L2
$L3:
	lw	$5,52($fp)
	lw	$3,0($5)
	lbu	$4,48($fp)
	move	$2,$3
	sb	$4,0($2)
	andi	$2,$4,0x00ff
	addu	$3,$3,1
	sw	$3,0($5)
	sw	$2,24($fp)
	b	$L1
$L2:
	lw	$4,48($fp)
	lw	$5,52($fp)
	la	$25,__swbuf
	jal	$31,$25
	sw	$2,24($fp)
$L1:
	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	__sputc
	.size	__sputc, .-__sputc
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
