	section .text
	global cos
  extern  print_eax_frac

  ;; x^2 / 2! を返却する．
  ;; 引数として，2を与えている（;in のところ）

cos:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx
  
  mov eax,  0x02000000       ; in 8.24
  mul eax      ; in * in = edx eax
  mov ebx,  eax ; ebx = in ^ 2

  mov esi,  0x02000000  ; 除数 8.24
  div esi      ; edx eax / esi = eax
  pop esi
endp:
  call  print_eax_frac
  pop ebx
  pop ecx
  pop edi
  pop edi
  pop esi
  ret
