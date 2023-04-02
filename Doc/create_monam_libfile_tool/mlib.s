;**********************
;* libfile simple add *
;**********************


* run (in monam) it will hit an illegal.
* 'S'ave 'monam.libfile' <return>  beg,end-1 <return>


   move.w  #asl,d0

   lea     fix_len_start,a0
   lea     fix_len_end,a1

   clr.l   d0
.next
   addq.l  #1,d0                        ; count new lib_jsr addr
   lea     4(a0),a2
.lp
   tst.b   (a2)+
   bne.s   .lp                          ; find end text
   move.l  a2,d1
   sub.l   a0,d1
   subq.l  #2,d1
   divu.l  #4,d1
   move.l  d1,(a0)                      ; fix offset
   asl.l   #2,d1
   adda.l  d1,a0
   addq.l  #8,a0
   cmpa.l  a1,a0
   blt.s   .next   


   move.l  #beg,a1
   move.l  #mid,a2
   move.l  a2,d1
   sub.l   a1,d1                         ; file size normal monam.libfile (11176)
   move.l  #end,a3
   move.l  a3,d3
   sub.l   a1,d3
   move.l  d3,d4                         ; file size extended monam.libfile
   subq.l  #8,d4
   move.l  d4,4(a1)                      ; fix size
   move.l  #last_lib_num-1,d2            ; count new libs
exit
   illegal
   rts

   move.l  4.w,a6
   lea     -30(a6),a5
   jsr     -30(a6)


   dc.l 'strt'
   ALIGN 2                                ; long
beg
   incbin "oldMonAm.libfile"              ; the 3.08 libfile
mid
   dc.b    'Debug',0,0,0                  ; include random exec to make it compatible with old monam
   dc.w    1,-114

   RSSET   5                              ; next is lib 5

fix_len_start

asl rs.b 1
   include 'mon/libs/asl_lib.s'
commo rs.b 1
   include 'mon/libs/commodities_lib.s'
iffp rs.b 1
   include 'mon/libs/iffparse_lib.s'
expan rs.b 1
   include 'mon/libs/expansion_lib.s'
diskf rs.b 1
   include 'mon/libs/diskfont_lib.s'
gadt rs.b 1
   include 'mon/libs/gadtools_lib.s'
local rs.b 1
   include 'mon/libs/locale_lib.s'
lowl rs.b 1
   include 'mon/libs/lowlevel_lib.s'

wb rs.b 1
   include 'mon/libs/wb_lib.s'
util rs.b 1
   include 'mon/libs/utility_lib.s'
picas rs.b 1
   include 'mon/libs/picasso96_lib.s'
rexxs rs.b 1
   include 'mon/libs/rexxsyslib_lib.s'
msb rs.b 1
   include 'mon/libs/mathieeesingbas_lib.s'
mdb rs.b 1
   include 'mon/libs/mathieeedoubbas_lib.s'

batc rs.b 1
   include 'mon/libs/battclock_lib.s'
batm rs.b 1
   include 'mon/libs/battmem_lib.s'
cardr rs.b 1
   include 'mon/libs/cardres_lib.s'
cia rs.b 1
   include 'mon/libs/cia_lib.s'
diskr rs.b 1
   include 'mon/libs/disk_lib.s'
miscr rs.b 1
   include 'mon/libs/misc_lib.s'
potgo rs.b 1
   include 'mon/libs/potgo_lib.s'



last_lib_num rs.b 1
fix_len_end

   dc.l    0                              ; end (3.09)
   dc.b	   'asl.library',0                ; name lib 5
   dc.b	   'commodities.library',0
   dc.b	   'iffparse.library',0
   dc.b	   'expansion.library',0
   dc.b	   'diskfont.library',0
   dc.b	   'gadtools.library',0
   dc.b	   'locale.library',0
   dc.b	   'lowlevel.library',0

   dc.b	   'workbench.library',0
   dc.b	   'utility.library',0
   dc.b	   'Picasso96API.library',0
   dc.b	   'rexxsyslib.library',0
   dc.b	   'mathieeesingbas.library',0
   dc.b	   'mathieeedoubbas.library',0

   dc.b    'battclock.resource',0
   dc.b    'battmem.resource',0
   dc.b    'card.resource',0
   dc.b    'ciaa.resource',0
