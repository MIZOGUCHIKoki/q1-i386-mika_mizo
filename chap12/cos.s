	section .text
	global cos

cos:
	push  esi
	push  edi
	push  edx
	push  ecx
	push  ebx
  
  mov eax,  2        ; in
  mov edx,  0
  mul eax       ; in * in = edx eax
  mov ebx,  eax ; ebx = in ^ 2

  ;mul eax       ; (in ^ 2) ^ 2 = edx eax
  ;mov ecx,  eax ; ecx = in ^ 4
  ;mul ebx       ; in ^ 2 * in ^ 4 = edx eax
  ;mov edi,  eax ; edi = in ^ 6 
  
  mov esi,  1
  push esi
  mov edx,  0  ; $B3d$i$l$k?t(B1
  mov esi,  2  ; $B=|?t(B
  mov eax,  ebx; $B3d$i$l$k?t(B2
  div esi      ; edx eax / esi = eax
  shl eax,  24
  pop esi
  sub esi,  eax
  
  ; ecx / 24
  mov edx,  0
  mov ebx,  24
  mov eax,  ecx
  div ebx
  shl eax,  24
  add esi,  eax

  ;;; edx / 720
  ;sub eax,  edi ; eax += edi
endp:
  mov eax,  esi
  pop ebx
  pop ecx
  pop edi
  pop edi
  pop esi
  ret
