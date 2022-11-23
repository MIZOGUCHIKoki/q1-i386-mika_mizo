  section .text
  global  sort
sort:
	push  esi
	push  edi
	push  edx
  push  ecx
  push  ebx
  push  eax
  
  ;; ---$BF~NO%G!<%?$r@0M}(B---
  mov ebx,  [esp + 4] ; data
  mov ecx,  [esp + 8] ; length
  mov eax,  [esp + 12]; sot       ; width
  mov esi,  4
  mov edx,  0
  div esi   ; edx eax / esi = eax
  mov esi,  eax
  ;; ---
  ;; ebx  : $B@hF,HVCO(B
  ;; ecx  : $B%G!<%?8D?t(B
  ;; esi  : $B9=B$BN%G!<%?8D?t(B

  mov   eax,  0 ; max_index
  mov   edx,  0 ; max
  sub   ecx,  esi   ; i = length - sot
loop0:
  cmp   ecx,  0 ; ecx = i
  jle   endp
  mov   edx,  [ebx]   ; max = data[0]
  mov   eax,  0       ; max_indent = 0

  mov   edi,  esi ; edi = sot :: j

  loop1:
    cmp   edi,  ecx   ; j > i?
    jg    swap
    
    push  esi
    mov   esi,  [ebx + edi*4] ; data[j]
    cmp   esi,  edx       ; data[j] >= max
    jge   then
    jmp   endif

    then:
      mov edx,  [ebx + edi*4] ; max = data[j]
      mov eax,  edi           ; max_index = j
    endif:
      pop esi
      inc edi
      jmp loop1

  swap:
    push esi
    push edi
    mov   esi,  [ebx + eax*4]   ; m = data[max_index]
    mov   edi,  [ebx + ecx*4]   ; edi = data[i]
    mov   [ebx + eax*4],  edi   ; data[max_index],  data[i]
    mov   [ebx + ecx*4],  esi   ; data[i] = m
    pop edi
    pop esi
    dec   ecx
    jmp   loop0
	
endp:
  pop eax
  pop ebx
  pop ecx
	pop edx
	pop edi
	pop esi
	ret
