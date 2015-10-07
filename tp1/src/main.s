	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"Usage:\n"
	.ascii	" tp0 -h\n\000"
	.align	2
$LC1:
	.ascii	" tp0 -V\n\000"
	.align	2
$LC2:
	.ascii	"tp0 < in_file > out_file\n\000"
	.align	2
$LC3:
	.ascii	"Options:\n\000"
	.align	2
$LC4:
	.ascii	" -V, --version \tPrint version and quit.\n\000"
	.align	2
$LC5:
	.ascii	" -h, --help  \tPrint this information and quit.\n\000"
	.align	2
$LC6:
	.ascii	"Examples:\n\000"
	.align	2
$LC7:
	.ascii	" tp0 < in.txt > out.txt\n\000"
	.align	2
$LC8:
	.ascii	"cat in.txt | tp0 > out.txt\n\000"
	.text
	.align	2
	.globl	printManual
	.ent	printManual
printManual:
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
	la	$a0,$LC0
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC1
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC2
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC3
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC4
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC5
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC7
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC8
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	printManual
	.size	printManual, .-printManual
	.rdata
	.align	2
$LC10:
	.ascii	"help\000"
	.align	2
$LC11:
	.ascii	"version\000"
	.data
	.align	2
$LC12:
	.word	$LC10
	.word	0
	.word	0
	.word	104
	.word	$LC11
	.word	0
	.word	0
	.word	86
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	memcpy
	.rdata
	.align	2
$LC9:
	.ascii	"hV\000"
	.align	2
$LC13:
	.ascii	" Version 1.0 del TP0\n\000"
	.align	2
$LC14:
	.ascii	"Error, el programa se cerrara.\n\000"
	.text
	.align	2
	.globl	parsearOpciones
	.ent	parsearOpciones
parsearOpciones:
	.frame	$fp,112,$ra		# vars= 64, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,112
	.cprestore 24
	sw	$ra,104($sp)
	sw	$fp,100($sp)
	sw	$gp,96($sp)
	move	$fp,$sp
	sw	$a0,112($fp)
	sw	$a1,116($fp)
	la	$v0,$LC9
	sw	$v0,36($fp)
	addu	$v0,$fp,40
	la	$v1,$LC12
	move	$a0,$v0
	move	$a1,$v1
	li	$a2,48			# 0x30
	la	$t9,memcpy
	jal	$ra,$t9
$L19:
	addu	$v0,$fp,40
	sw	$zero,16($sp)
	lw	$a0,112($fp)
	lw	$a1,116($fp)
	lw	$a2,36($fp)
	move	$a3,$v0
	la	$t9,getopt_long
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	sw	$v0,88($fp)
	li	$v0,86			# 0x56
	lw	$v1,88($fp)
	beq	$v1,$v0,$L24
	lw	$v1,88($fp)
	slt	$v0,$v1,87
	beq	$v0,$zero,$L28
	li	$v0,-1			# 0xffffffffffffffff
	lw	$v1,88($fp)
	beq	$v1,$v0,$L21
	b	$L26
$L28:
	li	$v0,104			# 0x68
	lw	$v1,88($fp)
	beq	$v1,$v0,$L23
	b	$L26
$L23:
	la	$t9,printManual
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L24:
	la	$a0,$LC13
	la	$t9,printf
	jal	$ra,$t9
	move	$a0,$zero
	la	$t9,exit
	jal	$ra,$t9
$L26:
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
	la	$t9,printManual
	jal	$ra,$t9
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
$L21:
	lw	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L19
	move	$sp,$fp
	lw	$ra,104($sp)
	lw	$fp,100($sp)
	addu	$sp,$sp,112
	j	$ra
	.end	parsearOpciones
	.size	parsearOpciones, .-parsearOpciones
	.align	2
	.globl	alocarMatriz
	.ent	alocarMatriz
alocarMatriz:
	.frame	$fp,56,$ra		# vars= 16, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,52($sp)
	sw	$fp,48($sp)
	sw	$gp,44($sp)
	sw	$s0,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,56($fp)
	sll	$v0,$v0,2
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L31
	sw	$zero,36($fp)
	b	$L30
$L31:
	sw	$zero,28($fp)
