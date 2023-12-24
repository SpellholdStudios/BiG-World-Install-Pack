:: skip Chores review
@echo on

SETLOCAL
cd /d %DPATH%

SETLOCAL enabledelayedexpansion

set "target=%temp%\text.tmp"
if exist "!target!" del "!target!"
set "search=CBCT3510"
set "replace=CBCT3500"

FOR /f "delims=" %%i IN ('FINDSTR . "!source!"') DO (
	SET line=%%i& CALL :change !line!
)
move "!target!" "!source!"
GOTO :eof
:change

SET line=!line:%search%=%replace%!

IF [!line!] EQU [] (ECHO.>>!target!) ELSE (ECHO !line!>>!target!)
GOTO :eof

:eof
