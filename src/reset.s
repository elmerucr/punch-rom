		include	"definitions.i"

		global	rom_version
		global	exc_reset


		section	TEXT

rom_version:	db	'punch rom v0.4 20241124',0

exc_reset:	; set stackpointers
		lds	#$0400		; this write to sp will enable nmi's as well
		ldu	#$fc00		; initial value might be changed by software

		jsr	init_vectors

		; setup logo in surface $c
		ldd	#$0007
		std	BLITTER_S_C+S_W
		ldd	#$0012
		std	BLITTER_S_C+S_H
		lda	#%00010000			; 2 bit color mode = 4 colors
		sta	BLITTER_S_C+S_F_0
		lda	#%00000001
		sta	BLITTER_S_C+S_F_1
		clr	BLITTER_S_C+S_F_2
		clr	BLITTER_S_C+S_B_0
		clr	BLITTER_S_C+S_B_1
		ldx	#punch_icon
		stx	BLITTER_S_C+S_B_2
		ldd	#153
		std	BLITTER_S_C+S_X
		ldd	#83
		std	BLITTER_S_C+S_Y

		; tiles in $d
		ldd	#$0005
		std	BLITTER_S_D+S_W
		ldd	#$0001
		std	BLITTER_S_D+S_H
		lda	#%00000010
		sta	BLITTER_S_D+S_F_0
		clr	BLITTER_S_D+S_F_1
		clr	BLITTER_S_D+S_B_0
		clr	BLITTER_S_D+S_B_1
		ldx	#rom_version
		stx	BLITTER_S_D+S_B_2
		ldd	#151
		std	BLITTER_S_D+S_X
		ldd	#104
		std	BLITTER_S_D+S_Y

		lda	#$32
		sta	$0bd1	; fg color for text?

		clr	$0bc1
		clr	$0bc2
		clr	$0bc3
		lda	#$11
		sta	$0bc4
		lda	#$22
		sta	$0bc5
		lda	#$33
		sta	$0bc6
		lda	#$22
		sta	$0bc7
		lda	#$11
		sta	$0bc8

		ldx	#color_loop
		stx	TIMER0_VECTOR_INDIRECT

; copy logo data (actually rom to vram so we have logo visible to blitter)
		ldx	#$fc00
.1		lda	,x
		sta	,x+
		cmpx	#$0000
		bne	.1

; set timer
		ldd	#600		; 600 bpm
		std	TIMER0_BPM
		lda	#%00000001
		sta	TIMER_CR	; activate timer 0

; activate interrupts
		lda	#%00001111	; core frame_done, load_bin, load_lua and load_squirrel irqs enabled
		sta	CORE_CR

		andcc	#%11101111	; enable irq's

		jsr	sound_reset

.2		sync
		bra	.2		; endless loop to sync

color_loop:	lda	$0bc1
		ldx	#$0bc2
.1		ldb	,x
		stb	,-x
		leax	2,x
		cmpx	#$0bc9
		bne	.1
		sta	$0bc8

		rti

init_vectors:	pshu	y,x,b,a

		ldx	#vector_table
		ldy	#VECTOR_ILLOP_INDIRECT
.1:		ldd	,x
		std	,y
		leax	2,x
		leay	2,y
		cmpx	#vector_table+48
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
 		dw	$0000

 		dw	timer0_irq
 		dw	timer1_irq
 		dw	timer2_irq
 		dw	timer3_irq
 		dw	timer4_irq
 		dw	timer5_irq
 		dw	timer6_irq
 		dw	timer7_irq

		dw	core_frame_done_irq
		dw	core_load_bin_irq
		dw	$0000
		dw	core_load_squirrel_irq
		dw	$0000
		dw	$0000
		dw	$0000
		dw	$0000
