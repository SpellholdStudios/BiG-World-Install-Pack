SETLOCAL
cd /d %DPATH%

:: first parameter: the mods setup-name
:: second parameter: the components (make sure you use a quote to pass them eg. "0 1 2 3")
:: third parameter: optional 

SET EDITV32="%CD%\%BWIPU%\editv32.exe"
SET LOG_INST="%CD%\%BWIP%\log_inst_cmd.txt"

:Install
echo.
echo.
echo Installing %1...

:: Search for the setup
If Not Exist Setup-%~1.exe (
	echo Skipping %1: Setup does not exist
	exit /b 0
)

:: Get the desired translation
SET TP2_PATH=
SET TRA=

IF EXIST "Setup-%~1.tp2" SET TP2_PATH=Setup-%~1.tp2
IF EXIST "%CD%\%~1\Setup-%~1.tp2" SET TP2_PATH=%CD%\%~1\Setup-%~1.tp2
IF EXIST "%~1.tp2" SET TP2_PATH=%~1.tp2
IF EXIST "%CD%\%~1\%~1.tp2" SET TP2_PATH=%CD%\%~1\%~1.tp2

IF "%TP2_PATH%" == "" (
	echo Skipping %1, component[s] %~2: Can not find TP2 file
	pause
	exit /b 0
)

echo.
echo.
WeiDU.exe --list-languages "%TP2_PATH%" --noautoupdate --no-exit-pause
%EDITV32% -p "Language: " TRA 
IF "%TRA%" == "" (
	echo Skipping %1, component[s] %~2: No language selected: aborting
	pause
	exit /b 0
)


:: Select/Adjust the components
SET COMP=%~2

echo.
echo.
Setup-%~1.exe --list-components "%TP2_PATH%" 0 --noautoupdate --no-exit-pause
%EDITV32% -p "Components (type SPACE for none): " COMP

echo Installing %1, component[s] %COMP% with language-token %TRA%
SET ADD=%~3
If "%ADD%" == "" (
	Call :Install_Normal %1 %TRA% "%COMP%"
) else (
	%EDITV32% -p "Optional (3rd type): " ADD
	If "%ADD:~0,4%" == "TYPE" (
		Call :Install_SUBWithType %1 %TRA% "%COMP%" "%ADD%"
	) else (
		Call :Install_SUB %1 %TRA% "%COMP%" "%ADD%"
	)	
)
CALL "%BWIPS%\ref_ids.bat"
%W5%

exit /b 1
:: pause the installation of the mod since WeiDU did not return an errorlevel of 0 (12.2  WeiDU Return Values)
If Not "%errorlevel%" == "0" (
	echo WeiDU has reported an error
	pause
)
exit /b 1


:: install a normal mod
:Install_Normal
echo Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --logapp>> %LOG_INST%
Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --logapp | %M%
exit /b %errorlevel%

:: install a mod with a SUB-component
:Install_SUB
%if% sub del sub
for %%i in (%~4) do (
	echo %%i>> sub
)
echo setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 ^<sub --logapp>> %LOG_INST%
Setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 <sub --logapp | %M%
exit /b %errorlevel%

:: install a mod with a type-command
:Install_SUBWithType
echo %~4 ^| setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --logapp>> %LOG_INST%
%~4 | setup-%~1.exe --language %2 --skip-at-view --noautoupdate --force-install-list %~3 --logapp | %M%
exit /b %errorlevel%

:: Usefull help can be found at robvanderwoude.com and dostips.com