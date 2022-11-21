	section .text
	global cos
  extern  print_eax_frac

  ;; x^2 / 2! $B$rJV5Q$9$k!%(B
  ;; $B0z?t$H$7$F!$(B2$B$rM?$($F$$$k!J(B;in $B$N$H$3$m!K(B

cos:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx
  
  mov eax,  0x02000000       ; in 8.24
  mul eax      ; in * in = edx eax
  mov ebx,  eax ; ebx = in ^ 2

  mov esi,  0x02000000  ; $B=|?t(B 8.24
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
