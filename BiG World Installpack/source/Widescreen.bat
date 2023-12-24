SETLOCAL
cd /d %DPATH%

@echo off & setlocal ENABLEDELAYEDEXPANSION

%NMAC% %IFNS%widescreen.exe goto :skipWide
%MAC% goto :skipWide

:WIDESCRN
%TXT1% | findstr @000 | Call %C% &  %TXT% | findstr @059 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @048 | Call %C%
%.%
%TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :dimensio
if /I "%X%"=="N" goto :SKIPWIDE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :WIDESCRN

:dimensio
for /f "tokens=4,5 delims=. " %%a in ('ver') do set "version=%%a%%b"

if version lss 62 (
    ::set "wmic_query=wmic desktopmonitor get screenheight, screenwidth /format:value"
    for /f "tokens=* delims=" %%@ in ('wmic desktopmonitor get screenwidth /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "screenwidth=%%#"
    )
    for /f "tokens=* delims=" %%@ in ('wmic desktopmonitor get screenheight /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "screenheight=%%#"
    )

) else (
    ::wmic path Win32_VideoController get VideoModeDescription,CurrentVerticalResolution,CurrentHorizontalResolution /format:value
    for /f "tokens=* delims=" %%@ in ('wmic path Win32_VideoController get CurrentHorizontalResolution  /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "screenwidth=%%#"
    )
    for /f "tokens=* delims=" %%@ in ('wmic path Win32_VideoController get CurrentVerticalResolution /format:value') do (
        for /f "tokens=2 delims==" %%# in ("%%@") do set "screenheight=%%#"
    )
)

:SCRNSIZE
ECHO %screenwidth%> BWP_widescreen_input.txt
ECHO %screenheight%>> BWP_widescreen_input.txt
ECHO ^Y>> BWP_widescreen_input.txt

%TXT1% | findstr @000 | Call %C% &  %TXT% | findstr @059 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
for /f "delims=" %%a in ('%TXT% ^| findstr @062 ^| Call %C%') do set screensize=!screensize!%%a
for /f "delims=" %%a in ("%screenheight%") do set screensize=!screensize!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @063 ^| Call %C%') do set screensize=!screensize!%%a
for /f "delims=" %%a in ("%screenwidth%") do set screensize=!screensize!%%a
for /f "delims=" %%a in ('%TXT% ^| findstr @064 ^| Call %C%') do set screensize=!screensize!%%a
%.% !screensize! | %M%
%.%
%TXT% | findstr @061 | Call %C%
%.%
%TXT% | findstr @545 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" goto :COORDINA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :SCRNSIZE

:COORDINA
%TXT1% | findstr @000 | Call %C% &  %TXT% | findstr @059 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @049 | Call %C%
%IF% BWP_coordinate.txt del BWP_coordinate.txt
%.%
%.%
%.%
set X=
set /P X=
ECHO %X%> BWP_widescreen_input.txt
%.%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @059 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @050 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
ECHO %X%>> BWP_widescreen_input.txt
%TXT1% | findstr @006 | Call %C% &  %TXT% | findstr @059 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @060 | Call %C%
call ".\%BWIPS%\get_coordinate.bat"
%.%
type BWP_coordinate.txt
%.%
%.%
%.%
%TXT% | findstr @051 | Call %C%
%.%
%TXT% | findstr @545 | Call %C%
%.%
%.%
%.%
ECHO ^Y>> BWP_widescreen_input.txt
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" goto :COORDINA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :COORDINA
:skipWide
type NUL> BWP_NoWide
