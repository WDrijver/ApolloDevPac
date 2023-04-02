; some SAGA! registers
; just add what is missing and you realy need.

; hardware_name include file
; chip hardware is in CAPITAL

CHIP	=$DFF000
L	=$8000	; long copper move  (dc.w L+BPLPT,screen_adr)

BLTDDAT=$0000
DMACONR=$0002
VPOSR=$0004
VHPOSR=$0006
DSKDATR=$0008
JOY0DAT=$000A	; takes db9_0_mouse & JOY1BUT
JOY1DAT=$000C	; takes db9_1_joy & JOY0BUT
CLXDAT=$000E
ADKCONR=$0010
POT0DAT=$0012
POT1DAT=$0014
POTGOR=$0016
SERDATR=$0018
DSKBYTR=$001A
INTENAR=$001C
INTREQR=$001E
DSKPTH=$0020
DSKPTL=$0022
DSKLEN=$0024
DSKDAT=$0026
REFPTR=$0028
VPOSW=$002A
VHPOSW=$002C
COPCON=$002E
SERDAT=$0030
SERPER=$0032
POTGO=$0034
JOYTEST=$0036
STREQU=$0038
STRVBL=$003A
STRHOR=$003C
STRLONG=$003E
;blitter
BLTCON0	=$040
BLTCON1	=$042
BLTAFWM	=$044
BLTALWM	=$046
BLTCPT	=$048
BLTBPT	=$04C
BLTAPT	=$050
BLTDPT	=$054
BLTSIZE	=$058
BLTCON0L	=$05A
BLTSIZV	=$05C
BLTSIZH	=$05E
BLTCMOD	=$060
BLTBMOD	=$062
BLTAMOD	=$064
BLTDMOD	=$066
BLTCDAT	=$070
BLTBDAT	=$072
BLTADAT	=$074
;sprite
SPRHDAT	=$078
DENISEID	=$07C		;0
DSKSYNC=$007E
;CoPro
COP1PT	=$080		;l
COP2PT	=$084		;l
COPJMP1	=$088		;s
COPJMP2	=$08A		;s
COPINS	=$08C		;s
DIWSTRT	=$08E
DIWSTOP	=$090
DDFSTRT	=$092
DDFSTOP	=$094
;dma
DMACON=$0096
CLXCON=$0098	
INTENA=$009A
INTREQ=$009C	;bit 5 =vbl
;audio/disk
ADKCON=$009E
;screen
BPL1PT	=$0E0
BPL2PT	=$0E4
BPL3PT	=$0E8
BPL4PT	=$0EC
BPL5PT	=$0F0
BPL6PT	=$0F4
BPL7PT	=$0F8
BPL8PT	=$0FC
BPLCON0=$100
BPLCON1=$102
BPLCON2=$104
BPLCON3=$106
BPL1MOD=$108
BPL2MOD=$10A
BPLCON4=$10C

;screen
CLXCON2=$10E	;reset by CLXCON
BPL1DAT=$110
BPL2DAT=$112
BPL3DAT=$114
BPL4DAT=$116
BPL5DAT=$118
BPL6DAT=$11A
BPL7DAT=$118
BPL8DAT=$11A
;sprite
SPR0PT	=$120		;l
SPR1PT	=$124
SPR2PT	=$128
SPR3PT	=$12C
SPR4PT	=$130
SPR5PT	=$134
SPR6PT	=$138
SPR7PT	=$13C

SPR8PT	=$320		;l
SPR9PT	=$324
SPR10PT	=$328
SPR11PT	=$32C
SPR12PT	=$330
SPR13PT	=$334
SPR14PT	=$338
SPR15PT	=$33C

