:: "if %errorlevel%==0" or "if not errorlevel 1" (nestled within a conditioned branch) means "if exist"
:: "if %errorlevel%==1" or "if errorlevel 1" (nestled within a conditioned branch) means "if not exist"

SETLOCAL
cd /d %DPATH%
%.%
%.%
%.%1. CORRECTIONS AND IMPROVEMENTS | %M%
%.%
%.%
%IFG% Call %EINST% TP "0"
%IFF% Call %EINST% correcfrbg2 "0"
%IFH% Call %EINST% Traduccion_Mejorada "0"

Call %EINSTI% TobEx "100 101 102 105 107 108 109 111 112 113 114 115 116 117 118 120 121 122 123 124"
findstr /I /M "NEJHalruaa" %CON%>nul
if errorlevel 1 (
	%IFNS%spell_rev.exe Call %EINSTI% TobEx "103"
)

findstr /I /M "BP_Ascension" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Oversight "0"
)

Call %EINST% bg2fixpack "0 3"
%IFE% Call %EINSTI% bg2fixpack "1000"
Call %EINSTI% bg2fixpack "100 101 102 103 104 106 107 108 109 110 111 112 113 114 115 116"

Call %EINSTI% VCv21 "0 1 2"
		
%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "0 2"

Call %EINST% iiKeyNames "2001"

Call %EINSTI% druidgrovemakeover "0"
%.%
%.%
%.%2. BGT, THE BIG BG2 MODS AND PRIOR TWEAKS | %M%
%.%
%.%
:: Install TDD before BGT in order to have NPCs imported from BG1 that receive the quests offered by TDD.
findstr /I /M "CnoBig4BG2" %CON%>nul
if errorlevel 1 (
	findstr /I /M "BGT2DTDD" %CON%>nul
	if not errorlevel 1 (
		findstr /I /M "SandrahNPC_req" %CON%>nul
		if not errorlevel 1 (
			Call %EINST% TDD "0"
		) else (
			findstr /I /M "CNoFirewalker CSharTeel" %CON%>nul
			if errorlevel 1 (
				Call %EINST% TDD "0"
			) else (
				%IFS%TDD.exe %TXT% | findstr @405 | Call %C%>> %E%
			)
		)
		Call %EINST% TDD "1"
	)

	Call %EINST% SOS "0 1"
	rem interesting for SandrahNPC
)

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1a
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

Call %EINST% JondalarFix "0"

%IFG% Call %EINST% TP "1"

%IFG% Call %EINST% BGT-NPCSound "0" 2>NUL
if %PREVIEW%==0 (
	%.%Don't worry about the "error: unrecognized file signature, must be..." messages | %M%
)

Call %EINST% TxtMusic "0"

:SKIPBG1a

findstr /I /M "CnoBig4BG2" %CON%>nul
if errorlevel 1 (
	Call %EINST% CtB "0 1"
	rem required for SandrahNPC

	findstr /I /M "CTB.TP2~.*#.*#1./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% CtB "2 3"

		Call %EINST% CtBcutImp "0"
	)
	
	findstr /I /M "CTB.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% TethyrForestPatch "0"
	)

	findstr /I /M "COctDrizzt" %CON%>nul
	if errorlevel 1 (
		Call %EINST% RoT "0 1"
	)
	rem required for SandrahNPC
)

findstr /I /M "SOS.TP2~.*#.*#0./ CtB.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "RoT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		copy /Y ".\RoT\anim\Yeti\*.bam" ".\override" | %M%
	)
)

Call %EINST% res_fixer "0"

if %PREVIEW%==0 (
	%IF% ".\override\.itm" del ".\override\.itm"
)

Call %EINSTI% BP "0 35 50"

findstr /I /M "CSOBWPO" %CON%>nul
if errorlevel 1 (
	%IFNS%tb#tweaks.exe Call %EINSTI% BP "60"
)

:: BP Encounter Components
findstr /I /M "SCS_Encount" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% BP "1020 1225"
	findstr /I /M "BP.TP2~.*#.*#35./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% BP "1750"
	)												   
)
Call %EINSTI% BP "1080 1100 1110 1120 1130 1140 1170 1175 1190 1200 1210 1250 1275 1300 1315 1330 1350 1375 1400 1425 1450 1525 1570 1600 1625 1650 1675 1700 1725 1800"

findstr /I /M "orig_Ascension" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% BP "2000 2100 2200 2300 2400 2600"
	findstr /I /M "OVERSIGHT.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% BP "2500"
	)
) else (
	%IFS%BP.exe %TXT% | findstr @381 | Call %C%>> %E%
)
:: Any version of Ascension required for SandrahNPC

:: Install TDD after BGT to give TDD NPCs their quests function.
findstr /I /M "CnoBig4BG2" %CON%>nul
if errorlevel 1 (
	findstr /I /M "TDD2DBGT" %CON%>nul
	if not errorlevel 1 (
		findstr /I /M "SandrahNPC_req" %CON%>nul
		if not errorlevel 1 (
			Call %EINST% TDD "0"
		) else (
			findstr /I /M "CNoFirewalker CTDDCSharTeel CSharTeel" %CON%>nul
			if errorlevel 1 (
				Call %EINST% TDD "0"
			) else (
				%IFS%TDD.exe %TXT% | findstr @405 | Call %C%>> %E%
			)
		)
		Call %EINST% TDD "1"
	)
)

if %PREVIEW%==0 (
	%IF% ".\BWP_workspace\tisunpack.exe" copy /Y ".\BWP_workspace\tisunpack.exe" "*.*" | %M%
	rem required for TS
)

findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "3"
)
findstr /I /M "CBerelKeldorn" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% VCv21 "4"
	)
)
findstr /I /M "CnoTS" %CON%>nul
if errorlevel 1 (
	findstr /I /M "SandrahNPC_les" %CON%>nul
	if not errorlevel 1 (
		%IFS%VCv21.exe (
			Call %EINST% VCv21 "5 6 7 8"
		)
	) else (
		findstr /I /M "CKeepYosh CnoTS" %CON%>nul
		if errorlevel 1 (
			%IFS%VCv21.exe (
				Call %EINST% VCv21 "5 6 7 8"
			)
		) else (
			%IFS%VCv21.exe %TXT% | findstr @392 | Call %C%>> %E%
		)
	)
)
Call %EINSTI% VCv21 "9 10"
findstr /I /M "CSharTeel CTDDCSharTeel CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% VCv21 "11"
) else (
	%IFS%NeJ3v71.exe %TXT% | findstr @401 | Call %C%>> %E%
)
Call %EINSTI% VCv21 "12"
findstr /I /M "VCv21.TP2~.*#.*#4./ VCv21.TP2~.*#.*#6./ VCv21.TP2~.*#.*#12./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "13"
)
Call %EINSTI% VCv21 "14 16 17 18 19 21 23 24 25 26 27 28"
%IFNS%BP.exe Call %EINSTI% VCv21 "29"
findstr /I /M "CNoBDashImoen ConSandrah" %CON%>nul
if errorlevel 1 (
	%IFNS%CtB.exe Call %EINSTI% VCv21 "30"
)
rem Call %EINSTI% VCv21 "31 32 33 34"

findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "35 36 39"
	rem comp 38 cannot be installed	
)
Call %EINSTI% VCv21 "40"

%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 20 21 22 23 24"
findstr /I /M "CNoBDashImoen ConSandrah" %SET%>nul
if errorlevel 1 (
	%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "19"
)

findstr /I /M "CnoNEJ" %CON%>nul
if errorlevel 1 (
	findstr /I /M "NoNEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% NeJ3v71 "0 5"
		findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			if %PREVIEW%==0 (
				copy /Y ".\NeJ2\backup\0\POGHM4.DLG" ".\override" | %M%
				REM Without this bgqe component #7 cannot be installed
				copy /Y ".\NeJ2\backup\0\SHOPKN.dlg" ".\override" | %M%
				REM without this bgqe component #10 and stratagems component #1000 cannot be installed
			)
		)
	)
	Call %EINSTI% NeJ3v71 "1 4"
	rem 4 is skie
	findstr /I /M "MiH_EQ" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% NeJ3v71 "2"
	)

	rem for all versions of NEJ
	if %PREVIEW%==0 (
		%IF% .\NEJ2 copy /Y ".\%BWFP%\_override\NEJ2\*.*" ".\override" | %M%
	)
)

Call %EINST% PoFQuestPack "0"
if %PREVIEW%==0 (
	%IFS%PoFQuestPack.exe copy ".\%BWFP%\_PoFQuest\missing\POFQtraps\*" ".\override" | %M%
	%IFS%PoFQuestPack%IFNIF%TDD.exe copy ".\%BWFP%\_PoFQuest\missing\POFQtrapsTDD\*" ".\override" | %M%
)

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1b
)

Call %EINST% BGTMusic "2"
%.%
%.%
%.%3. BG1 QUEST MODS | %M%
%.%
%.%
Call %EINST% DarkHorizons "0"
:: significant for SandrahNPC

:: correct temporary the language numbers
if %PREVIEW%==0 (
	findstr /C:"VERSION ~v3.1~ //" DSotSC\DSotSC.tp2>nul
	if not errorlevel 1 call "%BWIPFIX%"\dsotsc_language.bat"
)
Call %EINST% DSotSC "0 1 2 3 4"
:: required for SandrahNPC

Call %EINST% NTotSC "0 1 2 3 4 7 8 9"
findstr /I /M "CBGT_AdvPack" %CON%>nul
if errorlevel 1 (
	Call %EINST% NTotSC "5 6"
)
:: required for SandrahNPC

Call %EINST% BoneHillv275 "0"
:: significant for SandrahNPC

Call %EINST% drizztsaga "1 3"
:: required for SandrahNPC

Call %EINST% Vault "0"
:: significant for SandrahNPC
%IFS%item_rev.exe CALL %EINST% vault "1"

findstr /I /M "CImoenRom" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Imoen_forever "0 1 2 3"
)

Call %EINSTI% C#ENDLESSBG1 "0 1 3 4 5 6 7 8 12"

findstr /I /M "NeJ3v71.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IF% ".\NeJ2\backup\0\POGHM4.DLG" copy /Y ".\NeJ2\backup\0\POGHM4.DLG" ".\override" | %M%
		REM Without this bgqe component #7 cannot be installed
	)
)
Call %EINST% bgqe "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
:: significant for SandrahNPC

Call %EINST% AC_QUEST "0 1 2 3 5 6 7 8 9 10"
:: significant for SandrahNPC

Call %EINST% c#brage "0 1"

Call %EINST% TGC1E "0"
:: required for SandrahNPC

Call %EINST% SirinesCall "0 1"

if %PREVIEW%==0 (
	%IFS%SOA.exe copy /Y ".\%BWFP%\_override\worldmap\*.*" ".\override" | %M%
)
Call %EINST% SOA "1"
:: significant for SandrahNPC

Call %EINST% NMT "0"

Call %EINST% WBGTAP "1"

Call %EINST% karatur "0"

Call %EINST% bst "0"
%.%
%.%
%.%4. BG1 NPC MODS | %M%
%.%
%.%
findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "DRIZZTSAGA.TP2~.*#.*#3./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% bg1npc "0 10"
	) else (
		findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% bg1npc "0 10"
		)
	)
)

