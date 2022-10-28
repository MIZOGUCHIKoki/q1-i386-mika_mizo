AS = nasm -felf
LD = ld
LDFLAGS = -m elf_i386

test_memsqsum: test_memsqsum.o print_eax.o
	$(LD) $(LDFLAGS) $+ -o $@

memsqsum: memsqsum.o print_eax.o
	$(LD) $(LDFLAGS) $+ -o $@

%.o: %.s
	$(AS) $<

.PHONY: clean test

clean:
	rm -f *.o *~ *.out

test: memsqsum test_memsqsum
	./text_memsqsum
	make clean
