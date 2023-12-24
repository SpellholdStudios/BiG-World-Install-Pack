SETLOCAL
cd /d %DPATH%

SET COMP1=total_happy
SET COMP2=happy_plus1
SET COMP3=phlaphee
SET COMP4=Arkenor
SET COMP5=Februarius
SET COMP6=Jourin
SET COMP7=micbaldur

%.%
%.%
%.%1. CORRECTIONS AND IMPROVEMENTS | %M%
%.%
%.%
%IFG% Call %EINST% TP "0"
%IFF% Call %EINST% correcfrbg2 "0"
%IFH% Call %EINST% Traduccion_Mejorada "0"

Call %EINST% TobEx "100 101 102 105 107 108 109 111 112 113 114 115 116 117 118 120 121 122 123 124"
%IFNS%spell_rev.exe Call %EINST% TobEx "103"

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Oversight "0"
)

Call %EINST% bg2fixpack "0"
%IFE% Call %EINST% bg2fixpack "1000"
Call %EINST% bg2fixpack "3 100 101 102 103 104 106 107 108 109 110 111 112 113 114 115 116"

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINSTI% VCv21 "0 1 2"
		
	%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "0 2"
)

findstr /I /M "%COMP3% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% iiKeyNames "2001"
)
%.%
%.%
%.%2. BGT, THE BIG BG2 MODS AND PRIOR TWEAKS | %M%
%.%
%.%
findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TDD "0 1"

	Call %EINST% SOS "0"
)

if %PREVIEW%==0 (
%.%
%.%
%.%
%.%
	rem path for BG1
	%NMAC% %IFS%BGT.exe %TXT% | findstr @089 | Call %C%
	rem %MAC% %IFS%BGT.exe %TXT% | findstr @389 | Call %C%
%.%
%.%
%.%
%.%
%.%
)
Call %EINST% bgt "0" "TYPE BWP_BGT_input.txt"

Call %EINST% bggoEET "1" 

findstr /I /M "%COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% JondalarFix "0"
)

%IFG% Call %EINST% TP "1"

%IFG% Call %EINST% BGT-NPCSound "0" 2>NUL
if %PREVIEW%==0 (
	%.%Don't worry about the "error: unrecognized file signature, must be..." messages | %M%
)

Call %EINST% TxtMusic "0"

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% CtB "0 1 2 3"
	Call %EINST% CtBcutImp "0"
	Call %EINST% TethyrForestPatch "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RoT "0 1"
)

findstr /I /M "SOS.TP2~.*#.*#0./ CtB.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "RoT.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		copy /Y ".\RoT\anim\Yeti\*.bam" ".\override" | %M%
	)
)

Call %EINST% res_fixer "0"

if %PREVIEW%==0 (
	%IF% ".\override\.itm" del ".\override\.itm"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BP "0 35 50 60"
)
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BP "1020 1080 1100 1110 1120 1130 1140 1170 1175 1190 1200 1210 1250 1275 1300 1315 1330 1350 1375 1400 1425 1450 1525 1570 1600 1625 1650 1675 1700 1750 1800 2000"
)
findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BP "2100 2200 2300 2400 2500 2600"
)

if %PREVIEW%==0 (
	%IF% ".\BWP_workspace\tisunpack.exe" copy /Y ".\BWP_workspace\tisunpack.exe" "*.*" | %M%
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% VCv21 "6"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% NeJ3v71 "0 1 4 5"
)
findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		copy /Y ".\NeJ2\backup\0\POGHM4.DLG" ".\override" | %M%
		REM Without this bgqe component #7 cannot be installed
		copy /Y ".\NeJ2\backup\0\SHOPKN.dlg" ".\override" | %M%
		REM without this bgqe and stratagems component #1000 cannot be installed
	)
)
:: for all versions of NEJ
if %PREVIEW%==0 (
	%IF% .\NEJ2 copy /Y ".\%BWFP%\_override\NEJ2\*.*" ".\override" | %M%
)

