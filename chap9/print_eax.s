  ; eax を出力
ndigit: equ 10
  section .text
  global  print_eax

print_eax:
  push ebx
  push ecx
  push edx
  push edi
  push esi
  push eax

  ; eaxの桁数をカウント
  mov edi,  10   ; 割る数
  mov esi,  1    ; 桁数
countK:
  mov edx,  0     
  div edi         ; edx eax / edi = eax 1932 / 10 = 193
  cmp eax,  0
  je endcountK
  inc esi          ; 桁数++
  jmp countK

endcountK:
  mov esi,  esi   ; 桁数を確定 （いらない）

writeProcess:
  mov ecx,  buf + ndigit
  ; mov ecx,  buf + esi   ; 作業領域の末尾の次の番地
  mov edi,  10
  ;mov eax,  N
  pop eax
  push eax
loop0:
  mov edx,  0
  dec ecx                 ; 次の書き込み先
  div edi                 ; N / 10 = eax, mod edx
  add dl, '0'
  mov [ecx], dl           ; 書き込み
  cmp eax,  0
  jne loop0

  mov eax,  4             ; write システムコール番号
  mov ebx,  1             ; 出力先番号（1=標準出力）
  add esi,  1             ; 改行を含めた長さ
  mov edx,  esi           ; 改行を含めた長さ
  int 0x80

  pop eax
  pop esi
  pop edi
  pop edx
  pop ecx
  pop ebx
  ret


 section .data
buf:  times ndigit  db  0     ; ndigitバイト領域(2^32の桁数)
      db  0x0a            ; 改行
