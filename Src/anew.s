; apollo new integer instruction example
; 080 only
; and a recent core (because sa7.4 does not work)

; this might be unsupported by apollo
; because there is ammx that can do that quad.
; who knows.

; CLI
; EXECUTE anew_script   ; that will assemble and run the debugger

; use <cntl>Z to single-step trough them and see the results.
; all commands are listed in 'command summary'
; a printed version is handy to have nearby.


	
	lea	some_numbers,a1
	movem.w	(a1),d0/d1/d2/d3 ;4 8 3 9

** <cntl>Z steps trough code **

	min.w	d0,d1
	max.w	d2,d3
	pavgb	d2,d3,d4
	andn.w	d4,d0

	move.l	#70000,d5
loop
	addq.l	#3,b0
	dbra.l	d5,loop

** <cntl>A stops AFTER the current instruction **

	movem.w	8(a1),d0/d1/d2/d3

	abs.w	d1,d3
	cmpiw.l	#24,(a0)

	move.l	(a1)+,b0
	move.l	(a1)+,b1
	move.l	(a1)+,b2
	move.l	(a1)+,b3

	move2	a7,d6:d7
	sub.w	a4,b2
	andn.l	b1,a5
	cmp.l	b3,a0
	cmp.l	b3,d0
	eor.l	b0,a2

	illegal


** <cntl>C to cancel **
** or <amiga>Q quit **

some_numbers
	dc.w	4,8,3,9
	dc.w	1234,-83,321,7473