CC = gcc
CFLAGS = -g -c -Wall
PROG = tp1

c_invertirEImprimir: src/invertirEImprimir.c
		$(CC) $(CFLAGS) src/invertirEImprimir.c -o obj/invertirEImprimir.o

c_pila: src/pila.c
	$(CC) $(CFLAGS) src/pila.c -o obj/pila.o

main: src/main.c
	$(CC) $(CFLAGS) src/main.c -o obj/main.o

all_c:  main c_invertirEImprimir c_pila
	$(CC) src/main.c obj/invertirEImprimir.o obj/pila.o -o $(PROG)

as_invertirEImprimir: src/invertirEImprimir.s
	$(CC) $(CFLAGS) src/invertirEImprimir.s -o assembler/invertirEImprimir.o

as_pila: src/pila.s
	$(CC) $(CFLAGS) src/pila.s -o assembler/pila.o

all_assembler: main as_invertirEImprimir as_pila
	$(CC) $(CFLAGS) src/main.c assembler/*.o
	
clean:
	rm -rf obj/*.o *.s $(PROG)
