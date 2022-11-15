  section .text
  global  _start
  extern  print_eax_int

_start:
  mov eax,  0xffff0000
  call  print_eax_int

  mov eax,  1
  int 0x80
