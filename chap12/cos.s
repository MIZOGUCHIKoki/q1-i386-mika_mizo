	section .text
	global cos
  extern  print_eax_int

cos:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx
  
  mov eax,  2
  mov edx,  0
  mul eax   ; in * in = edx eax
  mov ebx,  eax ; ebx = in ^ 2
  mul eax       ; (in ^ 2) ^ 2 = edx eax
  mov ecx,  eax ; ecx = in ^ 4
  mul ebx       ; in ^ 2 * in ^ 4 = edx eax
  mov edi,  eax ; edi = in ^ 6 
  

  mov eax,  1
  shr ebx,  1   ; ebx / 2
  sub eax,  ebx

  ;; ecx / 24
  mov ebx,  ecx
  shr ecx,  3   ; ecx / 8
  add eax,  ecx ; eax += ecx

  ;; edx / 720
  sub eax,  edi ; eax += edi

  call  print_eax_frac
endp:
  pop ebx
  pop ecx
  pop edi
  pop edi
  pop esi
  ret
