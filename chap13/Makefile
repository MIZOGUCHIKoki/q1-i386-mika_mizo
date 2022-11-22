AS = nasm -felf
LD = ld
LDFLAGS = -m elf_i386
CC = gcc
CFLAGS = -m32 -W -Wall

make: sort isprime

sort: sort.s sortc.c
	$(CC) $(CFLAGS) $+ -o $@

isprime: isprime.s isprimec.c
	$(CC) $(CFLAGS) $+ -o $@

%.o: %.s
	$(AS) $<

%.o: %.c
	$(CC) -c $(CFLAGS) $<

.PHONY: clean test

clean:
	rm -f *.o *~ *.out 

test: sort isprime
	./sort 		
	./isprime 

