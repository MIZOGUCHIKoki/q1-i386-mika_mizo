	section .text
	global cos2

cos2:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx
  
	
	mov edx, 0
	mul eax			
	mov ebx, eax

	mov edx, 0
	mul eax
	mov ecx, eax

	mov edx, 0
	mul ebx
	mov edi, eax
	

	mov esi, 2
	mov eax, ebx
	mov edx, eax
	shl eax, 24
	sar edx, 8
	idiv esi
	mov esi, 1
	shl esi, 24
	sub esi, eax
	push esi

	mov esi, 24
	mov eax, ecx
	mov edx, eax
	shl eax, 24
	sar edx, 8
	idiv esi
	pop esi
	add esi, eax
	push esi

	mov esi, 720
	mov eax, edi
	mov edx, eax
	shl eax, 24
	sar edx, 8
	idiv esi
	pop esi
	sub esi, eax
	mov eax, esi
	

endp:

  pop ebx
  pop ecx
  pop edi
  pop edi
  pop esi
  ret
