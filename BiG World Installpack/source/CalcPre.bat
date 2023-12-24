SETLOCAL
cd /d %DPATH%

@echo off & setlocal ENABLEDELAYEDEXPANSION

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @624 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" goto :CALCPRE
if /I "%X%"=="N" goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause

:CALCPRE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @629 | Call %C%
%.%
%.%
%TXT% | findstr @671 | Call %C%
%.%

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
set /A unpacked1=%BGIIGr%-%cleanBG2%

:: count number of mods
set /a count=0
for /f %%a in ('dir /b "Setup-*.exe"') do set /a count+=1

:: estimated size installed mods without setup
set facMods=344
set /A estMods=(%unpacked1%-%count%)*%facMods%/100

:: estimated size genbiff
set facGenBiff=40
%IFS%generalized_biffing.exe set /A estGenbiff=%estMods%*%facGenBiff%/100
%IFNS%generalized_biffing.exe set estGenbiff=0

%IFN% BWP_BG1 set /A entire=(%cleanBG2%+%count%+%estMods%+%estGenbiff%)
%IF% BWP_BG1 set /A entire=(%cleanBGT%+%count%+%estMods%+%estGenbiff%)
set /A entireGB=%entire%/1024

for /f "delims=" %%a in ('%TXT% ^| findstr @683 ^| Call %C%') do set growto2=!growto2!%%a
for /f "delims=" %%a in ("%BG2Dez%") do set growto2=!growto2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @684 ^| Call %C%') do set growto2=!growto2!%%a
for /f "delims=" %%a in ("%entireGB%") do set growto2=!growto2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set growto2=!growto2!%%a
%.% !growto2! | %M%

:: Clean-Up saves estimated:
set factCleanUp=30
set /A savecleanup=%estMods%*%factCleanUp%/100

:: Clear-Out saves estimated:
set factClearOut=15
set /A saveClearOut=((%estMods%*%factClearOut%)+%count)/100
set saveclearOut=((%estMods%*%factClearOut%)+%count)/100

:: values in GB
set /A saveCleanUpGB=%saveCleanup%/1024
set /A estGenbiffGB=%estGenbiff%/1024
set /A saveClearOutGB=%saveClearOut%/1024

:: result
set /A savetotal=(%SaveCleanUp%+%estGenbiff%+%saveClearOut%)
set /A savetotalGB=%savetotal%/1024
set /A resulttotalGB=(%entire%-%savetotal%)/1024

%TXT% | findstr @685 | Call %C%
%.%
for /f "delims=" %%a in ('%TXT% ^| findstr @686 ^| Call %C%') do set savecleantot=!savecleantot!%%a
for /f "delims=" %%a in ("%saveCleanUpGB%") do set savecleantot=!savecleantot!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @687 ^| Call %C%') do set savecleantot=!savecleantot!%%a
%.% !savecleantot! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @688 ^| Call %C%') do set savebifftot=!savebifftot!%%a
for /f "delims=" %%a in ("%estGenbiffGB%") do set savebifftot=!savebifftot!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @689 ^| Call %C%') do set savebifftot=!savebifftot!%%a
%.% !savebifftot! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @688 ^| Call %C%') do set savecleartot=!savecleartot!%%a
for /f "delims=" %%a in ("%saveClearOutGB%") do set savecleartot=!savecleartot!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @691 ^| Call %C%') do set savecleartot=!savecleartot!%%a
%.% !savecleartot! | %M%
%.%
for /f "delims=" %%a in ('%TXT% ^| findstr @692 ^| Call %C%') do set savetotal1=!savetotal1!%%a
for /f "delims=" %%a in ("%savetotalGB%") do set savetotal1=!savetotal1!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @693 ^| Call %C%') do set savetotal1=!savetotal1!%%a
%.% !savetotal1! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @694 ^| Call %C%') do set savetotal2=!savetotal2!%%a
for /f "delims=" %%a in ("%resulttotalGB%") do set savetotal2=!savetotal2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set savetotal2=!savetotal2!%%a
%.% !savetotal2! | %M%
%.%
%TXT% | findstr @672 | Call %C%
%.%
%.%
pause
