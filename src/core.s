		global	core_irq


		section	TEXT

core_irq:
	lda	#$0f		; refer to surface 7
	sta	$0e03		; store in index1
	lda	#%00000100	; clear surface
	sta	$0e01
	rti
