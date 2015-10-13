CC = gcc
CFLAGS = -Wall
PROG = tp0.out
MIPSFLAGS = myMultiplicar.s

.mips:
	$(CC) $(CFLAGS) $(MIPSFLAGS) main.c -o $(PROG)

all:
	$(CC) $(CFLAGS) main.c -o $(PROG)

.clean:
	rm *.o *.s $(PROG)
