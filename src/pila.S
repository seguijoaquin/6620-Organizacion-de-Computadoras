#include <sys/syscall.h>
#include <mips/regdef.h>	

	.rdata	
	.align	2
fallo:
	.ascii	"Fallo el malloc.\n\000"
	.text
	.align	2
	.globl	CrearPila
	.ent	CrearPila
CrearPila:
	.frame	$fp,56,$31		

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

	li	$4,12			
	la	$25,malloc		#llamada a malloc con argumento a0=12
	jal	$31,$25

	sw	$2,24($fp)		#return de malloc a pila
	bne	$2,$0,entra_if		#if(pila!=NULL) 
	
	la	$4,fallo
	li	$2,4
	syscall			#llamada a syscall que printea "Fallo malloc"
	

	sw	$0,32($fp)		#return NULL
	b	retorno

entra_if:				#entro al if(pila!=NULL)
	li	$4,30			
	la	$25,malloc
	jal	$31,$25	

	sw	$2,28($fp)		#return de malloc a aux
	bne	$2,$0,cargar		#if(aux!=NULL)

	la	$4,fallo
	li	$2,4			#llama a syscall y printea "Fallo malloc"
	syscall

	lw	$4,24($fp)	
	la	$25,free		#llama al free para liberar la pila
	jal	$31,$25

	sw	$0,32($fp)		#return NULL
	b	retorno
cargar:
	lw	$3,24($fp)		#carga malloc de pila en v1
	lw	$2,28($fp)		#carga malloc de aux en v0
	sw	$2,0($3)		#pila->caracteres=aux;
	
	li	$2,30			# 0x1e
	sw	$2,4($3)		#pila->tamanio=PILA_TAM_INICIAL;
	
	sw	$0,8($3)		#pila->cantidad = 0;

	sw	$3,32($fp)		#guardo en 32(fp)=pila para el return
retorno:
	lw	$2,32($fp)		#return de (NULL o NULL) o return de  pila
	
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
	.frame	$fp,40,$31		

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

	move	$2,$4
	lw	$4,0($2)
	la	$25,free		#destruyo pila->caracteres
	jal	$31,$25

	move	$4,$2
	la	$25,free		#destruyo pila
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
fallo_rea:
	.ascii	"Fallo el realloc.\n\000"
	.text
	.align	2
	.globl	RedimensionarPila
	.ent	RedimensionarPila
RedimensionarPila:
	.frame	$fp,56,$31		

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

	lw	$2,8($4)		# $2 <- pila.cantidad
	sll	$2,$2,1			# nuevo_tam = pila.cantidad * PILA_FACTOR
	sw	$2,24($fp)

	sll	$2,$2,2 		#nuevo_tam * sizeof(char)

	lw	$4,0($4)		#a0 <- pila.caracteres
	move	$5,$2			#a1 <-nuevo_tam * sizeof(char)
	la	$25,realloc
	jal	$31,$25

	sw	$2,28($fp)
	bne	$2,$0,no_zero		# if (aux != NULL)

	la	$4,fallo_rea
	li	$2,4
	syscall

	sw	$0,32($fp)		#return NULL == false
	b	return
no_zero:
	lw	$3,56($fp)		#trae la pila
	lw	$2,28($fp)		#trae aux
	sw	$2,0($3)		#pila->caracteres = aux;

	lw	$2,24($fp)		#trae nuevo_tam
	sw	$2,4($3)		#pila->tamanio = nuevo_tam;

	li	$2,1			
	sw	$2,32($fp)		#return 1 == true
return:
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
	.frame	$fp,56,$31	

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

	sw	$4,56($fp)		#guarda pila
		
	move	$2,$5			#mueve char a v0
  	sb	$2,24($fp)

	move	$3,$4			#trae pila

	lw	$4,0($4)		#pila.caracteres
	lw	$2,8($3)		#pila.cantidad
	addu	$3,$4,$2		#pila.caracteres + pila.cantidad == pila->caracteres[pila->cantidad]

	lbu	$2,24($fp)		#carga el byte q guarde anteriormente
	sb	$2,0($3)		#pila->caracteres[pila->cantidad]=valor

	lw	$3,56($fp)		#trae la pila
	lw	$2,56($fp)		#trae la pila

	lw	$2,8($2)		#pila.cantidad
	addu	$2,$2,1		#pila.cantidad++
	sw	$2,8($3)		#guarda lo modificado en pila.cantidad++

	lw	$2,56($fp)		#trae pila

	lw	$4,8($2)		#pila.cantidad
	lw	$2,4($3)		#pila.tamanio
	divu	$0,$4,$2		# pila.cantidad / pila.tamanio

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
	lw	$4,56($fp)		#trae pila
	la	$25,RedimensionarPila
	jal	$31,$25

	bne	$2,$0,$L24
	sw	$0,28($fp)
	b	$devuelvo
$L24:
	li	$2,1			
	sw	$2,28($fp)
devuelvo:
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
	.frame	$fp,24,$31		

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

	lw	$2,8($4)		#pila.cantidad
	bne	$2,$0,pila_no_zero	# if (pila->cantidad != 0)

	li	$2,1			# 0x1
	sw	$2,8($fp)		#return 1 == true
	b	return_bool
pila_no_zero:
	sw	$0,8($fp)		#return 0 == false
return_bool:
	lw	$2,8($fp)		#carga el return

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
	.frame	$fp,24,$31		

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

	lw	$8,8($4)		# pila.cantidad
	beq	$8,$0,cant_zero		# if (pila.cantidad == 0)

	addu	$8,$8,-1		#pila.cantidad--

	sw	$8,8($4)		#guardo pila.cantidad--

	lw	$4,0($4)		#pila.caracteres
	addu	$2,$4,$8		# pila.caracteres[(pila.cantidad)]
	lb	$2,0($2)		#cargo ese byte al que apunta pila.caracteres[(pila.cantidad)]
	sw	$2,8($fp)		#return el byte cargado anteriormente
	b	byte_return
cant_zero:
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,8($fp)		#return EOF
byte_return:
	lw	$2,8($fp)		#carga el return

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
	.frame	$fp,48,$31	

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

	sw	$4,48($fp)		#guardo pila_destino
	sw	$5,52($fp)		#guardo pila_origen
sigue:
	lw	$2,52($fp)		#cargo pila_origen
	lw	$2,8($2)		#pila_origen.cantidad
	bne	$2,$0,pilao_no_zero	#pila_origen.cantidad != 0
	b	pilao_zero
pilao_no_zero:
	lw	$4,52($fp)		#cargo pila_origen
	la	$25,Desapilar
	jal	$31,$25

	sb	$2,24($fp)		#guardo byte return de Desapilar
	lb	$2,24($fp)		#cargo byte return de Desapilar

	lw	$4,48($fp)		#cargo pila_destino
	move	$5,$2			#cargo byte return de Desapilar en a1
	la	$25,Apilar
	jal	$31,$25

	bne	$2,$0,sigue		# if(!Apilar(pila_destino, aux))

	sw	$0,28($fp)		#return 0 == false
	b	bool_retorno
pilao_zero:
	li	$2,1			
	sw	$2,28($fp)		#return 1 ==true
bool_retorno:
	lw	$2,28($fp)		#cargo el return

	move	$sp,$fp
	lw	$31,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$31
	.end	CambiarDePila
	.size	CambiarDePila, .-CambiarDePila
