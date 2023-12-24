@echo off

SETLOCAL
cd /d %DPATH%

Call ".\%BWIPS%\header.bat"

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

:EXPLANAT
CMD /U /C Type "BWP Explanation.txt">> "BWP Explanation1.txt"
del "BWP Explanation.txt"
ren "BWP Explanation1.txt" "BWP Explanation.txt"
start notepad "BWP Explanation.txt" & %W10% & start "" ".\%BWIPS%\focus.bat" & exit

:LSTNINS1
%IF% listnotinstalled (
	%IF% "BWP not installed mods.txt" del "BWP not installed mods.txt"
	%IF% StopLBar del StopLBar
	start "pulse bar" "%BWIPS%\pulse_bar.bat"
	%TXT% | findstr @045 | Call %C% > "BWP not installed mods.txt"
	CALL "%BWIPS%\List.bat" INI& rem list not installed mods
	type NUL> StopLBar
	start notepad "BWP not installed mods.txt" & start "" ".\%BWIPS%\focus.bat" & exit
)

:CLEAN-UP
findstr /I /M "cleanup" %SET%>nul
if not errorlevel 1 call ".\%BWIPS%\Clean-Up.bat"

:LEVEL1NP
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%IFS%level1npcs.Debug %TXT% | findstr @094 | Call %C%
%.%
%.%
%.%
%.%
%.%
%TXT% | findstr @095 | Call %C%
%.%
%.%
%.%
%.%
%.%BWPinstalled>> %IPL%
%.%
%.%
%.%
%.%
pause
%TXT1% | findstr @006 | Call %C%
:: installation complete
%TXT% | findstr @093 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
%.%
%.%
%.%
%.%
Call ".\%BWIPFIX%\fix_dungeon_crash.bat"

:: nice game
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\smiley.png"
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @486 | Call %C% & %TXT1% | findstr @001 | Call %C% & %.% & %.%
%W2%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\smiley.png" /t 0

call ".\%BWIPS%\credits.bat"						  
EXIT