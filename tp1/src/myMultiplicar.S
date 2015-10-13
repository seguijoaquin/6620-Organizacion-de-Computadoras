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

    la t0,0(a0)     #cargo en t0 la dir de a0
    la t1,0(a1)     #cargo en t1 la dir de a1
    la t2,0(a2)     #cargo en t2 la dir de a2
    move t3, a3     #cargo en t3 f1

    lw t4, 48($fp)  #cargo en t4 c1
    lw t5, 52($fp)  #cargo en t5 c2

    l.d $f0,(t0)
    s.d $f0,8(t2)
    lw v0,48($fp)
    move v0,a3
    j _exit


.end myMultiplicar

_exit:
    #Desarmo el Stack Frame
    move sp,$fp
    lw ra,28(sp)
    lw $fp,24(sp)
    lw gp,20(sp)
    addu sp,sp,32
    j ra
