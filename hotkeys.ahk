; purplevarun's hotkeys

; HOTKEYS

#F1::
Send {Volume_Mute}
return

#F2::
Send {Volume_Down}
return

#F3::  
Send {Volume_Up}
return

#F4::
ChangeBrightness( CurrentBrightness := 0 ) 
return

#F5::
ChangeBrightness( CurrentBrightness := 50 ) 
return

#F6::
ChangeBrightness( CurrentBrightness := 100 ) 
return

^Left::
Send {Home}
return

^Right::
Send {End}
return

^Up::
Send ^{PgUp}
return

^Down::
Send ^{PgDn}
return


+^Left::
Send +{Home}
return

+^Right::
Send +{End}
return

; ------------------------------------------------------

; Variables
Increments 			:= 10 ; < lower for a more granular change, higher for larger jump in brightness 
CurrentBrightness 	:= GetCurrentBrightNess()

; Functions
ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
	if ( brightness >= 0 && brightness <= 100 )
	{
		For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( timeout, brightness )	
	}
 	else if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}