Call %EINSTI% bg1npc "24 34 44 54 64 74 80 100 120 130 200"
:: 0 - 70 required for SandrahNPC

findstr /I /M "BG1NPC.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% BG1NPCMusic "0"
)

Call %EINSTI% bg1re "105" & rem adult version
rem Call %EINSTI% bg1re "100" & rem standard version
Call %EINSTI% bg1re "1 2 3 4 5 6 7 8 9 10 11 15 16 17 18 19 20 21 23 27 28 31 32 33 34 35 36 37 40 41 42 43 44"
Call %EINSTI% bg1re "12 13 24 25 38 39" & rem adult version

findstr /I /M "FOTD.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% bg1ub "0"
)
Call %EINSTI% bg1ub "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 28 29 30 31 32 33 34"
:: components 3, 4, 5, 6, 7 will be skipped, if BG1 NPC Project is installed
findstr /I /M "BG1NPC.TP2~.*#.*#130./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% bg1ub "27"
)

Call %EINST% IndiNPC "0"
:: interesting for SandrahNPC

Call %EINST% Mur'Neth "0"
:: interesting for SandrahNPC

Call %EINST% MulgoreXaviaNPC "0"

Call %EINST% XanBG1Friend "0"

Call %EINST% coranbgfriend "0"

Call %EINST% AjantisBG1 "0"

findstr /I /M "CWorgasPoFQ" %CON%>nul
if errorlevel 1 (
	Call %EINST% ACBre "0 13"
)
:: significant for SandrahNPC

if %PREVIEW%==0 (
	%IFGS%FinchNPC.exe del ".\FinchNPC\audio\SUFINC28.ogg" | %M%
)
Call %EINST% FinchNPC "0"
:: significant for SandrahNPC

Call %EINST% gavin "0 1" "5"
Call %EINST% gavin "2"
Call %EINST% gavin "10"
:: interesting for SandrahNPC

Call %EINSTI% Huple_NPC "0 1"

Call %EINST% ChaosKnight "0"

findstr /I /M "ChaosKnight.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Askaria "0"
)

Call %EINST% valerie "0"
:: interesting for SandrahNPC

Call %EINSTI% isra "0 1 2"
:: interesting for SandrahNPC

Call %EINST% White "0"
:: interesting for SandrahNPC

findstr /I /M "CGarricktales" %CON%>nul
if errorlevel 1 (
	Call %EINST% garrick_flirt "0" "5"
)
findstr /I /M "CGarrickflirt" %CON%>nul
if errorlevel 1 (
	findstr /I /M "BG1NPC.TP2~.*#.*#10./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#200./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% garrick-tt "0"
	)
)

Call %EINST% GlamNPCPack "0"
%IFNS%GlamNPCPack.exe Call %EINST% vynd "0"

Call %EINST% TenyaThermidor "0"

Call %EINST% Zakrion_BG1 "1000"

Call %EINST% Margarita "0"

Call %EINST% Helarine_BGEE "0"

Call %EINST% BG1Aerie "0"
%.%
%.%
%.%5. BG1 STORES AND ITEMS | %M%
%.%
%.%
Call %EINST% BW_Herbs "0"

Call %EINST% thalan "0"

Call %EINSTI% LostItems "0 1 2"

Call %EINST% c#brage "10"

Call %EINST% BGeeAR "0"

Call %EINST% BGeeW "0"

Call %EINST% Animus "0"

Call %EINST% wmart "0"

Call %EINST% ClubOfPain "0"

Call %EINST% WandCase "0"

Call %EINST% saradas_magic "0"
%.%
%.%
%.%6. BG1 RULES AND TWEAKS | %M%
%.%
%.%
Call %EINSTI% BGSpawn "1000 2100 3800 4000 5000"

Call %EINSTI% ktweaks "1 2 3 301"
:: Ktweaks component #3 needs to be installed if component #2 is installed

Call %EINSTI% kittomes "0 4 5"

Call %EINSTI% BGTTweak "100 600"
findstr /I /M "VCv21.TP2~.*#.*#24./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% BGTTweak "400"
)
findstr /I /M "BG2SOA.TP2~.*#.*#0./ BG2SOA.TP2~.*#.*#1./ VCv21.TP2~.*#.*#24./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% BGTTweak "800"
)
Call %EINSTI% BGTTweak "901 1000 1104 1200 1300 1502"
findstr /I /M "BG1UB.TP2~.*#.*#16./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% BGTTweak "1400"
)
%IFNS%RR.exe call %EINSTI% BGTTweak "1700"
Call %EINSTI% BGTTweak "2001"
if %PREVIEW%==0 (
	%IFS%NeJ3v71.exe %IF% ".\override\Auril.ITM" copy /Y ".\NeJ3\itm\Auril.ITM" ".\override" | %M%
)
Call %EINSTI% BGTTweak "2100 2300 2400 2500 2600 2700 2800"

Call %EINST% BG_Travel "66"

Call %EINST% CritterParts_v1.1 "0"

Call %EINST% ZFA "0 1 2"

Call %EINSTI% BP-Balancer "17 27 30"

:SKIPBG1b
%.%
%.%
%.%7. BG2 QUEST MODS | %M%
%.%
%.%
Call %EINSTI% EdwinRomance "0 2 3"

findstr /I /M "BP_Ascension" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Ascension "0 10 20 30 40 50 61 1000 1100 1200 1300 1400 1500 2400"
)

findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Turnabout "0 1"
)

Call %EINSTI% d0questpack "11"

findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2100./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% LongerRoad "0 2"
)
:: interesting for SandrahNPC

findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\wheels\ssl\ssl.exe goto :skwhlssl
)
Call %EINST% wheels "0"
:skwhlssl

findstr /I /M "TS.TP2~.*#.*#0./ VCv21.TP2~.*#.*#28./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% UB "1"
)
Call %EINSTI% UB "0 2 3 4 5 6 7 8 9 10 11 12 15 16 17 18 19 21 25"
%IFNS%item_rev.exe Call %EINSTI% UB "20"
findstr /I /M "ASCENSION.TP2~.*#.*#0./ TURNABOUT.TP2~.*#.*#0./ 7C-Yoshi.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
if errorlevel 1 (
	Call %EINST% UB "24"
)

Call %EINSTI% ToA "1 10 20 30 40 50"
:: interesting for SandrahNPC

Call %EINST% GBThfKp "0"
:: interesting for SandrahNPC
if %PREVIEW%==0 (
	findstr /I /M "GBTHFKP.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		%IFNS%Tactics%IFNIF%BP%IFNIF%Stratagems.exe "%BWIPU%"\7z.exe x -y -o".\override" .\GBThfKp\_debug\impmaevar.7z
	)
)

findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% AjocMod "0"
)

Call %EINST% TTSQ "0"

Call %EINSTI% emad "0 1 2 3 4 5"

Call %EINSTI% PlanarSphereMod "0 1 2 3"
:: significant for SandrahNPC

Call %EINSTI% tb#quest "0 "

findstr /I /M "TB#QUEST.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% tb#quest "1"
)
%IFS%refinements.exe Call %EINSTI% tb#quest "2"
Call %EINSTI% tb#quest "3"

Call %EINST% BWQuest "0"

Call %EINST% c#sb_silber "0"

Call %EINSTI% spgaunt "0 1 3"

Call %EINST% TOD "0 1 2"

Call %EINST% DC "0"

Call %EINST% Assassinations "0"

Call %EINST% BackBrynnlaw "0"

Call %EINST% Sellswords "0"

Call %EINST% 1Sylm "0"

Call %EINSTI% sovereign "0 1"

call %EINSTI% TotDG "0"

findstr /I /M "CSeverian" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Innershade "0"
)
if %PREVIEW%==0 (
	%IFS%TotDG%IFIF%Innershade.exe copy /Y ".\override\bpbgtmap.bam" ".\bp-bgt_worldmap\bam" | %M%
)

call %EINSTI% WhiteQueen "0"

Call %EINST% rukrakia "0 3"

Call %EINST% ISNF "0"

Call %EINST% Devin "0"

Call %EINST% Eilistraee "0"
:: interesting for SandrahNPC

Call %EINST% FishingForTrouble "0 1"
%IFNS%FishingForTrouble.exe Call %EINST% dq "0 1 2"
:: significant for SandrahNPC

call %EINST% SouthernEdge "0"

call %EINST% Ooze "0"

call %EINST% TangledIsle "0"

call %EINST% BridgesBlock "0"

call %EINST% AlabasterSands "0"
%.%
%.%
%.%8. MINI-MODS | %M%
%.%
%.%
Call %EINST% aip "0"

Call %EINST% SDMODS "0"

Call %EINST% TurnipGolem "0"

Call %EINST% MDX "0"

Call %EINST% hf_HHG "0"

Call %EINST% QualloFix "0"

Call %EINST% cal "0"

Call %EINST% Questor "0"

Call %EINST% SNAKES "0"

Call %EINST% Contest "0"

Call %EINST% BWL_Contest "0"

Call %EINST% ThOghma "0"

Call %EINSTI% ShardsOfIce "0 1 2"

Call %EINST% SkooterTheNPC "0"

Call %EINST% lucy "0"

Call %EINST% Cerberus "0"

Call %EINST% slandor "0"

Call %EINST% Zalnoya "0 1"

Call %EINST% Swylif "0"

Call %EINST% sagaman "0"

Call %EINST% Derats_Ogre "0"

Call %EINST% Almaquest2 "0"

Call %EINST% Reunion "0"

Call %EINST% dw_lanthorn "20"
%.%
%.%
%.%9. BG2 TACTICAL ENCOUNTERS | %M%
%.%
%.%
%IFNS%BGT%IFNIF%BP.exe Call %EINSTI% Tactics "0"
%IFNS%BP.exe Call %EINSTI% Tactics "1 6 7 8 9 11 14 15 24 29 31"
Call %EINSTI% Tactics "32 33 37"
%IFNS%BP%IFNIF%stratagems.exe Call %EINSTI% Tactics "2 4 5 10 16 12 13 20 21 22 23 28 35"
%IFNS%stratagems.exe Call %EINSTI% Tactics "3 22 25 34"
%IFNS%d0questpack.exe Call %EINSTI% Tactics "17"
%IFNS%d0questpack%IFNIF%stratagems.exe Call %EINSTI% Tactics "18"
%IFNS%BP.exe Call %EINSTI% Tactics "36"
%IFNS%d0questpack.exe Call %EINSTI% Tactics "30"

Call %EINST% AzenMOD "0 1 2"

Call %EINST% com_encounters "0 1 2"

Call %EINSTI% DSoA "1"
findstr /I /M "BDToBv175.TP2~.*#.*#7./ VCv21.TP2~.*#.*#6./" %ELOG%>nul
if errorlevel 1 (
	%IFNS%BP.exe Call %EINSTI% DSoA "2"
)
%IFNS%BP.exe Call %EINSTI% DSoA "3 5 7"
Call %EINSTI% DSoA "4 6 8"

Call %EINST% DofD "0"

Call %EINSTI% impasylum "0 1 2 3"

findstr /I /M "BuTcHeR" %CON%>nul
if errorlevel 1 (
	Call %EINST% Firkraag "0"
)

Call %EINST% imnesvale "1"

Call %EINST% DNT "0"

Call %EINST% Arena "0"

Call %EINST% UoT "0"

