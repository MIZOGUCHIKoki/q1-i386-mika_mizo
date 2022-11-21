  section .text
  global  _start
  extern  cos, print_eax_frac

_start:
  call cos
  mov eax,  1
  mov ebx,  0
  int 0x80
