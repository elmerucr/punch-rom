		include	"definitions.i"

		global	rom_version
		global	exc_reset


		section	TEXT

rom_version:	db	'rom v0.2 20240119',0

exc_reset:	; set stackpointers
		lds	#$0400		; this write to sp will enable nmi's as well
		ldu	#$f000		; initial value might be changed by software

		jsr	init_vectors

		; set framebuffer base
		lda	#$ff
		sta	CORE_FB_BASE_1
		sta	BLITTER_S_F+S_B_1
		clra
		clrb
		std	CORE_FB_BASE_2
		std	BLITTER_S_F+S_B_2

		; set surface $f
		ldd	#$0140
		std	BLITTER_S_F+S_W
		ldd	#$00b4
		std	BLITTER_S_F+S_H

		ldx	#test
		stx	TIMER0_VECTOR_INDIRECT

		lda	#$05		; blue drawing color initially
		sta	$0e05

		ldd	#100		; 100 bpm
		std	TIMER0_BPM
		lda	#%00000001
		sta	TIMER_CR	; activate timer 0
		sta	CORE_CR		; activate core screen refresh irq

		andcc	#%10101111	; enable firq/irq

		jsr	sound_reset

.1		bra	.1		; endless loop

test:		inc	$0e05
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
