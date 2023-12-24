@echo off

SETLOCAL
cd /d %DPATH%

:: call last file first

%IF% "BWP downloaded mods1.txt" call ".\%BWIPS%\listDL.bat" ":AGREEDL1" & exit

%IF% "BWP not installed mods.txt" call ".\%BWIPS%\finish.bat" ":CLEAN-UP" & exit

%IF% "BWP Explanation.txt" call ".\%BWIPS%\finish.bat" ":LSTNINS1" & exit

%IF% "BWP preview.txt" call ".\%BWIPS%\initiateSettings.bat" ":AGREESET" & exit

%IF% "BWP not existing mods.txt" call ".\%BWIPS%\listexist.bat" ":LSTNINST" & exit

%IF% "BWP existing mods.txt" call ".\%BWIPS%\listexist.bat" ":LSTNEXST" & exit

findstr /I /M "reboot" %IPL%>nul 
if not errorlevel 1 call "%BWIPS%\reboot.bat" ":REBOOT" & exit

%IF% "BWP downloaded mods.txt" call ".\%BWIPS%\listDL.bat" ":AGREEDL1" & exit
