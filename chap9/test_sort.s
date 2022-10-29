  section .text
  global  _start
  extern  sort, print_eax

_start:
  mov ebx,  data1
  mov ecx,  ndata1
  call  sort

  mov eax,  [data1]
  call print_eax
  mov eax,  [data1 + 4 * (ndata1 - 1)]
  call  print_eax

  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
data1:  dd 3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8
ndata1  equ ($ - data1) / 4

