@echo off

:: set proper paths
set DPATH=%~dp0
SETLOCAL
cd /d %DPATH%
mode con cols=80 lines=26

taskkill /IM notepad.exe

for /f "delims=" %%a in ('type .\"create BGII - SoA"\BWP_BG2_input.txt') do @set BG2=%%a
SET .=echo.
SET BWIP=BiG World Installpack
SET BWIPU="%BG2%\%BWIP%\utils"
SET TXT=type "%BG2%\%BWIP%\temp\strings.txt"
SET TXT1=type "%BG2%\%BWIP%\temp\general.txt"

SET WAIT=@ping -n 1 localhost> nul
SET C=%BWIPU%\cut -c5- > BWP_strg.txt & type BWP_strg.txt

if exist "%BG2%/BWP_Delete" (
      %TXT1% | findstr @000 | Call %C% & %TXT% | findstr @250 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
      RD /S /Q "%BG2%"
) else (
      ren "%BG2%" "BGII - SoA Backup %date%"
%WAIT%
)

ren "create BGII - SoA" "BGII - SoA"
%WAIT%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%                            Uninstalling complete
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
pause

del BWP_strg.txt & del rename.bat & del StopLBar & exit
