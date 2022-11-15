  section .text
  global  _start
  extern  print_eax_int
  extern  max_abs
  extern  print_eax

_start:
  ;mov eax, -12

  mov ebx,  data1
  mov ecx,  ndata
  ;call  print_eax_int
  ;mov eax,  0xffffffff
  ;call  print_eax_int
  ;call  print_eax_int

  call  max_abs
  call  print_eax_int

  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
data1:  dd  -5,5
ndata:  equ ($ - data1) / 4
