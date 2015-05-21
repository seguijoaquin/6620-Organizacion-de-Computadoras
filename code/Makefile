CC = gcc
CFLAGS = -g -c -Wall
PROG = tp1

c_invertirEImprimir: invertirEImprimir.c
		$(CC) $(CFLAGS) invertirEImprimir.c


pila: pila.c
	$(CC) $(CFLAGS) pila.c

tp1_orga: main.c
	$(CC) $(CFLAGS) main.c

all_c:  tp1_orga c_invertirEImprimir pila
	$(CC) InvertirEImprimir.o pila.o main.c -o $(PROG)
	
clean:
	rm -rf *.o $(PROG)
