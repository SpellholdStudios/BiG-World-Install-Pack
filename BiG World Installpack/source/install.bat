SETLOCAL
cd /d %DPATH%

:: first parameter: the mods setup-name
:: second parameter: the components (make sure you use a quote to pass them eg. "0 1 2 3")
:: third parameter: optional
:Install
:: Search for the setup
If Not Exist Setup-%~1.exe (
	echo Skipping %1: Setup does not exist
	exit /b 0
)
:: Get the translation of the mod
Call :GETTRA %1
SET TRA=%errorlevel%
If %TRA% == 666 (
	echo Skipping %1, component[s] %~2: Does not fit language selection
	exit /b 0
)
:: Move old debug-files so findstr will not parse them
If Exist Setup-%~1.Debug Move Setup-%~1.Debug Setup-%~1.Debug.Old
:: Select the fitting installation
SET ADD=%~3
If "%ADD%" == "" (
	Call :Install_Normal %1 %TRA% %2
) else (
	If "%ADD:~0,4%" == "TYPE" (
		Call :Install_SUBWithType %1 %TRA% %2 %3
	) else (
		Call :Install_SUB %1 %TRA% %2 %3
	)
)
SET EXITVAL=%errorlevel%

findstr /C:"Installed ~" Setup-%~1.Debug>>BWP1.log
findstr "INSTALLED" Setup-%~1.Debug>>BWP2.log

:: pause the installation of the mod since WeiDU did not return an errorlevel of 0 (12.2  WeiDU Return Values)
If "%EXITVAL%" == "1" (
	echo WeiDU has reported an error
	pause
)

:: pause the installation of the mod since findstr found an uninstall pattern
findstr /I /M /C:"SUCCESSFULLY REMOVED OLD " Setup-%~1.Debug
If %errorlevel%==0 (
	echo Findstr has reported SUCCESSFULLY REMOVED OLD
	pause
)

:: pause the installation of the mod since findstr found a Warning pattern
:: Findstr /C: search string may not have more than 254 characters.
findstr /I /M /R /C:"WARNING: (?!*Could not find empty inventory slot.|*internal label|*audio was not installed|*cannot find block matching \[pcvamp/BCS/priest.bcs\])" Setup-%~1.Debug
if %errorlevel%==1 (
	findstr /I /M /C:"INSTALLED WITH WARNINGS " Setup-%~1.Debug
	If %errorlevel%==0 (
		echo Findstr has reported INSTALLED WITH WARNINGS
		pause
	)
)

:: change the installation of the mod since findstr found an error pattern
findstr /I /M /C:"NOT INSTALLED DUE TO ERRORS Smarter general AI" /C:"NOT INSTALLED DUE TO ERRORS IA generale plus efficace" /C:"NOT INSTALLED DUE TO ERRORS Kl黦ere allgemeine KI" /C:"NOT INSTALLED DUE TO ERRORS IA generale piu' intelligente" /C:"NOT INSTALLED DUE TO ERRORS 歹 康府茄 老馆 AI" /C:"NOT INSTALLED DUE TO ERRORS Inteligentniejszy ogolny skrypt SI" /C:"NOT INSTALLED DUE TO ERRORS 更聪明的普通 AI" /C:"NOT INSTALLED DUE TO ERRORS IA General m醩 Lista" Setup-%~1.Debug
if %errorlevel%==0 (
	findstr /I /M "SCSreplacement" %CON%>nul
	if %errorlevel%==0 (
		echo replace_SCS_6000>> %CON%
		GOTO :SKPERROR
	)
)

:: pause the installation of the mod since findstr found an error pattern
findstr /I /M /C:"NOT INSTALLED DUE TO ERRORS " Setup-%~1.Debug
If %errorlevel%==0 (
	echo Findstr has reported NOT INSTALLED DUE TO ERRORS
	pause
)
	   
:SKPERROR		 
:: pause the installation of the mod since findstr found an error pattern
findstr /I /M /C:"FATAL ERROR: Parsing.Parse_error" Setup-%~1.Debug
If %errorlevel%==0 (
	echo Findstr has reported FATAL ERROR: Parsing.Parse_error
	pause
)

:: pause the installation of the mod since findstr found a parse pattern
findstr /I /M /R /C:"PARSE ERROR (?!*. Recovering.|*argument \[pxWARLORD.\]|*argument \[pxBLADESINGER.\])" Setup-%~1.Debug
If %errorlevel%==0 (
	echo Findstr has reported PARSE ERROR
	pause
)

:: pause the installation of the mod since findstr found a parse pattern
findstr /I /M /C:"PARSE WARNING " Setup-%~1.Debug
If %errorlevel%==0 (
	findstr /I /M /C:"[Kit] argument [Blackguard] not found in [KIT.IDS]" Setup-%~1.Debug
	if %errorlevel%==1 (
		echo warning from Vynd is normal
	) else (
		echo Findstr has reported PARSE WARNING
		pause
	)
)

:: merge old debug-files
If Exist Setup-%~1.Debug.Old (
	Move Setup-%~1.Debug Setup-%~1.Debug.New
	Move Setup-%~1.Debug.Old Setup-%~1.Debug
	Type Setup-%~1.Debug.New>> Setup-%~1.Debug
	del Setup-%~1.Debug.New
)


CALL "%BWIPS%\ref_ids.bat"
%W5%

exit /b 1

:GETTRA
SET MOD=%1
SET TRA=
:: Lines in the TRA-file should look like this: StuffofTheMagi=GE-0,EN-1
FOR /F "tokens=2* delims==" %%i IN ('findstr /i /b /C:"%1=" "%BWIPI%\TRA.txt"') DO SET TRA=%%i
echo Available mod translations == %TRA%&rem remove for debugging

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F %%u IN (BWP_Language) DO (
	echo !TRA! | findstr /i %%u >NUL
	If "!errorlevel!" == "0" (
		for /l %%c in (0,1,255) do (
			set si=!TRA:~%%c,2!
			If /I "!si!" == "%%u" (
				CALL :STRIPNUM %%c
				echo Installing !MOD! with %%u translation language-token #!errorlevel!&rem remove for debugging
				exit /b !errorlevel!
			)
		)
		exit /b 666
	)
)
exit /b 666
ENDLOCAL

:STRIPNUM
SET /a c=%1+3
set si=!TRA:~%c%,2!
If "!SI:~1,1!" == "," SET SI=!SI:~0,1!
exit /b !SI!

:: install a normal mod
:Install_Normal
Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --no-exit-pause --force-install-list %~3 --logapp | %M% 
echo Weidu: %errorlevel%
exit /b %errorlevel%

:: install a mod with a SUB-component
:Install_SUB
%if% sub del sub
for %%i in (%~4) do (
	echo %%i>> sub
)
Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 <sub --logapp | %M%
exit /b %errorlevel%

:: install a mod with a type-command
:Install_SUBWithType
If /i "%1" == "BGT" (
   for /f "delims=" %%a in ('type BWP_BGT_input.txt') do @set BG1Dir=%%a
    %~4 | Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --args-list ops %BG1Dir% --logapp | %M%
) Else (
    %~4 | setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --logapp | %M%
)
exit /b %errorlevel%

:: Usefull help can be found at robvanderwoude.com and dostips.com