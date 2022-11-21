	section .text
	global cos
  extern print_eax_frac

cos:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx

  mov esi,  0x01000000
  
  ; x^2/2!
  mul eax      ; in * in = edx eax
  mov ebx,  0x02000000  ; 除数 8.24
  div ebx      ; edx eax / ebx = eax
  sub esi,  eax
  push  eax
  
  mul eax     ; (in ^ 2 / 2!) ^ 2
  mov ebx,  0x06000000  ; in ^ 4 / 4! 
  div ebx     ; edx eax / ebx = eax
  add esi,  eax
  
  mov ecx,  eax ; ecx = in ^ 4 / 4! 
  pop eax       ; eax = in ^ 2 / 2!

  mul ecx       ; eax * ecx = edx eax
  mov edi,  0x0f000000 ; edx = 15
  div edi       ; edx eax / edi = eax
  sub esi,  eax


endp:
  mov eax,  esi
  pop ebx
  pop ecx
  pop edi
  pop edi
  pop esi
  ret
