
	include exec/execbase.i
	include exec/exec_lib.i
	include dos/dos.i
	include dos/dos_lib.i
	
MAIN:

.open
    lea      DOSNAME(pc),a1          ; Name
    moveq.l  #36,d0                  ; Version
    CALLEXEC OpenLibrary             ; OpenLibrary(name,version)
    move.l   d0,_DOSBase             ; Dos->Base

.attn
	clr.l    d6
	nop
	move.w   AttnFlags(a6),d6
	move.w   d6,ARGS

.getattns
	move.l   #TEMPLATE,d1
	move.l   #ARGS,d2
	CALLDOS  VPrintf

.detect
	btst.l   #10,d6                  ; Exec->AttnFlags->Bit10
	bne.s    .apollo                 ; Bit10 = 1
	move.l   #NOTDETECTED,d1         ; Bit10 = 0
	CALLDOS  PutStr
	bra.s    .close
.apollo
	move.l   #DETECTED,d1
	CALLDOS  PutStr
	
.close
    movea.l  _DOSBase,a1             ; Dos->Base
    CALLEXEC CloseLibrary            ; CloseLibrary(base)

.done
    moveq.l  #0,d0                   ; DOS Return Code
    rts                              ; Exit program

	EVEN
_DOSBase     dc.l 0
ARGS:        dc.l 0

    EVEN
DOSNAME:     dc.b "dos.library",0
TEMPLATE:    dc.b "Exec->AttnFlags: 0x%04x.",10,0
DETECTED:    dc.b "AC68080 detected.",10,0
NOTDETECTED: dc.b "AC68080 not detected.",10,0

    END
