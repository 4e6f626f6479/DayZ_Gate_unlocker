#Requires AutoHotkey v2.0

;ENDER (Ends the macro)
^L::ExitApp

;ACTIVATOR (Activates the Macro)
^K::{
decoder()
}

; (because of the way DayZ interactions work it is fastest to try) 10x next number
f_10() {
Send "{f down}"
Sleep 4150
Send "{f up}"
}

; 1x next number (used for the higher dials)
f_1() {
Send "{f down}"
Sleep 1100
Send "{f up}"
}

; next dial (switches to next dial)
f_press() {
Send "{f down}"
Sleep 75
Send "{f up}"
}

;interaction_reset (dayZ is slow with interactions so we need to pause sometimes to keep the macro going reliably)
f_reset() {
Sleep 850
}

;decoder
decoder() {
	
	; initialise gears
	firstgear := 0
	secondgear := 0
	thirdgear := 0
	fourthgear := 0
	
	loop {
		
		;This is the fourth gear cycle, it cycles the fourth gear once and then adds one to the third gear
		
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
	
			; when the third gear has completed a revolution we move the second gear by one
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
	
			;when the second gear has completed a revolution we move the first gear by one
			
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
		
			; when we have moved the first gear by one full revolution we have checked all combinations so the macro ends. 
			
			ExitApp
	
		}
	}
}