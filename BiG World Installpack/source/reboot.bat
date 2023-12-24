SETLOCAL
cd /d %DPATH%

call ".\%BWIPS%\conSize" 81 25 81 9999

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

:: information
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @001 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause

%.%reboot>> %IPL%

start "Reading PDF" ".\%BWIP%\temp\BiG World Installpack.pdf" & %W10% & start "" "%BWIPS%\focus.bat" & exit
:: Without an extra pair of rabbits' ears START regards the first quoted parameter as the window-title and therefore would not find the path.

:REBOOT
COLOR FC
%.%
%.%
%TXT% | findstr @032 | Call %C%
%.%
%.%
pause

COLOR 0F
Exit