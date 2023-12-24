SETLOCAL
cd /d %DPATH%

for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set BWD=%%a

::add mods from an additional folder
%IF% "%BWD% add-on" robocopy "%BWD% add-on" "%BWD%" /xc /xn /xo

::move mods for BG1 folder only
%IFN% "%BWD%\dialog" MD "%BWD%\dialog"
%IF% "%BWD%\correcfrBG1v1.1.zip" move "%BWD%\correcfrBG1v1.1.zip" "%BWD%\dialog"
%IF% "%BWD%\DLAN_BG1_TOTSC_v5.7z" move "%BWD%\DLAN_BG1_TOTSC_v5.7z" "%BWD%\dialog"
%IF% "%BWD%\Sonidos_BG_TotSC_castellano.exe" move "%BWD%\Sonidos_BG_TotSC_castellano.exe" "%BWD%\dialog"
%IF% "%BWD%\MKs_BG1Textpatch_Revised-v3.3.zip" move "%BWD%\MKs_BG1Textpatch_Revised-v3.3.zip" "%BWD%\dialog"


::remove discarded mods
%IFN% "%BWD%\discarded" MD "%BWD%\discarded"
%IF% "%BWD%\1pp_avatars_v3.rar" move "%BWD%\1pp_avatars_v3.rar" "%BWD%\discarded"
%IF% "%BWD%\1pp_thieves_galore_110.rar" move "%BWD%\1pp_thieves_galore_110.rar" "%BWD%\discarded"
%IF% "%BWD%\1pp_v2.70_windows.rar" move "%BWD%\1pp_v2.70_windows.rar" "%BWD%\discarded"
%IF% "%BWD%\dwarven_female_avatars_APP1010.rar" move "%BWD%\dwarven_female_avatars_APP1010.rar" "%BWD%\discarded"
%IF% "%BWD%\gavin_bg2-v20.exe" %IF% "%BWD%\gavin_tob-20111125.exe" move "%BWD%\gavin_bg2-v20.exe" "%BWD%\discarded"
%IF% "%BWD%\NeJ2Biffer_v3.rar" move "%BWD%\NeJ2Biffer_v3.rar" "%BWD%\discarded"
%IF% "%BWD%\NeJ2v42b.exe" move "%BWD%\NeJ2v42b.exe" "%BWD%\discarded
%IF% "%BWD%\NeJ2v602.exe" move "%BWD%\NeJ2v602.exe" "%BWD%\discarded"
%IF% "%BWD%\NeJ2v68.exe" move "%BWD%\NeJ2v68.exe" "%BWD%\discarded"
%IF% "%BWD%\NeJ2v693.exe" move "%BWD%\NeJ2v693.exe" "%BWD%\discarded"
%IF% "%BWD%\TS_BPv6.10.rar" move "%BWD%\TS_BPv6.10.rar" "%BWD%\discarded"


%IFN% "%BWD%\BWP" MD "%BWD%\BWP"
%IF% "%BWD%\%BWIP%*.*" move "%BWD%\%BWIP%*.*" "%BWD%\BWP"
%IF% "%BWD%\%BWTP%*.*" move "%BWD%\%BWTP%*.*" "%BWD%\BWP"
%IFE% move "%BWD%\BWP\%BWTP%*ENGLISH.*" "%BWD%"
%IFG% move "%BWD%\BWP\%BWTP%*GERMAN.*" "%BWD%"
%IFH% move "%BWD%\BWP\%BWTP%*SPANISH.*" "%BWD%"
%IFR% move "%BWD%\BWP\%BWTP%*RUSSIAN.*" "%BWD%"


::remove doubly present mods
%IFN% "%BWD%\quarantine" MD "%BWD%\quarantine"


findstr /I /M "ShortPrep" %IPL%>nul
if not errorlevel 1 call ".\%BWIPS%\ShortPrep.bat" & goto :WHEELCHK

:VCONDIVI
%IF% "%BWD%\Divine_Remix-master.zip" %IF% "%BWD%\divine_remix_v7.1.zip" GOTO :VRUNDIVI
goto :VCONASCE
:VRUNDIVI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @631 | Call %C%
%IF% "%BWD%\divine_remix_v7.1.zip" %.%[1]   Divine Remix v7.1
%IF% "%BWD%\Divine_Remix-master.zip" %.%[2]   Divine Remix v8
%TXT% | findstr @545 | Call %C%
:VREPDIVI
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" %IF% "%BWD%\Divine_Remix-master.zip" move "%BWD%\Divine_Remix-master.zip" "%BWD%\quarantine" & goto :VCONASCE
if /I "%X%"=="2" %IF% "%BWD%\divine_remix_v7.1.zip" move "%BWD%\divine_remix_v7.1.zip" "%BWD%\quarantine" & goto :VCONASCE
%TXT% | findstr @500 | Call %C%
goto :VREPDIVI

