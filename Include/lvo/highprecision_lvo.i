_LVOHpSetup     EQU -$001E ; (a)(D0)
_LVOHpResize    EQU -$0024 ; (a)(D0)
_LVOHpMakeVar   EQU -$002A ; ()()
_LVOHpUnMakeVar EQU -$0030 ; (a)(D0)
_LVOHpMakeStr   EQU -$0036 ; ()()
_LVOFp2hp       EQU -$003C ; (a,b)(A0,D0)
_LVOHp2fp       EQU -$0042 ; (a)(D0)
_LVOInt2hp      EQU -$0048 ; (a,b)(A0,D0)
_LVOHp2int      EQU -$004E ; (a)(D0)
_LVOStr2hp      EQU -$0054 ; (a,b)(A0,D0)
_LVOHp2str      EQU -$005A ; (a,b,c)(A0,D1,D0)
_LVOHpAdd       EQU -$0060 ; (a,b,c)(A0,D1,D0)
_LVOHpSub       EQU -$0066 ; (a,b,c)(A0,D1,D0)
_LVOHpMul       EQU -$006C ; (a,b,c)(A0,D1,D0)
_LVOHpDiv       EQU -$0072 ; (a,b,c)(A0,D1,D0)
_LVOHpPower     EQU -$0078 ; (a,b,c)(A0,D1,D0)
_LVOHpSqrt      EQU -$007E ; (a,b)(A0,D0)
_LVOHpRec       EQU -$0084 ; (a,b)(A0,D0)
_LVOHpCopy      EQU -$008A ; (a,b)(A0,D0)
_LVOHpClear     EQU -$0090 ; (a)(D0)
_LVOHpCmp       EQU -$0096 ; (a,b,c)(A0,D1,D0)
_LVOHpEq        EQU -$009C ; (a,b)(A0,D0)
_LVOHpSign      EQU -$00A2 ; (a)(D0)
_LVOHpAbs       EQU -$00A8 ; (a,b)(A0,D0)
_LVOHpChs       EQU -$00AE ; (a,b)(A0,D0)
_LVOHpHalf      EQU -$00B4 ; (a,b)(A0,D0)
_LVOHpDouble    EQU -$00BA ; (a,b)(A0,D0)
_LVOHpInt       EQU -$00C0 ; (a,b)(A0,D0)
_LVOHpFrc       EQU -$00C6 ; (a,b)(A0,D0)