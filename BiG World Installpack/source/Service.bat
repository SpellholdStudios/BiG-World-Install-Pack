SETLOCAL
cd /d %DPATH%

:SERVICET
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @205 | Call %C% & %TXT% | findstr @549 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" exit
if /I "%X%"=="2" call ".\%BWIPS%\change-log.bat"
if /I "%X%"=="3" call ".\%BWIPS%\list_components.bat"
if /I "%X%"=="4" call ".\%BWIPS%\traify.bat"
if /I "%X%"=="5" goto :clnotyet
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :SERVICET

:clnotyet
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 (
	call ".\%BWIPS%\CalcPast.bat"
	call ".\%BWIPS%\initiateCleanup.bat"
) else (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @199 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :SERVICET
)
