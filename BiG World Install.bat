@echo off

:: set proper paths
set DPATH=%~dp0
SETLOCAL
cd /d %DPATH%

SET IF=IF EXIST
SET IFN=IF NOT EXIST
SET S=.exe Setup-
SET .=echo.
SET MOD=.exe echo      
SET OV=.\override\
SET MAC=%IFN% BGConfig.exe
SET NMAC=%IF% BGConfig.exe
SET GOG=%IF% goggame.dll
SET NGOG=%IFN% goggame.dll

SET BWFP=BiG World Fixpack
SET BWIP=BiG World Installpack
SET BWIPD=%BWIP%\DL
SET BWIPI=%BWIP%\install
SET BWIPL=%BWIP%\language
SET BWIPM=%BWIP%\mod
SET BWIPR=%BWIP%\replace
SET BWIPFIX=%BWIP%\repair
SET BWIPS=%BWIP%\source
SET BWIPSR=%BWIP%\SR
SET BWIPT=%BWIP%\test
SET BWIPU=%BWIP%\utils
SET BWSP=BiG World Smoothpack
SET BWTP=BiG World Textpack
SET BWBP=BiG World Trimpack
SET WS=.\BWP_workspace
SET WSO=.\BWP_workspace\override

SET C="%BWIPS%\strg.bat"
SET M="%BWIPU%\mtee.exe" /+ "BiG World Debug.txt"
SET OV=.\override\
SET E="BWP Explanation.txt"
SET IPL="BWP_IP.log"
SET SET="BWP Settings.txt"
SET CON="BWP Conflicts.txt"
SET W1="%BWIPU%\sleep.exe" 1s
SET W2="%BWIPU%\sleep.exe" 2s
SET W5="%BWIPU%\sleep.exe" 5s
SET W10="%BWIPU%\sleep.exe" 10s
SET CONV="%BWIPU%\iconv\iconv.exe"

SET IFE=%IF% BWIP_English
SET IFF=%IF% BWIP_French
SET IFG=%IF% BWIP_German
SET IFH=%IF% BWIP_Spanish
SET IFI=%IF% BWIP_Italian
SET IFP=%IF% BWIP_Polish
SET IFR=%IF% BWIP_Russian
SET IFL=%IF% BWIP_Language
SET IFNE=%IFN% BWIP_English
SET IFNF=%IFN% BWIP_French
SET IFNG=%IFN% BWIP_German
SET IFNH=%IFN% BWIP_Spanish
SET IFNR=%IFN% BWIP_Russian

SET IFS=%IF% Setup-
SET IFNS=%IFN% Setup-
SET IFIF=.exe %IFS%
SET IFNIF=.exe %IFNS%

SET IFES=%IFE% %IFS%
SET IFENS=%IFE% %IFNS%
SET IFFS=%IFF% %IFS%
SET IFFNS=%IFF% %IFNS%
SET IFGS=%IFG% %IFS%
SET IFGNS=%IFG% %IFNS%
SET IFHS=%IFH% %IFS%
SET IFHNS=%IFH% %IFNS%
SET IFRS=%IFR% %IFS%

SET TXT=type "%CD%\%BWIP%\temp\strings.txt"
SET TXT1=type "%CD%\%BWIP%\temp\general.txt"

SET TXTE=type "%BWIPL%\English\"
SET TXTG=type "%BWIPL%\German\"
SET TXTH=type "%BWIPL%\Spanish\"
SET TXTR=type "%BWIPL%\Russian\"
SET INST="%BWIPS%\Install.bat"
SET INSTQ="%BWIPS%\Install_q.bat"

SET SBG1="BWP_BG1" %SET%
::SET SBG2="BWP_BG2" %SET%
SET BGI="..\Baldur's Gate"
SET BWD=..\Big World Downloads

echo %CD%> BWP_BG2_input.txt

if #%1# neq ## goto %~1
:: This enables config.bat to switch to a designated jump label

%IFN% ".\%BWIP%" goto :failreq0
goto :callconf
:failreq0
%.%
%.%
%.%
%.%
%.%"BiG World Installpack" not found. That folder must be in the same directory!
%.%
%.%
%.%"BiG World Installpack" nicht gefunden. Dieser Ordner muss im gleichen
%.%Verzeichnis liegen!
%.%
%.%
pause
exit

:callconf
Call ".\%BWIPS%\header.bat"

Call ".\%BWIPS%\config.bat"

:GETINSTB
findstr /I /M "InstQ" %SET%>nul
if %errorlevel%==0 (
	SET INSTI="%BWIPS%\Install_q.bat"
) else (
	SET INSTI="%BWIPS%\Install.bat"
)

SET EINST=%INST%
SET EINSTI=%INSTI%
SET ELOG=WeiDU.log
SET PREVIEW=0

call ".\%BWIPS%\get_install_file.bat"

call ".\%BWIPS%\finish.bat"

EXIT
