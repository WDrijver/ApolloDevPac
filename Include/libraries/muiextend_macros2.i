	IFND	MUIEXTEND_MACROS2_I
MUIEXTEND_MACROS2_I	SET	1



MUIE_OBJECT	MACRO
\1_S	SET	0		; Need String
\1_T	SET	1		; Need TagList
	dc.l	0		; RO_Object
	dc.l	\3		; RO_Next
	dc.l	\2		; RO_Child
	dc.l	\1		; RO_Type
	ENDM

MUIE_METHOD	MACRO
	dc.l	\3		; MM_Next
	dc.l	\1		; MM_Object
	dc.l	\2		; MM_MethodID
	dc.w	(2*\4)		; MM_NumTags
	ENDM

MUIE_TAGITEM	MACRO
	dc.l	\1		; ti_Tag
	dc.l	\2		; ti_Data
	ENDM

MUIE_TAGFLAGS	MACRO
	dc.l	\1		; ULONG
	ENDM

MUIE_TAGEND	MACRO
	dc.l	TAG_END		; TagEnd
	ENDM

MUIE_STRPTR	MACRO
	dc.b	\1,0		; Chars
	EVEN			; 
	ENDM

MUIE_HOOK	MACRO
	dc.l	0		; MLN_SUCC
	dc.l	0		; MLN_PRED
	dc.l	\1		; h_Entry
	dc.l	0		; h_SubEntry
	dc.l	0		; h_Data
	ENDM



	ENDC	; MUIEXTEND_MACROS2_I