findstr /I /M "Firkraag" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% BuTcHeRy "10 20 30"
) else (
	%IFS%BuTcHeRy.exe %TXT% | findstr @355 | Call %C%>> %E%
)
%.%
%.%
%.%10. BG2 NPC MODS WITH MORE CONTENT | %M%
%.%
%.%
Call %EINST% Tsujatha "0"
:: interesting for SandrahNPC

Call %EINST% imoenfriendship "0"

findstr /I /M "CKhalid CImoenBDash CImoen4Ever" %CON%>nul
if errorlevel 1 (
	Call %EINST% imoenRomance "0 1"
)

Call %EINST% Amber "0"
:: interesting for SandrahNPC

findstr /I /M "CInner" %CON%>nul
if errorlevel 1 (
	Call %EINST% Severian "0"
)

Call %EINSTI% BTL "1 2"
:: interesting for SandrahNPC

Call %EINST% Tashia "0 2"
:: interesting for SandrahNPC

Call %EINSTI% ajantisbg2 "0 3 44" & rem adult version
rem Call %EINSTI% ajantisbg2 "0 44" & rem standard version
:: interesting for SandrahNPC

Call %EINST% Kido "0 1"
:: interesting for SandrahNPC

Call %EINST% Ariena "0 1"
:: interesting for SandrahNPC

Call %EINST% Kindrek "0"
:: interesting for SandrahNPC

findstr /I /M "CKhalid" %CON%>nul
if errorlevel 1 (
	Call %EINST% kitanya "0"
	%IFNS%wsr.exe Call %EINST% kitanya "1"
)
:: interesting for SandrahNPC

Call %EINST% Star "0"
:: interesting for SandrahNPC

Call %EINST% Valen "0"

Call %EINST% tsukibg2 "0 1"

Call %EINST% Yasraena "0"
:: significant for SandrahNPC

findstr /I /M "CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% alora "0"
)
:: interesting for SandrahNPC

Call %EINST% AurenAseph "0"
:: interesting for SandrahNPC

Call %EINST% Thael "0"

Call %EINSTI% Hanna "0 1 3 4 5 6"
:: interesting for SandrahNPC

Call %EINST% KimNPC "0 1"
:: interesting for SandrahNPC

Call %EINST% Lester "0"

findstr /I /M "CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Tiax "0"
)
:: interesting for SandrahNPC

Call %EINST% sarahtob "0"
:: interesting for SandrahNPC

Call %EINSTI% Hubelpot "0"

Call %EINST% Angelo "0"
:: interesting for SandrahNPC

Call %EINSTI% VampireTales "0 1 2 3"
:: interesting for SandrahNPC

Call %EINST% Nikita "0"
:: interesting for SandrahNPC

Call %EINST% touched "0 1"

Call %EINST% ninde "0"
 :: interesting for SandrahNPC

Call %EINSTI% xulaye "0 1 2"
:: interesting for SandrahNPC

Call %EINST% haldamir "0"
:: interesting for SandrahNPC

Call %EINST% AVIM "0"

findstr /I /M "CKIARA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Saerileth "0"
)
:: significant for SandrahNPC

findstr /I /M "CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Skie "0"
)
:: interesting for SandrahNPC

findstr /I /M "AOE_Kits Mortis CACBrePoFQ" %CON%>nul
if errorlevel 1 (
	Call %EINST% worgas "0"
	findstr /I /M "BDTOBV175.TP2~.*#.*#4./ VCv21.TP2~.*#.*#9./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% worgas "1"
	)
	findstr /I /M "ROT.TP2~.*#.*#0./ DRIZZTSAGA.TP2~.*#.*#0./ DKDRIZZT.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% worgas "2"
	)
)

Call %EINST% TyrisFlare "0"
:: interesting for SandrahNPC

Call %EINST% Varshoon "0 1"
:: interesting for SandrahNPC

Call %EINSTI% gavin_bg2 "0" "5"
Call %EINSTI% gavin_bg2 "1 2"
:: interesting for SandrahNPC

Call %EINST% darian "0 4"

Call %EINST% Yvette "0" "1"
Call %EINST% Yvette "1"

Call %EINST% arath "0"
:: interesting for SandrahNPC

Call %EINST% dace "0"
:: interesting for SandrahNPC

Call %EINST% Gahesh "0"

Call %EINST% Lena "1"

Call %EINST% aranw "0 320 540 900"

Call %EINST% isra_bg2 "0"
:: interesting for SandrahNPC

Call %EINST% TheUndying "0"
:: interesting for SandrahNPC

Call %EINST% Neh'taniel "0"

Call %EINST% Foundling "0" "1"

Call %EINST% Solaufein "0"
:: interesting for SandrahNPC

findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% rpgsolaflirtpack "0"
)

Call %EINST% c#solaufein "0 1"
:: interesting for SandrahNPC

Call %EINST% Sheena "0"
:: interesting for SandrahNPC

Call %EINST% Kelsey "0"
findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Kelsey "1"
)
findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Kelsey "4"
)
:: interesting for SandrahNPC

findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	call %EINST% GRoA "0"
)

findstr /I /M "CKeepYosh" %CON%>nul
if errorlevel 1 (
	Call %EINST% Keto "0"
	findstr /I /M "KELSEY.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% Keto "1"
	)
)
:: interesting for SandrahNPC

Call %EINST% Nathaniel "0 1 4 5"
:: interesting for SandrahNPC

Call %EINST% LuxleySoA "0 1"
findstr /I /M "LUXLEYSOA.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "NATHANIEL.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% LuxleySoA "2"
)
:: interesting for SandrahNPC

findstr /I /M "CSaerileth" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Kiara-Zaiya "0 1 2 3 4 5 6"
	findstr /I /M "BP.TP2~.*#.*#1250./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% Kiara-Zaiya "7"
	)
)
:: interesting for SandrahNPC

Call %EINSTI% iylos "0 1 6"
:: interesting for SandrahNPC

Call %EINST% evandra "0"

Call %EINST% calin "0" "5"
%.%
%.%
%.%11. BG2 NPC MODS WITH LESS CONTENT | %M%
%.%
%.%
findstr /I /M "multistronghold CNPCStrong" %CON%>nul
if errorlevel 1 (
	Call %EINST% cliffhistory "0"
)

Call %EINST% Chiara "0"

findstr /I /M "CRoTDrizzt ConSandrah" %CON%>nul
if errorlevel 1 (
	Call %EINST% DKDrizzt "0"
)

Call %EINST% Elvan-all "0 1"

Call %EINST% Goo "0"

Call %EINST% Horace "0 1"

Call %EINST% Kari "0"
:: interesting for SandrahNPC

Call %EINST% Malthis "0"

findstr /I /M "CFirewalker CTDDSharTeel CBG1NPCSoA ConSandrah" %CON%>nul
if errorlevel 1 (
	Call %EINST% sharteel "0 1"
)

Call %EINST% SBS "0 1"
:: interesting for SandrahNPC

Call %EINST% Vanim "0"

Call %EINST% BIDDE "0"

Call %EINST% Azure "0 1"

Call %EINST% frennedan "0"

findstr /I /M "CBranwen CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% POB "0"
)

findstr /I /M "CPerils CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% BranwenNPC "0"
)

Call %EINST% MawgulNPC "0"

Call %EINST% Uldar "0"

Call %EINST% rose "0"

Call %EINST% Larsha "0"

Call %EINST% Raziel "0"

findstr /I /M "CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Quayle "0"
)

Call %EINST% gloran "0"

Call %EINST% Auden "0"

Call %EINST% Coondred "0"

Call %EINST% saradas_magic_2 "0"

Call %EINST% AsharNPC "0"
%.%
%.%
%.%12. BG2 ONE-DAY NPCS | %M%
%.%
%.%
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

Call %EINST% FoxMonster "0"

Call %EINST% Vildra "0"

Call %EINST% Jandor "0"

findstr /I /M "CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Eldoth "0"
)

Call %EINST% Roar "0"

Call %EINST% Teddy "0"

Call %EINST% abSolestia "0"
%.%
%.%
%.%13. BG2 NPC-RELATED MODS | %M%
%.%
%.%
Call %EINST% Cws "0"

Call %EINST% JZ "0"

Call %EINSTI% ggib_tweaks "0 2 4 5 10"

findstr /I /M "CDArnise" %CON%>nul
if errorlevel 1 (
	Call %EINST% LuvNalia "0"
)

findstr /I /M "CLuvNalia" %CON%>nul
if errorlevel 1 (
	Call %EINST% deArnise "0"
)

Call %EINSTI% BanterPack "0 2 3"

findstr /I /M "BG1NPC.TP2~.*#.*#25./" %ELOG%>nul
if errorlevel 1 (
	Call %EINST% BanterPack "1"
)

findstr /I /M "CKhalid" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% iepbanters "0 1 2 3 4 5"
)

Call %EINST% viconia "0"

Call %EINST% mazzy "0"

findstr /I /M "CKeepYosh" %CON%>nul
if errorlevel 1 (
	Call %EINST% yoshimo "0"
)

findstr /I /M "CYoshFriend" %CON%>nul
if errorlevel 1 (
	findstr /I /M "BANTERPACK~.*#.*#2./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% 7C-Yoshi "0"
	)
)

findstr /I /M "CKeepYosh" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% YoshimoRomance "0" "1"
	Call %EINSTI% YoshimoRomance "1"

	Call %EINSTI% YoshimosRemorse "0 1"
)

Call %EINST% alcool "0"

Call %EINST% JanQuest "0"

Call %EINST% Korgan "0"

Call %EINST% KorganFriendship "0"

findstr /I /M "CKhalid CCoranBG2 CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% Coran "0 1"
)

findstr /I /M "CNoKkalid" %CON%>nul
if errorlevel 1 (
	Call %EINST% Khalid "0" "1"
	Call %EINST% Khalid "1 5"
)

findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "bg1npc.TP2~.*#.*#12./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% THEONEDRIZZT "0"
	)
)

Call %EINST% ValygarFriendship "0"

findstr /I /M "CSenkaKeldorn" %CON%>nul
if errorlevel 1 (
	Call %EINST% keldorn_rom "0 1 8"
)

findstr /I /M "SoAToBContentNPCOnly CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINST% yeslicknpc "0"
)

Call %EINST% sarevokfriendship "0"

Call %EINST% Branwen "0"

Call %EINSTI% NPCFlirt "0 2 4 6 8 10 12 14"
findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% NPCFlirt "1 3 5 7 9 11 13 15"
)

Call %EINSTI% RE "0 1 2 3 4 5 7 8 9 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 45 46 47 48 49 50 52 53 54"
:: interesting for SandrahNPC
findstr /I /M "CnoREBohdi" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% RE "6"
)
findstr /I /M "CCoranMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% RE "10"
)
findstr /I /M "CnoREValygar" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% RE "44 51"
)

findstr /I /M "CKhalid CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Xan "0 3 5"
)

findstr /I /M "XAN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	%IFE% Call %EINST% XanBG2Voice "0"
)

Call %EINST% Aeon "0"
findstr /I /M "AEON.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "XAN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Aeon "1"
)
findstr /I /M "AEON.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Aeon "2"
)
:: interesting for SandrahNPC

Call %EINST% sarevokromance "0"