Call %EINST% BGTMusic "2"
%.%
%.%
%.%3. BG1 QUEST MODS | %M%
%.%
%.%
findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DarkHorizons "0"

	Call %EINST% DSotSC "0 1 2 3 4"

	Call %EINST% NTotSC "0 1 2 3 4 7 8 9"

	Call %EINST% BoneHillv275 "0"

	Call %EINST% drizztsaga "1 3"
)

findstr /I /M "%COMP3% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Vault "0"
)

if %PREVIEW%==0 (
	%IF% ".\NeJ2\backup\0\POGHM4.DLG" copy /Y ".\NeJ2\backup\0\POGHM4.DLG" ".\override" | %M%
	REM Without this bgqe component #7 cannot be installed
)

Call %EINST% bgqe "0 1 2 3 4 5 6 7 8 9 10"

findstr /I /M "%COMP1% %COMP2% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AC_QUEST "0 1 2 3 5 6 7 8 9 10"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TGC1E "0"
)

Call %EINST% SirinesCall "0 1"

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		%IFS%SOA.exe copy /Y ".\%BWFP%\_override\worldmap\*.*" ".\override" | %M%
	)
	Call %EINST% SOA "1"
)
%.%
%.%
%.%4. BG1 NPC MODS | %M%
%.%
%.%
Call %EINST% bg1npc "0 10 24 34 44 54 64 74 80 100 120 130 200"

Call %EINST% BG1NPCMusic "0"

Call %EINST% bg1ub "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24"
:: components 3, 4, 5, 6, 7 will be skipped, if BG1 NPC Project is installed
findstr /I /M "BG1NPC.TP2~.*#.*#30./" %ELOG%>nul
if %errorlevel%==1 (
	Call %EINST% bg1ub "27"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% IndiNPC "0"

	Call %EINST% Mur'Neth "0"

	Call %EINST% MulgoreXaviaNPC "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% XanBG1Friend "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AjantisBG1 "0"
)

findstr /I /M "%COMP2% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ACBre "0 13"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		%IFGS%FinchNPC.exe del ".\FinchNPC\audio\SUFINC28.ogg" | %M%
	)
	Call %EINST% FinchNPC "0"
)

findstr /I /M "%COMP2% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% gavin "0 1" "5"
	Call %EINST% gavin "2"
	Call %EINST% gavin "10"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Huple_NPC "0 1"
)

findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ChaosKnight "0"
	Call %EINST% Askaria "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% isra "0 1 2"
)

findstr /I /M "%COMP1% %COMP2% %COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% garrick_flirt "0" "5"
)
%.%
%.%
%.%5. BG1 STORES AND ITEMS | %M%
%.%
%.%
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BW_Herbs "0"

	Call %EINST% thalan "0"

	Call %EINST% LostItems "0 1 2"
)

findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BGeeAR "0"

	Call %EINST% BGeeW "0"
)
%.%
%.%
%.%6. BG1 RULES AND TWEAKS | %M%
%.%
%.%
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BGSpawn "1000 2100 3800 4000 5000"
)

findstr /I /M "%COMP3% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ktweaks "1 2 3 301"
)

findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% kittomes "0 4 5"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BGTTweak "100 400 600 800 901 1000 1501 2001"
	if %PREVIEW%==0 (
		%IFS%NeJ3v71.exe %IF% ".\override\Auril.ITM" copy /Y ".\NeJ3\itm\Auril.ITM" ".\override" | %M%
	)
	Call %EINSTI% BGTTweak "2100 2300 2400 2500 2600 2700 2800"
)
%.%
%.%
%.%7. BG2 QUEST MODS | %M%
%.%
%.%
findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% EdwinRomance "0 2 3"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	findstr /I /M "BP.TP2~.*#.*#2000./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% Turnabout "0 1"
	)
)

findstr /I /M "%COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% LongerRoad "0 1"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% wheels "0"
)

