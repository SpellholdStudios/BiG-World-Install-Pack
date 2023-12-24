SETLOCAL
cd /d %DPATH%

:IWD1CHECK
%IF% "..\Icewind Dale" (
	SET IW1="..\Icewind Dale"\
	pushd "..\Icewind Dale"
	cd > "%CD%\BWP_IWD1_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_IWD1_input.txt') do @set X=%%a
	goto :eof
)

%IF% "..\Icewind Dale Complete (German)" (
	SET IW1="..\Icewind Dale Complete (German)"\
	pushd "..\Icewind Dale Complete (German)"
	cd > "%CD%\BWP_IWD1_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_IWD1_input.txt') do @set X=%%a
	goto :eof
)

%IFN% BWP_IWD1_input.txt (
	%IFS%NEJ3V71.exe call :NEJINPUT
	%IFS%DSotSC.exe call :DSCINPUT
)
%.%
:SETPATH
set X=
set /P X=
if /I "%X%"=="N" goto :eof

SETLOCAL ENABLEDELAYEDEXPANSION
%IFN% "!X!" (
	%TXT% | findstr @138 | Call %C%
	GOTO :SETPATH
)
ECHO !X!> BWP_IWD1_input.txt
ENDLOCAL
for /f "delims=" %%a in ('type BWP_IWD1_input.txt') do @set IW1=%%a

:eof


:NEJINPUT
%IFS%NEJ3V71.exe %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @099 | Call %C% & %TXT% | findstr @106 | Call %C%& %TXT1% | findstr @001 | Call %C%
goto :eof

:DSCINPUT
%IFS%DSotSC.exe %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @101 | Call %C% & %TXT% | findstr @106 | Call %C%& %TXT1% | findstr @001 | Call %C%
goto :eof
