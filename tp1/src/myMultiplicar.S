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
	move $fp, sp		#uso fp en vez de sp
	la t0,0(a0) 	#cargo en t0 la dir de a0
	la t1,0(a1)		#cargo en t1 la dir de a1
	la t2,0(a2)		#cargo en t2 la dir de a2
	move t3, a3		#cargo en t3 f1

	lw t4, 16($fp) 	#cargo en t4 c1
	lw t5, 20($fp)	#cargo en t5 c2

	l.d $f0,(t0) 
	s.d $f0,(t2)

	j	ra

.end myMultiplicar
