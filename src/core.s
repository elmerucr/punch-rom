		include	"definitions.i"

		global	core_frame_done_irq
		global	core_load_bin_irq
		global	core_load_lua_irq

		section	TEXT

core_frame_done_irq:
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

core_load_bin_irq:
	; temp hack
	lda	$04c1
	adda	#$23
	sta	$04c1
	rti

core_load_lua_irq:
	; replace irq routine for one that connects to moon/lua

	; turn off all timer interrupts
	clr	TIMER_CR
	; turn off all core interrupts
	clr	CORE_CR

	; make it pink (temp hack)
	lda	#$0f		; refer to surface 7
	sta	BLITTER_DST	; store in index1
	lda	#$cf	; zuurstok
	sta	BLITTER_COLOR
	lda	#%00000100	; clear surface
	sta	BLITTER_CR

	orcc	#%00010000	; disable irqs
	ldx	#exc_irq_lua
	stx	VECTOR_IRQ_INDIRECT
	andcc	#%11101111	; enable irqs

	rti
