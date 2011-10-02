ORG 0x7c00
BITS 16
DebugInit:
    jmp 0x0000:.init
.init:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov sp, DebugInit
    jmp DebugEnd

PrintText:
    pushad
    mov edi, 0x8000
.loop:
    lodsb
    test al, al
    je .done
    mov ah, 0x0e
    int 0x10
    jmp .loop
.done:
    popad
    ret

PrintReg:
    pushad
    mov cx, 0x0c
.loop:
    mov ax, si
    shr ax, cl
    and ax, 0x0f
    cmp al, 0x09
    jle .num
.alpha:
    add al, 0x07
.num:
    add al, 0x30
    mov ah, 0x0e
    int 0x10
    test cx, cx
    jz .done
    sub cx, 0x04
    jmp .loop
.done:
    popad
    ret

DebugEnd:
    jmp Main

