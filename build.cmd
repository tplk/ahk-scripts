@echo off
setlocal

set scripts_dir=%cd%\src\scripts
set build_dir=%cd%\build
set ahk_compiler_path=C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe

rmdir /S /Q "%build_dir%"
mkdir "%build_dir%"

for /r "%scripts_dir%" %%a in (*.ahk) do call:Compile "%%~a"

exit /B %errorlevel%

:Compile
set in_path=%~1
set out_path=%build_dir%\%~n1.exe

echo.
"%ahk_compiler_path%" /in "%in_path%" /out "%out_path%"
echo.
exit /B 0
