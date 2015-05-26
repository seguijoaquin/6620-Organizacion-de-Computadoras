	.section .mdebug.abi32
	.previous
	.abicalls
#include <mips/regdef.h>
	.text
	.align	2
	.globl	InvertirEImprimir
	.ent	InvertirEImprimir

InvertirEImprimir:
#Descripcion del stack frame
	.frame	$fp,56,ra		# vars= 16, regs= 3/0, args= 16, extra= 8

#Codigo PIC
	.set	noreorder
	.cpload	t9
	.set	reorder

#Creo stack frame
	subu	sp,sp,56

#Directiva codigo PIC
	.cprestore 16

#Salvado de callee-saved regs en SRA
	sw	ra,48(sp)
	sw	$fp,44(sp)
	sw	gp,40(sp)

#De aqui al final de la funcion uso fp en lugar de sp
	move	$fp,sp

#Salvo argumento File* datos
	sw	a0,56($fp)

	la	t9,CrearPila
	jal	ra,t9
	sw	v0,24($fp)	#fp+24 guardo pilaAux

	la	t9,CrearPila
	jal	ra,t9
	sw	v0,28($fp)	#fp+28 guardo pilaGeneral

	beq	v0,$0,$askAmbasNull	#if(pilaGeneral=NULL)
	lw	v0,24($fp)
	bne	v0,$0,$EntradaCicloWhile	#if(pilaAux!=NULL) al while(!eof)

$askAmbasNull:
	lw	v0,28($fp)
	bne	v0,$0,$askPilaNULL #if(pilaGeneral!=NULL)
	lw	v0,24($fp)
	bne	v0,$0,$askPilaNULL	#if(pilaAux!=NULL)
	lw	a0,28($fp)
	la	t9,DestruirPila	#DestruirPila(pilGeneral)
	jal	ra,t9
	lw	a0,24($fp)
	la	t9,DestruirPila	#DestruirPila(PilaAux)
	jal	ra,t9
	b	$returnFailure

$askPilaNULL:
	lw	v0,28($fp)
	bne	v0,$0,$destruirPilaAux
	lw	a0,28($fp)
	la	t9,DestruirPila
	jal	ra,t9
	b	$returnFailure

$destruirPilaAux:
	lw	a0,24($fp)
	la	t9,DestruirPila
	jal	ra,t9

$returnFailure:
	li	v0,1			# load EXIT_FAILURE
	sw	v0,36($fp)
	b	$EXIT

$EntradaCicloWhile:
	.set	noreorder
	nop
	.set	reorder

$verificoEOF:
	lw	v0,56($fp)	#load File* datos antes de verificar EOF
	lhu	v0,12(v0)
	srl	v0,v0,5
	andi	v0,v0,0x1	#enmascaro el MSBit para EOF
	beq	v0,$0,$cicloWhileNotEOF
	b	$askPilaVacia

$cicloWhileNotEOF:
	lw	a0,56($fp)	#load File* datos antes de llamar fgetc
	la	t9,fgetc
	jal	ra,t9
	sw	v0,32($fp)	#save caracter en fp+32
	lw	v1,32($fp)
	li	v0,-1			# load 0xffff en v0
	beq	v1,v0,$verificoEOF	#eval caracter != EOF
	
#Cargo ambos argumentos en SRA de acuerdo a ABI, en orden inverso
	lb	v0,32($fp)		#load caracter antes de llamar a Apilar
	lw	a0,24($fp)		#load pilaAux antes de llamar a Apilar
	move	a1,v0			#muevo argumento a SRA
	la	t9,Apilar		
	jal	ra,t9

	bne	v0,$0,$ifNewLine
	lw	a0,28($fp)
	la	t9,DestruirPila
	jal	ra,t9
	lw	a0,24($fp)
	la	t9,DestruirPila
	jal	ra,t9
	li	v0,1			# load EXIT_FAILURE
	sw	v0,36($fp)
	b	$EXIT

$ifNewLine:
	lw	v1,32($fp)		#load caracter
	li	v0,10			# load NEW LINE
	bne	v1,v0,$verificoEOF	#verifico que no sea fin de linea

#Cargo ambos argumentos en SRA de acuerdo a ABI, en orden inverso
	lw	a0,28($fp)		
	lw	a1,24($fp)
	la	t9,CambiarDePila
	jal	ra,t9

	bne	v0,$0,$verificoEOF
	lw	a0,28($fp)
	la	t9,DestruirPila
	jal	ra,t9
	lw	a0,24($fp)
	la	t9,DestruirPila
	jal	ra,t9

	li	v0,1			# load EXIT_FAILURE
	sw	v0,36($fp)		
	b	$EXIT