SPR0POS	=$140
SPR0CTL	=$142
SPR0DATA	=$144
SPR0DATB	=$146
SPR1POS	=$148
SPR1CTL	=$14A
SPR1DATA	=$14C
SPR1DATB	=$14E
SPR2POS=$0150
SPR2CTL=$0152
SPR2DATA=$0154
SPR2DATB=$0156
SPR3POS=$0158
SPR3CTL=$015A
SPR3DATA=$015C
SPR3DATB=$015E
SPR4POS=$0160
SPR4CTL=$0162
SPR4DATA=$0164
SPR4DATB=$0166
SPR5POS=$0168
SPR5CTL=$016A
SPR5DATA=$016C
SPR5DATB=$016E
SPR6POS=$0170
SPR6CTL=$0172
SPR6DATA=$0174
SPR6DATB=$0176
SPR7POS=$0178
SPR7CTL=$017A
SPR7DATA=$017C
SPR7DATB=$017E
;screen
COLOR00=$0180
COLOR01=$0182
COLOR02=$0184
COLOR03=$0186
COLOR04=$0188
COLOR05=$018A
COLOR06=$018C
COLOR07=$018E
COLOR08=$0190
COLOR09=$0192
COLOR10=$0194
COLOR11=$0196
COLOR12=$0198
COLOR13=$019A
COLOR14=$019C
COLOR15=$019E
COLOR16=$01A0
COLOR17=$01A2
COLOR18=$01A4
COLOR19=$01A6
COLOR20=$01A8
COLOR21=$01AA
COLOR22=$01AC
COLOR23=$01AE
COLOR24=$01B0
COLOR25=$01B2
COLOR26=$01B4
COLOR27=$01B6
COLOR28=$01B8
COLOR29=$01BA
COLOR30=$01BC
COLOR31=$01BE
;screen
HTOTAL=$01C0
HSSTOP=$01C2
HBSTRT=$01C4
HBSTOP=$01C6
VTOTAL=$01C8
VSSTOP=$01CA
VBSTRT=$01CC
VBSTOP=$01CE
SPRHSTRT=$1D0   ;mouse 
BEAMCON0=$01DC
HSSTRT=$01DE
VSSTRT=$01E0
HCENTER=$01E2
DIWHIGH=$01E4	;reset by DIWSTRT	& DIWSTOP	
;screen
BPLMOD	=$1E6
SPRHPT	=$1E8
BPLPT	=$1EC		;l
GFXMODE	=$1F4
;sprite
FMODE=$01FC

JOY0DATO=$020A	; takes only db9_0 mouse
JOY1DATO=$020C	; takes only db9_1 joy
JOY0BUT=$220	; buttons JOYPAD	(bit0=joypad_present)
JOYPAD=JOY0BUT
JOY1BUT=$222	; buttons second JOYPAD.
CLXDAT0	=$230
CLXDAT1	=$232
CLXDAT2	=$234
CLXDAT3	=$236
CLXDAT4	=$238
CLXDAT5	=$23A
CLXDAT6	=$23C
CLXDAT7	=$23E
CLXDAT8	=$240
CLXDAT9	=$242
CLXDAT10	=$244
CLXDAT11	=$246
CLXDAT12	=$248
CLXDAT13	=$24A
CLXDAT14	=$24C
CLXDAT15	=$24E
;3D
TXTPT	=$250
DSTPT	=$254
ZBFPT	=$258
;..
TXTL	=$280

;dma
DMACON2R	=$202
INTENA2R	=$21C
INTREQ2R	=$21E
DMACON2	=$296
INTENA2	=$29A
INTREQ2	=$29C

;screen
COLPLN	=$380		;l
COLSPR	=$384		;l
COLCHK	=$388		;l
COLPIP = $38C ;long (nr,r,g,b)

PIPXST = $3D0
PIPYST = $3D2
PIPXSP = $3D4
PIPYSP = $3D6
PIPPT = $388 ;long
PIPFRM = $3DC
PIPMOD = $3DE
PIPCK = $3E0
PIPDMA = $3E2

SAGACON = $3EC ;15 set, 4 sync, 3 2Mb, 2 zoom, 1 AGA, 0 scanlines
VAMPID	=$3FC
;SAGA sound
AUD0PT	=$400		;l
AUD0LEN	=$404		;l
AUD0VOL	=$408
AUD0CNT	=$40A
AUD0PER	=$40C


*****************************


;CIA byte access.
CIA	=$BFE000
CIAA	=$BFE001 ; BFEr01 r=register select 0..15
CIAB	=$BFD000 ; 
MOUSEK	=$BFE001	; btst #6,MOUSEK ,  btst #7,MOUSEK (mouse2/joystick)


