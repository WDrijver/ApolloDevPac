; test if your core supports db9_read_only $DFF20C
; so 2 joysticks and 2 joypads can be used for 4 players


	include 'registers.i'  ; some saga values

	lea	CHIP,a5
** <cntl>Z single step this
** notice that CHIP is seen as $DFF000 , it got that from 'include/registers.i'


	bsr	detect_joy_seperation
** now <cntl>A completes the subroutine before returning to monam
** it waits until you made any movement on the db9-JOYSTICK
** and then tells you if you have a recent core that can
** see it seperate from the JOYPAD

	move.l	d0,d0
** d0 tels if you have a 4 player core
** d1 is joystick db9_1 but also looks at joypad
** d2 is joystick db9_1
** d3 is joypad buttons
** d4 tells if joypad is connected


	illegal	;done.
** <amiga>Q to quit
** you can do it again with single-step just to see
** what happend




detect_joy_seperation

wait_for_buttonpress
	move.w	JOY1DAT(a5),d1		;joystick & joypad
	beq.s	wait_for_buttonpress
** you need to move the joystick while <cntl>Z to get out of this wait loop
	move.w	JOY1DATO(a5),d2		;joystick only
	move.w	JOY0BUT(a5),d3		;joypad
break
	cmp.w	d2,d1			; compare JOY1DAT & JOY1DATO
	bne	no			; not equal = no
yes
	move.l	#' Yes',d0
	bra.s	next
no
	move.l	#'  No',d0
next
	move.l	#'    ',d4
	btst	#0,d3			;test connected bit (d3=0001)
	beq	no_joypad_connected
	move.l	#' pad',d4
no_joypad_connected
	rts