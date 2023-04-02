; From forum: VASM / 68080 Snippets
; http://apollo-core.com/knowledge.php?b=5&note=38200
; They can now be viewed in there full glory with monam 3.09.

; CLI
; EXECUTE snippets_script   ; that will assemble & run the debugger

; use <cntl>Z to single-step trough them and see the results.
; all commands are listed in 'command summary.txt'
; a printed version is handy to have nearby.





*


;BIG/little indian convert move

  move.l #$12345678,-(sp)
  movex.l (sp)+,d0 ;result d0=78563412

** use <cntl>Z or Y or W to single_step trough **
** use <cntl>C to cancel **

;order (32bit)

  perm #@3210,d0,d1 ;result d1=12345678
  perm #@2211,d0,d2 ;result d2=34345656

;shift

  lslq #24,d1,d3  ;result d3=78000000
  ;(high part is not visable in debugger)

;order (64 bit)

  vperm #$01234567,d3,d2,d4 ;result d4=d3=78000000
  vperm #$76543210,d3,d3,d5 ;result d5=56341200
  vperm #$fedcba98,d3,d3,d6 ;result d6=56341200

** use <tab> to activated next window **
** use arrow keys to move window content **


*


  move.w ([4.l],$128.w),d7 ;result d7=0000A47F = AttnFlags
  btst #10,d7 ;AttnFlags, is CPU 080 ?


*


; another snippet

  ; result is what you see in debugger
  ; high part is not visable in there

; move.quad = load

  load.q #$8642864286428642,d0 ;result d0=86428642
  load.w #$8642,d1 ;result d1=86428642

  load.q #$0000000071118222,d1 ;result d1=71118222

; 4x add.w

  paddw d0,d1,d2 ;result d2=f7530864

; 4x add.w unsigned & saturated(limited)

  paddusw d0,d1,d3 ;result d3=f753ffff
 
; 8x add.b

  paddb d0,d1,d4 ;result d4=f7530864

; 8x add.b unsigned & saturated(limited)

  paddusb d0,d1,d5 ;result d5=f753ff64


*


; another snippet,
; a tool.
; ccc counts EVERY clock cycle

loop
  movec ccc,d0 ;cpu clock counter
  bra loop

** use <cntl>S to skip instruction **

; just keep single step the ever lasting loop to see the counter change
; usefull to keep track of how much clock cycles a routine used.
; loops every 50 sec at 85Mhz
; (2^32)/(7093790x12)


*


; another snippet

; setup

  clr.l d0  ;result d0=00000000
  move.l #$03f00401,d1 ;result d1=03f00401
 
  move.l #$80ff4020,d2 ;result d2=80ff4020
  move.l #$22222222,d3 ;result d3=22222222

  move.l d0,d4 ;result d4=00000000
  move.l d1,d5 ;result d5=03f00401

; 8x mul.b , lsr , add.b  (limited)

  pmula d2,d3,d4 ;d4+=(d2*d3)>>8 =11210804
 
; now at full potential

  pmula d2,d3,d5 ;result d5=14ff0c05

; $80*$22 =$1100
; $ff*$22 =$21de
; $40*$22 =$0880
; $20*$22 =$0440

; think RGB mode, a HUD. independent alfa fade.



*


; RGB

  load.q #$11ff00002200ff00,d0 ;2 xrgb pixels (red,green)
  load.q #$330000ff44ff00ff,d1 ;2 xrgb pixels (blue,purple)

; chunky convert:
; 4x compress 32bit > 16bit

  pack3216 d0,d1,d2 ;result d2=001f f81f (blue,purple)

;show top part of result in debugger

  lsrq #32,d2,d3 ;result d3=f800 07e0 (red,green)

; 2x uncompress 16bit > 32bit

  unpack1632 d3,d4:d5 ;result d5=0000ff00 (green)

; again
  unpack1632 d2,d6:d7 ;result d7=00ff00ff (purple)

