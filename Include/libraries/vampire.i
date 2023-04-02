		IFND	VAMPIRE_I
VAMPIRE_I	SET 1

	
*******************************************************************************
* 
* $id: vampire.i $
* 
* $VER: vampire.i 0.90 (23.02.2017)
* 
* (C) Copyright 2016-2017 APOLLO-Team.
*     All Rights Reserved
* 
*******************************************************************************


		IFND	EXEC_TYPES_I
		include exec/types.i
		ENDC

		IFND	UTILITY_TAGITEM_I
		include utility/tagitem.i
		ENDC


*******************************************************************************
* 
* Enumeration VampireBoards Identifiers
* 
* To be used with:
* ULONG V_GetProp( VP_Board_ID )
* ULONG V_GetProp( VP_Board_Name )
* 
*******************************************************************************


		ENUM	0
		EITEM	VB_UNKNOWN             ; Unknown board
		EITEM	VB_V600                ; Vampire V600
		EITEM	VB_V500                ; Vampire V500
		EITEM	VB_V500PLUS            ; Vampire V500+
		EITEM	VB_V4                  ; Vampire V4
		EITEM	VB_LAST                ; Number of board identifiers


*******************************************************************************
* 
* Enumeration VampireExpansion Ports
* 
* Unit number definitions:
* Ownership of a resource grants low-level bit access to the hardware registers.
* You still must follow the rules for shared access of the interrupt system.
* 
* To be used with:
* ULONG V_AllocExpansionPort( UWORD unit, UBYTE* name )
* ULONG V_FreeExpansionPort( UWORD unit )
* 
*******************************************************************************


		ENUM	0
		EITEM	VE_SDPORT              ; SD port on V500/600
		EITEM	VE_WIFIPORT            ; WiFi expansion port on V500+
		EITEM	VE_FREESLOT1           ; Reserved for future use
		EITEM	VE_FREESLOT2           ; Reserved for future use
		EITEM	VE_LAST                ; Number of expansion ports


*******************************************************************************
* 
* Enumeration VampireProperties Identifiers
*
* To be used with:
* ULONG V_GetProp( ULONG property )
* ULONG V_SetProp( ULONG property, ULONG value )
* 
*******************************************************************************


		ENUM	TAG_USER                      
		
		;------------------------------
		; BOARD Properties
		;------------------------------
		                               ; GET SET
		EITEM	VP_Board_CoreRev       ; [X] [ ]
		EITEM	VP_Board_Detect        ; [X] [ ]
		EITEM	VP_Board_ID            ; [X] [ ]
		EITEM	VP_Board_Name          ; [X] [ ]
		EITEM	VP_Board_SN            ; [X] [ ]
		
		;------------------------------
		; CPU Properties
		;------------------------------
		                               ; GET SET
		EITEM	VP_CPU_BlitSync        ; [X] [X]
		EITEM	VP_CPU_CACR            ; [X] [X]
		EITEM	VP_CPU_Clock           ; [X] [ ]
		EITEM	VP_CPU_Counters        ; [X] [ ]
		EITEM	VP_CPU_FPU             ; [X] [X]
		EITEM	VP_CPU_Frequency       ; [X] [ ]
		EITEM	VP_CPU_Identifier      ; [X] [ ]
		EITEM	VP_CPU_MapROM          ; [ ] [X]
		EITEM	VP_CPU_Multiplier      ; [X] [ ]
		EITEM	VP_CPU_PCR             ; [X] [X]
		EITEM	VP_CPU_Revision        ; [X] [ ]
		EITEM	VP_CPU_SuperScalar     ; [X] [X]
		EITEM	VP_CPU_Turtle          ; [X] [X]
		EITEM	VP_CPU_VBR             ; [X] [X]
		EITEM	VP_CPU_HasAC68080      ; [X] [ ]
		
		;------------------------------
		; AMMX Properties
		;------------------------------
		                               ; GET SET
		EITEM	VP_CPU_AMMXCount       ; [X] [ ]
		EITEM	VP_CPU_HasAMMX_V1      ; [X] [ ]
		EITEM	VP_CPU_HasAMMX_V2      ; [X] [ ]
		EITEM	VP_CPU_UseAMMX         ; [X] [X]
		
		;------------------------------
		; PORT Properties
		;------------------------------
		                               ; GET SET
		EITEM	VP_Port_IDEMode        ; [X] [X]
		EITEM	VP_Port_SDMode         ; [X] [X]
		
		;------------------------------
		; VIDEO Properties
		;------------------------------
		                               ; GET SET
		EITEM	VP_Video_ColorMap      ; [ ] [X]
		EITEM	VP_Video_Memory        ; [ ] [X]
		EITEM	VP_Video_Mode          ; [ ] [X]
		EITEM	VP_Video_Modeline      ; [ ] [X]
		EITEM	VP_Video_PLLData       ; [ ] [X]
		EITEM	VP_Video_VPosition     ; [X] [ ]
		
		;------------------------------
		; Properties count
		;------------------------------
		
		EITEM	VP_LAST                ; Number of properties


