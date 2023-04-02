	IFND	LIBRARIES_MPEGA_I
LIBRARIES_MPEGA_I	SET	1
**
**    $VER: mpega.i 2.0 (21/06/1998)
**
**    (C) Copyright 1997-1998 Stéphane TAVENARD
**        All Rights Reserved

	IFND EXEC_TYPES_I
	INCLUDE "exec/types.i"
	ENDC ; EXEC_TYPES_I

	IFND UTILITY_HOOKS_I
	INCLUDE "utility/hooks.i"
	ENDC ; UTILITY_HOOKS_I

*
* Controls for decoding
*

* Qualities
MPEGA_QUALITY_LOW	EQU	0
MPEGA_QUALITY_MEDIUM	EQU	1
MPEGA_QUALITY_HIGH	EQU	2

* Bitstream Functions
MPEGA_BSFUNC_OPEN	EQU	0
MPEGA_BSFUNC_CLOSE	EQU	1
MPEGA_BSFUNC_READ	EQU	2
MPEGA_BSFUNC_SEEK	EQU	3

* Access structure
  STRUCTURE	MPAACC,0
      LONG	MPAACC_FUNC
      LONG	MPAACC_DATA0
      LONG	MPAACC_DATA1
      LONG	MPAACC_DATA2
      LABEL	MPAACC_SIZE

* Access structure data for MPEGA_BSFUNC_OPEN
MPAACC_OPEN_STREAM_NAME		EQU	MPAACC_DATA0	;in
MPAACC_OPEN_BUFFER_SIZE		EQU	MPAACC_DATA1	;in
MPAACC_OPEN_STREAM_SIZE		EQU	MPAACC_DATA2	;out

* Access structure data for MPEGA_BSFUNC_READ
MPAACC_READ_BUFFER		EQU	MPAACC_DATA0	;in/out
MPAACC_READ_NUM_BYTES		EQU	MPAACC_DATA1	;in

* Access structure data for MPEGA_BSFUNC_SEEK
MPAACC_SEEK_ABS_BYTE_SEEK_POS	EQU	MPAACC_DATA0	;out

   WORD freq_div;    
   WORD quality;     
   LONG freq_max;    


* Decoding output settings
  STRUCTURE	MPAOUT,0
      WORD	MPAOUT_FREQ_DIV			;1, 2 or 4
      WORD	MPAOUT_QUALITY			;0 (low) .. 2 (high)
      LONG	MPAOUT_FREQ_MAX			;for automatic freq_div (if mono_freq_div = 0)
      LABEL	MPAOUT_SIZE

* Decoding layer settings
  STRUCTURE	MPALYR,0
      WORD      MPALYR_FORCE_MONO		;1 to decode stereo stream in mono, 0 otherwise
      STRUCT	MPALYR_MONO,MPAOUT_SIZE		;mono settings
      STRUCT	MPALYR_STEREO,MPAOUT_SIZE	;stereo settings
      LABEL	MPALYR_SIZE

* Full control structure of MPEG Audio decoding
  STRUCTURE	MPACTRL,0
      APTR	MPACTRL_BS_ACCESS		;NULL for default access (file I/O) or give your own bitstream access
      STRUCT	MPACTRL_LAYER_1_2,MPALYR_SIZE	;Layer I & II settings
      STRUCT	MPACTRL_LAYER_3,MPALYR_SIZE	;Layer III settings
      WORD	MPACTRL_CHECK_MPEG		;1 to check for mpeg audio validity at start of stream, 0 otherwise
      LONG	MPACTRL_STREAM_BUFFER_SIZE	;size of bitstream buffer in bytes (0 -> default size)
      LABEL	MPACTRL_SIZE
* NOTE: stream_buffer_size must be multiple of 4 bytes


* MPEG Audio modes
MPEGA_MODE_STEREO	EQU	0
MPEGA_MODE_J_STEREO	EQU	1
MPEGA_MODE_DUAL		EQU	2
MPEGA_MODE_MONO		EQU	3

  STRUCTURE	MPASTRM,0
      WORD	MPASTRM_NORM		;1 or 2
      WORD	MPASTRM_LAYER		;1..3
      WORD      MPASTRM_MODE		;0..3  (MPEGA_MODE_xxx)
      WORD      MPASTRM_BITRATE		;in kbps
      LONG      MPASTRM_FREQUENCY	;in Hz
      WORD      MPASTRM_CHANNELS	;1 or 2
      ULONG     MPASTRM_MS_DURATION	;stream duration in ms
      WORD      MPASTRM_PRIVATE_BIT	;0 or 1
      WORD      MPASTRM_COPYRIGHT	;0 or 1
      WORD      MPASTRM_ORIGINAL	;0 or 1
      * Decoding info according to MPEG control
      WORD      MPASTRM_DEC_CHANNELS	;decoded channels 1 or 2
      WORD      MPASTRM_DEC_QUALITY	;decoding quality 0..2
      LONG      MPASTRM_DEC_FREQUENCY	;decoding frequency in Hz
      * Private data
      APTR  	MPASTRM_HANDLE
      LABEL	MPASTRM_SIZE

MPEGA_MAX_CHANNELS	EQU	2	;Max channels
MPEGA_PCM_SIZE		EQU	1152	;Max samples per frame

* Error codes
MPEGA_ERR_NONE		EQU	0
MPEGA_ERR_BASE		EQU	0
MPEGA_ERR_EOF		EQU	(MPEGA_ERR_BASE-1)
MPEGA_ERR_BADFRAME	EQU	(MPEGA_ERR_BASE-2)
MPEGA_ERR_MEM		EQU	(MPEGA_ERR_BASE-3)
MPEGA_ERR_NO_SYNC	EQU	(MPEGA_ERR_BASE-4)
MPEGA_ERR_BADVALUE	EQU	(MPEGA_ERR_BASE-5) ;/* #1 */

	ENDC ; LIBRARIES_MPEGA_I
