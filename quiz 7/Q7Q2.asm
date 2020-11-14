		#include<p18f4550.inc>
		
		org	0x00
		goto	start
		org	0x08
		retfie
		org	0x18
		retfie

;************************************
;MAIN PROGRAM
;************************************

configure	setf TRISB,A
			clrf TRISD,A
			clrf PORTB,A
			clrf PORTD,A

on_led	bsf	PORTD,0,A
		bra check1

on_led1	bsf PORTD,1,A
		bra check
		

;**************************************
		
start	call configure
	
check	btfss	PORTB,0,A
		bra		on_led
		bcf		PORTD,0,A
		bra 	check1

check1	btfss	PORTB,1,A
		bra		on_led1
		bcf		PORTD,1,A
		bra		check		
		end