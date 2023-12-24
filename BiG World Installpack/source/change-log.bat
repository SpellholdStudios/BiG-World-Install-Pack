SETLOCAL
cd /d %DPATH%

:CHANGELO
if not exist BWP_change-log MD BWP_change-log
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @209 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
%.%
set X=
set /P X=
SETLOCAL ENABLEDELAYEDEXPANSION
WeiDU.exe --log nul --change-log !X! >BWP_change-log/change-log_!X!.txt --out BWP_change-log
endlocal
%.%
%.%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @006 | Call %C%
:REPCHANG
%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @211 | Call %C% & %TXT% | findstr @548 | Call %C%
%TXT% | findstr @204 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :CHANGELO
if /I "%X%"=="N" EXIT
%TXT% | findstr @500 | Call %C%
goto :REPCHANG
