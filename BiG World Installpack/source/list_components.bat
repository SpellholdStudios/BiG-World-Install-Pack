SETLOCAL
cd /d %DPATH%

:COMPONEN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @207 | Call %C% & %TXT% | findstr @213 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
%IFN% %X% (
	%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @210 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	goto :COMPONEN
)
SETLOCAL ENABLEDELAYEDEXPANSION
weidu.exe --nogame --list-languages !X!
%TXT1% | findstr @006 | Call %C% & %TXT% | findstr @208 | Call %C% & %TXT1% | findstr @001 | Call %C%
set Y=
set /P Y=
weidu.exe --nogame --list-components !X! !Y! >BWP_list-components.txt
endlocal
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @006 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
EXIT