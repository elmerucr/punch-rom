		include	"definitions.i"

		global	exc_illop
		global	exc_swi3
		global	exc_swi2
		global	exc_firq
		global	exc_irq
		global	exc_swi
		global	exc_nmi

		section	TEXT

exc_illop:
exc_swi3:
exc_swi2:
exc_firq:	rti

exc_irq:	lda	TIMER_SR
		beq	exc_irq_core	; no timer check for core
		ldx	#TIMER0_VECTOR_INDIRECT	; it is the timer
		lda	#%00000001
exc_test_tim:	bita	TIMER_SR
		beq	exc_next_tim
		sta	TIMER_SR	; acknowledge interrupt
		jmp	[,x]
exc_next_tim:	asla
		beq	exc_irq_end
		leax	2,x
		bra	exc_test_tim
exc_irq_core:	lda	CORE_SR
		beq	exc_irq_end	; no core end irq
		sta	CORE_SR
		jmp	[CORE_VECTOR_INDIRECT]
exc_irq_end:	rti

exc_swi:
exc_nmi:	rti
