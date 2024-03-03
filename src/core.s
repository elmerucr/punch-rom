		include	"definitions.i"

		global	core_irq

		section	TEXT

core_irq:
	lda	#$0f		; refer to surface 7
	sta	BLITTER_DST	; store in index1
	lda	#%00000100	; clear surface
	sta	BLITTER_CR
	lda	#$0e
	sta	BLITTER_SRC
	lda	#$0d
	sta	BLITTER_TILE
	lda	#%00000010
	sta	BLITTER_CR
	rti
