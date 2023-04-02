;*
;*	$VER: cgxvideo.h 41.11 (01.08.1998)
;*
;*	include file for cgxvideo.library
;*
;*	Copyright © 1996-1998 by phase5 digital products
;*      All Rights reserved.
;*



			IFND	LIBRARIES_CGXVIDEO_I
LIBRARIES_CGXVIDEO_I	SET	1

	INCLUDE "exec/types.i"

;;;;typedef APTR    VLayerHandle;


VOA_LeftIndent		EQU	$88000001
VOA_RightIndent		EQU	$88000002
VOA_TopIndent		EQU	$88000003
VOA_BottomIndent	EQU	$88000004

VOA_SrcType		EQU	$88000005
VOA_SrcWidth		EQU	$88000006
VOA_SrcHeight		EQU	$88000007

VOA_Error		EQU	$88000008

VOA_UseColorKey		EQU	$88000009

VOA_UseBackfill		EQU	$8800000a

VOA_BaseAddress		EQU	$88000030
VOA_ColorKeyPen		EQU	$88000031
VOA_ColorKey		EQU	$88000032

;
; possible errors returned with VOA_Error tag
;

VOERR_OK		EQU	0	; No error
VOERR_INVSCRMODE	EQU	1	; video overlay not possible for that mode
VOERR_NOOVLMEMORY	EQU	2	; No memory for video overlay
VOERR_INVSRCFMT		EQU	3	; Source format not supported
VOERR_NOMEMORY		EQU	4	; Not enough memory

;
; Source data types
; see cgxvideo.doc for more info
;

SRCFMT_YUV16		EQU	0
SRCFMT_YCbCr16		EQU	1
SRCFMT_RGB15PC		EQU	2	/* for historical reasons this format is byte swapped */
SRCFMT_RGB16PC		EQU	3	/* for historical reasons this format is byte swapped */

			ENDC
