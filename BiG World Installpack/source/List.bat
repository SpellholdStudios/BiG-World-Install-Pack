SETLOCAL
cd /d %DPATH%

:: Loops through the list in the file LIST.txt and passes it to :ModTest.
:: Parameter %1 = setup-name=modname (use " if there are spaces)
:: Parameter %2 = IE, INE, II or INI, meaning [I]f ([N]ot) [E]xist and [I]f ([N]ot) [I]nstalled
:GetMods
SETLOCAL ENABLEDELAYEDEXPANSION& rem enable to handle !errorlevel! in :ModTest
For /f "usebackq delims=" %%i In ("BiG World Installpack\install\List.txt") Do (
	CALL :ModTest "%%i" %1 ON& rem add the ON-switch to determine if SETLOCAL is on
)
ENDLOCAL
Exit /b 0& rem do not run more stuff

:: Print a line if a condition is met
:: Parameter %1 = setup-name=modname   (use " if there are spaces)
:: Parameter %2 = IE, INE, II or INI   meaning [I]f ([N]ot) [E]xist and [I]f ([N]ot) [I]nstalled
:: Parameter %3 = ON                   Do not switch ENABLEDELAYEDEXPANSION on and off all over again
:ModTest
If "%3" NEQ "ON" (
	SETLOCAL ENABLEDELAYEDEXPANSION
)
:: Test if the parameter is ok
SET TEST=%~1
If "%TEST:~0,1%" == "=" SET TEST=___
If "%TEST:~-1%" == "=" SET TEST=___
If "%TEST%" == "___" (
	If "%3" NEQ "ON" (
		ENDLOCAL
	)
	echo Bad expression
	exit /b 0
)

:: Get the setup-name and the mods name
SET VAL=
FOR /F "tokens=2* delims==" %%i IN ("%~1") DO SET VAL=%%i
SET NAME=%VAL%

FOR /F "tokens=1 delims==" %%i IN ("%~1") DO SET VAL=%%i
SET MOD=%VAL%
:: echo %Mod% == %NAME%

IF "[%NAME%]" == "[]" exit /b 0

IF "%2" == "IE" (
	If Exist Setup-%MOD%.exe (
			echo %NAME%>> "BWP existing mods.txt"
	)
)
IF "%2" == "INE" (
	If Not Exist Setup-%MOD%.exe (
			echo %NAME%>> "BWP not existing mods.txt"
	)
)
IF "%2" == "II" (
	CALL :TestInstalled %MOD% .*
	If "!errorlevel!" == "1" (
		echo %NAME%>> "BWP installed mods.txt"
	)	
)
IF "%2" == "INI" (
	If Exist Setup-%MOD%.exe (
		CALL :TestInstalled %MOD% .*
		If "!errorlevel!" == "0" echo %NAME%>> "BWP not installed mods.txt"
	)	
)
If "%3" NEQ "ON" (
	ENDLOCAL
)
exit /b 0

:: Search weidu.log for a regular expression
:: Parameter %1 = setup-name=modname
:: Parameter %2 = component-number
:TestInstalled
For /f "delims=" %%t in ('findstr /I "%1.tp2~.*#.*#%2 " weidu.log') DO (
	exit /b 1& rem If searched component was found, exit with return-value 1 (success)
)
exit /b 0& rem return with return-value 0 (fail)

:eof