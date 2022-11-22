        section .text
        global  add2
; 2数の和を返す.
; int add2(int a, int b);
add2:
        mov     eax, [esp + 4]  ; 第1引数 a を読み出す
        add     eax, [esp + 8]  ; 第2引数 b を加える
        ret