findstr /I /M "TS-BP.TP2~.*#.*#0./ TS.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==1 (
	Call %EINST% UB "1"
)
Call %EINST% UB "0 2 4 5 6 7 8 9 10 11 12 15 16 17 18 19 21 25"
%IFNS%item_rev.exe Call %EINSTI% UB "20"

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ToA "1 10 20 30 40 50"
)

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% GBThfKp "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AjocMod "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TTSQ "0"

	Call %EINST% emad "0 1 2 3 4 5"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% PlanarSphereMod "0 1 2 3"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% tb#quest "0 1 2 3"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BWQuest "0"
)

Call %EINST% c#sb_silber "0"

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% spgaunt "0 1 3"
)

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TOD "0 1 2"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DC "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Assassinations "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BackBrynnlaw "0"

	Call %EINST% Sellswords "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% 1Sylm "0"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	call %EINSTI% TotDG "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Innershade "0"
)
if %PREVIEW%==0 (
	%IFS%TotDG%IFIF%Innershade.exe copy /Y ".\override\bpbgtmap.bam" ".\bp-bgt_worldmap\bam" | %M%
)
findstr /I /M "%COMP2% %COMP3% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% WhiteQueen "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ISNF "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Eilistraee "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% FishingForTrouble "0 1"
	%IFNS%FishingForTrouble.exe Call %EINST% dq "0 1 2"
)
%.%
%.%
%.%8. MINI-MODS | %M%
%.%
%.%
findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% aip "0"
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% SDMODS "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TurnipGolem "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% MDX "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% hf_HHG "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% QualloFix "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% cal "0"

	Call %EINST% Questor "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% SNAKES "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Contest "0"

	Call %EINST% BWL_Contest "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ThOghma "0"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ShardsOfIce "0 1 2"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% SkooterTheNPC "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% lucy "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Cerberus "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% slandor "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Zalnoya "0 1"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% sagaman "0"

	Call %EINST% Almaquest2 "0"
)
%.%
%.%
%.%9. BG2 TACTICAL ENCOUNTERS | %M%
%.%
%.%
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Tactics "3 32 37"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AzenMOD "0 1 2"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% com_encounters "0 1 2"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DSoA "1 2 3 4 5 6 7 8"
)

findstr /I /M "%COMP3% %COMP4%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DofD "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% impasylum "0 1 2 3"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Firkraag "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% imnesvale "1"
)

findstr /I /M "%COMP3% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Arena "0"
)
%.%
%.%
%.%10. BG2 NPC MODS WITH MORE CONTENT | %M%
%.%
%.%
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Tsujatha "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% imoenfriendship "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% imoenRomance "0 1"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Amber "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BTL "1 2"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Tashia "0 2"
)

findstr /I /M "%COMP2% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ajantisbg2 "0 44"
)

findstr /I /M "%COMP2% %COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kido "0 1"
)

findstr /I /M "%COMP2% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Ariena "0 1"
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kindrek "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% kitanya "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Star "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Valen "0"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Yasraena "0"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% alora "0"
)

findstr /I /M "%COMP2% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AurenAseph "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Thael "0"

	Call %EINST% Hanna "0 1 3 4 5 6"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% KimNPC "0 1"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Tiax "0"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% sarahtob "0"
)
findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Hubelpot "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Angelo "0"
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% VampireTales "0 1 2 3"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Nikita "0"

	Call %EINST% touched "0 1"

	Call %EINST% ninde "0"
)

findstr /I /M "%COMP2% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% xulaye "0 1 2"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% haldamir "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Saerileth "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Skie "0"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% worgas "0"
	findstr /I /M "BDTOBV175.TP2~.*#.*#4./ VCv21.TP2~.*#.*#4./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% worgas "1"
	)
	findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% worgas "2"
	)
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TyrisFlare "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Varshoon "0 1"
)

findstr /I /M "%COMP2% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% gavin_bg2 "0" "5"
	Call %EINST% gavin_bg2 "1 2"
)

