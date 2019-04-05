@echo off
setlocal

set scripts_dir=%cd%\src\scripts

for /r "%scripts_dir%" %%a in (*.ahk) do call:Start "%%~a"

exit /B %errorlevel%

:Start
set script_path=%~1

echo.
cmd /C "start %script_path%"
echo Ran %script_path%
echo.
exit /B 0
