CC = gcc
CFLAGS = -Wall
PROG = tp0.out
MIPSFLAGS = -O0 -S -mrnames

.mips:
	$(CC) $(CFLAGS) $(MIPSFLAGS) main.c

all:
	$(CC) $(CFLAGS) main.c -o $(PROG)

.clean:
	rm *.o *.s $(PROG)