$askPilaVacia:
	lw	a0,24($fp)	#load pilaAux antes de llamar a fcion
	la	t9,PilaEstaVacia
	jal	ra,t9

	bne	v0,$0,$destruirPilaAuxiliar

#Cargo ambos argumentos en SRA antes de llamar a CambiarDePila (ABI)	
	lw	a0,28($fp)	#cargo pilaGeneral
	lw	a1,24($fp)	#cargo pilaAux
	la	t9,CambiarDePila
	jal	ra,t9

	bne	v0,$0,$destruirPilaAuxiliar

	lw	a0,28($fp)	#cargo pilaGeneral
	la	t9,DestruirPila
	jal	ra,t9

	lw	a0,24($fp)	#cargo pilaAux
	la	t9,DestruirPila
	jal	ra,t9

	li	v0,1			# load EXIT_FAILURE
	sw	v0,36($fp)
	b	$EXIT

$destruirPilaAuxiliar:
	lw	a0,24($fp)	#cargo pilaAux
	la	t9,DestruirPila
	jal	ra,t9

$EntradaWhilePilaGeneralVacia:
	lw	a0,28($fp)	#cargo pilaGeneral en SRA
	la	t9,PilaEstaVacia
	jal	ra,t9
	beq	v0,$0,$CicloWhilePilaVacia
	b	$SalidaWhile

$CicloWhilePilaVacia:
	lw	a0,28($fp)	#cargo pilaGeneral en SRA
	la	t9,Desapilar
	jal	ra,t9

	sw	v0,32($fp)	#save caracter en v0
	lw	a0,32($fp)
	la	a1,__sF+88
	la	t9,__sputc
	jal	ra,t9
	move	v1,v0
	li	v0,-1			
	bne	v1,v0,$EntradaWhilePilaGeneralVacia
	lw	a0,28($fp)
	la	t9,DestruirPila
	jal	ra,t9
	li	v0,1			
	sw	v0,36($fp)
	b	$EXIT

$SalidaWhile:
	lw	a0,28($fp)	#cargo pilaGeneral en SRA
	la	t9,DestruirPila
	jal	ra,t9
	sw	$0,36($fp)	#Cargo EXIT_SUCCES

$EXIT:
	lw	v0,36($fp)	#Cargo la salida para ser devuelta
	move	sp,$fp
	lw	ra,48(sp)
	lw	$fp,44(sp)
	addu	sp,sp,56
	j	ra
	.end	InvertirEImprimir
	.size	InvertirEImprimir, .-InvertirEImprimir
	.align	2
	.ent	__sputc
__sputc:
	.frame	$fp,48,ra		# vars= 8, regs= 3/0, args= 16, extra= 8

	.set	noreorder
	.cpload	t9
	.set	reorder
	subu	sp,sp,48
	.cprestore 16
	sw	ra,40(sp)
	sw	$fp,36(sp)
	sw	gp,32(sp)
	move	$fp,sp
	sw	a0,48($fp)
	sw	a1,52($fp)
	lw	v1,52($fp)
	lw	v0,52($fp)
	lw	v0,8(v0)
	addu	v0,v0,-1
	sw	v0,8(v1)
	bgez	v0,$L3
	lw	v0,52($fp)
	lw	v1,52($fp)
	lw	a0,8(v0)
	lw	v0,24(v1)
	slt	v0,a0,v0
	bne	v0,$0,$L2
	lb	v1,48($fp)
	li	v0,10			# load NEW LINE
	bne	v1,v0,$L3
	b	$L2
$L3:
	lw	a1,52($fp)
	lw	v1,0(a1)
	lbu	a0,48($fp)
	move	v0,v1
	sb	a0,0(v0)
	andi	v0,a0,0x00ff
	addu	v1,v1,1
	sw	v1,0(a1)
	sw	v0,24($fp)
	b	$L1
$L2:
	lw	a0,48($fp)
	lw	a1,52($fp)
	la	t9,__swbuf
	jal	ra,t9
	sw	v0,24($fp)
$L1:
	lw	v0,24($fp)
	move	sp,$fp
	lw	ra,40(sp)
	lw	$fp,36(sp)
	addu	sp,sp,48
	j	ra
	.end	__sputc
	.size	__sputc, .-__sputc
