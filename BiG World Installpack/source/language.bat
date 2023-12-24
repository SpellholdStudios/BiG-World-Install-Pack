SETLOCAL
cd /d %DPATH%

:REPSPEEC
%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @007 | Call %C%
%.%
%.%
%.%
%.%
%IF% BWP_LANGUAGE del BWP_LANGUAGE
%IF% BWP_language.txt del BWP_language.txt
set X=
set /P X=
For %%i In (%X%) DO echo %%i>> BWP_LANGUAGE


findstr /I /M "CZ EN FR GE IT PO SP RU CH JA KO" BWP_LANGUAGE>nul
if %errorlevel%==1 (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause & goto :REPSPEEC
)
%.%
call ".\%BWIPS%\get_language.bat"

:REPSPEE1
%TXT1% | findstr @000 | Call %C%
type BWP_language.txt
%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @008 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :eof
if /I "%X%"=="N" %TXT% | findstr @010 | Call %C% & goto :REPSPEEC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause

goto :REPSPEE1