SETLOCAL
cd /d %DPATH%

Call ".\%BWIPS%\header.bat"

@echo off

::===========================
setlocal enabledelayedexpansion
%IF% ".\%BWIP%\temp\pulse_bar.txt" (
	Set pStrings=".\%BWIP%\temp\pulse_bar.txt"
) else (
	Set pStrings=".\temp\pulse_bar.txt"
)

color 0a
::Load Strings
Set count=0
FOR /F "delims==" %%i IN ('type %pStrings%') DO (
	set progress[!count!]=%%i
	set /a count=!count!+1
)

:REPPULSE
for /L %%i in (2,1,30) DO (
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo !progress[31]!
	echo.
	echo !progress[0]!
	echo !progress[%%i]!
	echo !progress[1]!
	echo.
	echo !progress[32]!
	echo !progress[33]!
	echo !progress[34]!
	echo !progress[35]!
	echo !progress[36]!
	%W2%

	If exist .\StopLBar EXIT [/B]
)

for /L %%i in (29,-1,3) DO (
	cls
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo.
	echo !progress[31]!
	echo.
	echo !progress[0]!
	echo !progress[%%i]!
	echo !progress[1]!
	echo.
	echo !progress[32]!
	echo !progress[33]!
	echo !progress[34]!
	echo !progress[35]!
	echo !progress[36]!
	%W2%

	If exist .\StopLBar EXIT [/B]
)
rem If exist .\StopLBar EXIT [/B]
goto :REPPULSE
endlocal
:ENDLOOP
::===========================