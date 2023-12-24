SETLOCAL
cd /d %DPATH%

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

:REPEASET
call ".\%BWIPS%\settings.bat"
:SETTCALL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @498 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @053 | Call %C%
%.%
%TXT% | findstr @545 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :PREVIEW
if /I "%X%"=="2" goto :end
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :SETTCALL

:PREVIEW
SET EINST=".\%BWIPS%\preview.bat"
SET EINSTI=".\%BWIPS%\preview.bat"
SET ELOG="BWP preview.log"
SET PREVIEW=1
type NUL> "BWP preview.txt"
type NUL> "BWP preview.log"
type NUL> count2.txt
type NUL> dir2.txt
%IF% *.count* del *.count*
%.%
%.%
call ".\%BWIPS%\get_install_file.bat"
%IF% "BWP Explanation.txt" del "BWP Explanation.txt"
%.%
%.%
%.%
start notepad "BWP preview.txt" & %TXT% | findstr @206 | Call %C% & %.% & %.% & pause & start "" "%BWIPS%\focus.bat" & exit

:AGREESET
%.%
%IF% "BWP preview.txt" %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @498 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @079 | Call %C%
%.%
%.%
%TXT% | findstr @080 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :end
if /I "%X%"=="2" goto :REPEASET
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :AGREESET

:end
call ".\%BWIPS%\config.bat" :afterset