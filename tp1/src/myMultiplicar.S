#include <mips/regdef.h>
.text
.globl myMultiplicar
.ent myMultiplicar
#myMultiplicar(double* src1, double* src2, double* dest,int f1, int c1,int c2);
# a0 = scr1
# a1 = src2
# a2 = src3
# a3 = f1
# 16(sp) = c1
# 20(sp) = c2

myMultiplicar:
    .frame $fp,32,ra
    subu sp, sp, 32     #Creo el Stack Frame
    sw ra,28(sp)    #Guardo el Return Address
    sw $fp,24(sp)
    sw gp,20(sp)
    move $fp, sp        #uso fp en vez de sp

#    j  _exit
	#bloque para codigo PIC
	.set noreorder
	.cpload t9
	.set reorder

    #Cargo los args en el stack
    sw a0,32($fp) 	#double* m1
    sw a1,36($fp)	#double* m2
    sw a2,40($fp)	#double* mres
    sw a3,44($fp)	#int filas 1
    lw t0,48($fp)	#int columnas 1
    sw t0,48($fp)	#Redundancia
    lw t1,52($fp)	#int columnas 2
    sw t1,52($fp)	#redundancia

#	TESTING
#    la t0,0(a0)     #cargo en t0 la dir de a0
#    la t1,0(a1)     #cargo en t1 la dir de a1
#    la t2,0(a2)     #cargo en t2 la dir de a2
#    move t3, a3     #cargo en t3 f1

#   lw t4, 48($fp)  #cargo en t4 c1
#    lw t5, 52($fp)  #cargo en t5 c2

#    l.d $f0,(t0)
#    s.d $f0,8(t2)
#    lw v0,52($fp)
#    j _exit
	
	move	t0,zero #i = 0 
	sw	t0,16($fp)	#i -> 16($fp)

_loop_i:
	lw t0,16($fp)	#Redundante, t0=i

	move t1, zero	#j = 0
	sw t1,12($fp)	#j -> 12($fp)
	jal _loop_j
	
	addu t0,t0,1
	sw t0,16($fp) #i++

	lw v0,44($fp) #v0 = filas 1
	blt t0, v0, _loop_i #continuar si i < filas 1
	j _exit #Salgo

_loop_j:
	lw t1,12($fp) 	#Redundante, t1=j

	move t2,zero 	#k = 0
	sw t2,8($fp)	#k -> 8($fp)

	sw ra,4($fp)	#guardo el ra de j
	sub.d $f0,$f0,$f0	#acum = 0
	s.d $f0,($fp) #PREGUNTAAR accum-> fp

	jal _loop_k

	lw t0,16($fp) #cargo i
	lw t1,12($fp) #cargo j
	lw v0,52($fp) #cargo columnas 2
	mulou v1,v0,t0 # i * columnas 2
	addu v1,v1,t1 # (i * columnas2)+j #offset

	l.d $f0,($fp) # accum <- fp
	la a2,40($fp)
	addu a2,a2,v0 # mres[offset]
	s.d $f0,(a2) 	#mres[offset]=acum

	addu t1,t1,1
	sw t1,12($fp)	#j++

	blt t1, v1, _loop_j #continuar si j < columnas 2
	lw ra,4($fp)
	j ra

_loop_k:
	l.d $f0,($fp)	#Cargo accum en $f0
	lw t0,16($fp)	#Cargo i
	lw t1,12($fp)	#Cargo j
	lw t2,8($fp)	#Cargo k
	
	lw t3,44($fp)	#Cargo Filas 1
	lw t4,48($fp)	#Cargo Columnas 1
	lw t5,52($fp) 	#Cargo Columnas 2

	mulou v0,t0,t4 	# (i * columnas 1)
	addu v0,v0,t2 	#(i * columnas 1) + k = pos1

	mulou v1,t2,t5	#(k * columnas 2)
	addu v1,v1, t1 	#(k * columnas 2) + j = pos2

	la a0,32($fp)	
	addu a0,a0,v0 	#m1[pos1]
	l.d $f2,(a0)	# aux 1 = m1[pos1]

	la a1,36($fp)
	addu a1,a1,v1 	#m2[pos2]
	l.d $f4,(a1)	#aux 2 = m2[pos2]

	mul.d $f2,$f2,$f4 #m1[pos1] * m2[pos2]
	add.d $f0,$f0,$f2 	#acum = acum + (m1[pos1] * m2[pos2])
	s.d $f0,($fp)	#Guardo el accum

	addu t2,t2,1
	sw t2,8($fp)	#k++

	blt t2, t4, _loop_k #Seguir si k < columna1
	j ra

.end myMultiplicar

_exit:
    #Desarmo el Stack Frame
    move sp,$fp
    lw ra,28(sp)
    lw $fp,24(sp)
    lw gp,20(sp)
    addu sp,sp,32
    j ra