; 32bits rgb = xxxx xxxx rrrr rrrr gggg gggg bbbb bbbb
; 16bits rgb = rrrr rggg gggb bbbb


*


; Chunky to Planar
; 8 chunky bytes, 7 black, 1 white

  load.q #$00000000000000ff,d0

; 8 chunky bytes to 8 planar bytes

  c2p d0,d1 ;result d1=01010101

; 8 planar bytes back to 8 chunky bytes
 
  c2p d1,d2 ;result d2=000000ff

; note
; load.q , store.q
; q means quad-word (page 1-29 motorola reference manual)
; octo-byte , 64-bit


*


; another snippet
; e-registers can be used as integer and float.

; stupid trick

  fmove.s #1e3,e0  ;e0_as_float

  lsrq #32,e0,d0 ;result d0=408f3fff  hi-part float
  move.l e0,d1 ;result d1=e0000000  low-part float

  fsub.l e0,e0 ;read e0_as_integer subtract that from e0_as_float

  lsrq #32,e0,d2 ;result d2=41c00001
  move.l e0,d3 ;result d3=f3fffe00

; neat trick

  fmove.s #1000,e0 ;e0_as_float

  lsrq #52,e0,d2 ;result d2=00000408  sign & exponent
  and.w #$7ff,d2 ;result d2=00000408  removed sign
  sub.w #$3ff,d2 ;result d2=9  (normal binary exponent)

; now the exponent is a binair one, not decimal

  fmovecr #$b,fp1 ;log10(2)
  fmul.w d2,fp1
  fmove.l fp1,d3 ;result d3=3  (normal decimal exponent , might be 1 off)


*


; another snippet

; Store (move.quad : reg > mem)

  load.w #$1234,d0 ; result d0=12341234
  store d0,val1 ; result val1=1234123412341234

** use <amiga>R "Register = value" **
** type m3=val1 **
** use <cntl> arrows left/right change window 3 size **

; indirect
  load.w #$4567,d6
  move.b #6,d1 ; result d1=6
  storei d1,val2 ; result val2=4567456745674567
  move.b #0,d1 ; result d1=0
  storei d1,val3 ; result val3=1234123412341234
 
; count
  move.l #6,d1 ; result d1=6
  storec d6,d1,val4 ;result val4=4567456745670000
  move.l #3,d1 ; result d1=3
  storec d0,d1,val5 ;result val5=1234120000000000
; indirect: the value specifies what register is the source
;  00 - 07 = D0  - D7
;  08 - 15 = A0  - A7
;  16 - 23 = B0  - B7
;  40 - 47 = E0  - E7
;  48 - 55 = E8  - E15
;  56 - 63 = E16 - E23

  DATA

val1 ds.l 2 ;quad
val2 ds.l 2
val3 ds.l 2
val4 ds.l 2
val5 ds.l 2
  CODE

*


store
; There's more in store
 
  load.w #$1234,d0 ; source
  load.w #0,d1  ; clr.q d1
 
  ; mask
  move.b #%10110111,d1 ; mask = the first 8 bits
  storem d0,d1,val6 ; result val6=1200123400341234
 
  ; inverted long mask
  c2p d1,d2 ;place first 8 bits
    ;in every first bit of every byte
    ; result d2 = 00 01 01 01 (=lower part)
 
  storeilm d0,d2,val7 ; result val7=0034000012000000
  ; (= storem2)
 
  ; example 24bit color pixel write
 
  move.l #$00aabbcc,d3 ; R=aa G=bb B=cc
  move.b #%00000111,d4 ; result d4=00000007
  lea pixel,a0
  storem d3,d4,-5(a0) ; result pixel=aabbcc

  DATA
 
val6 ds.l 2
val7 ds.l 2
pixel ds.b 3
 ds.b 1

  CODE


*


