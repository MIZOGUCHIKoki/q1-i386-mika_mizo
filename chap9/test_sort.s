  section .text
  global  _start
  extern  sort, print_eax

_start:
  mov ebx,  data1
  mov ecx,  ndata1
  call  sort
  mov edi,  0
loop:
  cmp edi,  ndata1
  je  endp
  mov eax,  [data1 + edi * 4]
  call print_eax
  inc edi
  jmp loop


endp:
  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
data1:  dd 9, 8, 7, 6, 5, 4, 3, 2, 1
ndata1  equ ($ - data1) / 4

