; saga registers
; format: _[name]<tab>EQU<tab>$[chip_Address]
; for easy convert to include-file or sagalib-file with 'replace'


_Registers	EQU	$000
;_BltDdat	EQU	$000
_DmaConR	EQU	$002
_VposR	EQU	$004
_VHposR	EQU	$006
_DskDatR	EQU	$008
_Joy0Dat	EQU	$00A
_Joy1Dat	EQU	$00C
_ClxDat	EQU	$00E

_AdkConR	EQU	$010
_Pot0Dat	EQU	$012
_Pot1Dat	EQU	$014
_MouseK2	EQU	$016
_SerDatR	EQU	$018
_DskbytR	EQU	$01A
_IntEnaR	EQU	$01C
_IntReqR	EQU	$01E

_DskPt	EQU	$020
_DskPtL	EQU	$022
_DskLen	EQU	$024
_DskDat	EQU	$026
_RefPtr	EQU	$028
_VposW	EQU	$02A
_VHposW	EQU	$02C
_CopCon	EQU	$02E
_SerDat	EQU	$030
_SerPer	EQU	$032
_PotGo	EQU	$034
_JoyTest	EQU	$036
_StrEqu	EQU	$038
_StrVbl	EQU	$03A
_StrHor	EQU	$03C
_StrLong	EQU	$03E

_BltCon0	EQU	$040
_BltCon1	EQU	$042
_BltAFwm	EQU	$044
_BltALwm	EQU	$046
_BltCpt	EQU	$048
_BltCptL	EQU	$04A
_BltBpt	EQU	$04C
_BltBptL	EQU	$04E
_BltApt	EQU	$050
_BltAptL	EQU	$052
_BltDpt	EQU	$054
_BltDptL	EQU	$056
_BltSize	EQU	$058
_BltCon0L	EQU	$05A
_BltCon0L.b	EQU	$05B
_BltSizV	EQU	$05C
_BltsizH	EQU	$05E

_BltCmod	EQU	$060
_BltBmod	EQU	$062
_BltAmod	EQU	$064
_BltDmod	EQU	$066

_BltCdat	EQU	$070
_BltBdat	EQU	$072
_BltAdat	EQU	$074

_DeniseId	EQU	$07C
_DskSync	EQU	$07E

_Cop1Lc	EQU	$080
_Cop2Lc	EQU	$084
_CopJmp1	EQU	$088
_CopJmp2	EQU	$08A
_CopIns	EQU	$08C
_DiWstrt	EQU	$08E
_DiWstop	EQU	$090
_DdFstrt	EQU	$092
_DdFstop	EQU	$094
_DmaCon	EQU	$096
_ClxCon	EQU	$098
_IntEna	EQU	$09A
_IntReq	EQU	$09C

_AdkCon	EQU	$09E
_Aud0Lc	EQU	$0A0
_Aud0LcL	EQU	$0A2
_Aud0Len	EQU	$0A4
_Aud0Per	EQU	$0A6
_Aud0Vol	EQU	$0A8
_Aud0Dat	EQU	$0AA
_Aud1Lc	EQU	$0B0
_Aud1LcL	EQU	$0B2
_Aud1Len	EQU	$0B4
_Aud1Per	EQU	$0B6
_Aud1Vol	EQU	$0B8
_Aud1Dat	EQU	$0BA
_Aud2Lc	EQU	$0C0
_Aud2LcL	EQU	$0C2
_Aud2Len	EQU	$0C4
_Aud2Per	EQU	$0C6
_Aud2Vol	EQU	$0C8
_Aud2Dat	EQU	$0CA
_Aud3Lc	EQU	$0D0
_Aud3LcL	EQU	$0D2
_Aud3Len	EQU	$0D4
_Aud3Per	EQU	$0D6
_Aud3Vol	EQU	$0D8
_Aud3Dat	EQU	$0DA

_Bpl1pt	EQU	$0E0
_Bpl1ptL	EQU	$0E2
_Bpl2pt	EQU	$0E4
_Bpl2ptL	EQU	$0E6
_Bpl3pt	EQU	$0E8
_Bpl3ptL	EQU	$0EA
_Bpl4pt	EQU	$0EC
_Bpl4ptL	EQU	$0EE
_Bpl5pt	EQU	$0F0
_Bpl5ptL	EQU	$0F2
_Bpl6pt	EQU	$0F4
_Bpl6ptL	EQU	$0F6

