SETLOCAL
cd /d %DPATH%

findstr /I /M "emptied" %IPL%>nul
if not errorlevel 1 %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @247 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :end1

:CLEANUP
findstr /I /M "cleaned" %IPL%>nul
if not errorlevel 1 %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @248 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :CLEANBIF

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @200 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo cleanup>> %SET% & goto :CLEANBIF
if /I "%X%"=="N" goto :end1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CLEANUP

:CLEANBIF
echo cleanup>> %SET%

%IFNS%generalized_biffing.exe goto :REMOVMOD
findstr /I /M "cleared" %IPL%>nul
if not errorlevel 1 %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @249 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause & goto :REMOVMOD

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @202 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo clearbiff>> %SET% & goto :REMOVMOD
if /I "%X%"=="N" goto :end2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CLEANBIF

:REMOVMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @246 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo removemods>> %SET% & goto :end2
if /I "%X%"=="N" goto :end1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REMOVMOD

:end1
:: findstr /I /M "BWPinstalled" %IPL%>nul
:: if not errorlevel 1 call ".\%BWIPS%\Service.bat" ":SERVICET"

findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 (
	findstr /I /M "clearbiff" %IPL%>nul
	if not errorlevel 1 call ".\%BWIPS%\Clean-Up.bat"
) else (
	if not errorlevel 1 call ".\%BWIPS%\Service.bat" ":SERVICET"
)

:end2
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\Clean-Up.bat"