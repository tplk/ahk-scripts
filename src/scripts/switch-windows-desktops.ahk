; map LWinRAlt + h/l to switching windows virtual desktops

#SingleInstance Force

<#>!SC023::Send,{LControl Down}{LWin Down}{Left Down}{LControl Up}{LWin Up}{Left Up}
<#>!SC026::Send,{LControl Down}{LWin Down}{Right Down}{LControl Up}{LWin Up}{Right Up}