findstr /I /M "%COMP3% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Yvette "0" "1"
	Call %EINST% Yvette "1"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% arath "0"

	Call %EINST% dace "0"

	Call %EINST% Gahesh "0"

	Call %EINST% Lena "1"

	Call %EINST% isra_bg2 "0"
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% TheUndying "0"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Neh'taniel "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Solaufein "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% rpgsolaflirtpack "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Sheena "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kelsey "0"
	findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
	if %errorlevel%==0 (
		Call %EINST% Kelsey "1"
	)
	findstr /I /M "BP.TP2~.*#.*#2000./" %ELOG%>nul
	if %errorlevel%==0 (
		Call %EINST% Kelsey "4"
	)
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	call %EINST% GRoA "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Keto "0 1"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Nathaniel "0 1 4 5"
)

findstr /I /M "%COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% LuxleySoA "0 1 2"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kiara-Zaiya "0 1 2 3 4 5 6"
)

findstr /I /M "%COMP2% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% iylos "0 1 6"
)
%.%
%.%
%.%11. BG2 NPC MODS WITH LESS CONTENT | %M%
%.%
%.%
findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% cliffhistory "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Chiara "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Goo "0"

	Call %EINST% Horace "0 1"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kari "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Malthis "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% SBS "0 1"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Vanim "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BIDDE "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Azure "0 1"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% frennedan "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BranwenNPC "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% MawgulNPC "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Uldar "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% rose "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Raziel "0"
)

findstr /I /M "%COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Quayle "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Auden "0"

	Call %EINST% Coondred "0"
)
%.%
%.%
%.%12. BG2 ONE-DAY NPCS | %M%
%.%
%.%
findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% alassa "0"

	Call %EINST% allison "0"

	Call %EINST% anishai "0"

	Call %EINST% BonsBrucev2 "0"

	Call %EINST% cassius "0"

	Call %EINST% Ghareth "0"

	Call %EINST% HessaNPC "0"

	Call %EINST% JCBruce "0"

	Call %EINST% Wikaede "0"

	Call %EINST% WillyB "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% FoxMonster "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Vildra "0"

	Call %EINST% Jandor "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Eldoth "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Roar "0"

	Call %EINST% Teddy "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% abSolestia "0"
)
%.%
%.%
%.%13. BG2 NPC-RELATED MODS | %M%
%.%
%.%
findstr /I /M "%COMP2% CPMP3 %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Cws "0"
)

findstr /I /M "CPMP3 %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% JZ "0"
)

findstr /I /M "CPMP3 %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% deArnise "0"
)

Call %EINST% BanterPack "0 2 3"

Call %EINST% iepbanters "0 1 2 3 4 5"

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% viconia "0"

	Call %EINST% mazzy "0"

	Call %EINST% yoshimo "0"
)

Call %EINST% alcool "0"

Call %EINST% JanQuest "0"

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Korgan "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Khalid "0" "1"
	Call %EINST% Khalid "1 5"
)

findstr /I /M "%COMP1% %COMP2% %COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% valygarfriendship "0"
)

findstr /I /M "%COMP4%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% sarevokfriendship "0"
)

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% NPCFlirt "0 2 4 6 8 10"
	findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
	if %errorlevel%==0 (
		Call %EINST% NPCFlirt "1 3 5 7 9 11 13 15"
	)
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RE "1 2 3 6 9 13 22 24 28 30 35 36 41 42 43 45"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Xan "0 3 5"

	%IFE% Call %EINST% XanBG2Voice "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Aeon "0 1 2"
)

findstr /I /M "%COMP3% %COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% sarevokromance "0"
)

findstr /I /M "%COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% haerdalisromance "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% nephele "0 1"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Fade "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% homewardbound "0 2"
)
%.%
%.%
%.%14. BG2 STORES AND ITEMS | %M%
%.%
%.%
findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% AM "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BagBonus "0"

	Call %EINST% RGenie "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BoM "0"

	Call %EINST% BG2SoA "1"

	Call %EINST% Exnem "0 1 2"
)

findstr /I /M "%COMP5% COM6P %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% FR_ROV "0 1"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% HeartWood "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BW_Herbs_BG2 "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ValHorn "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% KWolf "0"

	Call %EINST% MunchMod "0"
)

findstr /I /M "%COMP3%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RItemPack "0 1 2 3 4 5 6 7 8"
)