; another snippet
logic
; 64 bit logic
; (debugger shows only the lower 32 of the 64 bits.)

  load.w #$00ff,d0 ; result d0=00ff00ff
  move.l #$0ff00f0f,d1 ; result d1=0ff00f0f

  pand d0,d1,d2  ; result d2=00f0000f
  por d0,d1,d3  ; result d3=0fff0fff
  peor d0,d1,d4  ; result d4=0f0f0ff0
  pandn d0,d1,d5  ; result d5=0f000f00


*


; another snippet

; bit select.
; if a mask bit is set the source bit is taken
; else no change

; bsel is also a 64 bit instruction.

  move.l #$12345678,d0
  move.l #$0000ffff,d1 ; mask
  move.l #$87654321,d2
  bsel d0,d1,d2  ; result d2=87655678
  move.l #$f0f0000f,d3 ; mask
  move.l #$87654321,d4
  bsel d0,d3,d4  ; result d4=17354328

  move.l #$87654321,d5
  bsel d0,d5,d5  ; result d5=02244220

  move.l #$87654321,d6
  pand d0,d6,d7  ; result d7=02244220


*


; psub is identical to padd, so:
; 4x sub.w = psubw d0,d1,d2
; 4x sub.w unsigned & saturated(limited)
; = psubusw d0,d1,d2
 
; 8x sub.b = psubb d0,d1,d2
; 8x sub.b unsigned & saturated(limited)
; = psubusb d0,d1,d2

; butterfly = add & sub combined.

  move.l #$01038081,d0
  move.l #$44028183,d1

; 4x add.w & 4x sub.w

  bflyw d0,d1,d2:d3  ;result in d2 & d3
  ; result d2 = 45050204 ; d2 = d1 + d0
  ; result d3 = 42ff0102 ; d3 = d1 - d0
  ; d2 can be changed to any EVEN data-register

; 8x add.b & 8x sub.b

  bflyb d0,d1,d4:d5
  ; result d4 = 45050104 ; d4 = d1 + d0
  ; result d5 = 43ff0102 ; d5 = d1 - d0


*


; blitter logic: minterm

  move.l #$11110000,d0
  move.l #$11001100,d1
  move.l #$10101010,d2

; logic operation
  move.b #%11100010,d3 ; result d3=000000e2
; this would be d1 as mask selecting d0, otherwise d2

  minterm d0-d3,d4  ; result d4=11100010

; powerfull logic operation!
; any locical bit function can be made in d4 for
; the 3 64_bit inputs.

; Other logic_op, set bit if only 1 of the 3 inputs is set
  move.b #%00010110,d3 ; result d3=00000016

  minterm d0-d3,d6  ; result d6=00010110
  move.l d6,d5

; same logic, new inputs:
  move.l #$01234567,d0
  move.l #$11002266,d1
  move.l #$f0f000ff,d2

  minterm d0-d3,d6  ; result d6=e0d36798

; note:
; source is 4 following data-registers, where the first one is modulo 4
; destination is EVEN data-register.


*


; a tool

; The last value written to chip-registers can be read.
; by using dfe000

  move.l $dfe080,a0 ;copper list 1 pointer, a0 =000055b8
  move.l $dfe084,a1 ;copper list 2 pointer, a1 =00005630

  move.w $dff002,d0 ;dma con read, dmacon = 03f0
  move.w $dfe002,d1 ;d1 = 0000: last value written to this read-only address
  ; is zero because there has been no writting to that location.

  move.w $dfe096,d2 ;dma con, d2 = 8180
  ; so the last action was: set bitplane & copper


*


; Another 4 register input instruction:

  load.q #$1122334455667788,d0
  load.q #$99aabbccddeeff00,d1
  load.q #$123456789abcdef0,d2
  load.q #$1111111111111111,d3

  transhi d0-d3,d4:d5
  ; result d4 = (112299aa)12341111
  ; result d5 = (3344bbcc)56781111

  translo d0-d3,d6:d7
  ; result d6 = (5566ddee)9abc1111
  ; result d7 = (7788ff00)def01111


