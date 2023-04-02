_LVOAddKBInt             EQU -$3c
_LVOAddTimerInt          EQU -$4e
_LVOAddVBlankInt         EQU -$6c
_LVOElapsedTime          EQU -$66
_LVOGetKey               EQU -$30
_LVOGetLanguageSelection EQU -$24
_LVOQueryKeys            EQU -$36
_LVOReadJoyPort          EQU -$1e
_LVORemKBInt             EQU -$42
_LVORemTimerInt          EQU -$54
_LVORemVBlankInt         EQU -$72
_LVOSetJoyPortAttrsA     EQU -$84
_LVOStartTimerInt        EQU -$60
_LVOStopTimerInt         EQU -$5a
_LVOSystemControlA       EQU -$48

CALL_LL MACRO
	move.l	_LOWLEVELBase,a6
	jsr	_LVO\1(a6)
	ENDM

LOWLEVELNAME MACRO
	dc.b    'lowlevel.library',0
	ENDM
