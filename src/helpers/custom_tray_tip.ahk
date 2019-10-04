ShowTrayTip(Title, Message, Duration = 1000)
{
  TrayTip, %Title%, %Message%, 2, 16
  SetTimer, HideTrayTip, -%Duration%
  return

}

HideTrayTip() {
    TrayTip  ; Attempt to hide it the normal way.
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200  ; It may be necessary to adjust this sleep.
        Menu Tray, Icon
    }
}
