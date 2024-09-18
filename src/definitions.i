; indirect interrupt vectors in ram
VECTOR_ILLOP_INDIRECT	equ	$0100
VECTOR_SWI3_INDIRECT	equ	$0102
VECTOR_SWI2_INDIRECT	equ	$0104
VECTOR_FIRQ_INDIRECT	equ	$0106
VECTOR_IRQ_INDIRECT	equ	$0108
VECTOR_SWI_INDIRECT	equ	$010a
VECTOR_NMI_INDIRECT	equ	$010c
; $010e unused

TIMER0_VECTOR_INDIRECT	equ	$0110
TIMER1_VECTOR_INDIRECT	equ	$0112
TIMER2_VECTOR_INDIRECT	equ	$0114
TIMER3_VECTOR_INDIRECT	equ	$0116
TIMER4_VECTOR_INDIRECT	equ	$0118
TIMER5_VECTOR_INDIRECT	equ	$011a
TIMER6_VECTOR_INDIRECT	equ	$011c
TIMER7_VECTOR_INDIRECT	equ	$011e

CORE_FRAME_DONE_VECTOR_INDIRECT	equ	$0120
CORE_LOAD_BIN_VECTOR_INDIRECT	equ	$0122
CORE_LOAD_SQ_VECTOR_INDIRECT	equ	$0126

COMMANDER		equ	$0b00
COMMANDER_SQ_SR		equ	COMMANDER
COMMANDER_SQ_CR		equ	COMMANDER+$01
COMMANDER_SQ_CR_TIMERS	equ	COMMANDER+$02

; system
CORE		equ	$0800
CORE_SR		equ	CORE
CORE_CR		equ	CORE+$01
CORE_VRAM_PEEK	equ	CORE+$02
CORE_FB_BASE_0	equ	CORE+$04
CORE_FB_BASE_1	equ	CORE+$05
CORE_FB_BASE_2	equ	CORE+$06
CORE_FB_BASE_3	equ	CORE+$07

; blitter
BLITTER		equ	$0e00
BLITTER_SR	equ	BLITTER
BLITTER_CR	equ	BLITTER+$01
BLITTER_SRC	equ	BLITTER+$02
BLITTER_DST	equ	BLITTER+$03
BLITTER_TILE	equ	BLITTER+$04
BLITTER_COLOR	equ	BLITTER+$05
BLITTER_X0	equ	BLITTER+$08
BLITTER_Y0	equ	BLITTER+$0a
BLITTER_X1	equ	BLITTER+$0c
BLITTER_Y1	equ	BLITTER+$0e

; blitter surfaces
BLITTER_S_0	equ	$0400
BLITTER_S_1	equ	$0410
;
;
BLITTER_S_C	equ	$04c0
BLITTER_S_D	equ	$04d0
BLITTER_S_E	equ	$04e0
BLITTER_S_F	equ	$04f0

S_X		equ	$0
S_Y		equ	$2
S_W		equ	$4
S_H		equ	$6
S_B_0		equ	$8
S_B_1		equ	$9
S_B_2		equ	$a
S_B_3		equ	$b
S_F_0		equ	$c
S_F_1		equ	$d
S_INDEX		equ	$f

; timer
TIMER		equ	$0a00
TIMER_SR	equ	TIMER
TIMER_CR	equ	TIMER+$01
TIMER0_BPM	equ	TIMER+$10
TIMER1_BPM	equ	TIMER+$12
TIMER2_BPM	equ	TIMER+$14
TIMER3_BPM	equ	TIMER+$16
TIMER4_BPM	equ	TIMER+$18
TIMER5_BPM	equ	TIMER+$1a
TIMER6_BPM	equ	TIMER+$1c
TIMER7_BPM	equ	TIMER+$1e

; sound / sid / analog / mixer
SND	equ	$0c00

SID0	equ	SND		; sid0 base
SID0F	equ	SID0+$00
SID0P	equ	SID0+$02
SID0VC	equ	SID0+$04
SID0AD	equ	SID0+$05
SID0SR	equ	SID0+$06
SID0V	equ	SID0+$1b

SID1	equ	SND+$20		; sid1 base
SID1F	equ	SID1+$00
SID1P	equ	SID1+$02
SID1VC	equ	SID1+$04
SID1AD	equ	SID1+$05
SID1SR	equ	SID1+$06
SID1V	equ	SID1+$1b

SID2	equ	SND+$40
SID2F	equ	SID2+$00
SID2P	equ	SID2+$02
SID2VC	equ	SID2+$04
SID2AD	equ	SID2+$05
SID2SR	equ	SID2+$06
SID2V	equ	SID2+$1b

SID3	equ	SND+$60
SID3F	equ	SID3+$00
SID3P	equ	SID3+$02
SID3VC	equ	SID3+$04
SID3AD	equ	SID3+$05
SID3SR	equ	SID3+$06
SID3V	equ	SID3+$1b

;ANA0	equ	SND+$04		; analog0 base
;ANA0P	equ	ANA0+$02

SNDM	equ	SND+$190	; mixer base
SNDM0L	equ	SNDM+$00
SNDM0R	equ	SNDM+$01
SNDM1L	equ	SNDM+$02
SNDM1R	equ	SNDM+$03
MXAN0L	equ	SNDM+$08
MXAN0R	equ	SNDM+$09
MXAN1L	equ	SNDM+$0a
MXAN1R	equ	SNDM+$0b
MXAN2L	equ	SNDM+$0c
MXAN2R	equ	SNDM+$0d
MXAN3L	equ	SNDM+$0e
MXAN3R	equ	SNDM+$0f
