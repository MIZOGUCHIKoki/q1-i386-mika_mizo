  section .text
  global  max_abs
max_abs:
  push  esi
  push  edi
  push  edx
  push  ecx
  push  ebx


  mov eax,    0       ; 最大値
;
loop0:
  cmp ecx,    0       ; esi ? 0
  je  endp            ; esi == 0 -> endp
  dec ecx

  mov esi,  [ebx]
  cmp esi,  0
  jg  then
  mov edx,  0x00000000
  sub edx,  esi
  mov eax,  edx

  
then:
  cmp eax,    [ebx]   ; ebx ? esi
  jl maxx            ; ebx >= [data1]
  add ebx,    4
  jmp loop0
  maxx:
    mov eax,    [ebx]   ;
    add ebx,    4
    jmp loop0

endp:
  pop ebx
  pop ecx
  pop edx
  pop edi
  pop esi
  ret
