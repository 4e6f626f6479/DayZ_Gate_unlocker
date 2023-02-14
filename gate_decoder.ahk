#Requires AutoHotkey v2.0

;ENDER
^L::ExitApp

;caller
^K::{
decoder()
}

; 10x next number
f_10() {
Send "{f down}"
Sleep 4100
Send "{f up}"
}

; 1x next number
f_1() {
Send "{f down}"
Sleep 1100
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
			fourthgear := fourthgear + 1
		}
		
		if(fourthgear > 9) {
	
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
			
			fourthgear := 0
		}
	}
}