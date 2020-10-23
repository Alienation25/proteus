opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 11 "X:\Hi-tech\Encoder_877a\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "X:\Hi-tech\Encoder_877a\main.c"
	dw 0x3FFB & 0x3FFF & 0x3F7F & 0x3FFE ;#
	FNCALL	_main,_printf
	FNCALL	_printf,_putch
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_EncData
	global	_PORTB
psect	text59,local,class=CODE,delta=2
global __ptext59
__ptext59:
_PORTB	set	6
	global	_RCSTA
_RCSTA	set	24
	global	_TMR0
_TMR0	set	1
	global	_TXREG
_TXREG	set	25
	global	_GIE
_GIE	set	95
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TXIF
_TXIF	set	100
	global	_OPTION
_OPTION	set	129
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB2
_TRISB2	set	1074
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_1:	
	retlw	13
	retlw	10
	retlw	84	;'T'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	0
psect	strings
	
STR_3:	
	retlw	13
	retlw	10
	retlw	32	;' '
	retlw	68	;'D'
	retlw	111	;'o'
	retlw	119	;'w'
	retlw	110	;'n'
	retlw	0
psect	strings
	
STR_2:	
	retlw	13
	retlw	10
	retlw	32	;' '
	retlw	85	;'U'
	retlw	80	;'P'
	retlw	0
psect	strings
	file	"encoder.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_EncData:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_printf
?_printf:	; 2 bytes @ 0x0
	global	?_isr
?_isr:	; 2 bytes @ 0x0
	ds	2
	global	??_putch
??_putch:	; 0 bytes @ 0x2
	global	putch@byte
putch@byte:	; 1 bytes @ 0x2
	ds	1
	global	??_printf
??_printf:	; 0 bytes @ 0x3
	global	printf@f
printf@f:	; 1 bytes @ 0x3
	ds	1
	global	printf@c
printf@c:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	main@OldEncData
main@OldEncData:	; 1 bytes @ 0x5
	ds	1
	global	main@upcount
main@upcount:	; 1 bytes @ 0x6
	ds	1
	global	main@downcount
main@downcount:	; 1 bytes @ 0x7
	ds	1
;;Data sizes: Strings 24, constant 0, data 0, bss 1, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       9
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; printf@f	PTR const unsigned char  size(1) Largest target is 10
;;		 -> STR_3(CODE[8]), STR_2(CODE[6]), STR_1(CODE[10]), 
;;
;; printf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_printf(COMMON[2]), 
;;
;; S606$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_printf
;;   _printf->_putch
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0     105
;;                                              5 COMMON     3     3      0
;;                             _printf
;; ---------------------------------------------------------------------------------
;; (1) _printf                                               9     9      0      45
;;                                              3 COMMON     2     2      0
;;                              _putch
;; ---------------------------------------------------------------------------------
;; (2) _putch                                                1     1      0      15
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _isr                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _printf
;;     _putch
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       9       1       64.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       9       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "X:\Hi-tech\Encoder_877a\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  downcount       1    7[COMMON] unsigned char 
;;  upcount         1    6[COMMON] unsigned char 
;;  OldEncData      1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 11F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_printf
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"X:\Hi-tech\Encoder_877a\main.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	16
	
l1563:	
;main.c: 16: unsigned char OldEncData = 3;
	movlw	(03h)
	movwf	(main@OldEncData)
	line	17
	
l1565:	
;main.c: 17: unsigned char upcount = 0;
	clrf	(main@upcount)
	line	18
	
l1567:	
;main.c: 18: unsigned char downcount = 0;
	clrf	(main@downcount)
	line	19
	
l1569:	
;main.c: 19: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7
	line	20
	
l1571:	
;main.c: 20: TRISB2 = 1;
	bsf	(1074/8)^080h,(1074)&7
	line	21
	
l1573:	
;main.c: 21: TRISB5 = 0;
	bcf	(1077/8)^080h,(1077)&7
	line	22
	
l1575:	
;main.c: 22: TRISC7 = 1; TRISC6 = 1; SPBRG = ((int)(4000000L/(16UL * 9600) -1)); RCSTA = (0|0x90); TXSTA = (0x4|0|0x20);
	bsf	(1087/8)^080h,(1087)&7
	
