		include	"definitions.i"

		global	rom_version
		global	exc_reset


		section	TEXT

rom_version:	db	'rom v0.2 20240110',0

exc_reset:	; set stackpointers
		lds	#$0400		; this write to sp will enable nmi's as well
		ldu	#$f000		; initial value might be changed by software

		jsr	init_vectors

		ldx	#test
		stx	TIMER0_VECTOR_INDIRECT

		ldd	#100		; 100 bpm
		std	TIMER0_BPM
		lda	#%00000001
		sta	TIMER_CR	; activate timer 0
		sta	CORE_CR		; activate core screen refresh irq

		andcc	#%10101111	; enable firq/irq

		jsr	sound_reset

.1		bra	.1		; endless loop

test:		pshu	a
		lda	$05f0
		inca
		sta	$05f0
		pulu	a
		rti

init_vectors:	pshu	y,x,b,a

		ldx	#vector_table
		ldy	#VECTOR_ILLOP_INDIRECT
.1:		ldd	,x
		std	,y
		leax	2,x
		leay	2,y
		cmpx	#vector_table+32
		bne	.1

		pulu	y,x,b,a
		rts

vector_table:	dw	exc_illop
 		dw	exc_swi3
 		dw	exc_swi2
 		dw	exc_firq
 		dw	exc_irq
 		dw	exc_swi
 		dw	exc_nmi
 		dw	core_irq
 		dw	timer0_irq
 		dw	timer1_irq
 		dw	timer2_irq
 		dw	timer3_irq
 		dw	timer4_irq
 		dw	timer5_irq
 		dw	timer6_irq
 		dw	timer7_irq