findstr /I /M "CnoValygarRom" %CON%>nul
if errorlevel 1 (
	Call %EINST% CorthalaRomantique "0 1 2"
)

Call %EINST% haerdalisromance "0"

Call %EINST% haerdalis_friendship "0"

Call %EINST% cernd "0"

Call %EINST% MinscFriendship "0"

Call %EINST% nephele "0 1"
:: interesting for SandrahNPC

Call %EINST% Petsy "0 1"

Call %EINST% Fade "0"
:: interesting for SandrahNPC

Call %EINST% homewardbound "0 2"
%.%
%.%
%.%14. BG2 STORES AND ITEMS | %M%
%.%
%.%
Call %EINST% AM "0"

Call %EINST% BagBonus "0"

Call %EINST% RGenie "0"

Call %EINST% BoM "0"

Call %EINST% BG2SoA "1"

Call %EINST% Exnem "0 1 2"

Call %EINSTI% FR_ROV "0 1"

Call %EINST% HeartWood "0"

Call %EINST% BW_Herbs_BG2 "0"

%IFNS%item_rev.exe Call %EINST% ValHorn "0"

Call %EINST% KWolf "0"

Call %EINST% MunchMod "0"

Call %EINSTI% RItemPack "0 1 2 4 5 6 7 8"

Call %EINST% Rolles "0"
%IFNS%Item_Pack.exe Call %EINST% Rolles "1"

Call %EINST% rttitempack "0"

Call %EINST% Ruad "0 10"

Call %EINST% Tzshop01 "0"

Call %EINST% AbyStore "0"

Call %EINST% Underrep "0"

Call %EINSTI% ItemUpgrade "10 11"
%IFE% Call %EINSTI% ItemUpgrade "12"

Call %EINSTI% SPItemPack "2"

Call %EINST% cliffkey "1"

findstr /I /M "SPITEMPACK.TP2~.*#.*#3./" %ELOG%>nul
if errorlevel 1 (
	Call %EINST% BloodMort "0"
)

Call %EINSTI% Ebg2 "0 1 2 4 5 9 14 15 18"
%IFNS%d0questpack.exe Call %EINSTI% Ebg2 "3"
%IFNS%d0tweak.exe Call %EINSTI% Ebg2 "7"
findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% Ebg2 "8 10 11 12 16 17"
	findstr /I /M "CRylornNoKit" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Ebg2 "13"
	)
)

Call %EINST% foodmod "0"

Call %EINST% rupert "0"

Call %EINST% VolcanicArmoury "0"

Call %EINST% RotBArmorSet "0"

Call %EINST% StuffofTheMagi "0" "1 2"
:: Call %EINST% StuffofTheMagi "0" "2 1"
:: first line is standard version, second line is tactic version

%IFNS%ashesofembers%IFNIF%Kitanya%IFNIF%RPG-KP.exe Call %EINSTI% KonTwk "0"
Call %EINSTI% KonTwk "9"
Call %EINSTI% KonTwk "11 13 14 15"

Call %EINST% bolsa "0"

Call %EINST% Charli "0"

Call %EINST% DARRON "0"

Call %EINST% nanstein "0"

Call %EINST% Mhoram "0"

Call %EINST% Vendedor_DLAN "0 1"

Call %EINST% Recarga "0"

Call %EINST% Alchemy "0"

Call %EINST% MERSKSTORE "0"

Call %EINST% MYSTIGAN "0"

Call %EINST% LavaIt "0"

Call %EINST% OLDMODSPACK "0"

Call %EINST% RFWIP "0"

Call %EINST% HOUYI "0"

Call %EINST% YLITEMS "0 1"

Call %EINST% DragonSummon "0" "1"

Call %EINST% dsr "0"

	REM The following 7 items will be found in Waukeen's Promenade if also the Unique Containers component from the Tweaks Anthology gets instaled!
Call %EINST% BBBKBG "0"
Call %EINST% BBPBAG "0"
Call %EINST% BBQUIV "0"
Call %EINST% BBQUIVB "0"
Call %EINST% BBQUIVC "0"
Call %EINST% BBSCCS "0"
Call %EINST% BBSCARDR "0"

Call %EINST% musica "0"

Call %EINST% swordap "0"

Call %EINST% portablehole "0"

Call %EINST% renal "0"

Call %EINST% trovador "0"

Call %EINST% Haendlermod "0"

Call %EINSTI% iwditempack "0 1 2 3 4 5 6 7 8 9 10 11"

findstr /I /M "IWDITEMPACK.TP2~.*#.*#./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% iwditemfix "0"
)

Call %EINST% sigil-bd-mod "0"

Call %EINST% d2item "0"

Call %EINST% BG2eeAR "0"

Call %EINST% BG2eeW "0"

Call %EINSTI% mih_ip "101 102 109 115 119 120 121 122 123"
%IFNS%item_rev%IFNIF%spell_rev.exe Call %EINSTI% mih_ip "105"

Call %EINST% iiItemMod "1" "0"
%.%
%.%
%.%15. MISCELLANEOUS DEPENDEND MODS | %M%
%.%
%.%
Call %EINSTI% arestorationp "0 1 2 3 4 5 6 7 8 10 11 12 13"

Call %EINSTI% d0questpack "0 1 4 5 6 7 8 9 10 14 15 16 17 18 19 20 21"
findstr /I /M "7C-Yoshi.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% d0questpack "13"
)

findstr /I /M "CKeepYosh" %CON%>nul
if errorlevel 1 (
	Call %EINST% stivan "0"
)

Call %EINST% alternatives "0"

findstr /I /M "IMOEN_FOREVER.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "SAERILETH.TP2~.*#.*#0./ ALTERNATIVES.TP2" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Imoen_forever "9"
)

Call %EINSTI% ts25mini "0 1 2 3 4 5"

Call %EINST% Chloe "0"
:: significant for SandrahNPC

Call %EINSTI% Yikari "0 3 4 5"

Call %EINST% TheBeaurinLegacy "1000"

Call %EINSTI% RevisedBattles "0 1 2 3 4 5 6 7 8"
findstr /I /M "FIRKRAAG.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M "BuTcHeR" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% RevisedBattles "9"
	)
)
findstr /I /M "VCv21.TP2~.*#.*#11./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% RevisedBattles "10"
)
Call %EINSTI% RevisedBattles "11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27"
findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		findstr /D:override /C:"B#BLADE" kit.ids> B#BLADEtemp.txt
		more +1 B#BLADEtemp.txt> B#BLADEstring.txt
		del B#BLADEtemp.txt
	)
)

Call %EINSTI% Grimuars "0 1"
findstr /I /M "REVISEDBATTLES.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% Grimuars "2"
)
Call %EINSTI% Grimuars "3 4"

Call %EINST% Celestials "0"

Call %EINSTI% tobr "0 1 2 3 4 5 6 7 8 9 10 11 12 13"

findstr /I /M "ACBRE.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% ACBre "2"
)

findstr /I /M "CNoRylorn" %CON%>nul
if errorlevel 1 (
	Call %EINST% Rylorn "0"
)

%IFS%Rjali.exe (
	Call %EINSTI% cdtweaks "3183" "1 2 1 1 2 1"
) else (
	findstr /I /M "SAERILETH.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% cdtweaks "3183" "1 2 2 2 1"
	) else (
		Call %EINSTI% cdtweaks "3183" "1 2 1 1 2 1"
	)
)

if %PREVIEW%==0 (
	%IFS%Rjali.exe %IFN% ".\override\ibrac21.bam" copy ".\%BWFP%\_override\missing\ibrac21.bam" ".\override" | %M%
)
Call %EINST% Rjali "3"
findstr /I /M "RJALI.TP2~.*#.*#3./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Rjali "4"
)

findstr /I /M "CKhalid CBG1NPCSoA" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Kivan "100 200"
)
:: significant for SandrahNPC

Call %EINST% adrian "0 10 20 30"

findstr /I /M "ConSandrah" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% BG1NPCSoA "0 2 4 6 8 10 11 20 25 30 40 45 50 55 60 65 70 75 87"
)

Call %EINSTI% SmilingImpCrossBanterMod "0 1 2 3 4 5 6 7 9 10 11 12 14"

Call %EINSTI% Faren "0 2"
Call ".\%BWIPI%\Faren.bat

Call %EINSTI% CrossmodBG2 "0 1 2"

Call %EINSTI% HerThiMoney "0 10 20 30 40"
%.%
%.%
%.%16. BG2 RULES, TWEAKS AND SPELLS | %M%
%.%
%.%
call %EINSTI% klatu "1010 1020 1030 1050 1080 1090 2000 2010 2020 2030 2040 2050 2060 2070 2080 2090 2100 2110 2120 2130 2160 2170 2180 2190 3070"
%IFNS%fullplate.exe Call %EINSTI% klatu "2140 2150"

Call %EINST% UCFOW "0"

Call %EINSTI% npckit "30 31 400 900 2100 2200 2300 2500 2510 2800"

Call %EINST% npc_tweak "0 2"
%IFNS%phord_druidkits.exe Call %EINST% npc_tweak "1"

Call %EINSTI% hiddenadventure "0 1 2 3 4 5 6 8 9 10"
findstr /I /M "CNPCStrong" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% hiddenadventure "7"
)

Call %EINST% ghost "0"

Call %EINST% FamiliarPack "0"

Call %EINSTI% Vic "0 1 2 3 4 5 6 7 9"

Call %EINST% fadingpromises "0"

findstr /I /M "DRIZZTSAGA.TP2~.*#.*#3./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% DrizztIsNotStupid "0"
)

findstr /I /M "SandrahNPC_req" %CON%>nul
if errorlevel 1 (
	findstr /I /M "3D.Acceleration=1" baldur.ini
	if not errorlevel 1 (
		Call %EINST% nogameover "100"
	)
)

Call %EINST% DungeonBeGone "0"

%IFNS%NeJ3v71%IFNIF%DungeonBeGone%.exe Call %EINST% SkipChateauIrenicus "0"

%IFNS%stratagems%IFNIF%BG1NPC.exe Call %EINST% parting "0 2"

findstr /I /M "CnoPCVamp" %CON%>nul
if errorlevel 1 (
	Call %EINST% pcvamp "0"
)
if %PREVIEW%==0 (
	%.%Don't worry about the "WARNING: cannot find block matching [pcvamp/BCS/priest.bcs]"; the code block to be replaced is not existing in these files. | %M%
)
Call %EINST% Drows "0"

findstr /I /M "Raziel_Worgas" %CON%>nul
if errorlevel 1 (
	findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% Mortis "0"
	)
)
:: not together with Worgas or Raziel (and maybe some other mods) because it causes the game to crash

findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINST% 7C#SARTWEAK "100 251"
)
%.%
%.%
%.%17. KITS | %M%
%.%
%.%
:: misc kits
Call %EINSTI% kitrtt "0 2 3 4 5 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 27 28 29 30"
findstr /I /M "RoT.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% kitrtt "1"
)
findstr /I /M "CRylornNoKit" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% kitrtt "6 7"
)
findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% kitrtt "26"
)
	
Call %EINSTI% PPK "0 1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17"
findstr /I /M "CRylornNoKit" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% PPK "2"
)

Call %EINSTI% Crusade "0 1 2 3"

Call %EINSTI% LOHMod "0 1 2 3 4 5 6"

