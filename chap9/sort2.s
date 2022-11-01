  section .text
  global  sort2

	
sort2:
	push esi
	push edi
	push edx
	push eax
	push ecx
	push ebx
	
push_heap:
	add [size], dword 1
	mov esi, [size]		;esi = size
	mov 
	cmp ecx, 0
	je end
	dec ecx
	
while:
	mov edi, 2
	mov edx, 0
	cmp eax, 1
	jle push_heap
	div edi
	mov edx, [ebx + esi*4]
	mov edi, [ebx + eax*4]
	cmp edx, edi
	jle push_heap
	mov [ebx + esi*4], edi
	mov [ebx + eax*4], edx
	jmp while
	
end:	

	pop ebx
	pop ecx
	pop eax
	pop edx
	pop edi
	pop esi
	ret

	
	section .data
size:	dd 0
