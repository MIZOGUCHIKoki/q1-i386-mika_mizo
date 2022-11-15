  section .text
  global  _start
  extern  print_eax_int
  extern  max_abs
  extern  print_eax

_start:
  mov eax,  0xffffffff

  mov ebx,  data1
  mov ecx,  ndata
  call  print_eax_int

  call  max_abs
  call  print_eax

  mov eax,  1
  int 0x80

  section .data
data1:  dd  1,2,3,4,5,6,-7,-10
ndata:  equ ($ - data1) / 4
