[org 0x7e00]
	xor     ax,     ax
        mov     ds,     ax
        mov     es,     ax
        mov     bx,     0x8000
                                                                ; Very cool other stuff
        mov     ax,     0x13
        int     0x10

        mov     ah,     02
        int     0x10

	mov	si,	sexy
	call	_print

	jmp	$

%include "src/func.asm"

sexy:	db	"yeet",0x00

times 	2048-($-$$)	db	0
