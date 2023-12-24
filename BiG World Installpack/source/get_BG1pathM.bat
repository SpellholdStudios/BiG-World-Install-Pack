SETLOCAL ENABLEDELAYEDEXPANSION
cd /d %DPATH%

:: get BG1 path
%IF% %BGI% (
	pushd %BGI%
	cd > "%CD%\BWP_BG1_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set X=%%a
	goto :BG1QUOTE
)

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @009 | Call %C% & %TXT% | findstr @106 | Call %C% & %TXT1% | findstr @001 | Call %C%
%.%
:SETPATH
set X=
set /P X=
if /I "%X%"=="N" goto :eof
%IFN% "!X!" (
	%TXT% | findstr @138 | Call %C%
	GOTO :SETPATH
)
ECHO !X!> BWP_BG1_input.txt

:BG1QUOTE
:: Add quotes to path
ECHO ^"!X!^"> BWP_BGT_input.txt
ENDLOCAL
for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set BG1=%%a
for /f "delims=" %%a in ('type BWP_BGT_input.txt') do @set BGT=%%a

:eof