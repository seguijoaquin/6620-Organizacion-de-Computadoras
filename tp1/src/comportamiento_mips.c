#include <stdio.h>
#include <stdlib.h>

int main()
{
    double  aux1 = 0;
    double  aux2 = 0;
    double  aux3 = 3;
    double  res = aux1 + aux2;

    if ( res  == 0)
        printf("0+0 es igual a 0\n");
    else
        printf("0+0 no es igual a 0, da %G\n",res);

    res = aux2 * aux3;
    if (res == 0)
        printf("0*3 es igual a 0\n");
    else
        printf("0*3 no es igual a 0, da %G\n",res);

    return 0;
}