;   dc.b    'ciab.resource',0
   dc.b    'disk.resource',0
   dc.b    'misc.resource',0
   dc.b    'potgo.resource',0

   dc.b    0                              ; end libnames
end
   dc.b   'end',0








; predifined libs are:
; 1 = exec
; 2 = intu
; 3 = dos
; 4 = grap

***************************
* Monam Libfile structure *
***************************

begin
   dc.l    $420003F0             ; lib version, located at 2440(a6) is checked at i0008d06
   dc.l    new_end-begin-8       ; file length -8 ; num of bytes to follow (load)


; exec lib

   dc.l    3                     ; text size in LONG
   dc.b    'Supervisor',0,0      ; supe rvis or00
   dc.w    1,-30                 ; lib_number, offset   -> will be changed to long addr pt in monam	

   dc.l    2
   dc.b    'InitCode'            ; Init Code
   dc.w    1,-72

   dc.l    3
   dc.b    'MakeLibrary',0       ; Make Libr ary0
   dc.w    1,-84

;*

   dc.l    4
   dc.b    'RemMemHandler',0,0,0 ; RemM emHa ndle r000
   dc.w    1,-780

   dc.l    5
   dc.b    'ObtainQuickVector',0,0,0 ; Obta inQu ickV ecto r000
   dc.w    1,-786


; Intuition lib

   dc.l    4
   dc.b    'OpenIntuition',0,0,0 ; Open Intu itio n000
   dc.w    2,-30

   dc.l    3
   dc.b    'Intuition',0,0,0     ; Intu itio n000
   dc.w    2,-36

;*

   dc.l    5
   dc.b    'BuildEasyRequestArgs' ; Buil dEas yReq uest Args  ;?longest?
   dc.w    2,-594

;*

   dc.l    3
   dc.b    'HelpControl',0 ; Help Cont rol0	
   dc.w    2,-828


; dos lib

   dc.l    1
   dc.b    'Open'
   dc.w    3,-30

   dc.l    2
   dc.b    'Close',0,0,0          ; Clos e000
   dc.w    3,-36

;*

   dc.l    2
   dc.b    'SetOwner'             ; SetO wner
   dc.w    3,-996


; graphics lib

   dc.l    3
   dc.b    'BltBitMap',0,0,0      ; BltB itMa p000
   dc.w    4,-30

   dc.l    3
   dc.b    'BltTemplate',0        ; BltT empl ate0
   dc.w    4,-36

;*

   dc.l    5
   dc.b    'WriteChunkyPixels',0,0,0 ; Writ eChu nkyP ixel s000
   dc.w    4,-1056

   dc.l    0                      ; end (3.08)
old_end



*******************
* extra libs 5..? *
*******************

; curently not all entry_names (text) include a zero terminator.
; this causes a max of 255 as lib number.

; max of 32k lib numbers is posible by making sure that libs
; above 255 have a zero terminator after there enty_names.


; making compatible entry.        ; so monam 3.09 can change  (the 3.08 end) 0 to 2
; it can be any 2 size entry, it must always be an existing lib, in any os, so exec _lib is safe.
   dc.b    'Debug',0,0,0          ; include exec to make it compatible with old monam, also tested if there is extended lib.
   dc.w    1,-114


; asl lib

   dc.l    4
   dc.b    'AllocFileRequest'     ; Allo cFil eReq uest
   dc.w    5,-30

   dc.l    3
   dc.b    'RequestFile',0        ; Requ estF ile0
   dc.w    5,-42

   dc.l    0                      ; end (3.09)
   dc.b	   'asl.library',0        ; name lib 5
   ;dc.b   'other.library',0      ; name lib 6

   dc.b    0                      ; end libnames
new_end