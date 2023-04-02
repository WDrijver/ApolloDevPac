
   dc.l    4                      ; =(text_len+3) div 4
   dc.b    'AllocFileRequest'     ; Allo cFil eReq uest
   ALIGN 2                        ; long   
   dc.w    asl,-30

   dc.l    4
   dc.b    'FreeFileRequest'      ; Free File Requ est0
   ALIGN 2                        ; long
   dc.w    asl,-36

   dc.l    3
   dc.b    'RequestFile'          ; Requ estF ile0
   ALIGN 2                        ; long
   dc.w    asl,-42

   dc.l    4
   dc.b    'AllocAslRequest'      ; Allo cAsl Requ est0
   ALIGN   2
   dc.w    asl,-48

   dc.l    4
   dc.b    'FreeAslRequest'       ; Free AslR eque st00
   ALIGN   2
   dc.w    asl,-54

   dc.l    3
   dc.b    'AslRequest'           ; AslR eque st00
   ALIGN   2
   dc.w    asl,-60

