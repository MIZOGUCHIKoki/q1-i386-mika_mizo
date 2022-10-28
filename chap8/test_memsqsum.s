	section .text
	global _start
	extern memsqsum


_start:
	mov eax, 0
	mov ebx, data1
	mov ecx, ndata1
	mov edx, 55
	call memsqsum
	cmp eax, edx
	je next
	mov ebx, 1
	jmp end

next:
	mov eax, 0
	mov ebx, data2
	mov ecx, ndata2
	mov edx, 0
	call memsqsum
	cmp eax, edx
	je next2
	mov ebx, 1
	jmp end

next2:
	mov eax, 0
	mov ebx, data3
	mov ecx, ndata3
	mov edx, 255
	call memsqsum
	cmp eax, edx
	je next3
	mov ebx, 1
	jmp end

next3:
	mov eax, 0
	mov ebx, data4
	mov ecx, ndata4
	mov edx, 0
	call memsqsum
	cmp eax, edx
	je if
	mov ebx, 1
	jmp end

if:	mov ebx, 0
	jmp end
	
end:	
	mov eax, 1
	int 0x80




data1:	dd 1, 2, 3, 4, 5
ndata1:	equ ($ - data1) / 4
data2:	dd 
ndata2:	equ ($ - data2) / 4
data3:	dd 1, 1, 2, 4, 8 ,13
ndata3:	equ ($ - data3) / 4
data4:	dd 0, 0, 0
ndata4:	equ ($ - data4) / 4
