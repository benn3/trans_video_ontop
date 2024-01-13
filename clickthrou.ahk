#by Ben for Ben 
WinSet_Click_Through(I, T="254") {
	IfWinExist, % "ahk_id " I
	{
		If (T == "Off")
		{
			WinSet, AlwaysOnTop, Off, % "ahk_id " I
			WinSet, Transparent, Off, % "ahk_id " I
			WinSet, ExStyle, -0x20, % "ahk_id " I
			WinSet, Style, +0xC40000, % "ahk_id " I  ; Restore title bar
		}
		Else
		{
			WinSet, AlwaysOnTop, On, % "ahk_id " I
			If(T < 0 || T > 254 || T == "On")
				T := 254
			WinSet, Transparent, % T, % "ahk_id " I
			WinSet, ExStyle, +0x20, % "ahk_id " I
			WinSet, Style, -0xC40000, % "ahk_id " I  ; Remove title bar
		}
	}
	Else
		Return 0
}

ID = 0xa10a0
current_trans = 190

!5::
WinSet_Click_Through(active_id, current_trans)
Return

!4::
WinGet, active_id, ID, A
MsgBox, The active window's ID is "%active_id%".
Clipboard = %active_id%
Return

!6::
WinSet_Click_Through(active_id, "Off")
Return

!NumpadAdd::
current_trans += 10
if (current_trans > 254)
    current_trans := 254
WinSet_Click_Through(active_id, current_trans)
Return

!NumpadSub::
current_trans -= 10
if (current_trans < 0)
    current_trans := 0
WinSet_Click_Through(active_id, current_trans)
Return
