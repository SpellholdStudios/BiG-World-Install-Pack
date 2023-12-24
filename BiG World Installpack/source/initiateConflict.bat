SETLOCAL
cd /d %DPATH%


findstr /I /M "PreSelection allyouget FinConflicts" %SET%>nul
if not errorlevel 1 goto :eof

%IFN% "BWP Conflicts.txt" goto :CONFLICT
:REPEXCON
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @148 | Call %C% & %TXT% | findstr @494 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" goto :CONFLICT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REPEXCON

:CONFLICT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @148 | Call %C% & %TXT% | findstr @141 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
call ".\%BWIPS%\Conflicts.bat"

:REPCONFL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @148 | Call %C% & %TXT% | findstr @149 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :FINCONFL
if /I "%X%"=="2" goto :CONFLICT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REPCONFL
:FINCONFL
%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @006 | Call %C%