_BplCon0	EQU	$100
_BplCon1	EQU	$102
_BplCon2	EQU	$104
_BplCon3	EQU	$106
_Bpl1mod	EQU	$108
_Bpl2mod	EQU	$10A
_BplCon4	EQU	$10C

_ClxCon2	EQU	$10E
_Bpl1dat	EQU	$110
_Bpl2dat	EQU	$112
_Bpl3dat	EQU	$114
_Bpl4dat	EQU	$116
_Bpl5dat	EQU	$118
_Bpl6dat	EQU	$11A
_Bpl7dat	EQU	$11C
_Bpl8dat	EQU	$11E

_Spr0pt	EQU	$120
_Spr0ptL	EQU	$122
_Spr1pt	EQU	$124
_Spr1ptL	EQU	$126
_Spr2pt	EQU	$128
_Spr2ptL	EQU	$12A
_Spr3pt	EQU	$12C
_Spr3ptL	EQU	$12E
_Spr4pt	EQU	$130
_Spr4ptL	EQU	$132
_Spr5pt	EQU	$134
_Spr5ptL	EQU	$136
_Spr6pt	EQU	$138
_Spr6ptL	EQU	$13A
_Spr7pt	EQU	$13C
_Spr7ptL	EQU	$13E

_Spr0pos	EQU	$140
_Spr0ctl	EQU	$142
_Spr0datA	EQU	$144
_Spr0datB	EQU	$146
_Spr1pos	EQU	$148
_Spr1ctl	EQU	$14A
_Spr1datA	EQU	$14C
_Spr1datB	EQU	$14E
_Spr2pos	EQU	$150
_Spr2ctl	EQU	$152
_Spr2datA	EQU	$154
_Spr2datB	EQU	$156
_Spr3pos	EQU	$158
_Spr3ctl	EQU	$15A
_Spr3datA	EQU	$15C
_Spr3datB	EQU	$15E
_Spr4pos	EQU	$160
_Spr4ctl	EQU	$162
_Spr4datA	EQU	$164
_Spr4datB	EQU	$166
_Spr5pos	EQU	$168
_Spr5ctl	EQU	$16A
_Spr5datA	EQU	$16C
_Spr5datB	EQU	$16E
_Spr6pos	EQU	$170
_Spr6ctl	EQU	$172
_Spr6datA	EQU	$174
_Spr6datB	EQU	$176
_Spr7pos	EQU	$178
_Spr7ctl	EQU	$17A
_Spr7datA	EQU	$17C
_Spr7datB	EQU	$17E

_Color00	EQU	$180
_Color01	EQU	$182
_Color02	EQU	$184
_Color03	EQU	$186
_Color04	EQU	$188
_Color05	EQU	$18A
_Color06	EQU	$18C
_Color07	EQU	$18E
_Color08	EQU	$190
_Color09	EQU	$192
_Color10	EQU	$194
_Color11	EQU	$196
_Color12	EQU	$198
_Color13	EQU	$19A
_Color14	EQU	$19C
_Color15	EQU	$19E
_Color16	EQU	$1A0
_Color17	EQU	$1A2
_Color18	EQU	$1A4
_Color19	EQU	$1A6
_Color20	EQU	$1A8
_Color21	EQU	$1AA
_Color22	EQU	$1AC
_Color23	EQU	$1AE
_Color24	EQU	$1B0
_Color25	EQU	$1B2
_Color26	EQU	$1B4
_Color27	EQU	$1B6
_Color28	EQU	$1B8
_Color29	EQU	$1BA
_Color30	EQU	$1BC
_Color31	EQU	$1BE

_Htotal	EQU	$1C0
_HsStop	EQU	$1C2
_HbStrt	EQU	$1C4
_HbStop	EQU	$1C6
_Vtotal	EQU	$1C8
_VsStop	EQU	$1Ca
_VbStrt	EQU	$1Cc
_VbStop	EQU	$1Ce

