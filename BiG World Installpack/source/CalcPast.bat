SETLOCAL
cd /d %DPATH%

@echo off & setlocal ENABLEDELAYEDEXPANSION

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @625 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" goto :CALCPAST
if /I "%X%"=="N" goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause

:CALCPAST
findstr /I /M "emptied" %IPL%>nul
if not errorlevel 1 goto :eof

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @629 | Call %C%
%.%
%.%
%TXT% | findstr @671 | Call %C%

::get folder size
%.%
set "FS=%temp%\GetFolderSize.vbs
echo WScript.Echo Int(CreateObject("Scripting.FileSystemObject").GetFolder(WScript.Arguments(0)).Size/1024/1024+.99)>%FS%

:: size in MB
for /f "delims=" %%a in ('type BWP_BG2_input.txt') do @set BG2=%%a
for /f %%i in ('cscript //nologo %FS% "%BG2%"') do set BGIIGr=%%i

:: size in GB
::You can only calculate with integers in batch; batch will cut off the digits, vbs however can display them.
set calc=%temp%\calculate.vbs
echo Set a=WScript.Arguments:WScript.Echo FormatNumber(Eval(a(0)),a(1))>%calc%
for /f %%i in ('cscript //nologo %calc% "%BGIIGr%/1024" 1') do set BG2Dez=%%i

set cleanBG2=2627
set cleanBGT=5137

::get subfolder size

%IF% CD2 (
	set CD2_5=1485
	%.% CD 2 - 5 folders have    %CD2_5% MB
) else (
	set CD2_5=0
)
set "data1=data"
for /f %%i in ('cscript //nologo %FS% "%data1%"') do set /A dataGr=%%i
%.% data folder has          %dataGr% MB
set "music1=music"
for /f %%i in ('cscript //nologo %FS% "%music1%"') do set /A musicGr=%%i
%.% music folder has         %musicGr% MB
set "override1=override"
for /f %%i in ('cscript //nologo %FS% "%override1%"') do set /A overrideGr=%%i
%.% override folder has      %overrideGR% MB
set "scripts1=scripts"
for /f %%i in ('cscript //nologo %FS% "%scripts1%"') do set /A scriptsGr=%%i
%.% scripts folder has       %scriptsGr% MB
%IFN% cache set cache1=0 & goto :NOCACHE
set "cache1=cache"
for /f %%i in ('cscript //nologo %FS% "%cache1%"') do set /A cacheGr=%%i
%.% cache folder has         %cacheGr% MB
:NOCACHE
set "save1=save"
for /f %%i in ('cscript //nologo %FS% "%save1%"') do set /A saveGr=%%i
%.% save folder has          %saveGr% MB
%IFN% temp set temp1=0 & goto :NOTEMP
set "temp1=temp"
for /f %%i in ('cscript //nologo %FS% "%temp1%"') do set /A tempGr=%%i
%.% temp folder has          %tempGr% MB
:NOTEMP
%IFN% generalized_biffing\prod goto :SKPGBIFF
	set genbiff=generalized_biffing
	for /f %%i in ('cscript //nologo %FS% "%genbiff%"') do set /A prodGR=%%i
	%.% genbiff folder has       %prodGR% MB
goto :FILESIZE
:: no if/else is possible there
:SKPGBIFF
set prodGR=0

:FILESIZE
del %FS%

::get file size

for %%F in (*.tlk) do set /a size_tlk+=%%~zF
set /a size_tlkMB=%size_tlk%/1024/1024
%.% dialog.tlk has           %size_tlkMB%

for %%F in ("chitin.key") do set chitinKeyGr=%%~zF
set /A chitinKeyMB=%chitinKeyGr%/1024/1024
%.% chitin.key has           %chitinKeyMB% MB

set others=27
%.% others have              %others% MB
set BWP=140

for %%F in ("BiG World Debug.txt") do set BWPDebugGr=%%~zF
set /A BWPDebugGrMB=%BWPDebugGr%/1024/1024
%.% BiG World Debug.txt has  %BWPDebugGrMB% MB

for %%F in (.\Setup-*.exe) do set /a size_exe+=%%~zF
set /a size_exeMB=%size_exe%/1024/1024
%.% setup-###.exe have       %size_exeMB% MB

