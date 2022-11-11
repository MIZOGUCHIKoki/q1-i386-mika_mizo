  section .text
  global  _start
  extern  print_eax
  extern  print_eax_hex
  extern  mul_10k
  extern  mul_edx

_start:
  call  print_eax_hex

mov eax,  1
int 0x80

  section .data
data: equ 200
