SETLOCAL
cd /d %DPATH%

:: search and replace; this code keeps exclamation marks and also empty lines, quotes must not contain tildes!
@echo off & setlocal disabledelayedexpansion

set "t=%temp%\text.tmp"
if exist "%t%" del "%t%"
for /f "delims=" %%i in ('findstr /n $ "%source%"') do set "Line=%%i" & call :ProcessLine
move "%t%" "%source%"
goto :eof

:ProcessLine
for /f "tokens=1* delims=:" %%a in ("%Line%") do set "L=%%b"
setlocal enabledelayedexpansion
if not defined L >>"%t%" echo\& goto :eof
>>"%t%" echo !L:%search%=%replace%!
endlocal
goto :eof
