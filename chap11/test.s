  section .text
  global  _start
  extern  print_eax_int

_start:
  mov eax,  0xffffffff
  call  print_eax_int

  mov eax,  1
  int 0x80
