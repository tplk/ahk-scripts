; right alt + F6: Show Spotify

#SingleInstance Force

>!F6::
{
	DetectHiddenWindows, On

	winId := Get_Spotify_Id()
	WinGet, style, Style, ahk_id %winId%
	if (style & 0x10000000) { ; WS_VISIBLE
		WinHide, ahk_id %winId%
		WinGet, windows, List
		Send !{TAB}
	} else {
		WinShow, ahk_id %winId%
		WinActivate, ahk_id %winId%
	}

	DetectHiddenWindows, Off
	return
}

; HELPERS

; Global variable to cache the Spotify Window ID once it's been found
global cached_spotify_window := 0

; FUNCTION: Get the ID of the Spotify window (using cache)
Get_Spotify_Id() {
	if (Is_Spotify(cached_spotify_window)) {
		return cached_spotify_window
	}

	WinGet, windows, List, ahk_exe Spotify.exe
	Loop, %windows% {
		winId := windows%A_Index%
		if (Is_Spotify(winId)) {
			cached_spotify_window = %winId%
			return winId
		}
	}
}

; FUNCTION: Check if the given ID is a Spotify window
Is_Spotify(winId) {
	WinGetClass, class, ahk_id %winId%
	if (class == "Chrome_WidgetWin_0") {
		WinGetTitle, title, ahk_id %winId%
		return (title != "")
	}
	return false
}
