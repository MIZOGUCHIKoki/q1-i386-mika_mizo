	section .text
	global average

average:
	push esi
	push edi
	push edx
	push ecx
	push ebx
	mov edi, ecx
	mov eax, 0

	
loop0:
	cmp ecx, 0
	je shift
	mov edx, [ebx]
	add eax, edx
	add ebx, 4
	dec ecx
	jmp loop0

shift:
	shl eax, 8
	div edi

	pop ebx
	pop ecx
	pop edx
	pop edi
	pop esi
	ret
	
	