findstr /I /M "%COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Rolles "0"
	%IFNS%Item_Pack.exe Call %EINST% Rolles "1"

	Call %EINST% rttitempack "0" 
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Ruad "0 10"

	Call %EINST% Tzshop01 "0"

	Call %EINST% AbyStore "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Underrep "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	%IFNE% Call %EINSTI% ItemUpgrade "10 11"
	%IFE% Call %EINSTI% ItemUpgrade "12"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% SPItemPack "2"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% cliffkey "1"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BloodMort "0"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Ebg2 "0 1 2 4 5 6 7 9 14 15 18"
	findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% Ebg2 "8 10 11 12 13 16 17"
	)
)

findstr /I /M "%COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% foodmod "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% rupert "0"

	Call %EINST% VolcanicArmoury "0"

	Call %EINST% RotBArmorSet "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% StuffofTheMagi "0" "2 1"
)

findstr /I /M "%COMP3% %COMP4% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% KonTwk "11 13 14 15"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% bolsa "0"

	Call %EINST% Charli "0"

	Call %EINST% DARRON "0"

	Call %EINST% nanstein "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Mhoram "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Recarga "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Alchemy "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% MERSKSTORE "0"

	Call %EINST% MYSTIGAN "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% LavaIt "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% OLDMODSPACK "0"

	Call %EINST% RFWIP "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DragonSummon "0" "1"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% dsr "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BBBKBG "0"
	Call %EINST% BBPBAG "0"
	Call %EINST% BBQUIV "0"
	Call %EINST% BBQUIVB "0"
	Call %EINST% BBQUIVC "0"
	Call %EINST% BBSCCS "0"
	Call %EINST% BBSCARDR "0"

	Call %EINST% musica "0"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% swordap "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% portablehole "0"

	Call %EINST% renal "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Haendlermod "0"

	Call %EINST% iwditempack "0 1 2 3 4 5 6 7 8 9 10 11"

	Call %EINST% iwditemfix "0"

	Call %EINST% d2item "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% iiItemMod "1" "0"
)
%.%
%.%
%.%15. MISCELLANEOUS DEPENDEND MODS | %M%
%.%
%.%
findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% d0questpack "0 1 4 5 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21"
)

findstr /I /M "%COMP2% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% alternatives "0"
)

findstr /I /M "CPMP3 %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Chloe "0"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Yikari "0 3 4 5"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RevisedBattles "0 1 2 3 4 5 6 7 8"
	findstr /I /M "FIRKRAAG.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% RevisedBattles "9"
	)

	findstr /I /M "VCv21.TP2~.*#.*#11./" %ELOG%>nul
	if %errorlevel%==0 (
		Call %EINST% RevisedBattles "10"
	)

	Call %EINST% RevisedBattles "11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27"
)

findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		findstr /D:override /C:"B#BLADE" kit.ids> B#BLADEtemp.txt
		more +1 B#BLADEtemp.txt> B#BLADEstring.txt
		del B#BLADEtemp.txt
	)
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Grimuars "0 1 3 4"
)

findstr /I /M "%COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Celestials "0"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% tobr "0 1 2 3 4 5 6 7 8 9 10 11 12 13"
)

findstr /I /M "%COMP2% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ACBre "2"
)

findstr /I /M "%COMP2% %COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Kivan "100 200"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% adrian "0"

	Call %EINSTI% BG1NPCSoA "0 2 4 6 8 10 11 20 25 30 40 45 50 55 60 65 70 75 87"

	Call %EINST% Faren "0 2 3 4 5 8 10 11 12 13 16 17 18 20 21 22 23 24"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% CrossmodBG2 "0 1 2"
)
%.%
%.%
%.%16. BG2 RULES, TWEAKS AND SPELLS | %M%
%.%
%.%
findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% npckit "30 31 900 2100 2200 2300 2800"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% npc_tweak "0 1 2"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ghost "0"

	Call %EINST% FamiliarPack "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Vic "0 1 2 3 4 5 6 7 9"
)

