SETLOCAL
cd /d %DPATH%


if %PROCESSOR_ARCHITECTURE% == x86 copy /y ".\%BWIPU%\weidu-32.exe" "weidu.exe"
if %PROCESSOR_ARCHITECTURE% == AMD64 copy /y ".\%BWIPU%\weidu-64.exe" "weidu.exe"

:: Start of replacement
:ReplaceWeiDU
:: Loop until WeiDU.exe exists
%IFN% WeiDU.exe (
	%TXT% | findstr @083 | Call %C%
	pause
	goto :ReplaceWeiDU
)
 
Call :GetSize weidu.exe
SET SIZE=%errorlevel%

GOTO :SKIPshow
:: Show tasks that will be closed
%IF% %windir%\system32\tasklist.exe (
	%TXT% | findstr @084 | Call %C%
	tasklist /FI "IMAGENAME eq setup-*"
) else (
	%TXT% | findstr @085 | Call %C%
)
pause
:SKIPshow
:: Get the translation-string to display.
for /f "delims=" %%a in ('%TXT% ^| findstr @086 ^| Call %C%') do @set ReplaceWeiDU1=%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @087 ^| Call %C%') do @set ReplaceWeiDU2=%%a

:: Kill tasks silently, tell if they will be replaced and check if it worked.
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /f %%s IN ('dir /b /l setup-*.exe') DO (
	%IF% %windir%\system32\taskkill.exe (
		taskkill /F /IM "%%s" 2>NUL 1>NUL
	)
	Call :GetSize "%%s"
	If Not "!errorlevel!" == "!size!" (
		echo %ReplaceWeiDU1% %%s
		copy /Y WeiDU.exe %%s
		Call :GetSize "%%s"
		If Not "!errorlevel!" == "!size!" (
			echo %ReplaceWeiDU2% %%s
			pause
	        )
	)
)
ENDLOCAL
:: End of replacement>> return to main batch
Exit /b 0

:: Returns the size of a file. Note that it has to be lowercase or you will be screwed. Parameter %1 = the file to search for
:GetSize
SETLOCAL ENABLEDELAYEDEXPANSION
For /f "delims=" %%i In ('dir /l /-c %~1') Do (
	Call :IsSetup "%%i"
	If "!errorlevel!" == "1" (
		Call :GrepLine "%%i" %~1
		If Not "!errorlevel!" == "0" (
			Exit /b !errorlevel!
		)
	)
)
ENDLOCAL
:: return with return-value 0 (failure)
Exit /b 0

:: Returns the size of a file. Parameter %1 = the line that has to be searched, %2 = the file to search for
:GrepLine
SETLOCAL ENABLEDELAYEDEXPANSION
For /d %%i In (%~1) Do (
	If "%%i" == "%2" (
::return the size
		Exit /b !size!
	)	
	Set size=%%i
)
ENDLOCAL
:: return with return-value 0 (failure)
Exit /b 0

:: Returns if the passed line contains a setup (header always begin with a space)
:IsSetup
SETLOCAL ENABLEDELAYEDEXPANSION
SET TEST=%~1
If "%TEST:~0,1%" == " " Exit /b 0
Exit /b 1
ENDLOCAL