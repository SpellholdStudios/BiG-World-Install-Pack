SETLOCAL
cd /d %DPATH%

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

%IF% "BWP existing mods.txt" del "BWP existing mods.txt"
%IF% "BWP not existing mods.txt" del "BWP not existing mods.txt"
%IF% "BWP Explanation.txt" del "BWP Explanation.txt"
%IF% "BWP preview.txt" del "BWP preview.txt"
:REPEXIST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @040 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" (
	%TXT% | findstr @682 | Call %C% & %TXT% | findstr @044 | Call %C% > "BWP existing mods.txt"
	CALL "%BWIPS%\List.bat" IE& rem list existing mods
	start notepad "BWP existing mods.txt" & %W5% & start "" "%BWIPS%\focus.bat" & exit
)
if /I "%X%"=="N" goto :LSTNEXST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REPEXIST

:LSTNEXST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @041 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" (
	%TXT% | findstr @682 | Call %C% & %TXT% | findstr @042 | Call %C% > "BWP not existing mods.txt"
	CALL "%BWIPS%\List.bat" INE& rem list not existing mods
	start notepad "BWP not existing mods.txt" & %W5% & start "" "%BWIPS%\focus.bat" & exit
)
if /I "%X%"=="N" goto :LSTNINST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :LSTNEXST

:LSTNINST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @047 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" type NUL> listnotinstalled & goto :end
if /I "%X%"=="N" goto :end
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :LSTNINST

:end
%.%listing>> %IPL%
call ".\%BWIPS%\config.bat" :afterlst
