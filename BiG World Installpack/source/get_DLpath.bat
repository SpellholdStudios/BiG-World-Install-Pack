SETLOCAL
cd /d %DPATH%

:BWDCHECK

%IF% "%BWD%" (
	pushd "%BWD%"
	cd > "%CD%\BWP_DL_input.txt"
	popd
	for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set X=%%a
) Else (
	SETLOCAL ENABLEDELAYEDEXPANSION
	%.%
	:: DL check
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @070 | Call %C% & %TXT1% | findstr @001 | Call %C%
	%.%
	:SETPATH
	set X=	
	set /P X=
	%IFN% "!X!" (
		%TXT% | findstr @138 | Call %C%
		GOTO :SETPATH
	)
	ECHO !X!> BWP_DL_input.txt
	ENDLOCAL
	for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set BWD=%%a
)

:eof