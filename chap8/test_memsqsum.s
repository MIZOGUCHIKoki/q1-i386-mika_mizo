	section .text
	global _start
	extern memsqsum


_start:
	mov edi, 0
	mov esi, 0
	mov eax, 0
	mov ebx, data1
	mov ecx, ndata1
	mov edx, 4294836225
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
	mov edx, 255
	call memsqsum
	cmp eax, edx
	je next4
	mov ebx, 1
	jmp end

next4:
	mov eax, 0
	mov ebx, data5
	mov ecx, ndata5
	mov edx, 0
	call memsqsum
	cmp eax, edx
	je nextR
	mov ebx, 1
	jmp end

nextR:
  mov eax,  0
  mov ebx,  data2
  mov ecx,  ndata2
  mov edx,  100
  mov edi,  200
  mov esi,  300
  call memsqsum
  cmp eax,  0
  jne nif
  cmp ebx,  data2
  jne nif
  cmp ecx,  ndata2
  jne nif
  cmp edx,  100
  jne nif
  cmp edi,  200
  jne nif
  cmp esi,  300
  jne nif

nextS:
  mov eax,  0
  mov ebx,  data2
  mov ecx,  ndata2
  mov edx,  esp
  call memsqsum
  cmp esp, edx
  jne nif

nextZero:
  mov eax,  0
  mov ebx,  data2
  mov ecx,  0
  call  memsqsum
  cmp eax,  0
  jne nif
  jmp if


if:	
  mov ebx, 0
	jmp end

nif:
  mov ebx,  1
  jmp end
	
end:	
	mov eax, 1
	int 0x80




data1:	dd 65535
ndata1:	equ ($ - data1) / 4
data2:	dd 0
ndata2:	equ ($ - data2) / 4
data3:	dd 1, 1, 2, 4, 8 ,13
ndata3:	equ ($ - data3) / 4
data4:  times 255 dd 1
ndata4:	equ ($ - data4) / 4
data5:	dd 0, 0, 0
ndata5:	equ ($ - data5) / 4
