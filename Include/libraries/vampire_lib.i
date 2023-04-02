		IFND	VAMPIRE_LIB_I
VAMPIRE_LIB_I	SET	1


*******************************************************************************
* 
* $id: vampire_lib.i $
* 
* $VER: vampire_lib.i 0.90 (23.02.2017)
* 
* (C) Copyright 2016-2017 APOLLO-Team.
*     All Rights Reserved
* 
*******************************************************************************


		IFND	EXEC_LIBRARIES_I
		include	exec/libraries.i
		ENDC


*******************************************************************************
* 
* Library Vector Offsets
* 
*******************************************************************************


		LIBINIT	
		LIBDEF  _LVOV_AllocExpansionPort
		LIBDEF  _LVOV_FreeExpansionPort
		LIBDEF  _LVOV_GetProp
		LIBDEF  _LVOV_SetProp


*******************************************************************************
* 
* Library Macros
* 
*******************************************************************************


CALLVAMP MACRO
		move.l  _VampireBase,a6
		jsr     _LVO\1(a6)
		ENDM


VAMPIRENAME MACRO
		dc.b    'vampire.library',0
		ENDM


*******************************************************************************
*
* END OF FILE
*
*******************************************************************************


		ENDC ;	VAMPIRE_LIB_I
