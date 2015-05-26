CC = gcc
CFLAGS = -g -c -Wall
PROG = tp1

main : main.c
        $(CC) $(CFLAGS) main.c -o main.o

invertirEImprimir: invertirEImprimir.S
        $(CC) $(CFLAGS) invertirEImprimir.S -o invertirEImprimir.o

pila: pila.S
        $(CC) $(CFLAGS) pila.S -o pila.o

all: main invertirEImprimir pila
        $(CC) main.o invertirEImprimir.o pila.o -o $(PROG)

clean:
        rm *.o $(PROG)

