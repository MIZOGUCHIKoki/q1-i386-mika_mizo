	section .text
	global fib

fib:
	push esi
	push edi
	push edx
	push ecx
	push ebx

	cmp eax, 0
	jl not
	jmp set

not:
	not eax
	add eax, 1		;絶対値
	jmp set

set:
	mov edi, eax
	shr eax, 1
	mov ebx, 0
	mov ecx, 1

loop0:
	ADD EBX, ECX
	mov edx, ebx
	ADD ECX, EBX
	mov esi, ecx
	dec eax
	jnz loop0

	test edi, 1
	jnz mov
	mov eax, edx
	jmp cmp
mov:
	mov eax, esi
	jmp cmp

cmp:	
	cmp edi, 0		
	jl minus		;ediが負である
	jmp endif

minus:
	test edi, 1		
	jnz pressed             ;ediが負 && 奇数である
	mov esi, -1
	imul esi
	jmp endif

pressed:	
	jmp endif

endif:
	pop ebx
	pop ecx
	pop edx
	pop edi
	pop esi
	ret
