* apollo float example
* 080 only
* try this after you have seen 'float.s'



	move.w	#1000,d0	;1000

** 080 = banked float **
** you can see that by changing preference **
** <cntl>P "preferences" **
** 'bank decoder Y/N' **

	fmove.w	d0,fp0		;1e3

** d0 can be viewed as decimal **
** <amiga>1 **
** use (shift)arrows to move up/down **
** or
** use <amiga>C "Change Register window: [da e3 fb  pc]" **
** type 'd f e9  pc' **
** (d <space> fb <space> e9 <space> <space> pc) **

	fmovecr	#0,fp1		; pi (rom constant 0)
	fmul	fp1,fp0,e1	; pi * 1000

** N shows '.bank 0,0,eor%01.001'
**          'fmul.x fp0,fp0'

	fmove.l	e1,d1

** float presentation can be changed **
** <cntl>P "preferences" **
** hit enter until you see 'avoid exponent in float Y/N' **
** Y for 3141.592653 **
** N for 3.141592653+e003 **

	fmovecr	#$34,fp2	; 100 (rom constant $34)
	fmovecr #$33,fp3	; 10  (rom constant $33)
	fmul	fp3,fp2,e4	; 1000
	fmove.l	e4,d2

	illegal			; prevent to go on
	rts			; end program

** change registers **
** <amiga>r 'register = value' **
** type 'fp6=12345' **
** <amiga>r 'register = value' **
** type 'fp7=\12345' **

** <cntl>C to cancel **
** or <amiga>Q quit **