:VCONASCE
%IF% "%BWD%\Ascension-master.zip" %IF% "%BWD%\Ascension-WeiDU-v1.4.24.exe" goto :VRUNASCE
goto :VCONLROA
:VRUNASCE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @717 | Call %C%
%IF% "%BWD%\Ascension-WeiDU-v1.4.24.exe" %.%[1]   Ascension v1.4.24
%IF% "%BWD%\Ascension-master.zip" %.%[2]   Ascension v2
%TXT% | findstr @545 | Call %C%
:VREPASCE
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" %IF% "%BWD%\Ascension-master.zip" move "%BWD%\Ascension-master.zip" "%BWD%\quarantine" & goto :VCONLROA
if /I "%X%"=="2" %IF% "%BWD%\Ascension-WeiDU-v1.4.24.exe" move "%BWD%\Ascension-WeiDU-v1.4.24.exe" "%BWD%\quarantine" & goto :VCONLROA
%TXT% | findstr @500 | Call %C%
goto :VREPASCE

:VCONLROA
%IF% "%BWD%\LongerRoad_v1.5.1.zip" %IF% "%BWD%\the-longer-road-2.*.zip" goto :VRUNLROA
goto :WHEELCHK
:VRUNLROA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @722 | Call %C%
%IF% "%BWD%\LongerRoad_v1.5.1.zip" %.%[1]   The Longer Road v1.5.1
%IF% "%BWD%\the-longer-road-2.*.zip" %.%[2]   The Longer Road v2
%TXT% | findstr @723 | Call %C% & %TXT% | findstr @545 | Call %C%
:VREPLROA
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" %IF% "%BWD%\the-longer-road-2.*.zip" move "%BWD%\the-longer-road-2.*.zip" "%BWD%\quarantine" & goto :WHEELCHK
if /I "%X%"=="2" %IF% "%BWD%\LongerRoad_v1.5.1.zip" move "%BWD%\LongerRoad_v1.5.1.zip" "%BWD%\quarantine" & goto :WHEELCHK
%TXT% | findstr @500 | Call %C%
goto :VREPLROA

:WHEELCHK
if %PROCESSOR_ARCHITECTURE% == x86 (
	%IF% "%BWD%\*wheels-v7.exe" %IF% "%BWD%\WheelsOfProphecy-master.zip" move "%BWD%\WheelsOfProphecy-master.zip" "%BWD%\quarantine" & goto :STRATCHK
	%.%
	%.%
	%IFN% "%BWD%\*wheels-v7.exe" %IF% "%BWD%\WheelsOfProphecy-master.zip" %TXT% | findstr @096 | Call %C% & pause & goto :WHEELCHK
)
if %PROCESSOR_ARCHITECTURE% == AMD64 %IF% "%BWD%\*wheels-v7.exe" %IF% "%BWD%\WheelsOfProphecy-master.zip" move "%BWD%\*wheels-v7.exe" "%BWD%\quarantine" & goto :STRATCHK


:STRATCHK
if %PROCESSOR_ARCHITECTURE% == x86 (
	%IF% "%BWD%\SwordCoastStratagems-31_RC3.zip" %IF% "%BWD%\SwordCoastStratagems-master.zip" move "%BWD%\SwordCoastStratagems-master.zip" "%BWD%\quarantine" & goto :VCONASCE
	%.%
	%.%
	%IFN% "%BWD%\SwordCoastStratagems-31_RC3.zip" %IF% "%BWD%\SwordCoastStratagems-master.zip" %TXT% | findstr @097 | Call %C% & pause & goto :STRATCHK
)
if %PROCESSOR_ARCHITECTURE% == AMD64 %IF% "%BWD%\SwordCoastStratagems-31_RC3.zip" %IF% "%BWD%\SwordCoastStratagems-master.zip" move "%BWD%\SwordCoastStratagems-31_RC3.zip" "%BWD%\quarantine" & goto :TWICEPCK





