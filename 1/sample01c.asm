; sample01c.asm
;   nasm -fbin sample01c.asm
;   qemu -hda sample01c
BITS 16
%include "debug.asm"
Main:  ;CODE
    mov si, Hello
    call PrintText
    hlt
Hello: ;DATA
    db "Hello ASM!", 0x00
times 510 - ($-$$) db 0
dw 0xAA55

