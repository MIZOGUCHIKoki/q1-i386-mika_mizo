	section .text
	global cos

cos:
	push esi
	push edi
	push edx
	push ecx
	push ebx

	mov esi, 2
	mov ecx, esi
	mov edi, eax

loop0:
	mov edx, 0
	cmp ecx, 0
	je next
	mul edi
	dec ecx
	jmp loop0

next:
	
