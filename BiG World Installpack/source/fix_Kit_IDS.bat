SETLOCAL
cd /d %DPATH%

@echo off & setlocal disabledelayedexpansion

set "file=%OV%KIT.IDS"
set "list=.\%BWFP%\_IDS_ref\KIT.ref"

set "t=%temp%\text.tmp"
if exist "%t%" del "%t%"
for /f "delims=" %%i in ('findstr /n $ "%file%"') do set "Line=%%i" & call :ProcessLine
move "%t%" "%file%"
goto :eof

:ProcessLine
:: replace ! with / so it won't be kicked out
:: !!! Don't use ! in kit.ref, use / instead !!!
Set "Line=%Line:!=/%"
setlocal Enabledelayedexpansion
for /f "tokens=1* delims=:" %%a in ("%Line%") do set "L=%%b"
if not defined L>>"%t%" echo\& goto :eof
for /f "usebackq tokens=1-2 delims=;" %%s in ("%list%") do set "L=!L:%%s=%%t!"
:: change / back to !
Set "L=%L:/=^!%"
>>"%t%" echo !L!


Endlocal
goto :eof