	.file	1 "invertirEImprimir.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	InvertirEImprimir
	.ent	InvertirEImprimir
InvertirEImprimir:
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
	la	$t9,CrearPila
	jal	$ra,$t9
	sw	$v0,24($fp)
	la	$t9,CrearPila
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	beq	$v0,$zero,$L19
	lw	$v0,24($fp)
	bne	$v0,$zero,$L18
$L19:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L20
	lw	$v0,24($fp)
	bne	$v0,$zero,$L20
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	b	$L21
$L20:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L22
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	b	$L21
$L22:
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
$L21:
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L17
$L18:
	.set	noreorder
	nop
	.set	reorder
$L24:
	lw	$v0,56($fp)
	lhu	$v0,12($v0)
	srl	$v0,$v0,5
	andi	$v0,$v0,0x1
	beq	$v0,$zero,$L26
	b	$L25
$L26:
	lw	$a0,56($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L24
	lb	$v0,32($fp)
	lw	$a0,24($fp)
	move	$a1,$v0
	la	$t9,Apilar
	jal	$ra,$t9
	bne	$v0,$zero,$L28
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L17
$L28:
	lw	$v1,32($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L24
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	la	$t9,CambiarDePila
	jal	$ra,$t9
	bne	$v0,$zero,$L24
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L17
$L25:
	lw	$a0,24($fp)
	la	$t9,PilaEstaVacia
	jal	$ra,$t9
	bne	$v0,$zero,$L31
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	la	$t9,CambiarDePila
	jal	$ra,$t9
	bne	$v0,$zero,$L31
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L17
$L31:
	lw	$a0,24($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
$L33:
	lw	$a0,28($fp)
	la	$t9,PilaEstaVacia
	jal	$ra,$t9
	beq	$v0,$zero,$L35
	b	$L34
$L35:
	lw	$a0,28($fp)
	la	$t9,Desapilar
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,32($fp)
	la	$a1,__sF+88
	la	$t9,__sputc
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L33
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L17
$L34:
	lw	$a0,28($fp)
	la	$t9,DestruirPila
	jal	$ra,$t9
	sw	$zero,36($fp)
$L17:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	InvertirEImprimir
	.size	InvertirEImprimir, .-InvertirEImprimir
	.align	2
	.ent	__sputc
__sputc:
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
	lw	$v1,52($fp)
	lw	$v0,52($fp)
	lw	$v0,8($v0)
	addu	$v0,$v0,-1
	sw	$v0,8($v1)
	bgez	$v0,$L3
	lw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$a0,8($v0)
	lw	$v0,24($v1)
	slt	$v0,$a0,$v0
	bne	$v0,$zero,$L2
	lb	$v1,48($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L3
	b	$L2
$L3:
	lw	$a1,52($fp)
	lw	$v1,0($a1)
	lbu	$a0,48($fp)
	move	$v0,$v1
	sb	$a0,0($v0)
	andi	$v0,$a0,0x00ff
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	sw	$v0,24($fp)
	b	$L1
$L2:
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,__swbuf
	jal	$ra,$t9
	sw	$v0,24($fp)
$L1:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	__sputc
	.size	__sputc, .-__sputc
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
