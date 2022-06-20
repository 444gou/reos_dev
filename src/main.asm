[bits 16]
[org 0x7c00]
[global _start]

_start:								; Segment stuff
	xor	ax,	ax
	mov	ds,	ax
	mov	es,	ax
	mov	bx,	0x8000
								; Very cool other stuff
	mov	ax,	0x13
	int	0x10

	mov	ah,	02
	int	0x10

	mov	si,	title
	call	_print

	mov	ah,	0x02
	mov	bh,	0x00
	mov	dh,	0x05
	mov	dl,	0x03
	int	0x10

	mov	si,	string
	call	_print

	mov	ah,	0x03
	mov	si,	string2
	call	_print

	mov	ah,	0x04
	mov	si,	string3
	call	_print

	mov	[DISK1],	dl
	mov	bp,	0x7c00
	mov	sp,	bp
	mov	si,	0x00

	call	_dl

	mov	ah,	0x0e
	mov	al,	[SECTOR2]
	int	0x10
 
	jmp	SECTOR2

%include "src/func.asm"

seks:		db	"sex",0x00
string: 	db      "'Leave simpleness, and live,",0x0d,0x0a,0x00
string2:	db	" and walk in the way of insight.'",0x0d,0x0a,0x00
string3:	db	" - Proverbs 9:6 RSVCE",0x00
title:		db	"Bootsector test @ 21-03-2022",0x0d,0x0a,0x00

times (510 - ($ -$$))	db	0x00
dw	0xAA55
