SETLOCAL
cd /d %DPATH%

if %PREVIEW%==0 (
	rem fix corrupted file
	Call ".\%BWIPS%\IDSfix.bat"

	rem trim leading and trailing spaces; remove duplicates
	Call ".\%BWIPS%\trim_IDS.bat"

	rem correct some possibly corrupted IDS files
	Call ".\%BWIPS%\trim_KitIDS.bat"

	rem Hotfixes
	findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul
	if %errorlevel%==0 (
		copy /Y ".\%BWFP%\_Hotfixes\RoT\dltcepsmithy\*.*" ".\override" | %M%
	)

	findstr /I /M "1PP.TP2~.*#.*#114./" %ELOG%>nul && findstr /I /M "SPELLPACKB6.TP2~.*#.*#1116./" %ELOG%>nul
	if %errorlevel%==0 (
		copy /Y ".\1pp\backup\114\SPMAGGLO.BAM" ".\override" | %M%
		copy /Y ".\1pp\backup\114\SPMAGGLO.VVC" ".\override" | %M%
	)

	findstr /I /M "W_GUI.TP2~.*#.*#1#./" %ELOG%>nul
	if not errorlevel 1 (
		copy /Y ".\%BWFP%\_override\GUI_original_fonts\*.*" ".\override" | %M%
	)

	call ".\%BWIPI%\RestoreSound.bat"
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
%.%
:: biff override
%IFS%generalized_biffing.exe %TXT% | findstr @090 | Call %C%
%.%
%.%
%.%
%.%
)

if %PROCESSOR_ARCHITECTURE% == x86 copy /y ".\%BWIPU%\weidu-32-246.exe" "setup-generalized_biffing.exe"
if %PROCESSOR_ARCHITECTURE% == AMD64 copy /y ".\%BWIPU%\weidu-64-246.exe" "setup-generalized_biffing.exe"

Call %EINST% generalized_biffing "1"
:: Due to technical reasons this mod cannot be installed with the current WeiDU 249

:: call %EINSTI% npc_ee "119 139 159 179 219 239 259 279 299 339 359 379 399 419 439 459 479 499 519 559 599 699 719 739 759 779 799 819 879"

if %PREVIEW%==0 (
	%NMAC% %NGOG% %IF% NoCD.exe %IF% MSVBVM50.DLL (
		Call ".\%BWIPU%\mute.exe"
		%W5%
		Call ".\%BWIPS%\NCDTrigger.vbs"
		Call ".\%BWIPU%\mute.exe"
	) | %M%

	rem correct misspellings in the game including mods (under development)

	WeiDU.exe --traify-tlk --out .\BWP_workspace\dialog.tra
	copy dialog.tlk .\BWP_workspace\dialog.bak
	%IF% dialogF.tlk copy dialogF.tlk .\BWP_workspace\dialogF.bak
	copy .\BWP_workspace\dialog.tra .\BWP_workspace\dialog.tra.bak
	%IFE% ren ".\%BWIPSR%\SR_consistence_catalog_English.txt" "SR_consistence_catalog.txt"
	%IFG% ren ".\%BWIPSR%\SR_consistence_catalog_German.txt" "SR_consistence_catalog.txt"
	".\%BWIPSR%\SR_consistence.js" ".\BWP_workspace\dialog.tra"
	WeiDU.exe  --make-tlk .\BWP_workspace\dialog.tra dialog.tlk
	%IF% dialogF.tlk WeiDU.exe  --make-tlk .\BWP_workspace\dialog.tra dialogF.tlk
)
:eof