findstr /I /M "%COMP1% %COMP2% %COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% fadingpromises "0"
)

findstr /I /M "%COMP3% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DrizztIsNotStupid "0"
)

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Drows "0"
)
%.%
%.%
%.%17. KITS | %M%
%.%
%.%
findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% kitrtt "0 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 27 28 29 30"

	Call %EINST% PPK "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17"
)
findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Crusade "0 1 2 3"

	Call %EINST% LOHMod "0 1 2 3 4 5 6"

	Call %EINST% Conductor "0 1"

	Call %EINST% HarpScout "0 1 2"

	Call %EINST% A4AUROR "0"

	Call %EINST% BearWalker "0" "1"

	Call %EINST% HeartwarderKit "0"

	Call %EINST% morituri "0"

	Call %EINST% RetaliatorKit "0"

	Call %EINST% werewarrior "0 1"

	Call %EINST% Px_Chantelame "0"

	Call %EINST% x0black "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% spstuff "0 1 2 3 6"

	Call %EINST% PofKits "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18"
)
%.%
%.%
%.%18. TWEAKS AND HLA-TABLES CHANGING MODS | %M%
%.%
%.%
findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ashesofembers "5 6 7 8 9 10 11 14 15"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Oversight "2 3 6 7"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% song_and_silence "0 1 2 3 4 5 6 7 8 9 10"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% sword_and_fist "1 30 31 32 33"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Divine_Remix "11 100 103 106 107 109 112 115 118 121 124 127 130 200 203 403 406 409 412 415 600"
)
%IFS%divine_remix.exe (
	findstr /I /M "VERSION.*~8" .\divine_remix\setup-divine_remix.tp2>nul
	if not errorlevel 1 (
		Call %EINST% DR8_hotfix "0"
	)
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RR "0 1 2 3 4 5 6 7 8 9 11 12 999"
	)
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% ashesofembers "0 2 3 12 18 19 20 21"

	Call %EINST% Tactics "26 27"
)

findstr /I /M "%COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% btweak_lite "0 1 2 3 4 5 6"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BardSong_BG2_IWD "0"
)

findstr /I /M "	%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% WSR "100 200 302 999"
)

findstr /I /M "%COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% celestiales "0 1 2"
)

Call %EINST% 1pp "106 111 101 104 105 201 202"

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% item_rev "0"
)

Call %EINST% 1pp "203 204 210"
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==1 (
	Call %EINST% 1pp "205 206 207 208 300 301"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% spell_rev "0"
)

findstr /I /M "%COMP3% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		%IFS%SpellPackB6.exe (
			copy ".\%BWFP%\_override\SpellPackB5\*.*" ".\override" | %M% & rem These files are randomly unpacked or not installed even if there are existing.
			copy .\SpellPackB6\SpellsAndEffects\Priest\Level03\ADD_SPELL\*.* .\override | %M%  & rem These files are randomly not copied even if there are existing.
		)
	)
	Call %EINSTI% SpellPackB6 "1116 1119 1113 1105 1131 1106 1109 1110 1151 1217 1223 1203 1206 1242 1243 1246 1250 1211 1213 1302 1328 1336 1313 1309 1310 1347 1348 1350 1351 1353 1354 1361 1419 1422 1427 1431 1405 1449 1453 1458 1459 1518 1503 1517 1506 1535 1539 1540 1541 1515 1544 1603 1621 1628 1637 1614 1645 1720 1705 1740 1743 1716 1728 2102 2103 2104 2117 2105 2107 2119 2116 2125 2217 2204 2238 2224 2240 2207 2211 2253 2213 2219 2331 2304 2303 2317 2305 2307 2308 2314 2315 2401 2402 2412 2404 2405 2450 2413 2459 2425 2501 2508 2502 2503 2506 2511 2514 2505 2549 2615 2614 2616 2619 2607 2648 2731 2736 2721 2716 2743 2714 2812 2821 2827 2810 2814 2915 2911 2912 2909 2913"
	%IFNS%stratagems.exe Call %EINSTI% SpellPackB6 "2203 2605 2713"
	)
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Spell50 "0 1 2"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% WildMage "0 1 3 4"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% semi_multi_clerics "0"

	Call %EINST% fairydragon "0"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	call %EINST% Teleport "0 1"
)

