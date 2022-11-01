  section .text
  global  _start
  extern  sort2, print_eax

_start:
  mov ebx,  data1
  mov ecx,  ndata1
  call  sort2
  mov edi,  0
loop:
  cmp edi,  ndata1 - 1
  je  endp
  mov eax,  [data1 + edi*4]
  call print_eax
  inc edi
  jmp loop


endp:
  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
data1:  dd 3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8
ndata1  equ ($ - data1) / 4