Call %EINSTI% IK "0 1 2 3 4 5 6 7"

findstr /I /M "CnoHidekit" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% HideKt "0 2 3 4 5 6 7 8 9 10 11 12 13"
)
Call %EINSTI% HideKt "1"

Call %EINSTI% Kitpack6 "1 2 3 5 7 8"
findstr /I /M "CMaGnoKit6 CWeaProMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Kitpack6 "4"
)

Call %EINSTI% Vagrant "0 1 2 3"

:: bard and thief kits
Call %EINST% Conductor "0 1"
Call %EINSTI% HarpScout "0 1 2"
Call %EINSTI% Pirate "0 2 6"
Call %EINST% lyric "0"
Call %EINST% ChanterKit "0"
Call %EINST% rogue-switch "0"

:: ranger and paladin kits
Call %EINST% A4Auror "0"
%IFS%infinityanimations%IFIF%Bear_Animations_D2.exe Call %EINST% BearWalker "1" "0"
Call %EINST% AvengerKit "0 1 2 3"
Call %EINST% fr_ombre "0"
Call %EINST% Storm "0"
Call %EINST% zulu "0"

:: druid and cleric kits
Call %EINST% SilverFur "0"
Call %EINST% PBhaal "0"
Call %EINST% HeartwarderKit "0"
Call %EINSTI% DruidicSorcererKit "0 1"
Call %EINSTI% druidsor "0"
Call %EINST% ScionMod "0"

:: fighter kits
Call %EINST% elven_pack "0"
Call %EINST% morituri "0"
Call %EINST% RetaliatorKit "0"
Call %EINST% werewarrior "0 1"
Call %EINST% Px_Chantelame "0"
findstr /I /M "CRylornNoKit" %CON%>nul
if errorlevel 1 (
	Call %EINST% x0black "0"
)
Call %EINST% WarslingSniperKit "0"
Call %EINST% JKits "0 1"
findstr /I /M "KITRTT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% JKITS "2"
)
findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINST% run "0"
)
findstr /I /M "CRefinement" %CON%>nul
if errorlevel 1 (
	Call %EINST% ArcaneArcher "0"
)
Call %EINST% A7-CustomKits "1"
Call %EINST% Armiger "0"
findstr /I /M "KITRTT.TP2~.*#.*#4./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% SamuraiKit "0"
)
Call %EINST% Tempest "0"
Call %EINST% acidelem_beta1 "0"
Call %EINST% d2ama "0"
Call %EINST% d2asn "0 1"
Call %EINST% d2bar "0"
Call %EINST% d2nec "0"
Call %EINST% d2pal "0"
Call %EINST% Jedi_Sith "0"

findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "0 5 6 7 8 13 16 17 18 19 20 21 22 25 26 27"
	findstr /I /M "CRylornNoKit" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% MegaModKits "10 14 15"
	)
)
findstr /I /M "ROT.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M "CRylornNoKit" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% MegaModKits "11"
	)
)
findstr /I /M "VCV21.TP2~.*#.*#30./ CTB.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "1"
)
findstr /I /M "VCV21.TP2~.*#.*#11./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "3"
)
findstr /I /M "VCV21.TP2~.*#.*#14./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "6"
)
findstr /I /M "NEJ3V71.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "2 4 12"
)
findstr /I /M "VAGRANT.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% MegaModKits "9"
)
Call %EINSTI% MegaModKits "23 24 28 29"

Call %EINSTI% RPG-KP "0 2 7 9 10 11 13"
findstr /I /M "CAL.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% RPG-KP "4 6"
	findstr /I /M "DRUIDICSORCERERKIT.TP2~.*#.*#0./ DRUIDSOR.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% RPG-KP "3"
	)
)

Call %EINSTI% spstuff "0 1 2 3 4 6"
%IFNS%refinements.exe Call %EINSTI% spstuff "5"

rem not DR sphere related
Call %EINSTI% PofKits "1 2 10 11 13 14 15"
rem DR sphere related
Call %EINSTI% PofKits "4 5 6 7 8 9 16 17 18"
findstr /I /M "RoT.TP2~.*#.*#1./ EBG2.TP2~.*#.*#9./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% PofKits "3"
)
findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% PofKits "12"
)

Call %EINSTI% Derats_kits "0 1 2 3 4 5 6 9 10 11"
findstr /I /M "CWeaProMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Derats_kits "8"
)
%.%
%.%
%.%18. TWEAKS AND HLA-TABLES CHANGING MODS | %M%
%.%
%.%
Call %EINSTI% ashesofembers "5 6 7 8 9 10 11"
findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "btweak_Restr CnoAoEWeap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% ashesofembers "14 15"
	) else (
		%IFS%ashesofembers%IFIF%item_rev.exe %TXT% | findstr @387 | Call %C%>> %E%
		%IFS%ashesofembers%IFIF%btweak.exe %TXT% | findstr @418 | Call %C%>> %E%
		%IFS%ashesofembers%IFIF%btweak_light.exe %TXT% | findstr @418 | Call %C%>> %E%
	)
)

:: install monks before
Call %EINSTI% Oversight "2 3 6 7 8"
findstr /I /M "multistronghold" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Oversight "5"
)
findstr /I /M "DW_LANTHORN.TP2~.*#.*#10./ DW_LANTHORN.TP2~.*#.*#20./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% Oversight "10"
)

Call %EINST% AnimalCompanions "0" "TYPE AnimalCompanions_input.txt"

:: install thieves and bards before
findstr /I /M "CnoSaSWeap" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% song_and_silence "0"
)
Call %EINSTI% song_and_silence "1 2 3 4 5 6 7 8 9 10"

:: install fighters and monks before
Call %EINSTI% sword_and_fist "1 30 31 32 34"
findstr /I /M "CRylornNoKit" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% sword_and_fist "33"
)

:: install druids, clerics, paladin and rangers before
findstr /I /M "SpellRevStrict" %CON%>nul
if errorlevel 1 (
	rem component 0 exists only in v7.1, component 10 or 11 exist only in v8
	findstr /I /M "NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Divine_Remix "0"
	)
	Call %EINSTI% Divine_Remix "11 100 103 107 109 112 115 118 121 124 127 130 200 203 403 406 409 412 415 600"
	%IFNS%ViconiaRevamped.exe Call %EINSTI% Divine_Remix "106"
)

%IFS%divine_remix.exe (
	findstr /I /M "VERSION.*~8" .\divine_remix\setup-divine_remix.tp2>nul
	if not errorlevel 1 (
		Call %EINST% DR8_hotfix "0"
	)
)

if %PREVIEW%==0 (
	%IFS%PoFQuestPack.exe %IF% ".\override\PF0152.ARE" move ".\override\PF0152.ARE" ".\BWP_workspace\override" | %M%
	%IF% .\override\GNT2014.bcs copy .\override\GNT2014.bcs .\override\GNT2013.bcs
)
Call %EINSTI% d0tweak "19"

findstr /I /M "CSOBWPO" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% RR "0"
)
findstr /I /M "CWeaProMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% RR "1 4"
)
Call %EINSTI% RR "2 3 5 6 7 8 9 11 12 999"

findstr /I /M "btweak_Restr" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% ashesofembers "0"
)
Call %EINSTI% ashesofembers "2"
findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% ashesofembers "3"
)
%IFNS%wsr.exe Call %EINSTI% ashesofembers "4"
Call %EINSTI% ashesofembers "12 18 19 20 21"
if %PREVIEW%==0 (
	%IF% ".\AshesofEmbers\Backup\12\slmage1.cre" copy /Y ".\AshesofEmbers\Backup\12\slmage1.cre" ".\override" | %M% 
)
%IFNS%btweak%IFNIF%btweak_lite.exe Call %EINSTI% ashesofembers "16 17"

Call %EINSTI% Tactics "26"
findstr /I /M "CRylornNoKit" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Tactics "27"
)

%IFNS%btweak.exe (
	Call %EINSTI% btweak_lite "0 1 2"
	findstr /I /M "AoE_Restr" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% btweak_lite "3"
	) else (
		%IFS%btweak_lite.exe %TXT% | findstr @418 | Call %C%>> %E%
	)
	Call %EINSTI% btweak_lite "4 5 6"
)

Call %EINSTI% btweak "0 1 2"
findstr /I /M "AoE_Restr" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% btweak "22"
) else (
	%IFS%btweak.exe %TXT% | findstr @418 | Call %C%>> %E%
)
Call %EINSTI% btweak "23 24 25"
%IFS%btweak%IFIF%btweak_lite.exe %TXT% | findstr @133 | Call %C%>> %E%

findstr /I /M "RR.TP2~.*#.*#4./" %ELOG%>nul && findstr /I /M "RR.TP2~.*#.*#5./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% BardSong_BG2_IWD "0"
)

findstr /I /M "ASHESOFEMBERS.TP2~.*#.*#4./ KONTWK.TP2~.*#.*#0./ KITANYA.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% WSR "100 200 302 999"
) else (
	%IFS%WSR.exe %TXT% | findstr @386 | Call %C%>> %E%
)

Call %EINST% celestiales "0 1 2"

Call %EINSTI% 1pp "101"
%MAC% Call %EINSTI% 1pp "102"
%NMAC% Call %EINSTI% 1pp "103"
Call %EINSTI% 1pp "106"
%NMAC% Call %EINSTI% 1pp "111"
findstr /I /M "PP1GUI" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% 1pp "104"
)
findstr /I /M "3D.Acceleration=1" baldur.ini
if not errorlevel 1 (
	Call %EINSTI% 1pp "114"
)
Call %EINSTI% 1pp "105 200 201 202 400 401"

call %EINSTI% item_rev "0"

findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% 1pp "203 204 205 206 207 208"
)
Call %EINSTI% 1pp "210 300 301"

Call %EINSTI% VCv21 "20"

%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "8"

Call %EINST% W_3kradziej "0 1"

findstr /I /M "NEJHalruaa" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% spell_rev "0"
)

findstr /I /M "SpellRevStrict NEJHalruaa" %CON%>nul
if errorlevel 1 (
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

findstr /I /M "ImprSummons SpellRev NEJHalruaa" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Spell50 "0 1 2"
)

findstr /I /M "SpellPack" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% WildMage "0 1 3 4"
)

Call %EINST% semi_multi_clerics "0"

Call %EINST% fairydragon "0"

Call %EINST% WTPFamiliars "0"


findstr /I /M "SandrahNPC_req" %CON%>nul
if errorlevel 1 (
	call %EINSTI% Teleport "0 1"
)

Call %EINSTI% infinityanimations "0"

findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% iwdification "40"
)
Call %EINSTI% iwdification "30 60"
%IFNS%BardSong_BG2_IWD.exe Call %EINSTI% iwdification "50"

Call %EINST% phord_druidkits "0"

Call %EINSTI% Z#Misc "1 17 18 19"

Call %EINSTI% Derats_kits "7"

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1c
)

findstr /I /M "SANDRAHRTF.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call ".\%BWIPI%\BGTTweak.bat"
)
%IFS%BP-Balancer.exe Call %EINSTI% BGTTweak "1900"

:SKIPBG1c

findstr /I /M "CNoNPCStrong" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% NPC_Strongholds "0"
)

Call %EINST% c#brandock "0"

Call %EINST% c#husam "0"