Call %EINST% infinityanimations "0"

findstr /I /M "%COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% phord_druidkits "0"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Z#Misc "1 17 18 19"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call ".\%BWIPI%\BGTTweak.bat"
	Call %EINST% BGTTweak "1900"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	%IFI% Call %EINST% Turambar_fixes_tweaks "10"
	Call %EINST% Turambar_fixes_tweaks "11 13 15 16 17 18 1055 1060 2000 2003 2004 2005 2007 2010 2020 2023"
)
%.%
%.%
%.%19. MAJOR TWEAKS | %M%
%.%
%.%
Call %EINST% infinityanimations "25 50 100 150 210 260 400 410 450 490 500 550 600 650 710 7000 9000"

findstr /I /M "ANGELO.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% ianinja "0"
)

Call %EINST% mwyvmtan "10 20"

Call %EINST% Bear_Animations_D2 "0"

findstr /I /M "%COMP1% %COMP2% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% JA#BGT_AdvPack "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% vecna "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% aurora "0 10 500 520"
	Call %EINST% tobaurora "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Haiass "0 10"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% G3Anniversary "0"
)

findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% w_packmule "0" "1"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% spell_rev "10 20 30 50"
)
findstr /I /M "%COMP3% %COMP4% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% spell_rev "60"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Item_Pack "0 1 4 5 6 7 8 9"
)

findstr /I /M "%COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% trap_rev "0"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% cursed_items "0 10"
)

findstr /I /M "%COMP3% %COMP4% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% item_rev "3 9"								   
)
findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% item_rev "10 11 12 13 1093 15 17 18"						
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% fullplate "1 102 204"
)

findstr /I /M "%COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% HardTimes "0 1"
)

Call %EINST% NSCPortraits "0 1 10 20 21 30 50 300 305 310 1000 1001 1030 1031 1300 1310 1320 1330 1340 1350 1360 1370 1380 1390 1400 1410 1420 1430 2000 2010 3000 3010 5000 5010"

findstr /I /M "%COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	%IFG% Call %EINST% JA#BGT_Tweak "0"
	Call %EINST% JA#BGT_Tweak "6 9 10 11 12 13"
	%IFG% Call %EINST% JA#BGT_Tweak "23"
)

:: correction of mismatching "Face" arguments caused by various mods 
Call %EINST% face_directions "0"

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		echo 1413 CLERIC_NEGATIVE_PLANE_PROTECTION>> override/spell.ids
	)
	Call %EINST% ua "3"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% randomiser "1300" "Y"
	Call %EINST% randomiser "9000 10200 10210"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% cdtweaks "60 70 110 130 181 1010 1020 1090 1120 1160 2040 2090 2300 3000 3031 3040 3050 3060 3121 3125 3170"
	findstr /I /M "EDWINROMANCE.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1180"
	)
	Call %EINSTI% cdtweaks "3183" "1 2 1 1 2 1"
	Call %EINST% cdtweaks "3190 4031 4041 4050 4061 4071 4100 4110"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% d0tweak "0 4 5 6"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% RezMod "0 1 2 3"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% hammers "0 15 25 35 50"
)

findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		type B#BLADEstring.txt>> ./override/kit.ids
	)
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINSTI% refinements "11 101 102 103 104 105 106 107 108"
	findstr /I /M "RR.TP2~.*#.*#5./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% refinements "109"
	)
	findstr /I /M "RR.TP2~.*#.*#2./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% refinements "110"
	)
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINSTI% aTweaks "324"
)

