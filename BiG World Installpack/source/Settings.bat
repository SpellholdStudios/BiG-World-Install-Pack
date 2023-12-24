SETLOCAL
cd /d %DPATH%

:SETTINGS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @498 | Call %C% & %TXT% | findstr @501 | Call %C%
%IFN% %SET% goto :INSTQSEL

%IF% BWP Settings.txt (
	%.%
	%.%
	%TXT% | findstr @502 | Call %C%
	%.%
	%TXT% | findstr @545 | Call %C% & %TXT1% | findstr @001 | Call %C%
	set X=
	set /P X=
	if /I "%X%"=="1" goto :eof
	if /I "%X%"=="2" goto :INSTQSEL
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	goto :SETTINGS
)
%.%
:INSTQSEL
type NUL> %SET%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @498 | Call %C% & %TXT% | findstr @499 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :MODSELEC
if /I "%X%"=="2" echo InstQ>> %SET% & goto :MODSELEC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :INSTQSEL

:MODSELEC
%IF% BWP_BG1 echo BWP_BG1>> %SET%
%IF% BWP_BG2 echo BWP_BG2>> %SET%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @498 | Call %C% & %TXT% | findstr @503 | Call %C%
%.%
%TXT% | findstr @547 | Call %C%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo PreSelection>> %SET% & goto :CKSUMCOM
if /I "%X%"=="2" echo process>> %SET% & goto :CKSUMPRO
if /I "%X%"=="3" echo individual>> %SET% & goto :CKSUMIND
if /I "%X%"=="4" echo allyouget>> %SET% & goto :CKSUMPRO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :MODSELEC

:CKSUMCOM
"%BWIPU%"\cksum.exe "%BWIPI%\compilation.bat" >"%BWIP%"\chsumCA
fc "%BWIP%"\chsumCS "%BWIP%"\chsumCA > nul
if %errorlevel%==0 (
	goto :COMPILAT
) else (
	%TXT% | findstr @021 | Call %C%
	pause
)
goto :COMPILAT

:CKSUMIND
"%BWIPU%"\cksum.exe "%BWIPI%\individual.bat" >"%BWIP%"\chsumIA
fc "%BWIP%"\chsumIS "%BWIP%"\chsumIA > nul
if %errorlevel%==0 (
	goto :eof
) else (
	%TXT% | findstr @020 | Call %C%
	pause
)
goto :eof

:CKSUMPRO
"%BWIPU%"\cksum.exe "%BWIPI%\process.bat" >"%BWIP%"\chsumPA
fc "%BWIP%"\chsumPS "%BWIP%"\chsumPA > nul
if %errorlevel%==0 (
	goto :PROCETYP
) else (
	%TXT% | findstr @022 | Call %C%
	pause
	goto :CKSUMPRO
)

:PROCETYP
findstr /I /M "allyouget" %SET%>nul
if %errorlevel%==0 (
	goto :COMPLTST
)
call ".\%BWIPS%\defineProcess.bat"
goto :SUMMCALL

:COMPILAT
%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @498 | Call %C%
%.%
%.%
%TXT% | findstr @504 | Call %C%
%.%
%TXT% | findstr @546 | Call %C%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo total_happy>> %SET% & goto :eof
if /I "%X%"=="2" echo happy_plus>> %SET% & goto :eof
if /I "%X%"=="3" goto :PLAYSLST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :COMPILAT

:PLAYSLST
%TXT% | findstr @623 | Call %C%
%TXT% | findstr @549 | Call %C%
:REPPLAYS
set X=
set /P X=
if /I "%X%"=="1" echo phlaphee>> %SET% & goto :eof
if /I "%X%"=="2" echo Arkenor>> %SET% & goto :eof
if /I "%X%"=="3" echo Februarius>> %SET% & goto :eof
if /I "%X%"=="4" echo Jourin>> %SET% & goto :eof
if /I "%X%"=="5" echo micbaldur>> %SET% & goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :REPPLAYS

:COMPLTST
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @622 | Call %C%
%.%
%TXT% | findstr @547 | Call %C%
%.%
%.%
%.%
copy /y ".\%BWIPT%\all_you_can_get_SET.txt" ".\BWP Settings.txt"
set X=
set /P X=
if /I "%X%"=="1" copy /y ".\%BWIPT%\all_you_can_get_BP1.txt" ".\BWP Conflicts.txt" & goto :SUMMCALL
if /I "%X%"=="2" copy /y ".\%BWIPT%\all_you_can_get_SCS1.txt" ".\BWP Conflicts.txt" & goto :SUMMCALL
if /I "%X%"=="3" copy /y ".\%BWIPT%\all_you_can_get_BP2.txt" ".\BWP Conflicts.txt" & goto :SUMMCALL
if /I "%X%"=="4" copy /y ".\%BWIPT%\all_you_can_get_SCS2.txt" ".\BWP Conflicts.txt" & goto :SUMMCALL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :COMPLTST

:SUMMCALL
call ".\%BWIPS%\summary.bat"
%.%
%TXT% | findstr @080 | Call %C%
%TXT% | findstr @545 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" goto :SETTINGS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :SUMMCALL
