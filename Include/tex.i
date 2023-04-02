*
*	Some macros for apollo specific instructions
*

; tex8_64 a,x,y,d
; An 0..7 texture pointer
; aX 0..7 an ,  hi_16_bit=number low_16_bit=fraction
; aY 0..7 same
; Dn 0..31 d0..7 & e0..23
; opcode dc.w $fe3A,$XD3e,$Y0S0+T
; Size 0,3,5,6 (for 64,128,256,512)
; Tex_mode 0,$201,$682 (for 8,16,24_dtx)

; examples

	;tex8_64	1,2,3,4		;tex8.64 (a1(a2,a3)),d4
	;tex16_256 7+8,2,3,23+8	;tex16.256 (b7(a2,a3)),e23

; note: tex24 uses nvidia-dtx1 compressed texture!




AMMX_TEX	MACRO	
	dc.w	((\1)&7)+(((\1)&8)<<5)+(((\4)&$10)<<2)+$fe30 ; A , msb_A , msb_D
	dc.w	((\2)&7)<<12+((\4)&$f)<<8+$3e	; X , D
	dc.w	((\3)&7)<<12+\5+$8800		; Y
	ENDM

tex8_64	MACRO
	AMMX_TEX	\1,\2,\3,\4,0
	ENDM
tex8_128	MACRO
	AMMX_TEX	\1,\2,\3,\4,$30
	ENDM
tex8_256	MACRO
	AMMX_TEX	\1,\2,\3,\4,$50
	ENDM
tex8_512	MACRO
	AMMX_TEX	\1,\2,\3,\4,$60
	ENDM

tex16_64	MACRO
	AMMX_TEX	\1,\2,\3,\4,$201
	ENDM
tex16_128	MACRO
	AMMX_TEX	\1,\2,\3,\4,$231
	ENDM
tex16_256	MACRO
	AMMX_TEX	\1,\2,\3,\4,$251
	ENDM
tex16_512	MACRO
	AMMX_TEX	\1,\2,\3,\4,$261
	ENDM

tex24_64	MACRO
	AMMX_TEX	\1,\2,\3,\4,$602+$80
	ENDM
tex24_128	MACRO
	AMMX_TEX	\1,\2,\3,\4,$632+$80
	ENDM
tex24_256	MACRO
	AMMX_TEX	\1,\2,\3,\4,$652+$80
	ENDM
tex24_512	MACRO
	AMMX_TEX	\1,\2,\3,\4,$662+$80
	ENDM



	;tex8_256 0,2,3,0
	;dc.w $fe30,$203e,$b850 ;tex8.256 (a0,(a2,a3)),d0
	;tex16_256 0,2,3,0
	;dc.w $fe30,$203e,$ba51 ;tex16.256(a2,a3)),d0
	;tex24_256 0,2,3,2
	;dc.w $fe30,$223e,$bed2 ;text24.256 (a0(a2,a3))*8,d2 	

