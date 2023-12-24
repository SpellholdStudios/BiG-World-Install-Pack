SETLOCAL
cd /d %DPATH%

:: Get the setup-name and the mods name
:: Parameter %1 = setup-name (use " if there are spaces)
:: Parameter %2 = components
SET VAL=
FOR /F "tokens=2 delims==" %%i IN ('findstr /B /I /C:"%1=" "%BWIPI%\List.txt"') DO SET VAL=%%i

if "%VAL%" NEQ "" (
	echo %VAL% %2>>"BWP preview.txt"
) else (
	echo %1 %2>>"BWP preview.txt"
)

set text=%2
set text=%text:~1,-1%

FOR %%i IN (%text%) DO (
	echo "%1.TP2~ #0 #%%i /">>"BWP preview.log"
)
goto :eof
