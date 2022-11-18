  section .text
  global  _start

_start:

  mov eax,  1
  mov ebx,  0
  int 0x80

  section .data
data1:  dd  -5,5,-10,2,10
ndata:  equ ($ - data1) / 4
