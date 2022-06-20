_print:
        mov     bl,     14
        mov     ah,     0x0e
        .loop:
                lodsb
                cmp     al,     0
                je      .quit
                int     0x10
                jmp     .loop

        .quit:
                ret

SECTOR2:	equ	0x7e00

_dl:
        mov     ah,     0x02
        mov     bx,     SECTOR2
        mov     al,     2
        mov     dl,     [DISK1]
        mov     ch,     0x00
        mov     dh,     0x00
        mov     cl,     0x02
        int     0x13

        ret

DISK1:	db	0
