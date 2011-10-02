; sample01b.asm
;   nasm -fbin sample01b.asm
;   qemu -hda sample01b
BITS 16
Main:
    hlt
times 510 - ($-$$) db 0
dw 0xAA55

