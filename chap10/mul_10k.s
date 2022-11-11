  section .text
  global  mul_10k

mul_10k:
  push  edi
  push  esi
  push  edx
  push  ecx
  push  ebx


mov ebx,  eax
shl eax,  4
add eax,  ebx
shl eax,  4


endp:
  pop ebx
  pop ecx
  pop edx
  pop esi
  pop edi
  ret
