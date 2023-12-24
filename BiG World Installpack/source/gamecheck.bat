SETLOCAL
cd /d %DPATH%

%IFN% BWP_BG1 goto :BG2CHECK

call ".\%BWIPS%\BG1Checking.bat"

:BG2CHECK
call ".\%BWIPS%\BG2Checking.bat"

%.%gamecheck>> %IPL%
