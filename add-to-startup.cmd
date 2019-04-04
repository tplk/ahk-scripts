@echo off
setlocal

set scripts_dir=%cd%\src\scripts
set startup_dir=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup
set shortcut_ps_path=%cd%\shortcut.ps1

for /r "%scripts_dir%" %%a in (*.ahk) do call:CreateStartupShortcut "%%~a"

exit /B %errorlevel%

:CreateStartupShortcut
set script_path=%~1
set shortcut_path=%startup_dir%\%~n1.lnk

echo.
powershell.exe -ExecutionPolicy ByPass -File "%shortcut_ps_path%" -target "%script_path%" -path "%shortcut_path%"
echo.
exit /B 0
