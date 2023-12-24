SETLOCAL
cd /d %DPATH%

if #%1# neq ## goto %~1
:: This enables focus.bat to switch to a designated jump label

:: Any digit and redirection > without space (n>) will be misinterpreted; to fix, escape the integer with a ^ character (^n>).

call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\BGtitle.png" /t 100 /c
%TXT1% | findstr @000 | Call %C%
%W2%
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\BGtitle.png" /t 0 /c

%IF% BWP_IP.log Call ".\%BWIPS%\continue.bat"

:BWPINTRO
if %PROCESSOR_ARCHITECTURE% == x86 (
	copy /y ".\%BWIPU%\weidu-32.exe" "weidu.exe"
	ren ".\%BWIPU%\7zCon.sfx-32" 7zCon.sfx
	ren ".\%BWIPU%\7z.dll-32" 7z.dll
	ren ".\%BWIPU%\7z.exe-32" 7z.exe
	ren ".\%BWIPU%\7-zip.dll-32" 7-zip.dll
	%.%32-bit>> %IPL%
)
if %PROCESSOR_ARCHITECTURE% == AMD64 (
	copy /y ".\%BWIPU%\weidu-64.exe" "weidu.exe"
	ren ".\%BWIPU%\7zCon.sfx-64" 7zCon.sfx
	ren ".\%BWIPU%\7z.dll-64" 7z.dll
	ren ".\%BWIPU%\7z.exe-64" 7z.exe
	ren ".\%BWIPU%\7-zip.dll-64" 7-zip.dll
)

Call ".\%BWIPS%\intro.bat"
%.%intro>> %IPL%

:MULTIPLE
Call ".\%BWIPS%\multiple.bat"

:CHCKINFO
Call ".\%BWIPS%\reboot.bat"

:GAMESELE
call ".\%BWIPS%\gameselect.bat"

:GAMECALC
Call ".\%BWIPS%\getpathnames2.bat"

findstr /I /M "shortcut" %IPL%>nul
if not errorlevel 1 goto :GAMECHEC

call ".\%BWIPS%\CalcDisc.bat"
%.%calc>> %IPL%

:GAMECHEC
call ".\%BWIPS%\gamecheck.bat"

:TOOLCHEC
call ".\%BWIPS%\toolcheck.bat"

:CORCHECK
findstr /I /M "corrected" %IPL%>nul
if errorlevel 1 (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @034 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @052 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	call ".\%BWIPS%\prepare.bat"
	call ".\%BWIPS%\corrections.bat"
	%.%corrected>> %IPL%
)

:MODCHECK
call ".\%BWIPS%\ModsCheck.bat"

findstr /I /M "shortcut" %IPL%>nul
if not errorlevel 1 %.%initiatecleanup>> %IPL% & goto :INITIAL

:LANGUAGE
call ".\%BWIPS%\language.bat"
%.%language>> %IPL%

:CALLLIST
call ".\%BWIPS%\listexist.bat"
exit
:: this is needed to enable listexit.bat to jump back properly

:afterlst
call ".\%BWIPS%\initiateSettings.bat"
exit
:: this is needed to enable initiateSettings.bat to jump back properly

:afterset
%.%settings>> %IPL%

:WIDESCRE
call ".\%BWIPS%\Widescreen.bat"
%.%widescreen>> %IPL%

:ANIMALCO
call ".\%BWIPS%\AnimalComp.bat"
%.%AnimalComp>> %IPL%

:CONFLICT
call ".\%BWIPS%\initiateConflict.bat"
%.%conflicts>> %IPL%

:OS_CHECK
%IFS%stratagems.exe call ".\%BWIPS%\checkOS.bat
%.%OScheck>> %IPL%

:MODDING
findstr /I /M "shortcut" %IPL%>nul
if not errorlevel 1 (
	call ".\%BWIPS%\initiateModding.bat"
)
%.%initiatemodding>> %IPL%

:CLEANUP
call ".\%BWIPS%\CalcPre.bat"
call ".\%BWIPS%\initiateCleanup.bat"
%.%initiatecleanup>> %IPL%

:INITIAL
call ".\%BWIPS%\shortcut.bat"

call ".\%BWIPS%\initialize.bat"
%.%initialize>> %IPL%

:INSTALLB
:: installation of components
%TXT% | findstr @000 | Call %C% & %TXT% | findstr @088 | Call %C% & %TXT1% | findstr @006 | Call %C%
%.%
%.%BWPstarted>> %IPL%
call ".\BiG World Install.bat" ":GETINSTB" & exit