:TWICEPCK
::the following mods are packed twice
%IFN% "%BWD%\twice-packed" MD "%BWD%\twice-packed"
%IF% "%BWD%\ashesofembers_v27.zip" move "%BWD%\ashesofembers_v27.zip" "%BWD%\twice-packed
%IF% "%BWD%\Cloakwood4.zip" move "%BWD%\Cloakwood4.zip" "%BWD%\twice-packed"
%IF% "%BWD%\deArnise_v6.zip" move "%BWD%\deArnise_v6.zip" "%BWD%\twice-packed"
%IF% "%BWD%\DungeonBeGoneV17.zip" move "%BWD%\DungeonBeGoneV17.zip" "%BWD%\twice-packed"
%IF% "%BWD%\GharethNPC.zip" move "%BWD%\GharethNPC.zip" "%BWD%\twice-packed"
%IF% "%BWD%\Goo_v6.zip" move "%BWD%\Goo_v6.zip" "%BWD%\twice-packed"
%IF% "%BWD%\GRoA_v2.zip" move "%BWD%\GRoA_v2.zip" "%BWD%\twice-packed"
%IF% "%BWD%\homewardbound-v7.rar" move "%BWD%\homewardbound-v7.rar" "%BWD%\twice-packed"
%IF% "%BWD%\JZ-v4.rar" move "%BWD%\JZ-v4.rar" "%BWD%\twice-packed"
%IF% "%BWD%\Keto-SOAv4.zip" move "%BWD%\Keto-SOAv4.zip" "%BWD%\twice-packed"
%IF% "%BWD%\TurnaboutV1.zip" move "%BWD%\TurnaboutV1.zip" "%BWD%\twice-packed"
%IF% "%BWD%\Virtue_v19.zip" move "%BWD%\Virtue_v19.zip" "%BWD%\twice-packed"
%IF% "%BWD%\NSC-Portraits-master.zip" move "%BWD%\NSC-Portraits-master.zip" "%BWD%\twice-packed"


%IF% "%BWD%\twice-packed" "%BWIPU%\7z.exe" x -y -o"%BWD%" "%BWD%\twice-packed\*.zip"
%IF% "%BWD%\twice-packed" "%BWIPU%\7z.exe" x -y -o"%BWD%" "%BWD%\twice-packed\*.rar"
%IF% "%BWD%\*.htm" del "%BWD%\*.htm"
%IF% "%BWD%\*.txt" del "%BWD%\*.txt"


::the following mod is packed trice
%IF% "%BWD%\NSC-Portraits-master" (
	move "%BWD%\NSC-Portraits-master\BGT NSC Portraits 3.1.rar" "%BWD%"
	RD /S /Q "%BWD%\NSC-Portraits-master"
)


:: the following mods need to be repacked again
%IFN% "%BWD%\special" MD "%BWD%\special"
%IF% "%BWD%\GharethNPC.exe" move "%BWD%\GharethNPC.exe" "%BWD%\special"
%IF% "%BWD%\TurnaboutV1.exe" move "%BWD%\TurnaboutV1.exe" "%BWD%\special"


:: the following add-ons need to be unpacked into the respective mods
%IFN% "%BWD%\IA_add-onsC" MD "%BWD%\IA_add-onsC"
%IFN% "%BWD%\IA_add-onsR" MD "%BWD%\IA_add-onsR"
%IF% "%BWD%\Belhifet_and_Marilith.rar" move "%BWD%\Belhifet_and_Marilith.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_Base_Anims.rar" move "%BWD%\IA_Base_Anims.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_BG2_Restores.rar" move "%BWD%\IA_BG2_Restores.rar" "%BWD%\IA_add-onsR"
%IF% "%BWD%\IA_BGII_IWDII.rar" move "%BWD%\IA_BGII_IWDII.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_Fiends_Genies.rar" move "%BWD%\IA_Fiends_Genies.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_IWD.rar" move "%BWD%\IA_IWD.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_IWD_Svirfneblin.rar" move "%BWD%\IA_IWD_Svirfneblin.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_NWN_01_Modron.rar" move "%BWD%\IA_NWN_01_Modron.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_PST_Abishai.rar" move "%BWD%\IA_PST_Abishai.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_PST_Paletted.rar" move "%BWD%\IA_PST_Paletted.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\IA_Wh_Dr_Wyv_LoP.rar" move "%BWD%\IA_Wh_Dr_Wyv_LoP.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\Moinesse_edits_IAised.rar" move "%BWD%\Moinesse_edits_IAised.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\NWN_Misc_I.rar" move "%BWD%\NWN_Misc_I.rar" "%BWD%\IA_add-onsC"
%IF% "%BWD%\packmule_wow.zip" move "%BWD%\packmule_wow.zip" "%BWD%\IA_add-onsC"
%IF% "%BWD%\Shadows_harpy_frostgiant.rar" move "%BWD%\Shadows_harpy_frostgiant.rar" "%BWD%\IA_add-onsC"

%IFN% "%BWD%\worldmap_add-ons" MD "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_french_addon.7z" move "%BWD%\bp-bgt_worldmap_french_addon.7z" "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_german_addon.7z" move "%BWD%\bp-bgt_worldmap_german_addon.7z" "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_italian_addon.7z" move "%BWD%\bp-bgt_worldmap_italian_addon.7z" "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_polish_addon.7z" move "%BWD%\bp-bgt_worldmap_polish_addon.7z" "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_russian_addon.7z" move "%BWD%\bp-bgt_worldmap_russian_addon.7z" "%BWD%\worldmap_add-ons"
%IF% "%BWD%\bp-bgt_worldmap_spanish_addon.7z" move "%BWD%\bp-bgt_worldmap_spanish_addon.7z" "%BWD%\worldmap_add-ons"