%IFI% Call %EINSTI% Turambar_fixes_tweaks "10"
Call %EINSTI% Turambar_fixes_tweaks "11 12 13 14 15 16 17 18 1055 1060 2000 2003 2004 2005 2007 2010 2020 2023"
findstr /I /M "DIVINE_REMIX.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M "DRSPHERE" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Turambar_fixes_tweaks "4010 4020"
	)
)

Call %EINSTI% ViconiaRevamped "0 60 70"
%.%
%.%
%.%19. MAJOR TWEAKS | %M%
%.%
%.%
Call %EINSTI% infinityanimations "25 50 100 150 210 260 400 410 450 490 500 550 600 650 710 7000 9000"

findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "ANGELO.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% ianinja "0"
	)

	Call %EINST% mwyvmtan "10 20"

	Call %EINST% Bear_Animations_D2 "0"
)

findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "BG1UB.TP2~.*#.*#19./" %ELOG%>nul && findstr /I /M "BG1UB.TP2~.*#.*#21./" %ELOG%>nul && findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#400./" %ELOG%>nul && findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#600./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37"
	)
)
Call %EINST% JA#BGT_AdvPack "38"
findstr /I /M "bg1npc.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "39"
	)
)

Call %EINST% tidings "0"

%IF% .\mih_eq\ssl\ssl.exe goto :miheqssl
:: This mod's components are not named consistently.
if %PREVIEW%==0 (
	%IFS%mih_eq.exe copy /Y ".\mih_eq\shared\new_monsters\scripts\mh#huecu.ssl" ".\mih_eq\shared\new_monsters\scripts\mh#huecu.baf" | %M%	
)

findstr /I /M "Erevain" %CON%>nul
if errorlevel 1 (
	Call %EINST% mih_eq "3"
)
rem the conflict with Erevain only exists with mih_eq v3
Call %EINST% mih_eq "0 1 2 4 5 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27"
goto :skpmiheq

:miheqssl
Call %EINST% mih_eq "101 103 104 105 106 107 111 114 118 143 156 159"
%IFNS%polytweak.exe Call %EINST% mih_eq "108"
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\mih_eq\ssl\ssl.exe goto :skpmiheq
)

Call %EINST% mih_eq "109 112 113 115 116 117 119 128 130 131 132 133 134 135 136 137 138 139 141 142 148 149 150 154 155 157"
:skpmiheq

findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% vecna "0"
)

Call %EINSTI% aurora "0 10"

Call ".\%BWIPI%\define_BIG.bat"

:: Call %EINSTI% aurora "40 60"
:: Does not work correctly; no mousepointer finger

findstr "0 1" count2.txt
if not errorlevel 1 (
	Call %EINSTI% aurora "115 170 215 247 420 470 500"
)
findstr "2 3 4 5 6 7" count2.txt
if not errorlevel 1 (
	Call %EINSTI% aurora "105 180 210 247 420 467 500"
)

Call %EINSTI% aurora "520"

%IFNS%infinityanimations.exe Call %EINSTI% aurora "9000"

findstr /I /M "AURORA.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% tobaurora "0"
)

Call %EINST% Haiass "0 10"

Call %EINSTI% TB#KITS "0"
findstr /I /M "HAIASS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% TB#KITS "1"
)

%IFN% .\DSotSC\modify\dlg\BLANE.d GOTO :SKIPSAND
findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DSOTSC.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "NTOTSC.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul && findstr /I /M "TGC1E.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#10./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#5../" %ELOG%>nul && findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "CTB.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DSOTSC.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "NTOTSC.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul && findstr /I /M "TGC1E.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#10./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#5../" %ELOG%>nul && findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "CTB.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
		if not errorlevel 1 (
			if %PREVIEW%==0 (
				%IFS%Solaufein.exe copy /Y ".\%BWFP%\_override\worldmap\*.*" ".\override" | %M%
				echo 118 TRUE_SIGHT>> override/stats.ids
				echo 119 CLERIC_CHAOTIC_COMMANDS>> override/stats.ids
				echo 120 CLERIC_INSECT_PLAGUE>> override/stats.ids
				echo 121 CLERIC_BLADE_BARRIER>> override/stats.ids
				echo 124 CLERIC_REGENERATION>> override/stats.ids
				echo 125 WIZARD_FIRE_SHIELD>> override/stats.ids
				echo 129 WIZARD_SPELL_TURNING>> override/stats.ids
				echo 131 CLERIC_FREE_ACTION>> override/stats.ids
				echo 162 WIZARD_SPELL_TURNING>> override/stats.ids
				echo 164 WIZARD_SPELL_TRAP>> override/stats.ids
				echo 177 WIZARD_SPELL_SHIELD>> override/stats.ids
				echo 178 WIZARD_RESIST_FEAR>> override/stats.ids
				echo 180 WIZARD_GREATER_MALISON>> override/stats.ids
				echo 3201 INNATE_NEUTRALIZE_POISON>> override/spell.ids
				echo 4732 HELM_TRUE_SIGHT>> override/spell.ids
				echo 201 NEEDS_BREACH>> override/Specific.IDS
				echo 3600 SHROM_TIMER>> override/gtimes.ids
				%IF% ".\override\DOGHMA.dlg" move ".\override\DOGHMA.dlg" ".\BWP_workspace\override" | %M%
			)
			Call %EINST% SandrahNPC "0" "1"
			if %PREVIEW%==0 (
				%IFS%Solaufein.exe %IF% ".\BWP_workspace\override\DOGHMA.dlg" move ".\BWP_workspace\override\DOGHMA.dlg" ".\override" | %M%
			)
		)
	)
)

findstr /I /M "SANDRAHNPC.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% SandrahRTF "0"
)

findstr /I /M "SANDRAHRTF.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% SandrahTOT "0"
)
:SKIPSAND

Call %EINST% G3Anniversary "0"

Call %EINST% c#greythedog "0"

Call %EINST% DjinniCompanion "0"
findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% DjinniCompanion "900"

	Call %EINST% w_packmule "0" "1"
)

Call %EINST% The_Old_Gold "100"

findstr /I /M "CELESTIALES.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% spell_rev "10"
)
findstr /I /M "NEJHalruaa" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% spell_rev "20 30 50 55"
)
findstr /I /M "DIVINE_REMIX.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M "DRSPHERE" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% spell_rev "60"
	)
)

Call %EINSTI% Item_Pack "0 1 2 3 4 5 6 7 8 9"

Call %EINST% trap_rev "0"

Call %EINSTI% cursed_items "0 10"

Call %EINSTI% item_rev "3"
findstr /I /M "Fullplate" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% item_rev "9"
)
Call %EINSTI% item_rev "10 11 12 13"
findstr /I /M "CWeaProMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% item_rev "1093"
)
Call %EINSTI% item_rev "15 17 18"

Call %EINST% freeact "10"
findstr /I /M "ITEM_REV.TP2~.*#.*#0./ SPELL_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINST% freeact "50"
)

if %PREVIEW%==0 (
	echo 1413 CLERIC_NEGATIVE_PLANE_PROTECTION>> override/spell.ids
)

findstr /I /M "ITEMREVS" %CON%>nul
if errorlevel 1 (
	Call %EINST% fullplate "1 102 204"
)

Call %EINST% HardTimes "0 1"

Call %EINSTI% NSCPortraits "0 1 10 20 21 30 50 300 305 310 1000 1001 1030 1031 1050 1051 1300 1310 1320 1330 1340 1350 1360 1370 1380 1390 1400 1410 1420 1430 1440 1450 1470 1480 1490 1500 1510 1520 1530 1540 1550 1580 1590 1600 1780 2000 2010 3000 3010 5000 5010"

Call %EINSTI% tb#tweaks "3550"

Call %EINST% BGII-Subrace "0 1"

findstr /I /M "C#SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% c#solaufein "2 4"
)

Call %EINSTI% might_and_guile "50 125 130 151 155 165 230"
findstr /I /M "CWeaProMod" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% might_and_guile "245"
	findstr /I /M "CMaGwithKit6" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% might_and_guile "205"
	)
	Call %EINSTI% might_and_guile "235 260 290"
)
Call %EINSTI% might_and_guile "450 470 480 490"

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1d
)
%IFG% Call %EINST% JA#BGT_Tweak "0"
Call %EINSTI% JA#BGT_Tweak "6 9 10 11 12 13"
)
findstr /I /M "NPC_TWEAK.TP2~.*#.*#1./ PHORD_DRUIDKITS.TP2~.*#.*#1./ " %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "14"
)
Call %EINSTI% JA#BGT_Tweak "20 21 22 24 25 26 27 28 29 31 32"
%IFG% Call %EINSTI% JA#BGT_Tweak "23"
:SKIPBG1d

:: correction of mismatching "Face" arguments caused by various mods
Call %EINST% face_directions "0"

Call %EINST% ua "0 1 2 3"

Call %EINSTI% randomiser "510" "10"
Call %EINSTI% randomiser "1300" "Y"
Call %EINSTI% randomiser "5005 5015 5025 5035 5045 5055 5065 5075 5085 9000 10200 10210 10300"

Call %EINST% 7c#addlevel "0" "2"
Call %EINST% 7c#addlevel "1" "2"
Call %EINST% 7c#addlevel "2" "2 2"
Call %EINST% 7c#addlevel "3" "2 2"
Call %EINST% 7c#addlevel "4" "2 2"
Call %EINST% 7c#addlevel "5" "2 2 2"
Call %EINST% 7c#addlevel "6" "2 2 2"
Call %EINST% 7c#addlevel "7" "2 2"
Call %EINST% 7c#addlevel "8" "2 2"
Call %EINST% 7c#addlevel "9" "2 2"
Call %EINST% 7c#addlevel "10" "2"
Call %EINST% 7c#addlevel "11" "2"
Call %EINST% 7c#addlevel "12" "2"
Call %EINST% 7c#addlevel "13" "2"
Call %EINST% 7c#addlevel "14" "2"
Call %EINST% 7c#addlevel "15" "2"
Call %EINST% 7c#addlevel "16" "2 2"
Call %EINST% 7c#addlevel "17" "2 2"
Call %EINST% 7c#addlevel "18" "2"

