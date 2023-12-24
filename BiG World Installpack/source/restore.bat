SETLOCAL
cd /d %DPATH%

:REPRESTO
findstr /I /M "ShortPrep" %IPL%>nul
if not errorlevel 1 goto :RUNRESTO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @071 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :RUNRESTO
if /I "%X%"=="N" exit
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPRESTO
:RUNRESTO
:: save necessary folders
echo %CD%> BWP_BG2_input.txt

%IF% "..\BGII - SoA restore" (
	%IFN% "..\BGII - SoA restore\CD*" (
		MOVE "%CD%\CD2" ..\"BGII - SoA restore"
		MOVE "%CD%\CD3" ..\"BGII - SoA restore"
		MOVE "%CD%\CD4" ..\"BGII - SoA restore"
		MOVE "%CD%\CD5" ..\"BGII - SoA restore"
	)

	%IFN% "..\BGII - SoA restore\data" mkdir "..\BGII - SoA restore\data"
	FOR %%i IN (
		.\data\25AmbSnd.bif
		.\data\25Areas.bif
		.\data\25ArMisc.bif
		.\data\25CreAni.bif
		.\data\25Creatures.bif
		.\data\25CreSou.bif
		.\data\25Deflt.bif
		.\data\25Dialog.bif
		.\data\25Effect.bif
		.\data\25GuiBam.bif
		.\data\25GuiDes.bif
		.\data\25GuiMos.bif
		.\data\25Items.bif
		.\data\25IWAnim.bif
		.\data\25MiscAn.bif
		.\data\25NpcSo.bif
		.\data\25Portrt.bif
		.\data\25Projct.bif
		.\data\25Scripts.bif
		.\data\25SndFX.bif
		.\data\25SpelAn.bif
		.\data\25Spells.bif
		.\data\25Store.bif
		.\data\AMBSound.bif
		.\data\Areas.bif
		.\data\ARMisc.bif
		.\data\CD3CreA2.bif
		.\data\CD3CreAn.bif
		.\data\CD4CreA2.bif
		.\data\CD4CreA3.bif
		.\data\CD4CreAn.bif
		.\data\CDCreAni.bif
		.\data\CHAAnim.bif
		.\data\CHASound.bif
		.\data\CREAnim.bif
		.\data\CREAnim1.bif
		.\data\Creature.bif
		.\data\CRESound.bif
		.\data\CRIWAnim.bif
		.\data\Default.bif
		.\data\DeSound.bif
		.\data\Dialog.bif
		.\data\Effects.bif
		.\data\GUIBam.bif
		.\data\GUICHUI.bif
		.\data\GUIDesc.bif
		.\data\GUIFont.bif
		.\data\GUIIcon.bif
		.\data\GUIMosc.bif
		.\data\Hd0CrAn.bif
		.\data\Hd0GMosc.bif
		.\data\Items.bif
		.\data\MISCAnim.bif
		.\data\MISSound.bif
		.\data\MovHD0.bif
		.\data\NPCAnim.bif
		.\data\NPCHd0So.bif
		.\data\NPCSoCD2.bif
		.\data\NPCSoCD3.bif
		.\data\NPCSoCD4.bif
		.\data\NPCSound.bif
		.\data\OBJAnim.bif
		.\data\PaperDol.bif
		.\data\Portrait.bif
		.\data\Project.bif
		.\data\Scripts.bif
		.\data\SFXSound.bif
		.\data\SPELAnim.bif
		.\data\Spells.bif
		.\data\Stores.bif
		.\data\Data
		.\data\Movies
	) DO (
		MOVE %%i "..\BGII - SoA restore\data"	
	)

	FOR %%i IN (
		BWP_BGT_input.txt
		BWP_BG1_input.txt	
		BWP_BG2_input.txt
                BWP_IWD1_input.txt
                BWP_IWD2_input.txt	
		BWP_DL_input.txt	
		"BWP Settings.txt"	
		"BWP Conflicts.txt"	
	) DO (
		 copy %%i ..\"BGII - SoA restore"
	)
)

:: backup or delete

:REPBAKDE
findstr /I /M "ShortPrep" %IPL%>nul
if not errorlevel 1 type NUL> BWP_Delete & goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @072 | Call %C% & %TXT% | findstr @545 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" type NUL> BWP_Delete & goto :eof
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPBAKDE



