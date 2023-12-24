SETLOCAL
cd /d %DPATH%

:IWD2CHECK
%IF% "..\Icewind Dale II" (
	SET IW2="..\Icewind Dale II"\
	pushd "..\Icewind Dale II"
	cd > "%CD%\BWP_IWD2_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_IWD2_input.txt') do @set X=%%a
	goto :eof
)

%IF% "..\Icewind Dale 2" (
	SET IW2="..\Icewind Dale 2"\
	pushd "..\Icewind Dale 2"
	cd > "%CD%\BWP_IWD2_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_IWD2_input.txt') do @set X=%%a
	goto :eof
)

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @102 | Call %C% & %TXT% | findstr @106 | Call %C%& %TXT1% | findstr @001 | Call %C%
:SETPATH
%.%
set X=
set /P X=
if /I "%X%"=="N" goto :eof

SETLOCAL ENABLEDELAYEDEXPANSION
IF NOT EXIST "!X!" (
	%TXT% | findstr @138 | Call %C%
	GOTO :SETPATH
)
ECHO !X!> BWP_IWD2_input.txt
ENDLOCAL
for /f "delims=" %%a in ('type BWP_IW2_input.txt') do @set IW2=%%a

:eof
