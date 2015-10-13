CC = gcc
CFLAGS = -Wall
PROG = tp1.out
MIPSFLAGS = myMultiplicar.S

.mips:
	$(CC) $(CFLAGS) $(MIPSFLAGS) main.c -o $(PROG)

all:
	$(CC) $(CFLAGS) main.c -o $(PROG)

.clean:
	rm *.o *.s $(PROG)
