﻿#Requires AutoHotkey v2.0

;ENDER
^L::ExitApp

;caller
^K::{
decoder()
}

; 10x next number
f_10() {
Send "{f down}"
Sleep 6300
Send "{f up}"
}

; 1x next number
f_1() {
Send "{f down}"
Sleep 1500
Send "{f up}"
}

; next dial
f_press() {
Send "{f down}"
Sleep 75
Send "{f up}"
}

;interaction_reset
f_reset() {
Sleep 850
}

;decoder
decoder() {
	
	firstgear := 0
	secondgear := 0
	thirdgear := 0
	fourthgear := 0
	
	loop {
		
		f_10
		f_reset
		
		f_press
		Sleep 250
		f_press
		Sleep 250
		f_press
		Sleep 250

		f_1
		f_reset

		f_press
		Sleep 250
		thirdgear := thirdgear + 1

		if(thirdgear > 9) {
	
			f_press
			Sleep 250
			f_press
			Sleep 250

			f_1
			f_reset

			f_press
			Sleep 250
			f_press
			Sleep 250

			thirdgear := 0
			secondgear := secondgear + 1
		}
		
		if(secondgear > 9) {
	
			f_press
			Sleep 250

			f_1
			f_reset
			
			f_press
			Sleep 250
			f_press
			Sleep 250
			f_press
			Sleep 250
			
			secondgear := 0
			firstgear := firstgear + 1
		}
		
		if(firstgear > 9) {
		
			ExitApp
	
		}
	}
}