; A bit like c2p
; C2P does transpose 8x8 bits
; TRANS does transpose 4x4 words
 
; Same restrictions as minterm:
; source is 4 following data-registers, where the first one is modulo 4
; destination pair, the first must be EVEN data-register.


*


; 4 x word multiply in 3 variations
; hi part, low part & middle part

  move.l #$12345678,d0
  move.l #$02018010,d1

;1234 x 0201 = 00247a34
;5678 x 8010 = d4c96780

  pmulh d0,d1,d2  ;result d2 = 0024d4c9
  pmul88 d0,d1,d3  ;result d3 = 247ac967
  pmull d0,d1,d4  ;result d4 = 7a346780


*


; another snippet

; convert 2 x 4 signed words to 8 unsigned bytes

  load.q #$008012340044fffd,d1
  packuswb d0,d1,d2  ;result d2 = 80ff4400


*


; mini & maxi

  move.l #$123460cd,d0
  move.l #$4321ab70,d1

; unsigned byte

  pminub d0,d1,d2  ;result d2 = 12216070
  pmaxub d0,d1,d3  ;result d3 = 4334abcd

; signed
  pminsb d0,d1,d4  ;result d4 = 1221abcd
  pmaxsb d0,d1,d5  ;result d5 = 43346070

; unsigned word

  pminuw d0,d1,d2  ;result d2 = 123460cd
  pmaxuw d0,d1,d3  ;result d3 = 4321ab70

; signed
  pminsw d0,d1,d4  ;result d4 = 1234ab70
  pmaxsw d0,d1,d5  ;result d5 = 432160cd


*


; ammx does not set the status register.
; vector compare
; 8 bytes or 4 words

  clr.l d0
  move.l #$01ff0083,d1

  pcmpeqb d0,d1,d2 ;result d2 = 0000ff00 , selected zero
  pcmphib d0,d1,d3 ;result d3 = ffff00ff , selected unsigned hi/greater
  pcmpgtb d0,d1,d4 ;result d4 = ff000000 , selected signed hi/greater
  pcmpgeb d0,d1,d5 ;result d5 = ff00ff00 , selected signed greater or equal

  ; pcmpgeb.q #0,d1,d5 ;same but a (4+8)byte instruction size
  ; pcmpgeb.w #0,d1,d5 ;same but a (4+2)byte instruction size

; signed less than , from d1
  pandn d5,d1,d6 ;result d6 = 00ff0083

; unsigned less than or equal , from d1
  pandn d3,d1,d7 ;result d7 = 00000000

; note:
; only eq/hi/gt/ge are valid conditions


*


;STOREM3 again.
;  - For fast chunky cpu sprites -
; 
;mode 0,1,2,3 is identical to 4,5,6,7 so modulo 4
; 
;    0: 2x long, mask msb=1 , 32bit chunky
;    1: 8x byte, mask byte<>0 , 8bit indexed
;    2: src
;    3: 4x word, mask msb=0 , 15bit chunky
 
; code snippet:
 
    lea pix,a0
    load.q #$800001230100ab00,d0
    storem3 d0,d0,(a0)+ ; result = 80000123 44444444
    storem3 d0,d1,(a0)+ ; result = 80440123 0144ab44
    storem3 d0,d2,(a0)+ ; result = 80000123 0100ab00
    storem3 d0,d3,(a0)+ ; result = 44440123 01004444
    storem3 d0,d4,(a0)+ ; result = 80000123 44444444
 
    DATA
pix
    REPT 5
    dc.l $44444444,$44444444
    ENDR

    CODE

*


average
; average

  move.l #$0123fe01,d0
  move.l #$0424fd70,d1

  pavgb d0,d1,d2 ;result d2 = 0324fe39

; note:
; unsigned rounded up
; pavgw d0,d1,d2 not exist


*


  illegal
; Thats all.

** use <cntl>C to Cancel **
** or <amiga>Q to quit (same)**