_SprHstrt	EQU	$1D0
_SprHstop	EQU	$1D2
_BplHstrt	EQU	$1D4
_BplHstop	EQU	$1D6
_hhposw	EQU	$1D8
_hhposr	EQU	$1DA

_Beamcon0	EQU	$1DC
_HsStrt	EQU	$1DE
_VsStrt	EQU	$1E0
_Hcenter	EQU	$1E2
_DiWhigh	EQU	$1E4

_BplHmod	EQU	$1E6
_SprHpt	EQU	$1E8
_SprHptL	EQU	$1EA
_BplHpt	EQU	$1EC
_BplHptL	EQU	$1EE
_GfxMode	EQU	$1F4

_VidPxClkW	EQU	$1F8
_VidPxClkR	EQU	$1F8
_Fmode	EQU	$1FC
_NoOp	EQU	$1FE

; expansion

_DmaCon2R	EQU	$202
_vJoy0Dat	EQU	$20A
_vJoy1Dat	EQU	$20C
_IntEna2R	EQU	$21C
_IntReq2R	EQU	$21E

_Joy0Pad	EQU	$220
_Joy1Pad	EQU	$222
_Joy2Pad	EQU	$224
_Joy3Pad	EQU	$226

_ClxDat0	EQU	$230
_ClxDat1	EQU	$232
_ClxDat2	EQU	$234
_ClxDat3	EQU	$236
_ClxDat4	EQU	$238
_ClxDat5	EQU	$23A
_ClxDat6	EQU	$23C
_ClxDat7	EQU	$23E


_TexTpt	EQU	$250
_TexDpt	EQU	$254
_TexZpt	EQU	$258
_TexStrt	EQU	$25E
_TexMip	EQU	$260
_TexMode	EQU	$262
_TexDmod	EQU	$266
_TexU	EQU	$270
_TexV	EQU	$274
_TexdU	EQU	$278
_TexdV	EQU	$27C
_TexLi	EQU	$280
_TexdLi	EQU	$282
_TexLiCol	EQU	$284
_TexZ	EQU	$288
_TexdZ	EQU	$28C

_DmaCon2	EQU	$296
_IntEna2	EQU	$29A
_IntReq2	EQU	$29C

_VidHpix	EQU	$300
_VidHstrt	EQU	$302
_VidHstop	EQU	$304
_VidHtot	EQU	$306
_VidVpix	EQU	$308
_VidVstrt	EQU	$30A
_VidVstop	EQU	$30C
_VidVtot	EQU	$30E
_VidHsyn	EQU	$310

_PlnCol	EQU	$380
_SprCol	EQU	$384
_CnkCol	EQU	$388
_PipCol	EQU	$38C
_PipXstrt	EQU	$3D0
_PipYstrt	EQU	$3D2
_PipXstop	EQU	$3D4
_PipYstop	EQU	$3D6
_PipPt	EQU	$3D8
_PipFor	EQU	$3DC
_PipMod	EQU	$3DE
_PipColK	EQU	$3E0
_PipDmaRow	EQU	$3E2

_SagaCon	EQU	$3EC
_VchipId	EQU	$3F0
_MultiplyC	EQU	$3F1
_SpiW	EQU	$3F8
_SpiR	EQU	$3FA
_VmpId	EQU	$3FC

; Saga Audio = Snd
; to prevent mistake Audio registers

_Snd0Lc	EQU	$400
_Snd0Len	EQU	$404
_Snd0Vol	EQU	$406
_Snd0Cnt	EQU	$408
_Snd0Per	EQU	$40C

_Snd1Lc	EQU	$410
_Snd1Len	EQU	$414
_Snd1Vol	EQU	$416
_Snd1Cnt	EQU	$418
_Snd1Per	EQU	$41C

_Snd2Lc	EQU	$420
_Snd2Len	EQU	$424
_Snd2Vol	EQU	$426
_Snd2Cnt	EQU	$428
_Snd2Per	EQU	$42C

_Snd3Lc	EQU	$430
_Snd3Len	EQU	$434
_Snd3Vol	EQU	$436
_Snd3Cnt	EQU	$438
_Snd3Per	EQU	$43C

