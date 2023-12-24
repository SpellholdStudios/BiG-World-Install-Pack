SETLOCAL
cd /d %DPATH%


%IFN% BWP_BG1_input.txt %IF% BWP_BG1 Call ".\%BWIPS%\get_BG1pathC1.bat"

%IFE% goto :skippath
%IFN% BWP_BG1_input.txt %IFS%NeJ3v71.exe Call ".\%BWIPS%\get_BG1pathC2.bat"

%IFN% BWP_IWD1_input.txt %IFS%NeJ3v71.exe Call ".\%BWIPS%\get_IWD1path.bat"
%IFN% BWP_IWD1_input.txt %IFS%NeJ3v71.exe Call ".\%BWIPS%\get_IWD1path.bat"

%IFN% BWP_IWD1_input.txt %IFS%DSotSC.exe Call ".\%BWIPS%\get_IWD1path.bat"
%IFN% BWP_IWD1_input.txt %IFS%NeJ3v71.exe Call ".\%BWIPS%\get_IWD1path.bat"

%IFN% BWP_IWD2_input.txt %IFS%DSotSC.exe Call ".\%BWIPS%\get_IWD2path.bat"
:skippath