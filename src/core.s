		include	"definitions.i"

		global	core_fd_irq
		global	core_ri_irq

		section	TEXT

core_fd_irq:
	lda	#$0f		; refer to surface 7
	sta	BLITTER_DST	; store in index1
	clr	BLITTER_COLOR
	lda	#%00000100	; clear surface
	sta	BLITTER_CR

	lda	#$0c
	sta	BLITTER_SRC
	lda	#%00000001
	sta	BLITTER_CR

	lda	#$0e
	sta	BLITTER_SRC
	lda	#$0d
	sta	BLITTER_TILE
	lda	#%00000010
	sta	BLITTER_CR
	rti

core_ri_irq:
	lda	$04c1
	adda	#$23
	sta	$04c1
	rti
