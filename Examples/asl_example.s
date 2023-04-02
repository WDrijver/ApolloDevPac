; Description:	
;	Very simple example of ASL.library usage in 68ASM,and few AOS functions. 
;	It bring ASL file requester and prints selected file path, on next line selected file.
;	Then just prints file content (preferably txt) in CLI window.
; Author: pisklak
; Licence: Public domain
; Warning: This source file is "as is" and I iam not responsible to any potential damage it might cause.

	INCLUDE dos/dos.i
    INCLUDE dos/dos_lib.i
    INCLUDE exec/exec_lib.i 
	INCLUDE libraries/asl.i
	INCLUDE libraries/asl_lib.i
	
	
call MACRO
     jsr _LVO\1(a6)
     ENDM 

; start by loading asl and dos libraries	 
	move.l 	4,_ExecBase
	move.l _ExecBase,a6			
	lea 	aslname,a1		; load asl name into A1
	move.l 	#0,d0			; load any version
	CALLEXEC OpenLibrary		; Open asl  library 
	move.l	d0,_ASLBase		; store aslbase
	beq	badend			; if it is 0 then exit with error code

	move.l _ExecBase,a6		
	lea 	dosname,a1		; load dos name into A1
	move.l 	#0,d0			; load any version
	CALLEXEC OpenLibrary		; Open dos  library 
	move.l	d0,_DOSBase		; store dosbase
	beq	badend			; if it is 0 then exit with error code

; print some short start message
	move.l	#welcome_msg,d1		; load welcome string in d1
	CALLDOS	PutStr			; and print message

; working with asl.lib functions AllocAslRequest and AslRequest
	move.l	_ASLBase,a6		; load aslbase in a6
	move.l 	#ASL_FileRequest,d0	; requester type = file request value from include
	move.l	#0,a0			; taglist is optional - we go lazy/easy mode :P
	call 	AllocAslRequest		; execute AllocAslRequest	
	move.l 	d0,my_request		; store allocated requester structure addr
	beq	badallocreq		; if error do some cleanu and exit
	
	move.l	my_request,a0		; our requester 
	move.l	#0,a1			; tags are optional - again lazy route
	call	AslRequest		; start our requester
	beq	user_cancel

; print minimal usefull data -  drawer and selected file
print_selection:
	move.l	my_request,a2		; load our requester struck addr in a2	
	move.l	fr_Drawer(a2),d1	; acces struct field with fields names from include 
	CALLDOS	PutStr			; PutString
	move.l	#LF_str,d1		; that is simple LF = newline
	CALLDOS PutStr
	move.l	fr_File(a2),d1
	CALLDOS PutStr
	move.l	#LF_str,d1
	CALLDOS PutStr
	
	move.l my_request,a2
	move.l	#256,d0
	move.l	fr_Drawer(a2),a0
	lea	fullpath,a1
	CALLEXEC CopyMem		; copy drawer string to our buffer
	
	move.l	#fullpath,d1
	move.l	fr_File(a2),d2
	move.l	#256,d3
	CALLDOS	AddPart			; add path and file parts
	
	move.l	#fullpath,d1
	CALLDOS	PutStr
	move.l	#LF_str,d1		; print full path
	CALLDOS	PutStr
	
; read and print our file
readfile:
	move.l	#fullpath,d1		; full path to our file 
	move.l	#MODE_OLDFILE,d2
	CALLDOS	Open
	move.l	d0,filehandle
	bne	.print_data
	move.l	#error_file_msg,d1
	CALLDOS	PutStr
	bra end
		
.print_data	
; 1st we should clear our buffer
	lea fullpath,a0
	move.w	#256-1,d1
.clear_loop	
	move.b	#0,(a0)+
	dbf	d1,.clear_loop	

; now we can read portion of data - in this case 256 bytes is our whole buffer 	
	move.l	filehandle,d1
	move.l	#fullpath,d2
	move.l	#256,d3
	CALLDOS Read
	beq	.end
	move.l	#fullpath,d1
	CALLDOS	PutStr
	bra	.print_data

.end
	move.l	#LF_str,d1
	CALLDOS	PutStr	
	bra 	end

; if user canceled requester print message and exit 
user_cancel:
	move.l	#cancel_msg,d1
	CALLDOS	PutStr
	bra 	end	
	
; if mem for requester struct can not be allocated close asl.lib and exit with error	
badallocreq:
	move.l	#error_allocreq,d1
	CALLDOS PutStr			; macro take care of a6
	move.l	_ExecBase,a6		; actually CALLEXEC macro do this 
	move.l	_ASLBase,a1
	CALLEXEC CloseLibrary		; close asl lib	
	move.l	_DOSBase,a1
	CALLEXEC CloseLibrary		; close dos lib
	move.l	#20,d0
	rts				; exit with error code

; if asl or dos lib can not be opened exit with error code
badend:
	move.l #20,d0
	rts

; end - dealloc requester struct mem and close all libs
end:
	move.l	_ASLBase,a6
	move.l	my_request,a0
	call	FreeAslRequest		; FreeAslRequest - dealloc requester struct
	move.l	_ASLBase,a1
	CALLEXEC CloseLibrary
	
	move.l	filehandle,d1
	beq	.closedos
	CALLDOS	Close			; close file - if was opened
.closedos
	move.l	_DOSBase,a1
	CALLEXEC CloseLibrary		;close our libs
	move.l	#0,d0
	rts	
		
; data section should be EVEN here I guess but Devpac take care of .l declarations I think anyway

_ExecBase	dc.l 0
_DOSBase	dc.l 0 
_ASLBase	dc.l 0 		

my_request	dc.l 0
filehandle	dc.l 0

aslname			dc.b 'asl.library',0
dosname			dc.b 'dos.library',0

welcome_msg		dc.b 'Starting ASL file requester!!!',10,0
error_allocreq	dc.b 'Can not allocate memory for requester!',10,0
cancel_msg		dc.b 'User canceled selection!',10,0
error_file_msg	dc.b 'Can not open file!',10,0
LF_str			dc.b 10,0
fullpath	ds.b 256
safetyEOL	dc.l 0		