SETLOCAL
cd /d %DPATH%

:TOOLCHC1
%IF% "%BWFP%" %IF% "%BWFP%.bat" GOTO :TOOLCHC2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @170 | Call %C%
%IFN% "%BWFP%" %TXT% | findstr @025 | Call %C%
%IFN% "%BWFP%.bat" %TXT% | findstr @026 | Call %C%
%IFN% ".\BiG World Fixpack\_messages\usuage.txt" %TXT% | findstr @027 | Call %C%
%.%
%TXT% | findstr @028 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
GOTO :TOOLCHC1

:TOOLCHC2
%IFNE% %IFNG% %IFNH% %IFNR% GOTO :PCUCHECK
%IFE% %IF% "%BWTP% ENGLISH" %IF% "%BWTP%.bat" GOTO :PCUCHECK
%IFG% %IF% "%BWTP% GERMAN" %IF% "%BWTP%.bat" GOTO :PCUCHECK
%IFR% %IF% "%BWTP% RUSSIAN" %IF% "%BWTP%.bat" GOTO :PCUCHECK
%IFH% %IF% "%BWTP% SPANISH" %IF% "%BWTP%.bat" GOTO :PCUCHECK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @170 | Call %C%
%IFE% %IFN% "%BWTP% ENGLISH" %TXT% | findstr @029 | Call %C%
%IFG% %IFN% "%BWTP% GERMAN" %TXT% | findstr @029 | Call %C%
%IFR% %IFN% "%BWTP% RUSSIAN" %TXT% | findstr @029 | Call %C%
%IFH% %IFN% "%BWTP% SPANISH" %TXT% | findstr @029 | Call %C%
%.%
%IFN% "%BWTP%.bat" %TXT% | findstr @030 | Call %C%
%IF% "%BWTP%*" del "%BWTP%*"
FOR /D %%X IN ("%CD%\%BWTP%*") DO RD /S /Q "%%X"
%.%
%TXT% | findstr @028 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
GOTO :TOOLCHC2

:PCUCHECK
%IFNS%PCU.exe (
	%IFS%karatur.exe GOTO :MISSIPCU
	%IFS%saradas_magic.exe GOTO :MISSIPCU
	%IFS%ScionMod.exe GOTO :MISSIPCU
	%IFS%TenyaThermidor.exe GOTO :MISSIPCU
)
GOTO :FINPCUCK
:MISSIPCU
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @170 | Call %C% & %TXT% | findstr @167 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
GOTO :PCUCHECK

:FINPCUCK

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @170 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @006 | Call %C%
%.%toolcheck>> %IPL%