l1577:	
	bsf	(1086/8)^080h,(1086)&7
	movlw	(019h)
	movwf	(153)^080h	;volatile
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(152)^080h	;volatile
	line	23
	
l1579:	
;main.c: 23: printf("\r\nTrarara");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_printf
	line	24
	
l1581:	
;main.c: 24: OPTION = 0b11010001;
	movlw	(0D1h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	25
	
l1583:	
;main.c: 25: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(1)	;volatile
	line	26
	
l1585:	
;main.c: 26: T0IE = 1;
	bsf	(93/8),(93)&7
	line	27
	
l1587:	
;main.c: 27: GIE = 1;
	bsf	(95/8),(95)&7
	line	36
	
l1589:	
;main.c: 36: if (OldEncData != EncData) {
	movf	(main@OldEncData),w
	xorwf	(_EncData),w	;volatile
	skipnz
	goto	u41
	goto	u40
u41:
	goto	l564
u40:
	goto	l1643
	line	40
	
l1593:	
	decf	(_EncData),w	;volatile
	skipz
	goto	u51
	goto	u50
u51:
	goto	l1599
u50:
	
l1595:	
	incf	(main@upcount),f
	
l1597:	
	clrf	(main@downcount)
	line	41
	
l1599:	
;main.c: 41: if (EncData == 2) {downcount++; upcount = 0; }
	movf	(_EncData),w	;volatile
	xorlw	02h
	skipz
	goto	u61
	goto	u60
u61:
	goto	l1645
u60:
	
l1601:	
	incf	(main@downcount),f
	
l1603:	
	clrf	(main@upcount)
	goto	l1645
	line	43
	
l1605:	
	movf	(_EncData),w	;volatile
	xorlw	03h
	skipz
	goto	u71
	goto	u70
u71:
	goto	l1611
u70:
	
l1607:	
	incf	(main@upcount),f
	
l1609:	
	clrf	(main@downcount)
	line	44
	
l1611:	
;main.c: 44: if (EncData == 0) {downcount++; upcount = 0; }
	movf	(_EncData),f
	skipz	;volatile
	goto	u81
	goto	u80
u81:
	goto	l1645
u80:
	goto	l1601
	line	46
	
l1617:	
	movf	(_EncData),f
	skipz	;volatile
	goto	u91
	goto	u90
u91:
	goto	l1623
u90:
	
l1619:	
	incf	(main@upcount),f
	
l1621:	
	clrf	(main@downcount)
	line	47
	
l1623:	
;main.c: 47: if (EncData == 3) {downcount++; upcount = 0; }
	movf	(_EncData),w	;volatile
	xorlw	03h
	skipz
	goto	u101
	goto	u100
u101:
	goto	l1645
u100:
	goto	l1601
	line	49
	
l1629:	
	movf	(_EncData),w	;volatile
	xorlw	02h
	skipz
	goto	u111
	goto	u110
u111:
	goto	l1635
u110:
	
l1631:	
	incf	(main@upcount),f
	
l1633:	
	clrf	(main@downcount)
	line	50
	
l1635:	
;main.c: 50: if (EncData == 1) {downcount++; upcount = 0; }
	decf	(_EncData),w	;volatile
	skipz
	goto	u121
	goto	u120
u121:
	goto	l1645
u120:
	goto	l1601
	line	38
	
l1643:	
	movf	(main@OldEncData),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    31    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l1593
	xorlw	1^0	; case 1
	skipnz
	goto	l1605
	xorlw	2^1	; case 2
	skipnz
	goto	l1617
	xorlw	3^2	; case 3
	skipnz
	goto	l1629
	goto	l1645

	line	56
	
l1645:	
;main.c: 56: OldEncData = EncData;
	movf	(_EncData),w	;volatile
	movwf	(main@OldEncData)
	line	57
	
l564:	
	line	59
;main.c: 57: }
;main.c: 59: if (upcount >= 4) {
	movlw	(04h)
	subwf	(main@upcount),w
	skipc
	goto	u131
	goto	u130
u131:
	goto	l1651
u130:
	line	60
	
l1647:	
;main.c: 60: printf("\r\n UP");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_printf
	line	61
	
l1649:	
;main.c: 61: upcount = 0;
	clrf	(main@upcount)
	line	63
	
l1651:	
;main.c: 62: }
;main.c: 63: if (downcount >= 4 ) {
	movlw	(04h)
	subwf	(main@downcount),w
	skipc
	goto	u141
	goto	u140
u141:
	goto	l1589
u140:
	line	64
	
l1653:	
;main.c: 64: printf("\r\n Down");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_printf
	line	65
	
l1655:	
;main.c: 65: downcount = 0;
	clrf	(main@downcount)
	goto	l1589
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	72
	signat	_main,88
	global	_printf
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:

;; *************** function _printf *****************
;; Defined at:
;;		line 461 in file "C:\Program Files\HI-TECH Software\PICC\9.71a\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               1    wreg     PTR const unsigned char 
;;		 -> STR_3(8), STR_2(6), STR_1(10), 
;; Auto vars:     Size  Location     Type
;;  f               1    3[COMMON] PTR const unsigned char 
;;		 -> STR_3(8), STR_2(6), STR_1(10), 
;;  _val            4    0        struct .
;;  c               1    4[COMMON] char 
;;  flag            1    0        unsigned char 
;;  prec            1    0        char 
;;  ap              1    0        PTR void [1]
;;		 -> ?_printf(2), 
;; Return value:  Size  Location     Type
;;                  2  560[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 11F/20
;;		On exit  : 11F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_putch
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text60
	file	"C:\Program Files\HI-TECH Software\PICC\9.71a\sources\doprnt.c"
	line	461
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:	
	opt	stack 7
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;printf@f stored from wreg
	movwf	(printf@f)
	line	540
	
l1557:	
	goto	l1561
	line	545
	
l1559:	
	movf	(printf@c),w
	fcall	_putch
	line	540
	
l1561:	
	movf	(printf@f),w
	incf	(printf@f),f
	movwf	fsr0
	fcall	stringdir
	movwf	(printf@c)
	movf	((printf@c)),f
	skipz
	goto	u31
	goto	u30
u31:
	goto	l1559
u30:
	line	1533
	
l1168:	
	return
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
;; =============== function _printf ends ============

	signat	_printf,602
	global	_putch
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:

;; *************** function _putch *****************
;; Defined at:
;;		line 7 in file "X:\Hi-tech\Encoder_877a\usart.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 11F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text61
	file	"X:\Hi-tech\Encoder_877a\usart.c"
	line	7
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 6
; Regs used in _putch: [wreg]
;putch@byte stored from wreg
	movwf	(putch@byte)
	line	9
	
l1553:	
	line	10
;usart.c: 9: while(!TXIF)
	
l1146:	
	line	9
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u21
	goto	u20
u21:
	goto	l1146
u20:
	line	11
	
l1555:	
;usart.c: 11: TXREG = byte;
	movf	(putch@byte),w
	movwf	(25)	;volatile
	line	12
	
l1149:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_isr
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:

;; *************** function _isr *****************
;; Defined at:
;;		line 74 in file "X:\Hi-tech\Encoder_877a\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  585[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text62
	file	"X:\Hi-tech\Encoder_877a\main.c"
	line	74
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 5
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	pclath,w
	movwf	(??_isr+1)
	ljmp	_isr
psect	text62
	line	76
	
i1l1541:	
;main.c: 76: if (T0IF) {
	btfss	(90/8),(90)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l587
u1_20:
	line	77
	
i1l1543:	
;main.c: 77: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(1)	;volatile
	line	78
	
i1l1545:	
;main.c: 78: EncData = PORTB & 0b00000110;
	movf	(6),w
	movwf	(_EncData)	;volatile
	
i1l1547:	
	movlw	(06h)
	andwf	(_EncData),f	;volatile
	line	79
	
i1l1549:	
;main.c: 79: EncData >>= 1;
	clrc
	rrf	(_EncData),f	;volatile
	line	80
	
i1l1551:	
;main.c: 80: T0IF = 0;
	bcf	(90/8),(90)&7
	line	83
	
i1l587:	
	movf	(??_isr+1),w
	movwf	pclath
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,90
psect	text63,local,class=CODE,delta=2
global __ptext63
__ptext63:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
