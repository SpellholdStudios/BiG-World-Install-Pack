SETLOCAL
cd /d %DPATH%

@echo off & setlocal

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @624 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" goto :CALCDISK
if /I "%X%"=="N" goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause

:CALCDISK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @660 | Call %C%
%.%
%.%
%TXT% | findstr @661 | Call %C%
%.%

::get folder size
set cleanBG2=2627
%.%
set "FS=%temp%\GetFolderSize.vbs
echo WScript.Echo Int(CreateObject("Scripting.FileSystemObject").GetFolder(WScript.Arguments(0)).Size/1024/1024+.99)>%FS%

for /f "delims=" %%a in ('type BWP_BG2_input.txt') do @set BG2=%%a
%IF% WeiDU.log set BGIIGr=%cleanBG2% & goto :NOBWPBG2
for /f %%i in ('cscript //nologo %FS% "%BG2%"') do set BGIIGr=%%i
:NOBWPBG2

%IFN% BWP_BG1_input.txt set BGGr=0 & goto :NOBWPBG1
for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set BG1=%%a
for /f %%i in ('cscript //nologo %FS% "%BG1%"') do set BGGr=%%i
:NOBWPBG1

for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set BWD=%%a
for /f %%i in ('cscript //nologo %FS% "%BWD%"') do set DGr=%%i

%IFN% "..\BGII - SoA restore" set RGr=0 & goto :NOBWPRES
set "restore=BGII - SoA restore"
for /f %%i in ('cscript //nologo %FS% "..\%restore%"') do set RGr=%%i
:NOBWPRES

::get hard drive size
SET "volume=%~d0"

for /f "skip=1" %%p in ('wmic logicaldisk %volume% get size') do ( 
  set size=%%p
  goto :totalsize
)
:totalsize
set /a disc=%size:~0,-3%/1049/1024

for /f "skip=1" %%p in ('wmic logicaldisk %volume% get freespace') do ( 
  set freespace=%%p
  goto :freespace
)
:freespace
set /a space=%freespace:~0,-3%/1049/1024

setlocal enabledelayedexpansion
::You can only calculate with integers in batch; batch will cut off the digits, vbs however can display them.
set calc=%temp%\calculate.vbs
echo Set a=WScript.Arguments:WScript.Echo FormatNumber(Eval(a(0)),a(1))>%calc%
for /f %%i in ('cscript //nologo %calc% "%BGIIGr%/1024" 1') do set BG2Dez=%%i
for /f %%i in ('cscript //nologo %calc% "%BGGr%/1024" 1') do set BG1Dez=%%i
for /f %%i in ('cscript //nologo %calc% "%DGr%/1024" 1') do set DLDez=%%i
for /f %%i in ('cscript //nologo %calc% "%RGr%/1024" 1') do set ReDez=%%i

%IF% WeiDU.log goto :NEWBG2FD
for /f "delims=" %%a in ('%TXT% ^| findstr @673 ^| Call %C%') do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ("%BG2:~3%") do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @674 ^| Call %C%') do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ("%BG2Dez%") do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set BG2game=!BG2game!%%a
%.% !BG2game! | %M%
goto :SKPBG2FD

:NEWBG2FD
for /f "delims=" %%a in ('%TXT% ^| findstr @704 ^| Call %C%') do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ("%BG2:~3%") do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @705 ^| Call %C%') do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ("%BG2Dez%") do set BG2game=!BG2game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set BG2game=!BG2game!%%a
%.% !BG2game! | %M%

:SKPBG2FD
%IFN% BWP_BG1 goto :SKPBG1FD
for /f "delims=" %%a in ('%TXT% ^| findstr @673 ^| Call %C%') do set BG1game=!BG1game!%%a
for /f "delims=" %%a in ("%BG1:~3%") do set BG1game=!BG1game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @674 ^| Call %C%') do set BG1game=!BG1game!%%a
for /f "delims=" %%a in ("%BG1Dez%") do set BG1game=!BG1game!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set BG1game=!BG1game!%%a
%.% !BG1game! | %M%

:SKPBG1FD
for /f "delims=" %%a in ('%TXT% ^| findstr @673 ^| Call %C%') do set DLfolder=!DLfolder!%%a
for /f "delims=" %%a in ("%BWD:~3%") do set DLfolder=!DLfolder!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @674 ^| Call %C%') do set DLfolder=!DLfolder!%%a
for /f "delims=" %%a in ("%DLDez%") do set DLfolder=!DLfolder!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set DLfolder=!DLfolder!%%a
%.% !DLfolder! | %M%

%IFN% "..\BGII - SoA restore" goto :NOBWRES2
for /f "delims=" %%a in ('%TXT% ^| findstr @673 ^| Call %C%') do set restorefolder=!restorefolder!%%a
for /f "delims=" %%a in ("%restore%") do set restorefolder=!restorefolder!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @674 ^| Call %C%') do set restorefolder=!restorefolder!%%a
for /f "delims=" %%a in ("%ReDez%") do set restorefolder=!restorefolder!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set restorefolder=!restorefolder!%%a
%.% !restorefolder! | %M%

