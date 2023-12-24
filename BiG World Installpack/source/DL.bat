:: In order to download a file from a google drive copy from the link https://drive.google.com/file/d/###...###/view?usp=sharing the part between /d/ and /view? and add it to the respective wget command line. (see: Virtue)

SETLOCAL
cd /d %DPATH%

SET DLW="%BWIPU%\wget-1.21.3-win32\wget"
SET AYG1=findstr /I /M "DLallyoucanget" %IPL%>nul
SET AYG2=if errorlevel 1 goto :DLGROUPS

%IFN% "%BWD%" MD "%BWD%"
%.%
%.%
%.%
%.%
%TXT% | findstr @492 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :DLGROUPS
if /I "%X%"=="2" echo DLallyoucanget>> %IPL% & goto :DLBWTOOL
rem if /I "%X%"=="3" goto :DLINDIVI

:DLGROUPS
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
%TXT% | findstr @493 | Call %C%

set X=
set /P X=
if /I "%X%"=="01" goto :DLBWTOOL
if /I "%X%"=="02" goto :DLESSENT
if /I "%X%"=="03" goto :DLRECOMM
if /I "%X%"=="04" goto :DLBIG1QU
if /I "%X%"=="05" goto :DLBIG2QU
if /I "%X%"=="06" goto :DLBG1QUE
if /I "%X%"=="07" goto :DLBG2QUE
if /I "%X%"=="08" goto :DLENCOUN
if /I "%X%"=="09" goto :DL1NPCSA
if /I "%X%"=="10" goto :DL2NPCSM
if /I "%X%"=="11" goto :DL2NPCSL
if /I "%X%"=="12" goto :DLONEDAY
if /I "%X%"=="13" goto :DLNPCREL
if /I "%X%"=="14" goto :DLBG1ITM
if /I "%X%"=="15" goto :DLBG2ITM
if /I "%X%"=="16" goto :DLBG2SPL
if /I "%X%"=="17" goto :DLBG1TWK
if /I "%X%"=="18" goto :DLBG2TWK
if /I "%X%"=="19" goto :DLKITSAL
if /I "%X%"=="20" goto :DLFAMCOM
if /I "%X%"=="21" goto :DLMINMOD
if /I "%X%"=="22" goto :DLMISCAL
if /I "%X%"=="23" goto :DLMANUAL
if /I "%X%"=="24" goto :DLUNAVAI
if /I "%X%"=="25" exit

:DLBWTOOL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BWP_tools.txt"
%AYG1% & %AYG2%

:DLESSENT
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\required.txt"
%AYG1% & %AYG2%

:DLRECOMM
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\recommended.txt"
%AYG1% & %AYG2%

:DLBIG1QU
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BigBG1quests.txt"
%AYG1% & %AYG2%

:DLBIG2QU
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BigBG2quests.txt"
%AYG1% & %AYG2%

:DLBG1QUE
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG1quests.txt"
%AYG1% & %AYG2%

:DLBG2QUE
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2quests.txt"
%AYG1% & %AYG2%

:DLENCOUN
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2encounters.txt"
%AYG1% & %AYG2%

:DL1NPCSA
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG1npcs.txt"
%AYG1% & %AYG2%

:DL2NPCSM
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2npcsmore.txt"
%AYG1% & %AYG2%

:DL2NPCSL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2npcsless.txt"
%AYG1% & %AYG2%

:DLONEDAY
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2onedaynpc.txt"
%AYG1% & %AYG2%

:DLNPCREL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\NPCrelated.txt"
%AYG1% & %AYG2%

:DLBG1ITM
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG1items.txt"
%AYG1% & %AYG2%

:DLBG2ITM
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2items.txt"
%AYG1% & %AYG2%

:DLBG2SPL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2spells.txt"
%AYG1% & %AYG2%

:DLBG1TWK
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG1tweaks.txt"
%AYG1% & %AYG2%

:DLBG2TWK
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\BG2tweaks.txt"
%AYG1% & %AYG2%

:DLKITSAL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\kits.txt"
%AYG1% & %AYG2%

:DLFAMCOM
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\famncomp.txt"
%AYG1% & %AYG2%

:DLMINMOD
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\minimods.txt"
%AYG1% & %AYG2%

:DLMISCAL
%TXT% | findstr @189 | Call %C% 
%DLW% -N -nv --no-check-certificate --content-disposition --show-progress -P "%BWD%" -a wget.txt -i "%BWIPD%\misc.txt"
%AYG1% & %AYG2%

:DLMANUAL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @111 | Call %C%
%.%
%.%
start "Microsoft WordPad" ".\%BWIPD%\manuallySP.rtf"
%.%
%.%
pause
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @112 | Call %C%
%.%
%.%
start "Microsoft WordPad" ".\%BWIPD%\manuallyRoW.rtf"
%.%
%.%
pause
%AYG1% & %AYG2%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @151 | Call %C%
%.%
%.%
start "Microsoft WordPad" ".\%BWIPD%\manuallyMF.rtf"
%.%
%.%
pause
%AYG1% & %AYG2%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @151 | Call %C%
%.%
%.%
start "Microsoft WordPad" ".\%BWIPD%\manuallyDLan.rtf"
%.%
%.%
pause
%AYG1% & %AYG2%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @254 | Call %C%
%.%
%.%
%.%
%.%
pause

:DLUNAVAI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @113 | Call %C%
%.%
%.%
more < "%BWIPD%\unavailable.txt"
%.%
%.%
pause
%AYG1% & %AYG2%