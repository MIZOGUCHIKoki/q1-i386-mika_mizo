  section .text
  global  _start
  extern  print_eax
  extern  print_eax_hex
  extern  mul_10k
  extern  mul_edx

_start:
  mov eax,  data
  mov edx,  data2
  call  mul_10k
  call  print_eax

mov eax,  1
int 0x80

  section .data
data: equ 2
data2: equ 3
