  ; eax を出力
  section .text
  global  print_eax_frac
  
  ndigit equ  34

print_eax_frac:
  push ebx
  push ecx
  push edx
  push edi
  push esi
  push  eax
  mov esi,  1    ; 桁数

D_Part: ; 少数出力部
  mov ecx,  buf + 9    ; 小数部アドレス番地先頭 .Xxxx
  and eax,  0x00ffffff
  mov ebx,  eax


loopD:
  mov eax,  0
  shl ebx,  2
  add eax,  ebx
  shl ebx,  8
  add eax,  ebx     ; eax*10 process

  and ebx,  0x00ffffff
  
  shr eax,  24
  inc ecx
  add al, '0'
  mov [ecx],  al

  inc esi

  cmp ebx,  0
  jne loopD

  mov dl, '.'
  mov [buf + 8],  dl
  dec ecx
  inc esi
  
Z_Part: ; 整数出力部
  mov ecx,  buf + 7
  pop eax
  shr eax,  24
  push eax    ; 符号付き
  push  eax ; 絶対値
  ; eaxの桁数をカウント
  mov edi,  10   ; 割る数
countK:
  mov edx,  0     
  div edi         ; edx eax / edi = eax 1932 / 10 = 193
  cmp eax,  0
  je writeProcess
  inc esi          ; 桁数++
  jmp countK

writeProcess:
  mov edi,  10                ; 割る数

  pop eax   ; 絶対値
loop0:
  mov edx,  0
  dec ecx                 ; 次の書き込み先
  div edi                 ; N / 10 = eax, mod edx
  add dl, '0'
  mov [ecx], dl           ; 書き込み
  cmp eax,  0
  jne loop0

  pop eax   ; 符号付き
  cmp eax,  128
  jl wp
  mov dl, '-'
  mov [ecx - 1], dl
  dec ecx
  inc esi                 ; 桁数

wp:
  mov ecx,  buf
  mov eax,  4             ; write システムコール番号
  mov ebx,  1             ; 出力先番号（1=標準出力）
  add esi,  1             ; 改行を含めた長さ
  mov edx,  esi           ; 改行を含めた長さ
  int 0x80

  pop esi
  pop edi
  pop edx
  pop ecx
  pop ebx
  ret
 section .data
buf:  times ndigit  db  0     ; ndigitバイト領域(2^32の桁数)
      db  0x0a                ; 改行
