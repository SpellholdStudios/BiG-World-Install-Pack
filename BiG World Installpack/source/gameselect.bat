SETLOCAL
cd /d %DPATH%

:: game seletion info
:REPSELGA
%TXT1% | findstr @006 | Call %C% & %TXT% | findstr @002 | Call %C% & %TXT% | findstr @003 | Call %C% & %TXT% | findstr @546 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :BG1ONLY
if /I "%X%"=="2" goto :BG2ONLY
if /I "%X%"=="3" goto :BGTFULL
if /I "%X%"=="SC" goto :SHORTCUT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REPSELGA

:BG2ONLY
type NUL> BWP_BG2
GOTO :ENDSELBG
:SHORTCUT
%.%shortcut>> %IPL%
:BGTFULL
type NUL> BWP_BG2
:BG1ONLY
type NUL> BWP_BG1
:ENDSELBG
%.%gameselect>> %IPL%