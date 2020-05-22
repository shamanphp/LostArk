#NoEnv
#Persistent
#KeyHistory 0
#SingleInstance force 

CoordMode, Pixel, Window
Coordmode, Mouse, Window

global centerX := A_ScreenWidth/2
global centerY := A_ScreenHeight/2

 
;main function - move mouse cursor to reverse position of screen
reversePosition(tx, ty){
	 
		x .= A_ScreenWidth-tx
		y .= A_ScreenHeight-ty
		
		
		if(tx=centerX)
		{
			x .= centerX
		}
		
		if(ty=centerY)
		{
			y .= centerY
		
		}
	
	mousemove, x,  y
	return

}

;bind space button, sign dollar for use space in bind, see docs for more 
$space::
	;store current position of screen
	MouseGetPos, xpos, ypos 

	reversePosition(xpos, ypos)    
					 
	SendInput, {space Down}
	sleep, 65
	SendInput, {space Up}
	mousemove, xpos, ypos
	 
return

;replace original space to shift+space
+space::
	SendInput, {space Down}
	sleep, 65
	SendInput, {space Up}
return

;disable/enable bind button
F12::
	suspend 
return
