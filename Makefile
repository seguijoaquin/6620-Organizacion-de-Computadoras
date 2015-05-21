CC = gcc
CFLAGS = -g -c -Wall
PROG = tp1

c_invertirEImprimir: src/invertirEImprimir.c
		$(CC) $(CFLAGS) src/invertirEImprimir.c -o obj/invertirEImprimir.o

pila: src/pila.c
	$(CC) $(CFLAGS) src/pila.c -o obj/pila.o

tp1_orga: src/main.c
	$(CC) $(CFLAGS) src/main.c -o obj/main.o

all_c:  tp1_orga c_invertirEImprimir pila
	$(CC) src/main.c obj/invertirEImprimir.o obj/pila.o -o $(PROG)
	
clean:
	rm -rf obj/*.o $(PROG)
