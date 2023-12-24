SETLOCAL
cd /d %DPATH%

SETLOCAL enabledelayedexpansion

for /f "tokens=2* delims==" %%i in ('type baldur.ini ^| find "HD0:"') do SET KEY=%%i

SET "source=baldur.ini"
SET "target=baldur2.ini"
SET "search=%KEY%"
SET "replace=%CD%\"

FOR /f "delims=" %%i IN ('FINDSTR . "%source%"') DO (
	SET line=%%i& CALL :change !line!
)
GOTO :next
:change

SET line=!line:%search%=%replace%!

IF [!line!] EQU [] (ECHO.>>%target%) ELSE (ECHO !line!>>%target%)
GOTO :eof

:next
del baldur.ini
ren baldur2.ini baldur.ini 

:eof

