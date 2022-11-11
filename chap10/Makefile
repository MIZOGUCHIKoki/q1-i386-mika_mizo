AS = nasm -felf
LD = ld -m elf_i386

testf: print_eax_hex.o mul_10k.o print_eax.o mul_edx.o exp.o
	$(LD) $+ -o $@

%.o: %.s
	$(AS) $<

.PHONY: clean test

clean:
	rm -f *.o *~ *.out 

test:	testf
	./testf
