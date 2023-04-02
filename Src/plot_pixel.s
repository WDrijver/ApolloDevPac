

	move.l	#$dfe1ec,a1	; screen addres
	move.l	(a1),a1		; where it points to
** use <cntl>Z to step trough

        move.l  #$12345678,8(a1)	; change pixel top-left corner
** it is like writing, starts top-left. then left to right. line by line.

	move.l	#$dfe1f4,a2	; video mode addr
	move.w	(a2),d0		; resolution and pixel format
	cmp.b	#5,d0		; 32 bit color?
	beq.s	good_format
	jmp	wrong_pixelformat
good_format
	lsr.w	#8,d0		; resolution
	lea	resolution,a2
	move.w	(a2,d0*2),d1	; resolution in pixels
	jmp	next_instruction

	DATA
resolution
	dc.w 0,320,320,320,640,640,640,960,480
	dc.w 304,1280,640,800,1024,720,848,640

	CODE
next_instruction
	move.l	#$ff0000,(a1)	; red pixel in top-left corner
	move.l	#$00ff00,(a1)	; green pixel
	move.l	#$0000ff,(a1)	; blue

	move.l	#$ff00ff,(a1)	; red+blue looks purple
	move.l	a1,a2		; screen

	move.w	#5,d2		; 5 times
	bra.s	pixel_plot_end_check
pixel	move.l	#$00ff00,(a2)+	; plot pixel and point to the next one
pixel_plot_end_check
	dbra	d2,pixel

	move.l	a1,a2		; screen
	adda.w	d1,a2		; add pixels_a_line
	move.l	#$ff0000,(a2)	; red pixel

	move.l	a1,a2		; try again
	move.w	d1,d2		; number of pixels in a line
	asl.w	#2,d2		; pixels size is 4 so x4
	adda.w	d2,a2		; point to next line
	move.l	#$ff00ff,(a2)	; plot purple pixel
	
	illegal			; end


	DATA
b	dc.b	%1110
	dc.b	%1001
	dc.b	%1110
	dc.b	%1001
	dc.b	%1110
	CODE


wrong_pixelformat
	lea	message,a0
	illegal

	DATA
message	dc.b 'exit and set a 32bit color mode',0
** <cntl>C or <amiga>Q **
	CODE