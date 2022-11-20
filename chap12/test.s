  section .text
  global  _start
  extern  cos

_start:
  mov eax, 2
  call cos
  mov eax,  1
  mov ebx,  0
  int 0x80