findstr /I /M "%COMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		rem correct temporary the language numbers
		findstr /C:" - last updated version 3" stratagems\setup-stratagems.tp2>nul
		if errorlevel 1 goto :skpscsla
		findstr /C:"Spanish translation commented out" stratagems\setup-stratagems.tp2>nul
		if not errorlevel 1 call "%BWIPFIX%"\scs_language.bat"
	)

	:skpscsla
	Call %EINST% stratagems "1000 1901 2000 2010 2020 2030 2041 2060 2070 2080 2090 2100 2110 2120 2130 2140 2150 2170 2180 3020 4000 4010 4020 4040 4110 4130 4146 4180 5020 5030 5050 7000 7010 7020 7030 7040 7050 7060 7070 7080 7110 7140 7200 7210 7220 7230 7250 7900 8000 8010 8090 8120 8130 8140 8150 8160 8170 8180 8190"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% NMR "0 1 2 3 4 5 6 7 8"
)

findstr /I /M "%COfMP3% %COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BP "10 325 440 475 550 600 625 650 675 725 750 760 800 875 900 925"
	Call %EINST% BP "150 350 375 390 400 425 500 525 575 700"
)

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Volcano "0"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% Turambar_fixes_tweaks "2050 2052"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% aTweaks "100 101 102 103 104 105 110 115 130 140 152 160 180 185 186 190 191 200 201 202 203 204 205 210 211 212 213 216 261 270 301 302 310 315 510 999"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% xpmod "0 15"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% BP-Balancer "1 6 11"
)

findstr /I /M "%COMP4% %COMP5% %COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% DiffTweak "3 7 17 24"
)

findstr /I /M "%COMP4% %COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% gMinion "0"
)

findstr /I /M "%COMP6%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% IMPROVEDSUMMONS "0 1 2 3 4 5 6 7 8 9 10"

	Call %EINST% BPSERIES "0 10 100"
)

findstr /I /M "%COMP5%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% NMRF-PC "0 2 3"
)

findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% tb#tweaks "100 150 200 300 1250"
)

findstr /I /M "%COMP4% %COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% P5Tweaks "30 50"
)
%.%
%.%
%.%20. CLOSER INSTALLATION | %M%
%.%
%.%
findstr /I /M "%COMP4% %COMP5% %COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% level1npcs "0"
	findstr /I /M "DIVINE_REMIX.TP2~.*#.*#0./" %ELOG%>nul
	if %errorlevel%==0 (
		Call %EINST% level1npcs "1" "1 1 1 1 1 1 1"
	) else (
		Call %EINST% level1npcs "1" "1 1 1 1 1 1 1 1"
	)
	Call %EINST% level1npcs "3 51 55 60 100"

	findstr /I /M "REFINEMENTS.TP2~.*#.*#10./" %ELOG%>nul
	if %errorlevel%==0 (
		if %PREVIEW%==0 (
			copy ".\level1npcs\backup\0\kit.ids" ".\override" | %M%
		)
	)
)

findstr /I /M "1PP.TP2~.*#.*#203./ 1PP.TP2~.*#.*#204./" %ELOG%>nul
if %errorlevel%==1 (
	Call %EINST% infinityanimations "8030 9520"
)
findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	if %PREVIEW%==0 (
		copy /Y ".\%BWFP%\_override\infinityanimations\*.*" ".\override" | %M%
	)
)

Call %EINST% 1pp "113"

Call %EINST% BP-BGT-Worldmap "0" "1 1"
Call %EINST% BP-BGT-Worldmap "1"

findstr /I /M "%COMP6% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% mapnames "0 25"
)

Call ".\%BWIPI%\define_GUI.bat"
:: FOR /F %%a IN ('type GUI_input.txt') DO Call %EINST% GUI "%%a"
Call %EINST% GUI "4"

findstr /I /M "%COMP5% %COMP7%" %SET%>nul
if %errorlevel%==0 (
	Call %EINST% W_GUI "0 11"
)

%NMAC% %IFN% BWP_NoWide Call %EINST% widescreen "0" "TYPE BWP_widescreen_input.txt"

Call ".\%BWIPI%\close1.bat"
Call ".\%BWIPI%\close2.bat"

:: Copyright 2008-2023 by Leonardo Watson
:: This file or parts of it may not be copied or changed without permission.