$L32:
	lw	$v0,28($fp)
	lw	$v1,56($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L35
	b	$L33
$L35:
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$s0,$v1,$v0
	lw	$v0,60($fp)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,28($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	bne	$v0,$zero,$L34
	sw	$zero,32($fp)
$L37:
	lw	$v0,32($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L40
	b	$L38
$L40:
	lw	$v0,32($fp)
	sll	$v1,$v0,2
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L37
$L38:
	lw	$a0,24($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,36($fp)
	b	$L30
$L34:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L32
$L33:
	lw	$v0,24($fp)
	sw	$v0,36($fp)
$L30:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$ra,52($sp)
	lw	$fp,48($sp)
	lw	$s0,40($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	alocarMatriz
	.size	alocarMatriz, .-alocarMatriz
	.align	2
	.globl	strLength
	.ent	strLength
strLength:
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
	sw	$zero,8($fp)
$L42:
	lw	$v1,24($fp)
	lw	$v0,8($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	bne	$v0,$zero,$L44
	b	$L43
$L44:
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	b	$L42
$L43:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	strLength
	.size	strLength, .-strLength
	.align	2
	.globl	getLine
	.ent	getLine
getLine:
	.frame	$fp,160,$ra		# vars= 120, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,160
	.cprestore 16
	sw	$ra,152($sp)
	sw	$fp,148($sp)
	sw	$gp,144($sp)
	move	$fp,$sp
	addu	$a0,$fp,24
	li	$a1,100			# 0x64
	la	$a2,__sF
	la	$t9,fgets
	jal	$ra,$t9
	bne	$v0,$zero,$L47
	sw	$zero,140($fp)
	b	$L46
$L47:
	addu	$a0,$fp,24
	la	$t9,strLength
	jal	$ra,$t9
	sw	$v0,128($fp)
	lw	$v1,128($fp)
	addu	$v0,$fp,24
	addu	$v0,$v0,$v1
	addu	$v0,$v0,-1
	lb	$v1,0($v0)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L54
	lw	$v0,128($fp)
	sltu	$v0,$v0,2
	bne	$v0,$zero,$L49
	lw	$v1,128($fp)
	addu	$v0,$fp,24
	addu	$v0,$v0,$v1
	addu	$v0,$v0,-1
	sb	$zero,0($v0)
$L49:
	lw	$a0,128($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,132($fp)
	sw	$zero,136($fp)
$L50:
	lw	$v0,136($fp)
	lw	$v1,128($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L53
	b	$L51
$L53:
	lw	$v1,132($fp)
	lw	$v0,136($fp)
	addu	$a0,$v1,$v0
	lw	$v1,136($fp)
	addu	$v0,$fp,24
	addu	$v0,$v0,$v1
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,136($fp)
	addu	$v0,$v0,1
	sw	$v0,136($fp)
	b	$L50
$L51:
	lw	$v0,132($fp)
	sw	$v0,140($fp)
	b	$L46
$L54:
	sw	$zero,140($fp)
$L46:
	lw	$v0,140($fp)
	move	$sp,$fp
	lw	$ra,152($sp)
	lw	$fp,148($sp)
	addu	$sp,$sp,160
	j	$ra
	.end	getLine
	.size	getLine, .-getLine
	.rdata
	.align	2
$LC15:
	.ascii	"%lf%c\000"
	.text
	.align	2
	.globl	llenarMatriz
	.ent	llenarMatriz
llenarMatriz:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	sw	$a2,88($fp)
	sw	$zero,36($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	li	$v0,1			# 0x1
	sb	$v0,40($fp)
$L56:
	lbu	$v0,40($fp)
	beq	$v0,$zero,$L57
	lw	$v0,24($fp)
	lw	$v1,84($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L58
	b	$L57
$L58:
	addu	$v0,$fp,48
	addu	$v1,$fp,32
	la	$a0,$LC15
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,scanf
	jal	$ra,$t9
	sw	$v0,56($fp)
	lw	$v1,56($fp)
	li	$v0,-1			# 0xffffffffffffffff
	beq	$v1,$v0,$L60
	lw	$v1,56($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L60
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,80($fp)
	addu	$a0,$v1,$v0
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	lw	$v0,88($fp)
	addu	$v1,$v0,-1
	lw	$v0,28($fp)
	bne	$v0,$v1,$L61
	sw	$zero,28($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L56
$L61:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L56
$L60:
	sb	$zero,40($fp)
	b	$L56
$L57:
	lw	$v1,84($fp)
	lw	$v0,88($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,36($fp)
	bne	$v0,$v1,$L65
	lb	$v1,32($fp)
	li	$v0,10			# 0xa
	bne	$v1,$v0,$L65
	b	$L64
$L65:
	li	$v0,1			# 0x1
	sw	$v0,60($fp)
	b	$L55
$L64:
	sw	$zero,60($fp)
$L55:
	lw	$v0,60($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	llenarMatriz
	.size	llenarMatriz, .-llenarMatriz
	.align	2
	.globl	liberarMatriz
	.ent	liberarMatriz
liberarMatriz:
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
	sw	$zero,24($fp)
$L67:
	lw	$v0,24($fp)
	lw	$v1,52($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L70
	b	$L68
$L70:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,48($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L67
$L68:
	lw	$a0,48($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	liberarMatriz
	.size	liberarMatriz, .-liberarMatriz
	.rdata
	.align	2
$LC16:
	.ascii	"%ix%i \000"
	.align	2
$LC17:
	.ascii	"%g \000"
	.align	2
$LC18:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	multiplicar
	.ent	multiplicar
multiplicar:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$a2,72($fp)
	sw	$a3,76($fp)
	la	$a0,$LC16
	lw	$a1,68($fp)
	lw	$a2,80($fp)
	la	$t9,printf
	jal	$ra,$t9
	sw	$zero,24($fp)
$L72:
	lw	$v0,24($fp)
	lw	$v1,68($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L75
	b	$L73
$L75:
	sw	$zero,28($fp)
$L76:
	lw	$v0,28($fp)
	lw	$v1,80($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L79
	b	$L74
$L79:
	sw	$zero,40($fp)
	sw	$zero,44($fp)
	sw	$zero,32($fp)
$L80:
	lw	$v0,32($fp)
	lw	$v1,72($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L83
	b	$L81
$L83:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$a0,$v1,$v0
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$a1,$v1,$v0
	lw	$v0,32($fp)
	sll	$v1,$v0,2
	lw	$v0,76($fp)
	addu	$a0,$v1,$v0
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,0($a0)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a1)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,40($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,40($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L80
$L81:
	la	$a0,$LC17
	lw	$a2,40($fp)
	lw	$a3,44($fp)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L76
$L74:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L72
$L73:
	la	$a0,$LC18
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	multiplicar
	.size	multiplicar, .-multiplicar
	.rdata
	.align	2
$LC19:
	.ascii	"%i%*c%i \000"
	.align	2
$LC20:
	.ascii	"Fallo al leer dimensiones\n\000"
	.align	2
$LC21:
	.ascii	"Fallo en malloc\n\000"
	.align	2
$LC22:
	.ascii	"Cantidad elementos distinta a dimensiones de matriz\n\000"
	.align	2
$LC23:
	.ascii	"Dimensiones no compatibles para multiplicar\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,88,$ra		# vars= 40, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,88
	.cprestore 24
	sw	$ra,80($sp)
	sw	$fp,76($sp)
	sw	$gp,72($sp)
	move	$fp,$sp
	sw	$a0,88($fp)
	sw	$a1,92($fp)
	lw	$a0,88($fp)
	lw	$a1,92($fp)
	la	$t9,parsearOpciones
	jal	$ra,$t9
	addu	$v0,$fp,36
	addu	$v1,$fp,40
	la	$a0,$LC19
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,scanf
	jal	$ra,$t9
	sw	$v0,44($fp)
$L85:
	lw	$v1,44($fp)
	li	$v0,2			# 0x2
	beq	$v1,$v0,$L88
	la	$a0,__sF+176
	la	$a1,$LC20
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L88:
	lw	$a0,36($fp)
	lw	$a1,40($fp)
	la	$t9,alocarMatriz
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L89
	la	$a0,__sF+176
	la	$a1,$LC21
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L89:
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	lw	$a2,40($fp)
	la	$t9,llenarMatriz
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	beq	$v0,$zero,$L90
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC22
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L90:
	addu	$v0,$fp,56
	addu	$v1,$fp,60
	la	$a0,$LC19
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,scanf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	li	$v0,2			# 0x2
	beq	$v1,$v0,$L91
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC20
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L91:
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	la	$t9,alocarMatriz
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	bne	$v0,$zero,$L92
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC21
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L92:
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	lw	$a2,60($fp)
	la	$t9,llenarMatriz
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	beq	$v0,$zero,$L93
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC22
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L93:
	lw	$v1,40($fp)
	lw	$v0,56($fp)
	bne	$v1,$v0,$L94
	lw	$v0,60($fp)
	sw	$v0,16($sp)
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	lw	$a2,40($fp)
	lw	$a3,52($fp)
	la	$t9,multiplicar
	jal	$ra,$t9
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	b	$L95
$L94:
	lw	$a0,32($fp)
	lw	$a1,36($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	lw	$a0,52($fp)
	lw	$a1,56($fp)
	la	$t9,liberarMatriz
	jal	$ra,$t9
	la	$a0,__sF+176
	la	$a1,$LC23
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,64($fp)
	b	$L84
$L95:
	addu	$v0,$fp,36
	addu	$v1,$fp,40
	la	$a0,$LC19
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,scanf
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L85
	sw	$zero,64($fp)
$L84:
	lw	$v0,64($fp)
	move	$sp,$fp
	lw	$ra,80($sp)
	lw	$fp,76($sp)
	addu	$sp,$sp,88
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
