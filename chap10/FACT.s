  section .text
  global  FACT
  extern  MULT
  extern  print_eax
 
FACT:   ; $B3,>h(BF(ebx)
  push  ebx
  push  edx
  mov   eax,  1
  sub   ebx,  1
  jnz   NEXT2
  jmp   FIN2
NEXT2:
  mov   edx,  1
LP2:
  inc   edx
  call  MULT
  dec   ebx
  jnz   LP2
FIN2:
  mov   esi,  eax
  mov   eax,  edx
  call  print_eax
  mov   eax,  esi
  pop   edx
  pop   ebx
  ret
