SETLOCAL
cd /d %DPATH%

findstr /I /M "BWPinstalled" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":MULTIPLE"

findstr /I /M "intro" %IPL%>nul
if errorlevel 1 (
	findstr /I /M "unpacked2" %IPL%>nul
	if not errorlevel 1 call ".\%BWIPS%\config.bat" ":BWPINTRO"
)

%TXT1% | findstr @003 | Call %C% & pause 

findstr /I /M "reboot" %IPL%>nul
if not errorlevel 1 (
	findstr /I /M "gameselect" %IPL%>nul
	if errorlevel 1 goto :skpcmesg
)
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @023 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
:skpcmesg

COLOR FC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @033 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
COLOR 0F

:: call last jump label first

findstr /I /M "initialize" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":INSTALLB"

findstr /I /M "inipatch" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":EXPLANAI"

findstr /I /M "RunModding" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":INIPATCH"

findstr /I /M "Fixing" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":BWMODING"

findstr /I /M "convertANSII" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":BWPFIXIN"

findstr /I /M "Smoothpack" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":CONVANSI"

findstr /I /M "Textpack" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":SMOOTHPK"

findstr /I /M "Fixpack" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":TEXTPACK"

findstr /I /M "rightPatch" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":FIXPACK"

findstr /I /M "Trimpack" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":RIGHTPAT"

findstr /I /M "resizeBMP" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":TRIMPACK"

findstr /I /M "conversion" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":RESIZBMP"

findstr /I /M "ReplaceWeiDU" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\initialize.bat" ":CONVERSI"

findstr /I /M "initiatecleanup" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":INITIAL"

findstr /I /M "initiatemodding" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":CLEANUP"

findstr /I /M "OScheck" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":MODDING"

findstr /I /M "conflicts" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":OS_CHECK"

findstr /I /M "AnimalComp" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":CONFLICT"

findstr /I /M "widescreen" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":ANIMALCO"

findstr /I /M "settings" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":WIDESCRE"

findstr /I /M "listing" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":afterlst"

findstr /I /M "language" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":CALLLIST"

findstr /I /M "modcheck" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":LANGUAGE"

findstr /I /M "corrected" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":MODCHECK"

findstr /I /M "toolcheck" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":CORCHECK"

findstr /I /M "gamecheck" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":TOOLCHEC"

findstr /I /M "calc" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":GAMECHEC"

findstr /I /M "gameselect" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":GAMECALC"

findstr /I /M "reboot" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":GAMESELE"

findstr /I /M "unpacked2" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":REPMULTI"

findstr /I /M "unpacked1" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":ASKNEWIN"

findstr /I /M "backup" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":UNPACKDL"

findstr /I /M "require" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":BACKUPSA"

findstr /I /M "pathname" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":REQUIREM"

findstr /I /M "back_unzip" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\multiple.bat" ":BACKUNZIP"

findstr /I /M "intro" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\config.bat" ":MULTIPLE"