:NOBWRES2
for /f "delims=" %%a in ('%TXT% ^| findstr @676 ^| Call %C%') do set currentspace=!currentspace!%%a
for /f "delims=" %%a in ("%space%") do set currentspace=!currentspace!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @677 ^| Call %C%') do set currentspace=!currentspace!%%a
for /f "delims=" %%a in ("%disc%") do set currentspace=!currentspace!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set currentspace=!currentspace!%%a
%.% !currentspace! | %M%

::leave free
If %disc% LSS 350 goto :smalldsc
If %disc% GTR 350 goto :largedsc

:smalldsc
set percent=15
set /A remainS1=(disc*percent)/100
set /A remainS2=%space%-%remainS1%

for /f "delims=" %%a in ('%TXT% ^| findstr @681 ^| Call %C%') do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ("%percent%") do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @680 ^| Call %C%') do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ("%remainS1%") do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @678 ^| Call %C%') do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ("%remainS2%") do set remainfree=!remainfree!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set remainfree=!remainfree!%%a
%.% !remainfree! | %M%
goto :calculate

:largedsc
set keep=50
set /A remainL=%space%-%keep%

for /f "delims=" %%a in ('%TXT% ^| findstr @681 ^| Call %C%') do set remainfree2=!remainfree2!%%a
for /f "delims=" %%a in ("%keep%") do set remainfree2=!remainfree2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @678 ^| Call %C%') do set remainfree2=!remainfree2!%%a
for /f "delims=" %%a in ("%remainL%") do set remainfree2=!remainfree2!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set remainfree2=!remainfree2!%%a
%.% !remainfree2! | %M%

:calculate
set facMods=344
set facGenBiff=40

%IFN% "..\BGII - SoA restore" goto :CALCCLEA
:: only after mods are unpacked
:: calc size of the mods
set /A unpacked=%BGIIGr%-%cleanBG2%

:: count number of mods
%IFN% WeiDU.log goto :CALCCLEA
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 goto :CALCCLEA
for /f %%a in ('dir /b "Setup-*.exe"') do set /a count=count+1

:: estimated size installed mods without setup
set /A estMods=(%unpacked%-%count%)*%facMods%/100

:: estimated size genbiff
%IFS%generalized_biffing.exe set /A estGenbiff=%estMods%*%facGenBiff%/100
%IFNS%generalized_biffing.exe set estGenbiff=0

goto :CALCBOTH


:CALCCLEA
::only for clean install
set facUnpack=131
set /A unpacked=(%DGr%*%facUnpack%/100)

:: count number of mods
for /F %%i in ('dir "%BWD%" /B /A-d') do set /A count=count+1

:: estimated size installed mods without setup
set /A estMods=(%unpacked%-%count%)*%facMods%/100

:: estimated size genbiff
%IF% "%BWD%\generalized-biffing-*.zip" set /A estGenbiff=%estMods%*%facGenBiff%/100
%IFN% "%BWD%\generalized-biffing-*.zip" set estGenbiff=0


:CALCBOTH
%IFN% BWP_BG1 set /A entire=(%cleanBG2%+%count%+%estMods%+%estGenbiff%)/1024
%IF% BWP_BG1 set /A entire=(%cleanBG2%+%BGGr%+%count%+%estMods%+%estGenbiff%)/1024

::%IFN% BWP_BG1 set /A entire=((%DGr%*%facInst%)+%BGIIGr%)/1024
::%IF% BWP_BG1 set /A entire=((%DGr%*%facInst%)+%BGIIGr%+%BGGr%)/1024

for /f "delims=" %%a in ('%TXT% ^| findstr @679 ^| Call %C%') do set growto=!growto!%%a
for /f "delims=" %%a in ("%entire%") do set growto=!growto!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set growto=!growto!%%a
%.% !growto! | %M%

If %entire% LSS %remainL% %TXT% | findstr @662 | Call %C% & %.% & %.% & %.% & pause & goto :eof
If %entire% GTR %remainL% %TXT% | findstr @663 | Call %C%
%.%
%.%
%.%
pause
:solution
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @664 | Call %C%
%.%
%.%
If %entire% GTR %disc% %TXT% | findstr @668 | Call %C% & pause & exit
If %entire% LSS %disc% %TXT% | findstr @665 | Call %C%
%IF% "..\BiG World Downloads" %TXT% | findstr @666 | Call %C%
%IF% "..\Baldur's Gate" %TXT% | findstr @667 | Call %C%
%.%
%.%
%TXT% | findstr @669 | Call %C%
%.%
%.%
%TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" exit
if /I "%X%"=="2" goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :solution
