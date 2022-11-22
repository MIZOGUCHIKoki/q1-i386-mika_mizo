AS = nasm -felf
LD = ld
LDFLAGS = -m elf_i386
CC = gcc
CFLAGS = -m32 -W -Wall


makeasm: isprime.o sort.o 
	$(LD) $(LDFLAGS) $+ 

makec: main.c

%.o: %.s
	$(AS) $<

.PHONY: clean test

clean:
	rm -f *.o *~ *.out 

test:	testf
	./a.out | cat -v