_Snd4Lc	EQU	$440
_Snd4Len	EQU	$444
_Snd4Vol	EQU	$446
_Snd4Cnt	EQU	$448
_Snd4Per	EQU	$44C

_Snd5Lc	EQU	$450
_Snd5Len	EQU	$454
_Snd5Vol	EQU	$456
_Snd5Cnt	EQU	$458
_Snd5Per	EQU	$45C

_Snd6Lc	EQU	$460
_Snd6Len	EQU	$464
_Snd6Vol	EQU	$466
_Snd6Cnt	EQU	$468
_Snd6Per	EQU	$46C

_Snd7Lc	EQU	$470
_Snd7Len	EQU	$474
_Snd7Vol	EQU	$476
_Snd7Cnt	EQU	$478
_Snd7Per	EQU	$47C

_Snd8Lc	EQU	$480
_Snd8Len	EQU	$484
_Snd8Vol	EQU	$486
_Snd8Cnt	EQU	$488
_Snd8Per	EQU	$48C

_Snd9Lc	EQU	$490
_Snd9Len	EQU	$494
_Snd9Vol	EQU	$496
_Snd9Cnt	EQU	$498
_Snd9Per	EQU	$49C

_Snd10Lc	EQU	$4A0
_Snd10Len	EQU	$4A4
_Snd10Vol	EQU	$4A6
_Snd10Cnt	EQU	$4A8
_Snd10Per	EQU	$4AC

_Snd11Lc	EQU	$4B0
_Snd11Len	EQU	$4B4
_Snd11Vol	EQU	$4B6
_Snd11Cnt	EQU	$4B8
_Snd11Per	EQU	$4BC

_Snd12Lc	EQU	$4C0
_Snd12Len	EQU	$4C4
_Snd12Vol	EQU	$4C6
_Snd12Cnt	EQU	$4C8
_Snd12Per	EQU	$4CC

_Snd13Lc	EQU	$4D0
_Snd13Len	EQU	$4D4
_Snd13Vol	EQU	$4D6
_Snd13Cnt	EQU	$4D8
_Snd13Per	EQU	$4DC

_Snd14Lc	EQU	$4E0
_Snd14Len	EQU	$4E4
_Snd14Vol	EQU	$4E6
_Snd14Cnt	EQU	$4E8
_Snd14Per	EQU	$4EC

_Snd15Lc	EQU	$4F0
_Snd15Len	EQU	$4F4
_Snd15Vol	EQU	$4F6
_Snd15Cnt	EQU	$4F8
_Snd15Per	EQU	$4FC

_Snd16Lc	EQU	$500
_Snd16Len	EQU	$504
_Snd16Vol	EQU	$506
_Snd16Cnt	EQU	$508
_Snd16Per	EQU	$50C

_Snd17Lc	EQU	$510
_Snd17Len	EQU	$514
_Snd17Vol	EQU	$516
_Snd17Cnt	EQU	$518
_Snd17Per	EQU	$51C

_Snd18Lc	EQU	$520
_Snd18Len	EQU	$524
_Snd18Vol	EQU	$526
_Snd18Cnt	EQU	$528
_Snd18Per	EQU	$52C

_Snd19Lc	EQU	$530
_Snd19Len	EQU	$534
_Snd19Vol	EQU	$536
_Snd19Cnt	EQU	$538
_Snd19Per	EQU	$53C

_Snd20Lc	EQU	$540
_Snd20Len	EQU	$544
_Snd20Vol	EQU	$546
_Snd20Cnt	EQU	$548
_Snd20Per	EQU	$54C

_Snd21Lc	EQU	$550
_Snd21Len	EQU	$554
_Snd21Vol	EQU	$556
_Snd21Cnt	EQU	$558
_Snd21Per	EQU	$55C

_Snd22Lc	EQU	$560
_Snd22Len	EQU	$564
_Snd22Vol	EQU	$566
_Snd22Cnt	EQU	$568
_Snd22Per	EQU	$56C

_Snd23Lc	EQU	$570
_Snd23Len	EQU	$574
_Snd23Vol	EQU	$576
_Snd23Cnt	EQU	$578
_Snd23Per	EQU	$57C
