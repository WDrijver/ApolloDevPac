;*****************
;* vbrfile make *
;*****************
; vector file

* run (in monam) it will hit an illegal.
* 'S'ave 'monam.vbrfile' <return>  beg,end-1 <return>



   lea     fix_len_start,a0
   lea     fix_len_end,a1

   clr.l   d0
.next
   addq.l  #1,d0                        ; count saga register entries
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



exit
   illegal
   rts

   move.l  4.w,a6
   jsr     -30(a6)


   dc.l 'strt'
   ALIGN 2                                ; long
beg
   dc.l    $420103F0                      ; id
   dc.l    end-beg-8                      ; file length -8 ; num of bytes to follow (load)


fix_len_start
   include 'mon/libs/saga_vbr_lib.s
fix_len_end  
 
   dc.l    0                              ; end register names
end
   dc.b   'end',0