%MAC% Call %EINSTI% cdtweaks "50 120"
Call %EINSTI% cdtweaks "60 70 110 130 140 201 1010 1020 1040 1090 1120 1125"
findstr /I /M "ZVA.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% cdtweaks "1075"
)
findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "BGTTweak.TP2~.*#.*#2800./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1130"
	)
)
%IFNS%refinements.exe Call %EINSTI% cdtweaks "1150"
findstr /I /M "NPC_STRONGHOLDS.TP2~.*#.*#0./ CLIFFHISTORY.TP2~.*#.*#0./ OVERSIGHT.TP2~.*#.*#5./  MULTISTRONGHOLD.TP2~.*#.*#./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% cdtweaks "1161"
)
findstr /I /M "FR_ROV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% cdtweaks "1170"
)
findstr /I /M "EDWINROMANCE.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% cdtweaks "1180"
)
Call %EINSTI% cdtweaks "1220 1230 1270"
findstr /I /M "CNPCStrong" %CON%>nul
if errorlevel 1 (
	findstr /I /M "CliffHistory" %CON%>nul
	if errorlevel 1 (
		Call %EINST% cdtweaks "1340"
	)
	Call %EINST% cdtweaks "1341 1342 1343 1344 1345 1346 1347"
)
Call %EINSTI% cdtweaks "2040 2090 2192"
findstr /I /M "CnoCDTWeap" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% cdtweaks "2160"
)
%IFNS%refinements.exe Call %EINSTI% cdtweaks "2200"
findstr /I /M "CSOBWPO" %CON%>nul
if errorlevel 1 (
	findstr /I /M "TDD.TP2~.*#.*#0./ BP.TP2~.*#.*#50./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "2210"
	)
	REM components 2240, 2250, 2260, 2270, 2280, 2290 will be skipped, if one of the conflicting mods is installed
	Call %EINSTI% cdtweaks "2240 2250"
)
Call %EINSTI% cdtweaks "2260 2270 2280 2290 2300 2320 2330 2340 2500 2530 3008 3050 3060 3115 3125 3230"
%IFNS%virtue.exe Call %EINSTI% cdtweaks "3121"
:: The components 3031 "100% spell learn" and 3190 "Rest Anywhere" can be considerd as a cheat an thus are skipped.
:: Call %EINSTI% cdtweaks "3031 3190"
Call %EINSTI% cdtweaks "3010 3220 3330 4000 4010 4025 4031 4041 4050 4061 4071 4100 4110 4150 4170"
%IFNS%level1npcs.exe Call %EINSTI% cdtweaks "4020"

findstr /I /M "SPELL_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% d0tweak "0"
)
Call %EINSTI% d0tweak "4 5 6"
findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% d0tweak "11"
)
findstr /I /M "ITEM_REV.TP2~.*#.*#18./ ITEM_REV.TP2~.*#.*#19./ ITEM_REV.TP2~.*#.*#20./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% d0tweak "18"
)

findstr /I /M "CImoen4Ever" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% ImoenIsStone "0"
)

Call %EINSTI% RezMod "0 1 2 3 100 101 102 103 104 105 106 107 108"
findstr /I /M "RECARGA.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "4"
)
findstr /I /M "TOBEX.TP2~.*#.*#118./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "109"
)

:: change temporary the language numbers
%IF% BWIP_English call "%BWIPFIX%"\NMTP_language"
Call %EINST% NMTP "0 2"
findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% NMTP "3 4 5"

	Call %EINST% NML "0"
)

if %PREVIEW%==0 (
	%IFS%w_psionics_unleashed.exe Call ".\%BWIPFIX%\edit_string_w_psionics.bat"
)
Call %EINST% w_psionics_unleashed "10 61"

Call %EINSTI% hammers "0 15 25 35 50"

findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		type B#BLADEstring.txt>> ./override/kit.ids
		echo 1408 CLERIC_PROTECTION_FROM_EVIL_10_FOOT>> override/spell.ids
	)
)

Call %EINSTI% refinements "11 101 102 103 104 105 106 107 108"
findstr /I /M "RR.TP2~.*#.*#5./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% refinements "109"
)
findstr /I /M "RR.TP2~.*#.*#2./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% refinements "110"
)
Call %EINSTI% refinements "30 40"

findstr /I /M "CMaGnoKit6 CnoKP6Weap" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Kitpack6 "0 6"
)

findstr /I /M "CnoVicWeap" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Vic "8"
)

Call %EINSTI% aTweaks "324"

:: correct temporary the language numbers
findstr /C:" - last updated version 3" stratagems\setup-stratagems.tp2>nul
if errorlevel 1 goto :skpscsla
findstr /C:"Spanish translation commented out" stratagems\setup-stratagems.tp2>nul
if not errorlevel 1 call "%BWIPFIX%"\scs_language.bat
:skpscsla

Call %EINSTI% stratagems "1000"
:: SCSv32 only
Call %EINSTI% stratagems "1901"
findstr /I /M "NEJHalruaa" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "1910 2000 2010 2020 2030 2041 2060 2070 2080 2090 2100 2110 2120 2130 2140 2150 2170 2180 3030"
	rem components 2000 2020 2030 2040 2041 2060 2070 2080 2090 2100 2140 2150 2160 will be skipped automatically if "Spell Revisions" is installed
	findstr /I /M "ITEM_REV.TP2~.*#.*#1030./" %ELOG%>nul
	if errorlevel 1 (
		rem call %EINSTI% stratagems "2160"
	)
)
:: all components above are SCSv31 only
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsss1
)
Call %EINSTI% stratagems "2900"
:: SCSv32 only
:skscsss1	
findstr /I /M "CSOBIWO" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "3010 3022"
)
:: both versions
Call %EINSTI% stratagems "3041 3060 3070 3080 3090 3110"
:: components 3050 3060 3070 3080 3090 3100 3110 will be skipped automatically if "Spell Revisions" is installed
:: all components above are SCSv31 only except component 3041
Call %EINSTI% stratagems "3501 3541 3551"
:: SCSv32 only
Call %EINSTI% stratagems "4000 4010 4020"
:: component 4010 only exist in SCSv31
%IFNS%level1npcs.exe call %EINSTI% stratagems "4099"
REM SCSv32 only
Call %EINSTI% stratagems "4051 4146 4162 4172 4180 4200 4210 4217 4230 4240 4240"
:: components 4180 4200 5020 and 5030 only exist in SCSv31
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsss2
)
Call %EINSTI% stratagems "5000"
REM component 5000 exists in both versions
:skscsss2
Call %EINSTI% stratagems "5020 5030 5070"
REM components 5020 and 5030 are SCSv31 only, 5070 is SCSv32 only
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsssl
)

:: SCS AI
Call %EINSTI% stratagems "5900"
findstr /I /M "BP_AI" %CON%>nul
if errorlevel 1 (
	findstr /I /M "skip_SCS_6000" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6000"
	)
	findstr /I /M "replace_SCS_6000" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6010"
	)
)
rem call these components above separately to avoid "out of memory"
findstr /I /M "BP_AI" %CON%>nul
if errorlevel 1 (
	findstr /I /M "Tactics.TP2~.*#.*#10./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6021"
		REM components 6020 - 6024 exist only in SCSv31
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "6030 6040"
		REM SCSv32
		) else (
			Call %EINSTI% stratagems "6034 6044"
			REM SCSv31 only
		)
	)
)
%IF% stratagems/iwdspells (
	Call %EINSTI% stratagems "6100"
	REM SCSv32	
) else (
	Call %EINSTI% stratagems "6101"
	REM SCSv31 only
)
Call %EINSTI% stratagems "6200 6310 6320"
findstr /I /M "TACTICS.TP2~.*#.*#20./ VCV21.TP2~.*#.*#21./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "6300"
)
findstr /I /M "BP_AI" %CON%>nul
if errorlevel 1 (
	findstr /I /M "Tactics.TP2~.*#.*#20./" %ELOG%>nul
		if errorlevel 1 (
		Call %EINSTI% stratagems "6500"
	)
	findstr /I /M "Tactics.TP2~.*#.*#12./ BP.TP2~.*#.*#2200./" %ELOG%>nul
	if errorlevel 1 (
		findstr /I /M "STRATAGEMS.TP2~.*#.*#603../ STRATAGEMS.TP2~.*#.*#604../" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6510"
		)
	)
	Call %EINSTI% stratagems "6520"
	findstr /I /M "replace_SCS_6000" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6531"
	)
	findstr /I /M "Tactics.TP2~.*#.*#22./" %ELOG%>nul
	if errorlevel 1 (
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "6540"
		) else (
			Call %EINSTI% stratagems "6541"
		)
	)
	findstr /I /M "Tactics.TP2~.*#.*#23./" %ELOG%>nul
	if errorlevel 1 (
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "6550"
		) else (
			Call %EINSTI% stratagems "6551"
		)
	)
	findstr /I /M "Tactics.TP2~.*#.*#21./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6560"
	)
	Call %EINSTI% stratagems "6570"
)
findstr /I /M "DEVIN.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "6580"
)
Call %EINSTI% stratagems "6590"
findstr /I /M "ASCENSION.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "6800 6810 6820 6830 6850" & rem Ascension components
)
findstr /I /M "STRATAGEMS.TP2~.*#.*#603../" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "6840"
)
findstr /I /M "BP_AI" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "7090 7130"
)
Call %EINSTI% stratagems "7000 7010 7020 7030 7040 7050 7060 7070 7080 7100 7110 7140 7200 7210 7220 7230 7250 7900 8000 8010"
findstr /I /M "BP_Encount" %CON%>nul
if errorlevel 1 (
	findstr /I /M "Tactics.TP2~.*#.*#13./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "8020"
	)
)
findstr /I /M "Tactics.TP2~.*#.*#37./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "8030"
)
findstr /I /M "BP_Encount" %CON%>nul
if errorlevel 1 (
	findstr /I /M "Tactics.TP2~.*#.*#16./ Tactics.TP2~.*#.*#25./ Tactics.TP2~.*#.*#34./" %ELOG%>nul
	if errorlevel 1 (
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "8040"
		) else (
			Call %EINSTI% stratagems "8042"
		)
	)
)
Call %EINSTI% stratagems "8050"
findstr /I /M "BP_Encount" %CON%>nul
if errorlevel 1 (
	findstr /I /M "Tactics.TP2~.*#.*#2./" %ELOG%>nul
	if errorlevel 1 (
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "8060"
		) else (
			Call %EINSTI% stratagems "8061"
		)
	)
	findstr /I /M "BP_AI" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "Tactics.TP2~.*#.*#4./" %ELOG%>nul
		if errorlevel 1 (
			findstr /I /M "replace_SCS_6000" %CON%>nul
			if errorlevel 1 (
				%IF% stratagems/iwdspells (
					Call %EINSTI% stratagems "8080"
				) else (
					Call %EINSTI% stratagems "8081"
				)
			)
		)
	)
	findstr /I /M "Tactics.TP2~.*#.*#5./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "8100"
	)
)
findstr /I /M "Tactics.TP2~.*#.*#3./" %ELOG%>nul
if errorlevel 1 (
	call %EINSTI% stratagems "8110"
)
findstr /I /M "BP_Encount" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% stratagems "8150"
)
Call %EINSTI% stratagems "8070 8090 8120 8160 8170 8190"
:skscsssl

findstr /I /M "CNoSOBIWO" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% scales_of_balance "101"
)
findstr /I /M "CnoSoBWeap" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% scales_of_balance "121"
)
Call %EINSTI% scales_of_balance "109 160 202 206 207 2123 227"
findstr /I /M "CHidekit" %CON%>nul && findstr /I /M "CSkipSoBHideKit" %CON%>nul 
if errorlevel 1 (
	Call %EINSTI% scales_of_balance "210"
)

call %EINSTI% jimfix "0 1 2 3 4 5 100 400 201 300 600"

Call %EINST% mih_eq "151"

findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINST% thecalling "0"
)

Call %EINSTI% NMR "0 1 2 3 4 5 6 7 8"

findstr /I /M "NMR.TP2~.*#.*#0./ NMR.TP2~.*#.*#1./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% NMR-Happy "2"
)

