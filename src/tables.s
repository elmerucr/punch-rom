		global	punch_icon

		section	RODATA

;punch_icon_0:	db	$00, $08, $0c, $00
;		db	$08, $01, $00, $09
;		db	$02, $04, $00, $06
;		db	$00, $02, $03, $00
;punch_icon_1:	db	$00, $00, $00, $00
;		db	$00, $06, $03, $04
;		db	$00, $09, $0c, $01
;punch_icon_2:	db	$00, $00, $00, $00
;		db	$00, $08, $0c, $00
;		db	$00, $02, $03, $00
;		db	$00, $00, $00, $00
punch_icon:
		db	%00000101	; 0011
		db	%01000000	; 1000
		db	%00010101	; 0111
		db	%00000000	; 0000
		db	%01010100	; 1110
		db	%00000110	; 0012
		db	%10100100	; 2210
		db	%00011010	; 0122
		db	%10010000	; 2100
		db	%01101010	; 1222
		db	%01000110	; 1012
		db	%11111110	; 3332
		db	%01011011	; 1123
		db	%11111001	; 3321
		db	%01101111	; 1233
		db	%11100101	; 3211
		db	%10111111	; 2333
		db	%10010110	; 2112
		db	%11111110	; 3332
		db	%01011011	; 1123
		db	%11111001	; 3321
		db	%00011010	; 0122
		db	%10010000	; 2100
		db	%01101010	; 1222
		db	%01000001	; 1001
		db	%10101001	; 2221
		db	%00000001	; 0001
		db	%01010000	; 1100
		db	%00000101	; 0011
		db	%01000000	; 1000
		db	%00010101	; 0111
		db	%00000000	; 0000 (two padding bits)
