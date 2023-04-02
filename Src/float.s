* float example *



	move.w	#1000,d0	;1000

** use <cntl>Z or Y or W to single_step trough **
** use <cntl>C to cancel **

	fmove.w	d0,fp0		;1e3

** d0 can be viewed as decimal **
** use <amiga>C "Change Register window: [da e3 fb  pc]" **
** type 'd fb  pc' **
** (d <space> fb <space> <space> pc) **

	fmovecr	#0,fp1		; pi (rom constant 0)
	fmul	fp0,fp1		; pi * 1000
	fmove.l	fp1,d1

** float presentation can be changed **
** <cntl>P "preferences" **
** hit enter until you see 'avoid exponent in float Y/N' **
** Y for 3141.592653 **
** N for 3.141592653+e003 **

	fmovecr	#$34,fp2	; 100 (rom constant $34)
	fmovecr #$33,fp3	; 10  (rom constant $33)
	fmul	fp3,fp2		; 1000
	fmove.l	fp2,d2

	illegal			; prevent to go on
	rts			; end program

** change registers **
** <amiga>r 'register = value' **
** type 'd3=d1*d2 **


** <cntl>C to cancel **
** or <amiga>Q quit **