:: BP AI
%IFNS%bpseries.exe Call %EINSTI% BP "10"
Call %EINSTI% BP "325 440 475 550 625 675 725 750 760 800 875 900 925" & rem no equivalent in SCS
findstr /I /M "SCS_AI" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% BP "350 375 390 400 425 500 525 575 600 650 700 150" & rem similar function also in SCS
)
findstr /I /M "replace_SCS_6000" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% BP "350 375 500 525 575 600 150"
)
findstr /I /M "BP.TP2~.*#.*#150./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% BP "175"
)
findstr /I /M "SCS_Encount" %CON%>nul
if errorlevel 1 (
	findstr /I /M "BP.TP2~.*#.*#150./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% BP "1000"
	)
)

Call %EINST% Volcano "0"

findstr /I /M "BP_Encount" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% Tactics "19"
)

Call %EINSTI% Turambar_fixes_tweaks "2050 2052"

Call %EINSTI% aTweaks "100 101 102 103 104 110 115 125 130 140"
findstr /I /M "KONTWK.TP2~.*#.*#9./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% aTweaks "120"
) else (
	%IFS%aTweaks.exe %TXT% | findstr @360 | Call %C%>> %E%
)
Call %EINSTI% aTweaks "160 180 185 190"
findstr /I /M "STRATAGEMS.TP2~.*#.*#603../ STRATAGEMS.TP2~.*#.*#651../" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "152 155 156"
)
Call %EINSTI% aTweaks "186 191 200 201 202 203 204 205 210 211 212 213 216 218 220 230 239"
Call %EINST% XP-info
Call %EINSTI% aTweaks "261 270 301 302 310 315 500 510 999"

Call %EINSTI% scales_of_balance "232"

Call %EINST% polytweak "50 60 70 80 83 85"
findstr /I /M "CSOBWPO" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% polytweak "97"
)
Call %EINST% polytweak "100 150 201 300 401 500 600 700 800 900"

Call %EINST% XP-info
findstr "0 1" count2.txt
if not errorlevel 1 (
	Call %EINSTI% xpmod "0"
	Call %EINSTI% xpmod "15"
)
findstr "2 3 4 5 6 7" count2.txt
if not errorlevel 1 (
	Call %EINSTI% xpmod "1"
	Call %EINSTI% xpmod "16"
)

Call %EINSTI% BP-Balancer "2 7 12"

findstr /I /M "cdtweaks.TP2~.*#.*#2090./ cdtweaks.TP2~.*#.*#2091./ cdtweaks.TP2~.*#.*#2092./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% EET_Tweaks "2002"
)
findstr /I /M "ATWEAKS.TP2~.*#.*#261./ XPMOD.TP2~.*#.*#7./ XPMOD.TP2~.*#.*#8./ XPMOD.TP2~.*#.*#9./ XPMOD.TP2~.*#.*#10./ XPMOD.TP2~.*#.*#11./ XPMOD.TP2~.*#.*#12./ XPMOD.TP2~.*#.*#13./ BP-BALANCER.TP2~.*#.*#1./ BP-BALANCER.TP2~.*#.*#2./ BP-BALANCER.TP2~.*#.*#3./ BP-BALANCER.TP2~.*#.*#4./ BP-BALANCER.TP2~.*#.*#5./ BP-BALANCER.TP2~.*#.*#6./ BP-BALANCER.TP2~.*#.*#7./ BP-BALANCER.TP2~.*#.*#8./ BP-BALANCER.TP2~.*#.*#9./ BP-BALANCER.TP2~.*#.*#10./ BP-BALANCER.TP2~.*#.*#11./ BP-BALANCER.TP2~.*#.*#12./ BP-BALANCER.TP2~.*#.*#13./ BP-BALANCER.TP2~.*#.*#14./ BP-BALANCER.TP2~.*#.*#15./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% EET_Tweaks "2044" "5 10"
)
findstr /I /M "XPMOD.TP2~.*#.*#0./ XPMOD.TP2~.*#.*#1./ XPMOD.TP2~.*#.*#2./ XPMOD.TP2~.*#.*#3./ XPMOD.TP2~.*#.*#4./ XPMOD.TP2~.*#.*#5./ XPMOD.TP2~.*#.*#6./" %ELOG%>nul
if errorlevel 1 (
	findstr "0 1" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% EET_Tweaks "2051"
	)
	findstr "2 3 4 5 6 7" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% EET_Tweaks "2052"
	)
)
findstr /I /M "XPMOD.TP2~.*#.*#15./ XPMOD.TP2~.*#.*#16./ XPMOD.TP2~.*#.*#17./ XPMOD.TP2~.*#.*#18./ XPMOD.TP2~.*#.*#19./ XPMOD.TP2~.*#.*#20./ XPMOD.TP2~.*#.*#21./" %ELOG%>nul
if errorlevel 1 (
	findstr "0 1" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% EET_Tweaks "2061"
	)
	findstr "2 3 4 5 6 7" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% EET_Tweaks "2062"
	)
)
Call %EINSTI% EET_Tweaks "2070 3010"

Call %EINSTI% DiffTweak "10 17 24"
findstr /I /M "STRATAGEMS.TP2~.*#.*#0./ BP.TP2~.*#.*#0./ TACTICS.TP2~.*#.*#./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% DiffTweak "30 36"
)

Call %EINSTI% iiSpellSystemAdjustments "0" "3 30 11 4 Y 2"
Call %EINSTI% iiSpellSystemAdjustments "1" "3 30 326 105 Y 2"
Call %EINSTI% iiSpellSystemAdjustments "2" "1 5 50 10 100 15 150 20 200 25 250 30 300 35 350 40 400 45 450"
Call %EINSTI% iiSpellSystemAdjustments "3" "1 5 50 10 100 15 150 20 200 25 250 30 300 35 350"

Call %EINST% iiProjectileR "2002" "2 2 60 2 70 2 50 2 70 2 80 2 90"

Call %EINST% iiLearnThroughuse "2001" "10 20 40 80 160 0"

findstr /I /M "ImprSummons SpellRev" %CON%>nul
if errorlevel 1 (
	Call %EINST% gMinion "0"
)

findstr /I /M "Spell50_gMinion SpellRev" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% ImprovedSummons "0 1 2 3 4 5 6 7 8 9 10"
)

Call %EINST% bpseries "0 10 100"

findstr /I /M "STRATAGEMS.TP2~.*#.*#1000./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% NMRF-PC "0"
	)
findstr /I /M "ASCENSION.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% NMRF-PC "1"
	)
Call %EINSTI% NMRF-PC "2 3"

Call %EINSTI% tb#tweaks "100 150 200 300 1250 4000 4500 5000 6000 6500"
findstr /I /M "ITEM_REV.TP2~.*#.*#15./ DIVINE_REMIX.TP2~.*#.*#403./ DIVINE_REMIX.TP2~.*#.*#409./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% tb#tweaks "7000"
)
Call %EINSTI% tb#tweaks "9100"

findstr /I /M "TOBEX.TP2~.*#.*#121./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% P5Tweaks "10"
)
findstr /I /M "TOBEX.TP2~.*#.*#120./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% P5Tweaks "20"
)
findstr /I /M "TOBEX.TP2~.*#.*#122./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% P5Tweaks "40"
)
Call %EINSTI% P5Tweaks "30 50"
findstr /I /M "CSOBIWO" %CON%>nul
if errorlevel 1 (
	findstr /I /M "ITEM_REV.TP2~.*#.*#17./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% P5Tweaks "60"
	)
)

findstr /I /M "bg1npcscs" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% bg1npcbeg "110 120 130 140 150 160 170 180 190 200 210"
)
%.%
%.%20. CLOSER INSTALLATION | %M%
%.%
%.%
Call %EINST% level1npcs "0"
findstr /I /M "CnoLV1Weap" %CON%>nul
if errorlevel 1 (
	findstr /I /M "DIVINE_REMIX.TP2~.*#.*#200./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% level1npcs "1" "1 1 1 1 1 1 1"
	) else (
		Call %EINSTI% level1npcs "1" "1 1 1 1 1 1 1 1"
	)
)
Call %EINSTI% level1npcs "51 55 60 100"

:: The regular expressions from Level1NPC don't consider the additions ("tF" and "tw") to the names made by Refinements and thus they corrupt the lines.
findstr /I /M "REFINEMENTS.TP2~.*#.*#10./ REFINEMENTS.TP2~.*#.*#11./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		copy /Y ".\level1npcs\backup\0\kit.ids" ".\override" | %M%
	)
)

Call %EINSTI% tnt "0 1 2 3 4 6 10 12 13 14 15 16 19 22 23 24 27 28 29 30 32 33 34 35 36 37 38 39 40 41 42 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 77 78 81"

findstr /I /M "SOS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% MTS_Crappack "23 24"
)

Call %EINST% Virtue "0"

findstr /I /M "VIRTUE.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "GLORAN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	rem Call %EINST% gloran "1" & rem not compatible with Virtue v20Alpha 
)

Call %EINST% sarerestore "0"

Call %EINSTI% Divine_Remix "1000"

findstr /I /M "1PP.TP2~.*#.*#203./ 1PP.TP2~.*#.*#204./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% infinityanimations "8030 9520"
) else (
	%IFS%infinityanimations.exe %TXT% | findstr @385 | Call %C%>> %E%
)

findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		copy /Y ".\%BWFP%\_override\infinityanimations\*.*" ".\override" | %M%
	)
)

Call %EINSTI% 1pp "113"

rem Call %EINSTI% cdtweaks "50"

Call %EINSTI% eportraits "0 100 101 102 202 119 103 104 122 123 125 105 106 107 108 109 128 110 112 113 246 131 115 116 133 117 200 201 223 224 228 204 230 206 231 254 233 234 235 207 236 208 209 238 239 210 241 232 212 213 242 243 244 245 214 215 217 248 249 250 218 251 222 252 220 221 253"

Call %EINST% BP-BGT-Worldmap "0" "1 1"
Call %EINST% BP-BGT-Worldmap "1"

Call %EINST% mapnames "0 25"

Call %EINSTI% BInfinitySounds "0"
Call %EINSTI% BInfinitySounds "1" "Y Y Y Y 2 1 Y"
Call %EINSTI% BInfinitySounds "2 3 4 5 6"

Call %EINST% 1pp_hq_music_BGT "0"

findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call ".\%BWIPI%\define_GUI.bat
) else (
	GOTO :SKIPGUI
)
if %PREVIEW%==0 (
	del GUI_Mods\1\songlist.2da
)

:: FOR /F %%a IN ('type GUI_input.txt') DO Call %EINST% GUI "%%a"
Call %EINST% GUI "4"

:SKIPGUI

findstr /I /M "TUTUGUI" %CON%>nul
if not errorlevel 1 (
	Call %EINST% TutuGUI "0"
	%IF% BWP_widescreen_input.txt Call %EINST% TutuGUI "1"
)

findstr /I /M "W_GUI" %CON%>nul
if not errorlevel 1 (
	Call %EINST% W_GUI "0 11"
)

%NMAC% %IFN% BWP_NoWide Call %EINST% widescreen "0" "TYPE BWP_widescreen_input.txt"

findstr /I /M "TUTUGUI" "W_GUI" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% bg2improvedgui "110 200 410 510 530 600 700 810 910 1000 1010 1120 1200 1310 1400 1580 1920 2040 2200 2500 2900 3000 3400 3600 4290"
)

Call ".\%BWIPI%\close1.bat"

Call ".\%BWIPI%\close2.bat"

:: Copyright 2008-2023 by Leonardo Watson
:: This file or parts of it may not be copied or changed without permission except for personal use.