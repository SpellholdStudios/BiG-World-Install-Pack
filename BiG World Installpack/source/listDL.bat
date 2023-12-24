SETLOCAL
cd /d %DPATH%

call ".\%BWIPS%\conSize" 81 25 81 9999

if #%1# neq ## goto %~1
for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set BWD=%%a

:REPBWPDL
findstr /I /M "ShortPrep" %IPL%>nul
if not errorlevel 1 goto :GOUNPACK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @657 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @067 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @548 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :LISTBWDL
if /I "%X%"=="N" goto :GOUNPACK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPBWPDL

:LISTBWDL
findstr /I /M "BWPinstalled" %IPL%>nul
if errorlevel 1 (
	DIR /A:-D /B "%BWD%" > "BWP downloaded mods.txt"
	start notepad "BWP downloaded mods.txt" & %W5% & start "" "%BWIPS%\focus.bat" & exit
)
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 (
	DIR /A:-D /B "%BWD%" > "BWP downloaded mods1.txt"
	start notepad "BWP downloaded mods1.txt" & %W5% & start "" "%BWIPS%\focus.bat" & exit
)

:AGREEDL1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @657 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @066 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause

:GOUNPACK
findstr /I /M "BWPinstalled" %IPL%>nul
if errorlevel 1 call ".\%BWIPS%\multiple.bat" ":UNPACK01" & exit
findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":UNPACK02" & exit

