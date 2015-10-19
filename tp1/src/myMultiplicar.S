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

	move	t0,zero #i = 0 
	sw	t0,16($fp)	#i -> 16($fp)


_loop_i:
	lw t0,16($fp)	#Redundante, t0=i

	move t1, zero	#j = 0
	sw t1,12($fp)	#j -> 12($fp)
	b _loop_j

_end_loop_i:		
	lw t0,16($fp)
	addu t0,t0,1
	sw t0,16($fp) #i++

	lw v0,44($fp) #v0 = filas 1
	blt t0, v0, _loop_i #continuar si i < filas 1
	j _exit #Salgo

_loop_j:
	lw t1,12($fp) 	#Redundante, t1=j

	move t2,zero 	#k = 0
	sw t2,8($fp)	#k -> 8($fp)

	sub.d $f0,$f0,$f0	#acum = 0
	s.d $f0,($fp) #PREGUNTAAR accum-> fp

	b _loop_k

_end_loop_j:
	lw t0,16($fp) #cargo i
	lw t1,12($fp) #cargo j
	lw v0,52($fp) #cargo columnas 2
	mulou v1,v0,t0 # i * columnas 2
	addu v1,v1,t1 # (i * columnas2)+j #offset
	mulou v1,v1,8

	l.d $f0,($fp) # accum <- fp
	lw a2,40($fp)
	la a2,0(a2)
	
	addu a2,a2,v1 # mres[offset]
	s.d $f0,(a2) 	#mres[offset]=acum

	addu t1,t1,1
	sw t1,12($fp)	#j++

	blt t1, v0, _loop_j #continuar si j < columnas 2
	b _end_loop_i

_loop_k:
    l.d $f0,($fp)   #Cargo accum en $f0
    lw t0,16($fp)   #Cargo i
    lw t1,12($fp)   #Cargo j
    lw t2,8($fp)    #Cargo k

    lw t3,44($fp)   #Cargo Filas 1
    lw t4,48($fp)   #Cargo Columnas 1
    lw t5,52($fp)   #Cargo Columnas 2

    mulou v0,t0,t4  # (i * columnas 1)
    addu v0,v0,t2   #(i * columnas 1) + k = pos1
    mulou v0,v0,8

    mulou v1,t2,t5  #(k * columnas 2)
    addu v1,v1, t1  #(k * columnas 2) + j = pos2
    mulou v1,v1,8

    lw a0,32($fp)
    la a0,0(a0)
    addu a0,a0,v0   #m1[pos1]
    l.d $f2,(a0)    # aux 1 = m1[pos1]

    sub.d $f6,$f6    #$f6 = 0
    c.eq.d $f2,$f6   #$f2 == 0?
    bc1t _end_loop_k #Si multiplico x 0, no sumo

    lw a1,36($fp)
    la a1,0(a1)
    addu a1,a1,v1   #m2[pos2]
    l.d $f4,(a1)    #aux 2 = m2[pos2]

    sub.d $f6,$f6    #$f6 = 0
    c.eq.d $f4,$f6   #$f4 == 0?
    bc1t _end_loop_k #Si multiplico x 0, no sumo

    #Si llego aca sumo algo
    mul.d $f2,$f2,$f4 #m1[pos1] * m2[pos2]
    add.d $f0,$f0,$f2   #acum = acum + (m1[pos1] * m2[pos2])

_end_loop_k:
    s.d $f0,($fp)   #Guardo el accum

    addu t2,t2,1
    sw t2,8($fp)    #k++

    blt t2, t4, _loop_k #Seguir si k < columna1
    b _end_loop_j


_exit:
    #Desarmo el Stack Frame

    move sp,$fp
    lw ra,28(sp)
    lw $fp,24(sp)
    lw gp,20(sp) 
    lw s0,(sp)
    addu sp,sp,32
    j ra

.end myMultiplicar
