SETLOCAL
cd /d %DPATH%

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

findstr /I /M "message_admin" %IPL%>nul
if errorlevel 1 (
	COLOR FC
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @024 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	COLOR 0F
	%.%message_admin>> %IPL%
)
:: multiple tasks
:REPMULTI
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%TXT% | findstr @069 | Call %C% & %TXT% | findstr @549 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :BACKUNZIP
if /I "%X%"=="2" goto :MEGAINST
if /I "%X%"=="3" Call ".\%BWIPS%\DL.bat" & Call ".\%BWIPS%\DLfix.bat"
if /I "%X%"=="4" Call ".\%BWIPS%\service.bat"
if /I "%X%"=="5" exit
if /I "%X%"=="SC" %.%ShortPrep>> %IPL% & goto :MEGAINST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :REPMULTI

:MEGAINST
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @068 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause & goto :REPMULTI
)
findstr /I /M "BWPstarted" %IPL%>nul
if not errorlevel 1 (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @065 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	%.%
	%.%
	set X=
	set /P X=
	if /I "%X%"=="1" goto :eof
	if /I "%X%"=="2" goto :BACKUNZIP
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :REPMULTI
)
findstr /I /M "unpacked2" %IPL%>nul
if not errorlevel 1 goto :eof
findstr /I /M "unpacked1" %IPL%>nul
if errorlevel 1 (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @091 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :REPMULTI
)
:BACKUNZIP
%.%back_unzip>> %IPL%

Call ".\%BWIPS%\getpathnames1.bat"
%.%pathname>> %IPL%

:EXCLUSION
Call ".\%BWIPS%\exclusion.bat"
%.%exclusion>> %IPL%

:BACKUPSA
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 (
	%IF% "..\BGII - SoA restore" goto :RESTORE2
	%IFN% "..\BGII - SoA restore" %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @139 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & exit
)
%IF% "..\BGII - SoA restore" goto :UNPACKDL

:REPPREPA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @658 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @075 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :ESSENTIA
if /I "%X%"=="N" goto :UNPACKDL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPPREPA

:ESSENTIA
Call ".\%BWIPS%\backup.bat"

:UNPACKDL
findstr /I /M "unpacked" %IPL%>nul
if not errorlevel 1 %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @092 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :REPMULTI

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @657 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @076 | Call %C% & %TXT% | findstr @078 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @548 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :RUNPACDL
if /I "%X%"=="N" exit
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :UNPACKDL

:RUNPACDL
call ".\%BWIPS%\CalcDisc.bat"
call ".\%BWIPS%\listDL.bat"
exit

:UNPACK01
call ".\%BWIPS%\unpack0.bat"
Call ".\%BWIPS%\unpack1.bat"
Call ".\%BWIPS%\unpack3.bat"
%.%unpacked1>> %IPL%

:ASKNEWIN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @077 | Call %C% & %TXT% | findstr @078 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" call ".\%BWIPS%\config.bat" ":CHCKINFO"
if /I "%X%"=="N" exit
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :ASKNEWIN

:RESTORE2
call ".\%BWIPS%\restore.bat"

:REPUNPA2
findstr /I /M "ShortPrep" %IPL%>nul
if not errorlevel 1 MD "..\create BGII - SoA" & goto :BWDLLST2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @073 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" MD "..\create BGII - SoA" & goto :UNPACK02
if /I "%X%"=="N" goto :RESTOBG2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPUNPA2

:BWDLLST2
call ".\%BWIPS%\CalcDisc.bat"
call ".\%BWIPS%\listDL.bat"

:UNPACK02
:: Restore and unpack
FOR %%i IN (
	"..\BGII - SoA restore\CD2"
	"..\BGII - SoA restore\CD3"
	"..\BGII - SoA restore\CD4"
	"..\BGII - SoA restore\CD5"
	"..\BGII - SoA restore\data"
) DO (
	MOVE %%i "..\create BGII - SoA"
)
xcopy "..\BGII - SoA restore" "..\create BGII - SoA\" /S /E
call ".\%BWIPS%\unpack0.bat"
Call ".\%BWIPS%\unpack2.bat"
Call ".\%BWIPS%\unpack3.bat"
%.%unpacked2>> "..\create BGII - SoA\%IPL%"
goto :RENAMEBG

:RESTOBG2
:: Restore only
FOR %%i IN (
	"..\BGII - SoA restore\CD2"
	"..\BGII - SoA restore\CD3"
	"..\BGII - SoA restore\CD4"
	"..\BGII - SoA restore\CD5"
	"..\BGII - SoA restore\data"
) DO (
	MOVE %%i "..\create BGII - SoA"
)
xcopy "..\BGII - SoA restore" "..\create BGII - SoA\" /S /E
goto :RENAMEBG

:RENAMEBG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @074 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
copy /Y ".\%BWIPS%\rename.bat" ..
start "" "..\rename.bat" & exit

:eof