for %%F in (.\Setup-*.debug) do set /a size_deb+=%%~zF
set /a size_debMB=%size_deb%/1024/1024
%.% setup-###.debug have     %size_debMB% MB

:constsiz
set /a constant1=%CD2_5%+%dataGr%+%musicGr%+%overrideGR%+%scriptsGr%+%cacheGr%+%saveGr%+%tempGr%+%size_tlkMB%+%chitinKeyMB%+%others%
set /a constant2=%BWP%+%BWPDebugGrMB%+%size_exeMB%+%size_debMB%

findstr /I /M "cleaned" %IPL%>nul
if errorlevel 1 (
	set facCleanUp=66
) else (
	set facCleanUp=100
)
set /a saveCleanUp=((%BGIIGr%-%constant1%-%constant2%-%prodGR%)*%facCleanUp%)/100
set /a saveCleanUpGB=%saveCleanUp%/1024

%IF% generalized_biffing\prod (
	set /a prodGRGB=%prodGR%/1024									
) else (										 
	set /a prodGRGB=0
)															   

set /a savetotal=%BGIIGr%-%constant1%
set /a savetotalGB=%savetotal%/1024
findstr /I /M "cleared" %IPL%>nul
if not errorlevel 1 (
	set /a saveClearOutGB=%savetotalGB%
) else (
	set /a saveClearOutGB=%savetotalGB%-%saveCleanupGB%-%prodGRGB%
)
set BG2rounded=%BG2Dez:~0,-2%
set /a resulttotalGB=(%BG2rounded%-%savetotalGB%)																	
%.%
%.%
for /f "delims=" %%a in ('%TXT% ^| findstr @695 ^| Call %C%') do set sizenow=!sizenow!%%a
for /f "delims=" %%a in ("%BG2Dez%") do set sizenow=!sizenow!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set sizenow=!sizenow!%%a
%.% !sizenow! | %M%
%TXT% | findstr @685 | Call %C%
%.%

findstr /I /M "cleaned" %IPL%>nul
if errorlevel 1 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @686 ^| Call %C%') do set savecleantot=!savecleantot!%%a
	for /f "delims=" %%a in ("%saveCleanupGB%") do set savecleantot=!savecleantot!%%a
	for /f "delims=" %%a in ('%TXT% ^| findstr @687 ^| Call %C%') do set savecleantot=!savecleantot!%%a
	%.% !savecleantot! | %M%
)

%IFN% generalized_biffing\prod goto :SKPGENPR
findstr /I /M "cleared" %IPL%>nul
	if errorlevel 1 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @688 ^| Call %C%') do set savebifftot=!savebifftot!%%a
	for /f "delims=" %%a in ("%prodGRGB%") do set savebifftot=!savebifftot!%%a
	for /f "delims=" %%a in ('%TXT% ^| findstr @689 ^| Call %C%') do set savebifftot=!savebifftot!%%a
	%.% !savebifftot! | %M%
)	
:SKPGENPR

for /f "delims=" %%a in ('%TXT% ^| findstr @688 ^| Call %C%') do set savecleartot=!savecleartot!%%a
for /f "delims=" %%a in ("%saveClearOutGB%") do set savecleartot=!savecleartot!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @691 ^| Call %C%') do set savecleartot=!savecleartot!%%a
%.% !savecleartot! | %M%
	
%.%
for /f "delims=" %%a in ('%TXT% ^| findstr @692 ^| Call %C%') do set savetotal1=!savetotal1!%%a
for /f "delims=" %%a in ("%savetotalGB%") do set savetotal1=!savetotal1!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @693 ^| Call %C%') do set savetotal1=!savetotal1!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set sizenow=!sizenow!%%a
%.% !savetotal1! | %M%
	
for /f "delims=" %%a in ('%TXT% ^| findstr @694 ^| Call %C%') do set savetotal2=!savetotal2!%%a
for /f "delims=" %%a in ("%resulttotalGB%") do set savetotal2=!savetotal2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set savetotal2=!savetotal2!%%a
%.% !savetotal2! | %M%
%.%
%.%
pause
