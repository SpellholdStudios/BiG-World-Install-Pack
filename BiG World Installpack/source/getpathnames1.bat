SETLOCAL
cd /d %DPATH%


%IFN% BWP_BG1_input.txt Call ".\%BWIPS%\get_BG1pathM.bat"

%IFN% BWP_DL_input.txt Call ".\%BWIPS%\get_DLpath.bat"
