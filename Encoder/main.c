#include <htc.h>
#include <stdio.h>
#include "usart.h"

#define _XTAL_FREQ 4000000

#define left RB1
#define right RB2

volatile unsigned char EncData;
__CONFIG(WDTDIS & UNPROTECT & LVPDIS & HS);

void main()
{

unsigned char OldEncData = 3;
unsigned char upcount = 0;
unsigned char downcount = 0;
TRISB1 = 1;
TRISB2 = 1;
TRISB5 = 0;
init_comms();
printf("\r\nTrarara");
OPTION = 0b11010001;
TMR0 = 0;
T0IE = 1;
GIE = 1;


while (1) {




    
	if (OldEncData != EncData) { 

	switch (OldEncData) {
	
						case 0 : if (EncData == 1) {upcount++; downcount=0; }
								 if (EncData == 2) {downcount++; upcount = 0; }
								 break;
						case 1 : if (EncData == 3) {upcount++; downcount=0; }
								 if (EncData == 0) {downcount++; upcount = 0; }
								 break;
						case 2 : if (EncData == 0) {upcount++; downcount=0; }
								 if (EncData == 3) {downcount++; upcount = 0; }
								 break;
						case 3 : if (EncData == 2) {upcount++; downcount=0; }
								 if (EncData == 1) {downcount++; upcount = 0; }
								 break;								 
	
	
	}

	OldEncData = EncData;
	}
	
if (upcount >= 4) {
			printf("\r\n UP");
			upcount = 0;
		}
if (downcount >= 4 ) {
			printf("\r\n Down");	
			downcount = 0;
		}	


 }


}	
	
interrupt isr() {
 
if (T0IF) {
TMR0 = 0;
EncData = PORTB & 0b00000110;
EncData >>= 1;
T0IF = 0;
}
 
}