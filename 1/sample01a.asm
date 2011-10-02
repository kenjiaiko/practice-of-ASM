; sample01a.asm
;   nasm -fbin sample01a.asm
;   qemu -hda sample01a
BITS 16
Main:
    hlt
times 510 - ($-$$) db 0
dw 0xAA55

