AS = nasm -felf
LD = ld
LDFLAGS = -m elf_i386
CC = gcc
CFLAGS = -m32 -W -Wall

makefile: isprime.o isprimec.o sort.s sortc.c
	$(CC) $(CFLAGS) $+

%.o: %.s
	$(AS) $<

%.o: %.c
	$(CC) -c $(CFLAGS) $<

.PHONY: clean test

clean:
	rm -f *.o *~ *.out 

test:	makefile
	./a.out | cat -v

