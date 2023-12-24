SETLOCAL
cd /d %DPATH%

@echo off & setlocal ENABLEDELAYEDEXPANSION

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @487 | Call %C%
%.%
:: get system
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "5.1" set "win=XP"
if "%version%" == "6.0" set "win=Vista"
if "%version%" == "6.1" set "win=7"
if "%version%" == "6.2" set "win=8"
if "%version%" == "6.3" set "win=8.1"
if "%version%" == "10.0" set "win=10"


:: get architecture
if %PROCESSOR_ARCHITECTURE% == x86 set "arch=32" & goto :RUN32BIT
if %PROCESSOR_ARCHITECTURE% == AMD64 set "arch=64" & goto :RUN64BIT


:RUN32BIT
setlocal ENABLEDELAYEDEXPANSION

for /f "delims=" %%a in ('%TXT% ^| findstr @696 ^| Call %C%') do set win32bit=!win32bit!%%a
for /f "delims=" %%a in ("%Win%") do set win32bit=!win32bit!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @697 ^| Call %C%') do set win32bit=!win32bit!%%a
%.% !win32bit! | %M%
%TXT% | findstr @698 | Call %C% & %TXT% | findstr @488 | Call %C%
%IFS%BP.exe (
	%TXT% | findstr @489 | Call %C% & %TXT% | findstr @547 | Call %C%
) else (
	%TXT% | findstr @545 | Call %C%
)
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo SCSreplacement>> %CON% & goto :eof
if /I "%X%"=="2" echo skip_SCS_6000>> %CON% & goto :eof
if /I "%X%"=="3" echo replace_SCS_6000>> %CON% & goto :eof
if /I "%X%"=="4" %IF% "BWP Conflicts.txt" findstr /L /V /I "SCS_AI" "BWP Conflicts.txt" >"BWP Conflicts1.txt" & del "BWP Conflicts.txt" & ren "BWP Conflicts1.txt" "BWP Conflicts.txt" & echo BP_AI>> %CON% & goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
endlocal
goto :RUN32BIT


:RUN64BIT
:: get memory
:: get installed RAM
for /f "skip=1" %%p in ('wmic computersystem get totalphysicalmemory') do ( 
  set totalphysical=%%p
  goto :totalmem
)
:totalmem
set /a totalphysicalmem=%totalphysical:~0,-3%/1024/1024

for /f "delims=" %%a in ('%TXT% ^| findstr @699 ^| Call %C%') do set installedRAM=!installedRAM!%%a
for /f "delims=" %%a in ("%totalphysicalmem%") do set installedRAM=!installedRAM!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @700 ^| Call %C%') do set installedRAM=!installedRAM!%%a
%.% !installedRAM! | %M%

:: get free RAM
for /f "skip=1" %%p in ('wmic os get freephysicalmemory') do ( 
  set physmemory=%%p
  goto :physmemo
)
:physmemo
set /a freephysical=%physmemory%/1024/1024

for /f "delims=" %%a in ('%TXT% ^| findstr @701 ^| Call %C%') do set freeRAM=!freeRAM!%%a
for /f "delims=" %%a in ("%freephysical%") do set freeRAM=!freeRAM!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @702 ^| Call %C%') do set freeRAM=!freeRAM!%%a
%.% !freeRAM! | %M%


:: get free virtual Memory
for /f "skip=1" %%p in ('wmic os get freevirtualmemory') do ( 
  set virtmemory=%%p
  goto :virtmemo
)
:virtmemo
set /a freevirtual=%virtmemory%/1024/1024

for /f "delims=" %%a in ('%TXT% ^| findstr @703 ^| Call %C%') do set virtualRAM=!virtualRAM!%%a
for /f "delims=" %%a in ("%freevirtual%") do set virtualRAM=!virtualRAM!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @675 ^| Call %C%') do set virtualRAM=!virtualRAM!%%a
%.% !virtualRAM! | %M%
%.%

If %freephysical% LSS 5 goto :lessRAM
If %freephysical% GEQ 5 goto :moreRAM

:moreRAM
%TXT% | findstr @490 | Call %C% & goto :end

:lessRAM
If %freevirtual% LSS 6 %TXT% | findstr @491 | Call %C% & goto :end
If %freevirtual% GEQ 6 %TXT% | findstr @490 | Call %C% & goto :end

:end
%.%
pause