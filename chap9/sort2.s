  section .text
  global  sort

	
sort:
	push esi
	push edi
	push edx
	push eax
	push ecx
	push ebx
	
push_heap:
	mov esi, subdata
	add [esi], dword 1
	mov edi, 2
	cmp ecx, 0
	je end
	dec ecx

while:
	mov edx, 0
	cmp esi, 1
	jle push_heap
	mov eax, esi
	div edi
	mov edi, esi
	mov edx, [ebx + eax*4]
	cmp [ebx + edi*4], edx
	jle push_heap
	mov esi, [ebx + edi*4]
	mov [ebx + edi*4], edx
	mov [ebx + eax*4], esi
	mov esi, eax
	jmp while
	
end:
	mov eax, 1
	int 0x80

	pop ebx
	pop ecx
	pop eax
	pop edx
	pop edi
	pop esi
	ret

	
	section .data
subdata:	times 10 dd 0
	
