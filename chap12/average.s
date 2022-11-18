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
	mov dl, [ebx]
	add eax, edx
	add ebx, 4
	dec ecx
	jmp loop0

shift:
	div edi

	pop ebx
	pop ecx
	pop edx
	pop edi
	pop esi
	ret
	
	
