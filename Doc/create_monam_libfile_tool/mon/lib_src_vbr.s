; vbr / 256 cpu vectors

&Bus_error	EQU	2*4
&Address_error	EQU	3*4
&Illegal_exception	EQU	4*4
&Divide_by_zero	EQU	3*4
&CHK_exception	EQU	4*4
&TRAPV_exception	EQU	5*4
&Privilege_violation	EQU	6*4
&Trace	EQU	9*4
&Line_A	EQU	10*4
&Line_F	EQU	11*4
&CoPro_violation	EQU	13*4
&Format_error	EQU	14*4


&Bad_interrupt	EQU	24*4
&Av1_Serial	EQU	25*4
&Av2_Timer	EQU	26*4
&Av3_Vbl	EQU	27*4
&Av4_Audio	EQU	28*4
&Av5_buf	EQU	29*4  ; Task terminated
&Av6_ext	EQU	30*4
&Av7	EQU	31*4
&Trap#0	EQU	32*4
&Trap#1	EQU	33*4
&Trap#2	EQU	34*4
&Trap#3	EQU	35*4
&Trap#4	EQU	36*4
&Trap#5	EQU	37*4
&Trap#6	EQU	38*4
&Trap#7	EQU	39*4
&Trap#8	EQU	40*4
&Trap#9	EQU	41*4
&Trap#10	EQU	42*4
&Trap#11	EQU	43*4
&Trap#12	EQU	44*4
&Trap#13	EQU	45*4
&Trap#14	EQU	46*4
&Trap#15	EQU	47*4
&FP_Unordered	EQU	48*4
&FP_Inexact	EQU	49*4
&FP_div_zero	EQU	50*4
&FP_Underflow	EQU	51*4
&FP_Operand_error	EQU	52*4
&FP_Overflow	EQU	53*4
&FP_NAN	EQU	54*4

&MMU_ConfigBad	EQU	56*4
&MMU_Illegal	EQU	57*4
&MMU_Access	EQU	58*4