*******************************************************************************
*
* Structure V_Counters
*
* To be used with :
* V_GetProp( VP_CPU_Counters, &MyCounters )
* 
*******************************************************************************


V_COUNTERS_NUM	EQU	11


	STRUCTURE	V_Counters,0
		
		;---------------------------------------------------------
		; Public DIFF values:
		; Following fields contains the difference 
		; between one call to the previous call (T1-T0).
		; They represents the numbers of cycles or hits
		; triggered during the time interval of 2 calls.
		;---------------------------------------------------------

		ULONG	vc_IP1                 ; Instructions in Pipe 1
		ULONG	vc_IP2                 ; Instructions in Pipe 2
		ULONG	vc_BPC                 ; Branch-Predict Correct
		ULONG	vc_BPW                 ; Branch-Predict Wrong
		ULONG	vc_DCH                 ; Data-Cache Hit
		ULONG	vc_DCM                 ; Data-Cache Miss
		ULONG	vc_STR                 ; Stall-Register
		ULONG	vc_STC                 ; Stall-Cache
		ULONG	vc_STH                 ; Stall-Hazard
		ULONG	vc_STB                 ; Stall-Buffer
		ULONG	vc_MWR                 ; Memory writes
		
		;---------------------------------------------------------
		; Semi-Private RAW values:
		; Following fields contains last raw values
		; as returned by the CPU dedicated registers.
		; They are needed to compute the above fields.
		;---------------------------------------------------------
		
		STRUCT  vc_RAW,(V_COUNTERS_NUM*4) ; Raw values
		LABEL	vc_SIZE                ; SizeOf


*******************************************************************************
*
* Structure V_Modeline
*
* To be used with :
* V_SetProp( VP_Video_Modeline, &VModeline )
* 
*******************************************************************************


	STRUCTURE	V_Modeline,0
		UWORD	vml_HPIXEL             ; Parameters to initialize 
		UWORD	vml_HSSTRT             ; the screen dimensions 
		UWORD	vml_HSSTOP             ; and sizes.
		UWORD	vml_HTOTAL             ; 
		UWORD	vml_VPIXEL             ; 
		UWORD	vml_VSSTRT             ; 
		UWORD	vml_VSSTOP             ; 
		UWORD	vml_VTOTAL             ; 
		UWORD	vml_HVSYNC             ; 
		LABEL	vml_SIZE               ; SizeOf


*******************************************************************************
*
* Structure V_PLLData
*
* To be used with :
* V_SetProp( VP_Video_PLLData, &VPLLData )
* 
*******************************************************************************


	STRUCTURE	V_PLLData,0
		STRUCT	vpll_DATA,18           ; Pixels clock parameters
		LABEL	vpll_SIZE              ; SizeOf


*******************************************************************************
*
* END OF FILE
*
*******************************************************************************


		ENDC ; VAMPIRE_I

