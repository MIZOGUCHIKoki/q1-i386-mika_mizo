  section .text
  global  qsort
  extern  qsort

qsort:
  push  esi
  push  edi
  push  edx
  push  eax
  push  ecx
  push  ebx

endp:
  pop ebx
  pop ecx
  pop eax
  pop edx
  pop edi
  pop esi
  ret 
