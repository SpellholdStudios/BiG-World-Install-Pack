:: To uninstall a single component or specific components for testing purposes:    setup-##.exe --language 0  --force-uninstall-list # --noautoupdate
:: To uninstall a complete mod for testing purposes:                               setup-##.exe --language 0  --uninstall --noautoupdate
:: replace ## with the modname and # with the component number(s) and 0 if necessary with the actual language number.
:: Caution: Only if you know exactly what you are doing! You could ruin your whole installation!

:: Inside nested logic (IF/ELSE, FOR loops, etc...) only REM may be used because colons "::" give an error.
:: If you use commands in-line you need to add "&" character before.
:: You may not do a findstr search in different files with only one string.

:: findstr and logical operations:
:: A AND B: findstr /I /M "A" txt>nul && findstr /I /M "B" txt>nul
:: A OR B: findstr /I /M "A B" txt>nul 
:: (A AND B) OR C: findstr /I /M "A C" txt>nul && findstr /I /M "B C" txt>nul
:: (A OR B) AND C: findstr /I /M "A B" txt>nul && findstr /I /M "C" txt>nul
:: Either A OR B is missing: findstr /I /M "A" txt>nul && findstr /I /M "B" txt>nul combined with errorlevel 1
:: Neither A NOR B: findstr /I /M "A B" txt>nul combined with errorlevel 1

:: FindStr search string may not have more than 127 characters.

:: "if %errorlevel%==0" or "if not errorlevel 1" means "if exist", "if %errorlevel%==1" or "if errorlevel 1" means "if not exist"
:: Don't use "if %errorlevel%==1" within nestled a conditional branch, use "if errorlevel 1" instead. Instead of "if %errorlevel%==0" use "if not errorlevel 1"
:: In the context of errorlevel there must be "&&" instead of "&" to read the full line otherwise only the part after "&" would be read.
:: A jump label may not be nestled inside a conditional branch.

SETLOCAL
cd /d %DPATH%

SET SLAQ="LargeQuest" %SET%
SET SMEQ="MediumQuest" %SET%
SET SSMQ="SmallQuest" %SET%
SET SEAQ="EasyQuest" %SET%
SET SHAQ="HardQuest" %SET%
SET SSTQ="StandardQuest" %SET%
SET SXTQ="ExpertQuest" %SET%

SET SBPC="NPCBanter" %SET%
SET SCPC="ContinuingNPC" %SET%
SET SNPC="NewAddedNPC" %SET%
SET SOPC="OneDayNPC" %SET%
SET SABC="SoAToBContentNPCOnly" %SET%
SET SVPC="VoicedNPCOnly" %SET%
SET SVBC="SoAToBContentNPCOnly VoicedNPCOnly" %SET%
SET SCOM="Companions" %SET%

SET SITM="NewItems" %SET%
SET SSPL="NewSpells" %SET%
SET SEIS="EasyItemSpell" %SET%
SET SSIS="StandardItemSpell" %SET%
SET SOIS="OverpoweredItemSpell" %SET%

SET SCOR="Correction" %SET%
SET SRES="Restoration" %SET%
SET SCOS="Cosmetic" %SET%
SET SKIT="NewKit" %SET%	
SET STAC="TacticMod" %SET%	

SET SHCH="HeavyChallenges" %SET%
SET SLCH="LightChallenges" %SET%
SET SMCH="MediumChallenges" %SET%
SET SVCH="VeryHardChallenges" %SET%
SET SXCH="ExtremeChallenges" %SET%
SET SLMCH="LightChallenges MediumChallenges" %SET%
SET SMHCH="MediumChallenges HeavyChallenges" %SET%
SET SHVCH="HeavyChallenges VeryHardChallenges" %SET%
SET SVXCH="VeryHardChallenges ExtremeChallenges" %SET%
SET SHVXCH="HeavyChallenges VeryHardChallenges ExtremeChallenges" %SET%

SET SATW="AITweak" %SET%
SET SCTW="ConvenienceTweak" %SET%
SET SDTW="IWDTweak" %SET%
SET SGTW="GameplayTweak" %SET%
SET SHTW="HLATweak" %SET%
SET SITW="ItemTweak" %SET%
SET SKTW="KitTweak" %SET%
SET SMTW="MiscTweak" %SET%
SET SPTW="PnPTweak" %SET%
SET SRTW="RuleTweak" %SET%
SET SSTW="SpellTweak" %SET%
SET SXTW="XPTweak" %SET%

SET SCTK="CheatTweak" %SET%
SET SETK="EasyTweak" %SET%
SET SHTK="HeavyTweak" %SET%
SET SSTK="StandardTweak" %SET%
SET SXTK="ExtremeTweak" %SET%
SET SESTK="EasyTweak StandardTweak" %SET%
SET SHXTK="HeavyTweak ExtremeTweak" %SET%

SET SCPT="Scripts" %SET%
SET SFUN="FunMod" %SET%
SET SGRA="Graphic" %SET%
SET SINC="IncongruousMod" %SET%
SET SPOR="Portrait" %SET%

SET SADU="AdultContent" %SET%
SET SBET="BetaVersion" %SET%
SET SBUG="Buggymod" %SET%
SET SXPL="ExperiencedPlayer" %SET%

SET SHRD="HighRated" %SET%
SET SLRD="LowRated" %SET%
SET SMRD="MidRated" %SET%
SET SNRD="NotRated" %SET%
SET STRD="TopRated" %SET%
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

findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M "BP_Ascension" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Oversight "0"
	)
)

Call %EINSTI% bg2fixpack "0 3"
%IFE% Call %EINSTI% bg2fixpack "1000"
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% bg2fixpack "100 101 102 103 104 106 107 108 109 110 111 112 113 114 115 116"
)

Call %EINSTI% VCv21 "0 1 2"
%IFNS%VCv21.exe (
	Call %EINSTI% BDToBv175 "0 2"
) else (
	%TXT% | findstr @305 | Call %C% >> %E%
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINST% iiKeyNames "2001"
)



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
			findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SHRD%>nul
			if not errorlevel 1 (
				findstr /I /M "CNoFirewalker CSharTeel" %CON%>nul
				if errorlevel 1 (
					Call %EINST% TDD "0"
				) else (
					%IFS%TDD.exe %TXT% | findstr @405 | Call %C%>> %E%
				)
			)
		)
		findstr /I /M %SKIT%>nul
		if not errorlevel 1 (
			Call %EINST% TDD "1"
		)
	)
	
	findstr /I /M "SandrahNPC_les" %CON%>nul
	if not errorlevel 1 (
		Call %EINST% SOS "0 1"
	) else (
		findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SMRD%>nul
		if not errorlevel 1 (
			Call %EINST% SOS "0 1"
		)
	)
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
	findstr /I /M "SandrahNPC_req" %CON%>nul
	if not errorlevel 1 (
		Call %EINST% CtB "0 1"
	) else (
		findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SMRD%>nul && findstr /I /M %SXPL%>nul
		if not errorlevel 1 (
			Call %EINST% CtB "0"
		)
		findstr /I /M "CTB.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			findstr /I /M %SLRD%>nul
			if not errorlevel 1 (
				Call %EINST% CtB "1"
			)
		)
	)
	findstr /I /M "CTB.TP2~.*#.*#1./" %ELOG%>nul
	if not errorlevel 1 (
		findstr /I /M %SCTW%>nul
		if not errorlevel 1 (
			Call %EINST% CtB "2"
		)
		findstr /I /M %SCOS%>nul
		if not errorlevel 1 (
			Call %EINST% CtB "3"

			Call %EINST% CtBcutImp "0"
		)
	)

	findstr /I /M "CTB.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% TethyrForestPatch "0"
	)

	findstr /I /M "SandrahNPC_req" %CON%>nul
	if not errorlevel 1 (
		Call %EINST% RoT "0"
	) else (
		findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul
		if not errorlevel 1 (
			findstr /I /M "COctDrizzt" %CON%>nul
			if errorlevel 1 (
				Call %EINST% RoT "0"
			) else (
				%IFS%DKDrizzt.exe %TXT% | findstr @124 | Call %C%>> %E%
			)
		)
	)
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINST% RoT "1"
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

Call %EINSTI% BP "0 50"
findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINSTI% BP "35"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "CSOBWPO" %CON%>nul
	if errorlevel 1 (
		%IFNS%tb#tweaks.exe Call %EINSTI% BP "60"
	)
)
:: BP Encounter Components
findstr /I /M %SHVCH%>nul
if not errorlevel 1 (
	findstr /I /M "SCS_Encount" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% BP "1020 1225"
		findstr /I /M "BP.TP2~.*#.*#35./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% BP "1750"
		)
	)
	Call %EINSTI% BP "1080 1100 1110 1120 1130 1140 1170 1175 1190 1200 1210 1250 1275 1300 1315 1330 1350 1375 1400 1425 1450 1525 1570 1600 1625 1650 1675 1700 1725 1800"
)

findstr /I /M "orig_Ascension" %CON%>nul
if errorlevel 1 (
	findstr /I /M "SandrahNPC_req" %CON%>nul
	if not errorlevel 1 (
		Call %EINSTI% BP "2000"
	) else (
		findstr /I /M %SHVCH%>nul
		if not errorlevel 1 (
			Call %EINSTI% BP "2000"
		)
	)
	findstr /I /M %SHVCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% BP "2100 2200 2300 2400 2600"
		findstr /I /M "OVERSIGHT.TP2~.*#.*#0./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% BP "2500"
		)
	) else (
		%IFS%BP.exe %TXT% | findstr @381 | Call %C%>> %E%
	)
)

:: Install TDD after BGT to give TDD NPCs their quests function.
findstr /I /M "CnoBig4BG2" %CON%>nul
if errorlevel 1 (
	findstr /I /M "TDD2DBGT" %CON%>nul
	if not errorlevel 1 (
		findstr /I /M "SandrahNPC_req" %CON%>nul
		if not errorlevel 1 (
			Call %EINST% TDD "0"
		) else (
			findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SHRD%>nul
			if not errorlevel 1 (
				findstr /I /M "CNoFirewalker CSharTeel" %CON%>nul
				if errorlevel 1 (
					Call %EINST% TDD "0"
				) else (
					%IFS%TDD.exe %TXT% | findstr @405 | Call %C%>> %E%
				)
			)
		)
		findstr /I /M %SKIT%>nul
		if not errorlevel 1 (
			Call %EINST% TDD "1"
		)
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
findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CBerelKeldorn" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% VCv21 "4"
		)
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
		findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SMRD%>nul
		if not errorlevel 1 (
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
)
Call %EINSTI% VCv21 "9"
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "10"
	findstr /I /M "CSharTeel CTDDCSharTeel CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% VCv21 "11"
	) else (
		%IFS%NeJ3v71.exe %TXT% | findstr @401 | Call %C%>> %E%
	)
)
findstr /I /M %SNPC%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "12"
)
findstr /I /M "VCv21.TP2~.*#.*#4./ VCv21.TP2~.*#.*#6./ VCv21.TP2~.*#.*#12./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "13"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "14"
)
findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "16 17"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "18 19 21"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "23"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "24 25 26 27 28"
	%IFNS%BP.exe Call %EINSTI% VCv21 "29"
	findstr /I /M "CNoBDashImoen ConSandrah" %CON%>nul
	if errorlevel 1 (
		%IFNS%CtB.exe Call %EINSTI% VCv21 "30"
	)
)
findstr /I /M %SHVCH%>nul
if not errorlevel 1 (
	rem Call %EINSTI% VCv21 "31 32 33 34"
)
findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "35 36"
		findstr /I /M %SKTW%>nul
		if not errorlevel 1 (
			Call %EINSTI% VCv21 "39"
			rem comp 38 cannot be installed	
		)
	)
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "40"
)

%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "1 3 4 5 6 7 9 10 11 12 13 14 15 16 17 18 20 21 22 23 24"
findstr /I /M "CNoBDashImoen ConSandrah" %SET%>nul
if errorlevel 1 (
	%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "19"
)

findstr /I /M "CnoNEJ" %CON%>nul
if errorlevel 1 (
	findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SXPL%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
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
	)
	findstr /I /M %SKTW%>nul && findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% NeJ3v71 "4"
		rem skie
	)
	findstr /I /M %SMTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% NeJ3v71 "1"
	)
	findstr /I /M %SNPC%>nul
	if not errorlevel 1 (
		findstr /I /M "MiH_EQ" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% NeJ3v71 "2"
		)
	)

	rem for all versions of NEJ
	if %PREVIEW%==0 (
		%IF% .\NEJ2 copy /Y ".\%BWFP%\_override\NEJ2\*.*" ".\override" | %M%
	)
)

findstr /I /M %SLAQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% PoFQuestPack "0"
	if %PREVIEW%==0 (
		%IFS%PoFQuestPack.exe copy ".\%BWFP%\_PoFQuest\missing\POFQtraps\*" ".\override" | %M%
		%IFS%PoFQuestPack%IFNIF%TDD.exe copy ".\%BWFP%\_PoFQuest\missing\POFQtrapsTDD\*" ".\override" | %M%
	)
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
findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% DarkHorizons "0"
) else (
	findstr /I /M %SLAQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% DarkHorizons "0"
	)
)

:: correct temporary the language numbers
findstr /C:"VERSION ~v3.1~ //" DSotSC\DSotSC.tp2>nul
if not errorlevel 1 call "%BWIPFIX%"\dsotsc_language.bat"

findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% DSotSC "0 1 2 3 4"
	Call %EINST% NTotSC "0 1 2 3 4 7 8 9"
	findstr /I /M "CBGT_AdvPack" %CON%>nul
	if errorlevel 1 (
		Call %EINST% NTotSC "5 6"
	)
) else (
	findstr /I /M %SLAQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% DSotSC "0 1 2 3 4"

		Call %EINSTI% NTotSC "0 1 2 3 4 8 9"
		findstr /I /M "CBGT_AdvPack" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% NTotSC "5 6"
		)
		findstr /I /M %SNPC%>nul
		if not errorlevel 1 (
			Call %EINSTI% NTotSC "7"
		)
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% BoneHillv275 "0"
) else (
	findstr /I /M %SLAQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% BoneHillv275 "0"
	)
)

findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% drizztsaga "1 3"
) else (
	findstr /I /M %SHAQ%>nul && findstr /I /M %SLRD%>nul
	if not errorlevel 1 (
		Call %EINST% drizztsaga "1 3"
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% vault "0"
	%IFS%item_rev.exe CALL %EINST% vault "1"
) else (
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINST% vault "0"
		%IFS%item_rev.exe CALL %EINST% vault "1"
	)
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SEAQ%>nul
if not errorlevel 1 (
	findstr /I /M "CImoenRom" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Imoen_forever "0 1 2 3"
	)
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	Call %EINSTI% c#endlessbg1 "0 1 5 6 7 8 12"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% C#ENDLESSBG1 "3 4"
)

findstr /I /M "NeJ3v71.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IF% ".\NeJ2\backup\0\POGHM4.DLG" copy /Y ".\NeJ2\backup\0\POGHM4.DLG" ".\override" | %M%
		REM Without this bgqe component #7 cannot be installed
	)
)
findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% bgqe "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"

	Call %EINST% AC_QUEST "0 1 2 3 5 6 7 8 9 10"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% bgqe "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15"
	)
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% AC_QUEST "0 1 2 3 5 6 7 8 9 10"
	)
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %STRD%>nul
if not errorlevel 1 (
	Call %EINST% c#brage "0 1"
)

findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% TGC1E "0"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% TGC1E "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% SirinesCall "0 1"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% SirinesCall "0 1"
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IFS%SOA.exe copy /Y ".\%BWFP%\_override\worldmap\*.*" ".\override" | %M%
	)
	Call %EINST% SOA "1"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		if %PREVIEW%==0 (
			%IFS%SOA.exe copy /Y ".\%BWFP%\_override\worldmap\*.*" ".\override" | %M%
		)
		Call %EINST% SOA "1"
	)
)

findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% NMT "0"
)
findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	Call %EINST% WBGTAP "1"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% karatur "0"
)

findstr /I /M %SLAQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% bst "0"
)
%.%
%.%
%.%4. BG1 NPC MODS | %M%
%.%
%.%
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% bg1npc "0 10"
) else (
	findstr /I /M %SBPC%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
		if not errorlevel 1 (
			findstr /I /M "DRIZZTSAGA.TP2~.*#.*#3./" %ELOG%>nul
			if not errorlevel 1 (
				Call %EINSTI% bg1npc "0 10"
			)
		) else (
			findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
			if errorlevel 1 (
				Call %EINSTI% bg1npc "0 10"
			)
		)
	)
)
findstr /I /M %SBPC%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	Call %EINSTI% bg1npc "24 34"
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINSTI% bg1npc "44"
	)
)
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% bg1npc "54"
) else (
	findstr /I /M %SBPC%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% bg1npc "54"
	)
)
findstr /I /M %SBPC%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINSTI% bg1npc "64"
	)
	Call %EINSTI% bg1npc "74"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% bg1npc "80 100 120 130"
)
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 (
	Call %EINST% bg1npc "200"
) else (
	findstr /I /M %SBPC%>nul
	if not errorlevel 1 (
		Call %EINSTI% bg1npc "200"
	)
)

findstr /I /M "BG1NPC.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% BG1NPCMusic "0"
)

findstr /I /M %SBPC%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINSTI% bg1re "105"
		) else (
			Call %EINSTI% bg1re "100"
		)
		Call %EINSTI% bg1re "1 2 3 4 5 6 7 8 9 10 11 15 16 17 18 19 20 21 23 27 28 31 32 33 34 35 36 37 40 41 42 43 44"
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINSTI% bg1re "12 13 24 25 38 39"
		)
	)
)
findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	Call %EINSTI% bg1re "14 22 26 29 30"
)

findstr /I /M %SRES%>nul
if not errorlevel 1 (
	findstr /I /M "FOTD.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% bg1ub "0"
	)
	Call %EINSTI% bg1ub "1 2"
	REM components 3, 4, 5, 6, 7 will be skipped, if BG1 NPC Project is installed
	findstr /I /M "BG1NPC.TP2~.*#.*#1./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% bg1ub "3 4 5 6 7"
	) else (
		%IFS%bg1ub.exe %TXT% | findstr @300 | Call %C%>> %E%
	)
	Call %EINSTI% bg1ub "8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 28 29 30 31 32 33 34"
	findstr /I /M "BG1NPC.TP2~.*#.*#130./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% bg1ub "27"
	) else (
		%IFS%bg1ub.exe %TXT% | findstr @302 | Call %C%>> %E%
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% IndiNPC "0"
	Call %EINST% Mur'Neth "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% IndiNPC "0"
	)
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% Mur'Neth "0"
	)
)
		
findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% MulgoreXaviaNPC "0"
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		call %EINST% XanBG1Friend "0"

		call %EINST% coranbgfriend "0"

		call %EINST% AjantisBG1 "0"
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	findstr /I /M "CWorgasPoFQ" %CON%>nul
	if errorlevel 1 (
		Call %EINST% ACBre "0 13"
	)
	if %PREVIEW%==0 (
		%IFGS%FinchNPC.exe del ".\FinchNPC\audio\SUFINC28.ogg" | %M%
	)
	Call %EINST% FinchNPC "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		findstr /I /M "CWorgasPoFQ" %CON%>nul
		if errorlevel 1 (
			Call %EINST% ACBre "0 13"
		)
	)
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		if %PREVIEW%==0 (
			%IFGS%FinchNPC.exe del ".\FinchNPC\audio\SUFINC28.ogg" | %M%
		)
		Call %EINST% FinchNPC "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% gavin "0 1" "5"
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINST% gavin "2"
	)
	Call %EINST% gavin "10"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% gavin "0 1" "1"
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINSTI% gavin "2"
		)
		Call %EINSTI% gavin "10"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINSTI% Huple_NPC "0 1"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% ChaosKnight "0"

		findstr /I /M "ChaosKnight.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINST% Askaria "0"
		) else (
			%IFS%Askaria.exe %TXT% | findstr @352 | Call %C%>> %E%
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% valerie "0"
	Call %EINST% isra "0 1 2"
	Call %EINST% White "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% valerie "0"
		)

		Call %EINSTI% isra "0"
		findstr /I /M %SBPC%>nul
		if not errorlevel 1 (
			Call %EINSTI% isra "1 2"
		)

		Call %EINST% White "0"
	)
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CGarricktales" %CON%>nul
		if errorlevel 1 (
			findstr /I /M %SMRD%>nul
			if not errorlevel 1 (
				Call %EINST% garrick_flirt "0" "5"
			) else (
				%IFS%garrick_flirt.exe %TXT% | findstr @409 | Call %C%>> %E%
			)
		)
		findstr /I /M "CGarrickflirt" %CON%>nul
		if errorlevel 1 (
			findstr /I /M %SNRD%>nul
			if not errorlevel 1 (
				findstr /I /M "BG1NPC.TP2~.*#.*#10./" %ELOG%>nul && findstr /I /M "BG1NPC.TP2~.*#.*#200./" %ELOG%>nul
				if not errorlevel 1 (
					Call %EINST% garrick-tt "0"
				) else (
					%IFS%garrick-tt.exe %TXT% | findstr @409 | Call %C%>> %E%
				)
			)
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% GlamNPCPack "0"
	%IFNS%GlamNPCPack.exe Call %EINST% vynd "0"

	Call %EINST% TenyaThermidor "0"

	Call %EINST% Zakrion_BG1 "1000"

	Call %EINST% Margarita "0"

	Call %EINST% Helarine_BGEE "0"
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		Call %EINST% BG1Aerie "0"
	)
)
%.%
%.%
%.%5. BG1 STORES AND ITEMS | %M%
%.%
%.%
findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINST% BW_Herbs "0"

	Call %EINST% thalan "0"

	Call %EINSTI% LostItems "0"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% LostItems "1 2"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %STRD%>nul
if not errorlevel 1 (
	Call %EINST% c#brage "10"
)

findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINST% BGeeAR "0"

	Call %EINST% BGeeW "0"

	Call %EINST% Animus "0"

	Call %EINST% wmart "0"

	Call %EINST% ClubOfPain "0"

	Call %EINST% WandCase "0"

	Call %EINST% saradas_magic "0"
)
%.%
%.%
%.%6. BG1 RULES AND TWEAKS | %M%
%.%
%.%
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BGSpawn "1000 2100 3800 5000"
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% BGSpawn "4000"
	)
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% ktweaks "1 2 3"
	REM Ktweaks component #3 needs to be installed if component #2 is installed
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% ktweaks "301"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% kittomes "0 4 5"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BGTTweak "100 600 901 1000"
	findstr /I /M "VCv21.TP2~.*#.*#24./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% BGTTweak "400"
	)
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	findstr /I /M "BG2SOA.TP2~.*#.*#0./ BG2SOA.TP2~.*#.*#1./ VCv21.TP2~.*#.*#24./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% BGTTweak "800"
	)
)
%IFS%BGTTweak.exe %TXT% | findstr @340 | Call %C%>> %E%
Call %EINSTI% BGTTweak "1104"
Call %EINSTI% BGTTweak "1200 1300 1502"
findstr /I /M "BG1UB.TP2~.*#.*#16./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% BGTTweak "1400"
) else (
	%IFS%BGTTweak.exe %TXT% | findstr @341 | Call %C%>> %E%
)
%IFNS%RR.exe call %EINSTI% BGTTweak "1700"

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BGTTweak "2001"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IFS%NeJ3v71.exe %IF% ".\override\Auril.ITM" copy /Y ".\NeJ3\itm\Auril.ITM" ".\override" | %M%
	)
	Call %EINSTI% BGTTweak "2100 2700"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BGTTweak "2300"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BGTTweak "2400 2500 2600 2800"
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINST% BG_Travel "66"
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINST% CritterParts_v1.1 "0"
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINST% ZFA "0 1 2"
)

findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BP-Balancer "17 27 30"
)
:SKIPBG1b
%.%
%.%
%.%7. BG2 QUEST MODS | %M%
%.%
%.%
findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% EdwinRomance "0 2 3"
)

%IFS%Ascension.tp2 GOTO :SKIPASCE
findstr /I /M "BP_Ascension" %CON%>nul
if errorlevel 1 (
	findstr /I /M "SandrahNPC_req" %CON%>nul
	if not errorlevel 1 (
		Call %EINSTI% Ascension "0 10 20 30 40 50 61"
	) else (
		findstr /I /M %SMEQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SNRD%>nul
		if not errorlevel 1 (
			Call %EINSTI% Ascension "0 10 20 30 40 50 61"
		)
	)
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% Ascension "1000 1100 1200 1300 1400 1500 2400"
	)
)
:SKIPASCE
								   
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Turnabout "0 1"
	) else (
		%IFS%Turnabout.exe %TXT% | findstr @320 | Call %C%>> %E%
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% d0questpack "11"
)

findstr /I /M "SandrahNPC_les" %CON%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2100./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% LongerRoad "0 1"
	)
) else (
	findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2100./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% LongerRoad "0 1"
		)
	) else (
		%IFS%LongerRoad.exe %TXT% | findstr @321 | Call %C%>> %E%
		%IFS%LongerRoad%IFIF%BP.exe %TXT% | findstr @322 | Call %C%>> %E%
	)
)

findstr /I /M %SGTW%>nul && findstr /I /M %SBPC%>nul						
if not errorlevel 1 (
	findstr /I /M "32-bit" %IPL%>nul
	if not errorlevel 1 (
		%IF% .\wheels\ssl\ssl.exe goto :skwhlssl																															
	)
	Call %EINST% wheels "0"
)
:skwhlssl

findstr /I /M %SRES%>nul
if not errorlevel 1 (
	findstr /I /M "TS.TP2~.*#.*#0./ VCv21.TP2~.*#.*#28./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% UB "1"
	) else (
		%IFS%UB.exe %TXT% | findstr @311 | Call %C%>> %E%
	)
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% UB "3"
)
findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% UB "0 2 4 5 6 7 8 9 10 12 15 17 18 19 21 25"
	%IFNS%item_rev.exe Call %EINSTI% UB "20"
	) else (
		%IFS%UB.exe %TXT% | findstr @312 | Call %C%>> %E%
	)
	findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./ TURNABOUT.TP2~.*#.*#0./ 7C-YOSHI.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% UB "24"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% ToA "1 10 20 30 40 50"
	
	Call %EINST% GBThfKp "0"
) else (
	findstr /I /M %SLAQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% ToA "1 10 20 30 40 50"
	)
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% GBThfKp "0"
	)
)

if %PREVIEW%==0 (
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		findstr /I /M "GBTHFKP.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			%IFNS%Tactics%IFNIF%BP%IFNIF%Stratagems.exe "%BWIPU%"\7z.exe x -y -o".\override" .\GBThfKp\_debug\impmaevar.7z
		)
	)
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% AjocMod "0"
	) else (
		%IFS%AjocMod.exe %TXT% | findstr @303 | Call %C%>> %E%
	)
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% TTSQ "0"

	Call %EINSTI% emad "0 1 2 3 4 5"
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% PlanarSphereMod "0 1 2 3"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% PlanarSphereMod "0 1 2 3"
	)
)

findstr /I /M %SFUN%>nul && findstr /I /M %SADU%>nul && findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% tb#quest "0"

	findstr /I /M "TB#QUEST.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#quest "1"
	)
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	%IFS%refinements.exe Call %EINSTI% tb#quest "2"
	Call %EINSTI% tb#quest "3"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	Call %EINST% BWQuest "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% c#sb_silber "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% spgaunt "0 1 3"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	Call %EINSTI% TOD "0"
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% TOD "1 2"
	)

	Call %EINST% DC "0"

	Call %EINST% Assassinations "0"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% BackBrynnlaw "0"

	Call %EINST% Sellswords "0"
)
	
findstr /I /M %SSMQ%>nul && findstr /I /M %SHAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% 1Sylm "0"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	call %EINSTI% sovereign "0 1"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	call %EINSTI% TotDG "0"

	findstr /I /M "CSeverian" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Innershade "0"
	)
	if %PREVIEW%==0 (
		%IFS%TotDG%IFIF%Innershade.exe copy /Y ".\override\bpbgtmap.bam" ".\bp-bgt_worldmap\bam" | %M%
	)

	call %EINSTI% WhiteQueen "0"
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% rukrakia "0 3"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	call %EINST% ISNF "0"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Devin "0"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Eilistraee "0"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% Eilistraee "0"
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% FishingForTrouble "0 1"
	%IFNS%FishingForTrouble.exe Call %EINST% dq "0 1 2"
) else (
	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% FishingForTrouble "0 1"
		%IFNS%FishingForTrouble.exe Call %EINST% dq "0 1 2"
	)
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	call %EINST% SouthernEdge "0"
	
	call %EINST% Ooze "0"

	call %EINST% TangledIsle "0"

	call %EINST% BridgesBlock "0"

	call %EINST% AlabasterSands "0"
)
%.%
%.%
%.%8. MINI-MODS | %M%
%.%
%.%
findstr /I /M %SBPC%>nul && findstr /I /M %SFUN%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	Call %EINST% aip "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul
if not errorlevel 1 (
	findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% SDMODS "0"

		Call %EINST% TurnipGolem "0"
	)
	findstr /I /M %SFUN%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% MDX "0"
	)
	findstr /I /M %SFUN%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% hf_HHG "0"
	)
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% QualloFix "0"

	findstr /I /M %SBUG%>nul
	if not errorlevel 1 (
		Call %EINST% cal "0"

		Call %EINST% Questor "0"
	)

	Call %EINST% SNAKES "0"

	Call %EINST% Contest "0"

	Call %EINST% BWL_Contest "0"

	Call %EINST% ThOghma "0"

	Call %EINSTI% ShardsOfIce "0 1 2"
)

findstr /I /M %SBPC%>nul && findstr /I /M %SFUN%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% SkooterTheNPC "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% lucy "0"
)

findstr /I /M %SCOM%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Cerberus "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	Call %EINST% slandor "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Zalnoya "0 1"

	findstr /I /M %SFUN%>nul
	if not errorlevel 1 (
		Call %EINST% Swylif "0"
	)

	Call %EINST% sagaman "0"

	Call %EINST% Derats_Ogre "0"

	Call %EINST% Almaquest2 "0"

	Call %EINST% Reunion "0"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% dw_lanthorn "20"
)
%.%
%.%
%.%9. BG2 TACTICAL ENCOUNTERS | %M%
%.%
%.%
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M %SVXCH%>nul && findstr /I /M %SXPL%>nul
	if not errorlevel 1 (
		%IFNS%BGT%IFNIF%BP.exe Call %EINSTI% Tactics "0"
	)
	%IFNS%BP.exe Call %EINSTI% Tactics "1 6 7 8 9 11 14 15 24 29 31"
	Call %EINSTI% Tactics "32 33 37"
	%IFNS%BP%IFNIF%stratagems.exe Call %EINSTI% Tactics "2 4 5 10 16 12 13 20 21 22 23 28 35"
	%IFNS%stratagems.exe Call %EINSTI% Tactics "3 22 25 34"
	%IFNS%d0questpack.exe Call %EINSTI% Tactics "17"
	%IFNS%d0questpack%IFNIF%stratagems.exe Call %EINSTI% Tactics "18"
	findstr /I /M %SVXCH%>nul
	if not errorlevel 1 (
		%IFNS%BP.exe Call %EINSTI% Tactics "36"
	)
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	%IFNS%d0questpack.exe Call %EINSTI% Tactics "30"
)

findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% AzenMOD "0 1 2"

	Call %EINSTI% com_encounters "0 1 2"

	Call %EINSTI% DSoA "1"
	findstr /I /M "BDToBv175.TP2~.*#.*#7./ VCv21.TP2~.*#.*#6./" %ELOG%>nul
	if errorlevel 1 (
		%IFNS%BP.exe Call %EINSTI% DSoA "2"
	)
	%IFNS%BP.exe Call %EINSTI% DSoA "3 5 7"
	Call %EINSTI% DSoA "4 6 8"

	Call %EINST% DofD "0"

	Call %EINSTI% impasylum "0 1 2 3"

	findstr /I /M %SVXCH%>nul
	if not errorlevel 1 (
		findstr /I /M "BuTcHeR" %CON%>nul
		if errorlevel 1 (
			Call %EINST% Firkraag "0"
		)
	)

	findstr /I /M %SMCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% imnesvale "0"
	)
	findstr /I /M %SHVCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% imnesvale "1"
	)
	findstr /I /M %SXCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% imnesvale "2"
	)

	findstr /I /M %SINC%>nul
	if not errorlevel 1 (
		Call %EINST% DNT "0"
	)

	Call %EINST% Arena "0"

	findstr /I /M %SINC%>nul
	if not errorlevel 1 (
		Call %EINST% UoT "0"
	)

	findstr /I /M "Firkraag" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% BuTcHeRy "10 20 30"
	) else (
		%IFS%BuTcHeRy.exe %TXT% | findstr @355 | Call %C%>> %E%
	)
)
%.%
%.%
%.%10. BG2 NPC MODS WITH MORE CONTENT | %M%
%.%
%.%
findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Tsujatha "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SADU%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% Tsujatha "0"
	)
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M %SNRD%>nul
		if not errorlevel 1 (
			Call %EINST% imoenfriendship "0"
		)
	)
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		findstr /I /M "CKhalid CImoenBDash CImoen4Ever" %CON%>nul
		if errorlevel 1 (
			findstr /I /M %SNRD%>nul
			if not errorlevel 1 (
				Call %EINST% imoenRomance "0 1"
			)
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Amber "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			Call %EINST% Amber "0"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "CInner" %CON%>nul
	if errorlevel 1 (
		Call %EINST% Severian "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% BTL "1 2"
	
	Call %EINST% Tashia "0 2"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% BTL "1 2"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		Call %EINST% Tashia "0"
		findstr /I /M %SBPC%>nul
		if not errorlevel 1 (
			Call %EINST% Tashia "2"
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINSTI% ajantisbg2 "0 3 44"
	) else (
		Call %EINSTI% ajantisbg2 "0 44"
	)
	Call %EINST% Kido "0 1"
	
	Call %EINST% Ariena "0 1"
	
	Call %EINST% Kindrek "0"
	
	Call %EINST% kitanya "0"
	%IFNS%wsr.exe Call %EINST% kitanya "1"
	
	Call %EINST% Star "0"
) else (
	findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			findstr /I /M "CBG1NPCSoA" %CON%>nul
			if errorlevel 1 (
				findstr /I /M %SADU%>nul
				if not errorlevel 1 (
					Call %EINSTI% ajantisbg2 "0 3 44"
				) else (
					Call %EINSTI% ajantisbg2 "0 44"
				)
			) else (
				%IFS%ajantisbg2.exe %TXT% | findstr @395 | Call %C%>> %E%
			)
		)
	)
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% Kido "0 1"

		Call %EINSTI% Ariena "0 1"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SLRD%>nul
	if not errorlevel 1 (
		Call %EINST% Kindrek "0"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			findstr /I /M "CKhalid" %CON%>nul
			if errorlevel 1 (
				Call %EINSTI% kitanya "0"
				%IFNS%wsr.exe Call %EINSTI% kitanya "1"
			) else (
				%IFS%kitanya.exe %TXT% | findstr @411 | Call %C%>> %E%
			)
			findstr /I /M %SVPC%>nul
			if errorlevel 1 (
				Call %EINST% Star "0"
			)
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Valen "0"
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINSTI% tsukibg2 "0 1"
	)
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Yasraena "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% Yasraena "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% alora "0"
	
	Call %EINST% AurenAseph "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			findstr /I /M "CBG1NPCSoA" %CON%>nul
			if errorlevel 1 (
				Call %EINST% alora "0"
			) else (
				%IFS%alora.exe %TXT% | findstr @397 | Call %C%>> %E%
			)
		)
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SHRD%>nul
	if not errorlevel 1 (
		Call %EINST% AurenAseph "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Thael "0"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Hanna "0 1 3 4 5 6"
	Call %EINST% KimNPC "0 1"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% Hanna "0"
	)
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% Hanna "1 3 4 5 6"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			Call %EINSTI% KimNPC "0"
			findstr /I /M %SITW%>nul
			if not errorlevel 1 (
				Call %EINSTI% KimNPC "1"
			)
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Lester "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Tiax "0"
	
	Call %EINST% sarahtob "0"
) else (
	findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M "CBG1NPCSoA" %CON%>nul
		if errorlevel 1 (
			Call %EINST% Tiax "0"
		) else (
			%IFS%Tiax.exe %TXT% | findstr @398 | Call %C%>> %E%
		)
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINST% sarahtob "0"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% Hubelpot "0"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Angelo "0"
	
	Call %EINST% VampireTales "0 1 2 3"
	
	Call %EINST% Nikita "0"
) else (
	findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% Angelo "0"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% VampireTales "0"
	)
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% VampireTales "1 2"
	)
	findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
	if not errorlevel 1 (
		Call %EINSTI% VampireTales "3"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			Call %EINST% Nikita "0"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% touched "0 1"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% ninde "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% ninde "0"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		Call %EINSTI% xulaye "0 2"
		findstr /I /M %SBPC%>nul
		if not errorlevel 1 (
			Call %EINSTI% xulaye "1"
		)
	)
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% haldamir "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% AVIM "0"
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Saerileth "0"
) else (
	findstr /I /M "CKIARA" %CON%>nul
	if errorlevel 1 (
		findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
		if not errorlevel 1 (
			Call %EINST% Saerileth "0"
		)
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINST% Skie "0"
	) else (
		%IFS%Skie.exe %TXT% | findstr @399 | Call %C%>> %E%
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "AOE_Kits Mortis CACBrePoFQ" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% worgas "0"
		findstr /I /M "BDTOBV175.TP2~.*#.*#4./ VCv21.TP2~.*#.*#9./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% worgas "1"
		) else (
			%IFS%worgas.exe %TXT% | findstr @307 | Call %C%>> %E%
		)
		findstr /I /M "ROT.TP2~.*#.*#0./ DRIZZTSAGA.TP2~.*#.*#0./ DKDRIZZT.TP2~.*#.*#0./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% worgas "2"
		)
	) else (
		%IFS%worgas.exe %TXT% | findstr @304 | Call %C%>> %E%
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% TyrisFlare "0"
	
	Call %EINST% Varshoon "0 1"
	
	Call %EINST% gavin_bg2 "0" "5"
	
	Call %EINST% gavin_bg2 "1 2"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% TyrisFlare "0"
	)

	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINSTI% Varshoon "0 1"
		)
		Call %EINSTI% gavin_bg2 "0" "5"
		Call %EINSTI% gavin_bg2 "1 2"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINSTI% darian "0 4"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% Yvette "0" "1"
	Call %EINSTI% Yvette "1"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% arath "0"
	
	Call %EINST% dace "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% arath "0"
		)
		Call %EINST% dace "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Gahesh "0"

	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Lena "1"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul && findstr /I /M %SBET%>nul
if not errorlevel 1 (
	Call %EINST% aranw "0 320 540 900"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% isra_bg2 "0"
	
	Call %EINST% TheUndying "0"
) else (
	findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% isra_bg2 "0"
	)

	findstr /I /M %SSMQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% TheUndying "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% Neh'taniel "0"
	)

	findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SBET%>nul
	if not errorlevel 1 (
		Call %EINST% Foundling "0" "1"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Solaufein "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% Solaufein "0"
		)
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% rpgsolaflirtpack "0"
	) else (
		%IFS%rpgsolaflirtpack.exe %TXT% | findstr @313 | Call %C%>> %E%
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% c#solaufein "0 1"
	
	Call %EINST% Sheena "0"
	
	Call %EINST% Kelsey "0"
) else (
	findstr /I /M %SNPC%>nul
	if not errorlevel 1 (
		findstr /I /M %SNRD%>nul
		if not errorlevel 1 (
			Call %EINST% c#solaufein "0 1"
		)

		findstr /I /M %SMRD%>nul
		if not errorlevel 1 (
			findstr /I /M %SVBC%>nul
			if errorlevel 1 (
				Call %EINST% Sheena "0"
			)

			Call %EINSTI% Kelsey "0"
		)
	)
)
findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Kelsey "1"
) else (
	%IFS%Kelsey.exe %TXT% | findstr @369 | Call %C%>> %E%
)
findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "ASCENSION.TP2~.*#.*#0./ BP.TP2~.*#.*#2000./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Kelsey "4"
) else (
	%IFS%Kelsey.exe %TXT% | findstr @370 | Call %C%>> %E%
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "Kelsey.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		call %EINST% GRoA "0"
	) else (
		%IFS%GRoA.exe %TXT% | findstr @314 | Call %C%>> %E%
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Keto "0"
	findstr /I /M "KELSEY.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% Keto "1"
	)
	Call %EINST% Nathaniel "0 1 4 5"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			findstr /I /M "CKeepYosh" %CON%>nul
			if errorlevel 1 (
				Call %EINSTI% Keto "0"
				findstr /I /M "KELSEY.TP2~.*#.*#0./" %ELOG%>nul
				if not errorlevel 1 (
					Call %EINSTI% Keto "1"
				)
			) else (
				%IFS%Keto.exe %TXT% | findstr @393 | Call %C%>> %E%
			)

			Call %EINST% Nathaniel "0 1 4 5"
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% LuxleySoA "0 1 2"
) else (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINSTI% LuxleySoA "0 1"
	)
	findstr /I /M "LUXLEYSOA.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "NATHANIEL.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% LuxleySoA "2"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Kiara-Zaiya "0 1 2"
) else (
	findstr /I /M "CSaerileth" %CON%>nul
	if errorlevel 1 (
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINSTI% Kiara-Zaiya "0 1"
			findstr /I /M %SHTW%>nul
			if not errorlevel 1 (
				Call %EINSTI% Kiara-Zaiya "2"
			)
		)
	)
)
findstr /I /M %SHVCH%>nul
if not errorlevel 1 (
	findstr /I /M "KIARA-ZAIYA.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Kiara-Zaiya "3 4 6"
	)
)
findstr /I /M %SXPL%>nul
if not errorlevel 1 (
	findstr /I /M "KIARA-ZAIYA.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Kiara-Zaiya "5"
	)
)
findstr /I /M "BP.TP2~.*#.*#1250./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% Kiara-Zaiya "7"
) else (
	%IFS%Kiara-Zaiya.exe %TXT% | findstr @315 | Call %C%>> %E%
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% iylos "0 1 6"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% iylos "0"
		findstr /I /M %SBPC%>nul
		if not errorlevel 1 (
			Call %EINSTI% iylos "1 6"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% evandra "0"

	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% calin "0" "5"
	)
)
%.%
%.%
%.%11. BG2 NPC MODS WITH LESS CONTENT | %M%
%.%
%.%
findstr /I /M %SSMQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "multistronghold CNPCStrong" %CON%>nul
	if errorlevel 1 (
		Call %EINST% cliffhistory "0"
	) else (
		%IFS%cliffhistory.exe %TXT% | findstr @414 | Call %C%>> %E%
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Chiara "0"
)

findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CRoTDrizzt ConSandrah" %CON%>nul
		if errorlevel 1 (
			Call %EINST% DKDrizzt "0"
		) else (
			%IFS%DKDrizzt.exe %TXT% | findstr @124 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		findstr /I /M %SBUG%>nul
		if not errorlevel 1 (
			Call %EINSTI% Elvan-all "0 1"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% Goo "0"

		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINSTI% Horace "0 1"
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Kari "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% Kari "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Malthis "0"
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "CFirewalker CBG1NPCSoA ConSandrah CTDDCSharTeel" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% sharteel "0 1"
	) else (
		%IFS%sharteel.exe %TXT% | findstr @126 | Call %C%>> %E%
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% SBS "0 1"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% SBS "0 1"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		Call %EINST% Vanim "0"
	)

	Call %EINST% BIDDE "0"

	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		findstr /I /M %SBUG%>nul
		if not errorlevel 1 (
			Call %EINSTI% Azure "0 1"
		)

		Call %EINST% frennedan "0"
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "CBranwen CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINST% POB "0"
	) else (
		%IFS%POB.exe %TXT% | findstr @116 | Call %C%>> %E%
	)

	findstr /I /M "CPerils CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINST% BranwenNPC "0"
	) else (
		%IFS%BranwenNPC.exe %TXT% | findstr @121 | Call %C%>> %E%
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		Call %EINST% MawgulNPC "0"
	)

	Call %EINST% Uldar "0"
)

findstr /I /M %SCPC%>nul && findstr /I /M %SBG1%>nul && findstr /I /M %SBET%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		Call %EINST% rose "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Larsha "0"
	)
	
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		findstr /I /M "Mortis" %CON%>nul
		if errorlevel 1 (
			Call %EINST% Raziel "0"
		) else (
			%IFS%Raziel.exe %TXT% | findstr @404 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CBG1NPCSoA" %CON%>nul
		if errorlevel 1 (
			Call %EINST% Quayle "0"
		) else (
			%IFS%Quayle.exe %TXT% | findstr @114 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% gloran "0"

		Call %EINST% Auden "0"
	)
)

findstr /I /M %SNPC%>nul
if not errorlevel 1 (
	Call %EINST% Coondred "0"

	Call %EINST% saradas_magic_2 "0"

	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% AsharNPC "0"
	)
)
%.%
%.%
%.%12. BG2 ONE-DAY NPCS | %M%
%.%
%.%
findstr /I /M %SOPC%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	Call %EINST% alassa "0"

	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% allison "0"
	)
)

findstr /I /M %SOPC%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% anishai "0"
		)
	)
)

findstr /I /M %SOPC%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% BonsBrucev2 "0"

		Call %EINST% cassius "0"
	)
)

findstr /I /M %SOPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Ghareth "0"
)

findstr /I /M %SOPC%>nul && findstr /I /M %SHRD%>nul
if not errorlevel 1 (
	Call %EINST% HessaNPC "0"
)

findstr /I /M %SOPC%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% JCBruce "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Wikaede "0"
)

findstr /I /M %SOPC%>nul && findstr /I /M %SLRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINST% WillyB "0"

		Call %EINST% FoxMonster "0"

		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINST% Vildra "0"

			Call %EINST% Jandor "0"

			findstr /I /M "CBG1NPCSoA" %CON%>nul
			if errorlevel 1 (
				Call %EINST% Eldoth "0"
			) else (
				%IFS%Eldoth.exe %TXT% | findstr @402 | Call %C%>> %E%
			)
			Call %EINST% Roar "0"
	
			Call %EINST% Teddy "0"

			findstr /I /M %SBET%>nul
			if not errorlevel 1 (
				Call %EINST% abSolestia "0"
			)
		)
	)
)
%.%
%.%
%.%13. BG2 NPC-RELATED MODS | %M%
%.%
%.%
findstr /I /M %SBPC%>nul && findstr /I /M %SFUN%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Cws "0"
	)
	Call %EINST% JZ "0"
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINSTI% ggib_tweaks "0 2 4 5 10"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVBC%>nul
	if errorlevel 1 (
		findstr /I /M %SBUG%>nul
		if errorlevel 1 (
			findstr /I /M "CDArnise" %CON%>nul
			if errorlevel 1 (
				Call %EINST% LuvNalia "0"
			) else (
				%IFS%LuvNalia.exe %TXT% | findstr @132 | Call %C%>> %E%
			)
		)
		findstr /I /M "CLuvNalia" %CON%>nul
		if errorlevel 1 (
			Call %EINST% deArnise "0"
		) else (
			%IFS%deArnise.exe %TXT% | findstr @132 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %STRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINSTI% BanterPack "0 2 3"
		findstr /I /M "BG1NPC.TP2~.*#.*#25./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINST% BanterPack "1"
		) else (
			%IFS%BanterPack.exe %TXT% | findstr @308 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CKhalid" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% iepbanters "0 1 2 3 4 5"
		) else (
			%IFS%iepbanters.exe %TXT% | findstr @130 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% viconia "0"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% mazzy "0"
		
		findstr /I /M %SABC%>nul
		if errorlevel 1 (
			findstr /I /M "CKeepYosh" %CON%>nul
			if errorlevel 1 (
				Call %EINST% yoshimo "0"
			) else (
				%IFS%yoshimo.exe %TXT% | findstr @388 | Call %C%>> %E%
			)
			findstr /I /M "CYoshFriend" %CON%>nul
			if errorlevel 1 (
				findstr /I /M "BANTERPACK~.*#.*#2./" %ELOG%>nul
				if errorlevel 1 (
					Call %EINST% 7C-Yoshi "0"
				)
			) else (
				%IFS%7C-Yoshi.exe %TXT% | findstr @389 | Call %C%>> %E%
			)
		)
	)
	findstr /I /M "CKeepYosh" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% YoshimoRomance "0" "1"
		Call %EINSTI% YoshimoRomance "1"

		Call %EINSTI% YoshimosRemorse "0 1"
	) else (
		%IFS%YoshimoRomance.exe %TXT% | findstr @390 | Call %C%>> %E%
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% alcool "0"

		Call %EINST% JanQuest "0"

		Call %EINST% Korgan "0"

		Call %EINST% KorganFriendship "0"
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "CKhalid CCoranBG2 CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINST% Coran "0 1"
	) else (
		%IFS%Coran.exe %TXT% | findstr @123 | Call %C%>> %E%
	)

	findstr /I /M "CNoKkalid" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Khalid "0" "1"
		Call %EINSTI% Khalid "1 5"
	) else (
		%IFS%Khalid.exe %TXT% | findstr @127 | Call %C%>> %E%
	)
)

findstr /I /M "ROT.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "DRIZZTSAGA.TP2~.*#.*#1./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M "bg1npc.TP2~.*#.*#12./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINST% THEONEDRIZZT "0"
	) else (
		%IFS%THEONEDRIZZT.exe %TXT% | findstr @382 | Call %C%>> %E%
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% ValygarFriendship "0"
		
		findstr /I /M "CSenkaKeldorn" %CON%>nul
		if errorlevel 1 (
			Call %EINST% keldorn_rom "0 1 8"
		)
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		findstr /I /M "CBG1NPCSoA" %CON%>nul
		if errorlevel 1 (
			Call %EINST% yeslicknpc "0"
		) else (
			%IFS%yeslicknpc.exe %TXT% | findstr @391 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% sarevokfriendship "0"
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% Branwen "0"
)

findstr /I /M %SBPC%>nul && findstr /I /M %SADU%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINSTI% NPCFlirt "0 2 4 6 8 10 12 14"
		findstr /I /M "SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% NPCFlirt "1 3 5 7 9 11 13 15"
		) else (
			%IFS%NPCFlirt.exe %TXT% | findstr @368 | Call %C%>> %E%
		)
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% RE "0 3 4 7 8 11 14 15 16 17 18 19 20 21 22 23 24 26 27 28 29 30 32 33 35 37 39 40 43 44 45 46 47 49 50 51 52 53 54"
	findstr /I /M %SADU%>nul
	if not errorlevel 1 (
		Call %EINST% RE "1 2 5 9 12 13 25 31 34 36 38 41 42 48"
		findstr /I /M "CnoREBohdi" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% RE "6"
		)
	)
) else (
	findstr /I /M %SBPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINSTI% RE "0 3 4 7 8 11 14 15 16 17 18 19 20 21 22 23 24 26 27 28 29 30 32 33 35 37 39 40 43 45 46 47 49 50 52 53"
			findstr /I /M "CCoranMod" %CON%>nul
			if errorlevel 1 (
				Call %EINSTI% RE "10"
			) else (
				%IFS%RE.exe %TXT% | findstr @416 | Call %C%>> %E%
			)
			findstr /I /M "CnoREValygar" %CON%>nul
			if errorlevel 1 (
				Call %EINSTI% RE "44 51"
			)
		)
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINSTI% RE "1 2 5 9 12 13 25 31 34 36 38 41 42 48"
			findstr /I /M "CnoREBohdi" %CON%>nul
			if errorlevel 1 (
				Call %EINSTI% RE "6"
			)
		)
	)
)

findstr /I /M %SCPC%>nul && findstr /I /M %STRD%>nul
if not errorlevel 1 (
	findstr /I /M "CKhalid CBG1NPCSoA" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Xan "0 3 5"
	) else (
		%IFS%Xan.exe %TXT% | findstr @396 | Call %C%>> %E%
	)
)

findstr /I /M "XAN.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	%IFE% Call %EINST% XanBG2Voice "0"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Aeon "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% Aeon "0"
	)
)
findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	findstr /I /M "AEON.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "XAN.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Aeon "1"
	)
)
findstr /I /M %SITM%>nul && findstr /I /M %SBET%>nul
if not errorlevel 1 (
	findstr /I /M "AEON.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Aeon "2"
	)
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	Call %EINST% sarevokromance "0"

	findstr /I /M "CnoValygarRom" %CON%>nul
	if errorlevel 1 (
		Call %EINST% CorthalaRomantique "0 1 2"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M %SADU%>nul
		if not errorlevel 1 (
			Call %EINST% haerdalisromance "0"
		)

		Call %EINST% haerdalis_friendship "0"

		Call %EINST% cernd "0"

		Call %EINST% MinscFriendship "0"
	)
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% nephele "0 1"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M %SVPC%>nul
		if errorlevel 1 (
			Call %EINSTI% nephele "0 1"
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% Petsy "0 1"
)

findstr /I /M "SandrahNPC_les" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Fade "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		Call %EINST% Fade "0"
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% homewardbound "0 2"
)
%.%
%.%
%.%14. BG2 STORES AND ITEMS | %M%
%.%
%.%
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	findstr /I /M %SOIS%>nul
	if not errorlevel 1 (
		Call %EINST% AM "0"
	)

	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINST% bagbonus "0"

		Call %EINST% RGenie "0"

		Call %EINST% BoM "0"

		Call %EINST% BG2SoA "1"
	)
	findstr /I /M %SINC%>nul && findstr /I /M %SOIS%>nul
	if not errorlevel 1 (
		Call %EINSTI% Exnem "0 1 2"
	)
	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINSTI% FR_ROV "0 1"

		Call %EINST% HeartWood "0"
	)
	findstr /I /M %SSIS%>nul
	if not errorlevel 1 (
		Call %EINST% BW_Herbs_BG2 "0"
	
		%IFNS%item_rev.exe Call %EINST% ValHorn "0"
		) else (
			%IFS%ValHorn.exe %TXT% | findstr @122 | Call %C%>> %E%
		)
	)
	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINST% KWolf "0"
	)
	findstr /I /M %SSIS%>nul
	if not errorlevel 1 (
		Call %EINST% MunchMod "0"

		Call %EINSTI% RItemPack "0 1 2 4 5 6 7 8"
	)
	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINST% Rolles "0"
		%IFNS%Item_Pack.exe Call %EINST% Rolles "1"

		Call %EINST% rttitempack "0"

		Call %EINSTI% Ruad "0 10"

		Call %EINST% Tzshop01 "0"

		Call %EINST% AbyStore "0"

		Call %EINST% Underrep "0"
	)
	findstr /I /M %SSIS%>nul
	if not errorlevel 1 (
		Call %EINSTI% ItemUpgrade "10 11"
		%IFE% Call %EINSTI% ItemUpgrade "12"
		rem Call ".\%BWIPI%\cespy.bat"
		rem The Cespenar audio is now integrated into the mainline mod
	)
)

findstr /I /M %SSPL%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINSTI% SPItemPack "2"
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINST% cliffkey "1"

		findstr /I /M "SPITEMPACK.TP2~.*#.*#3./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINST% BloodMort "0"
		)

		Call %EINSTI% Ebg2 "0 2"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SADU%>nul
if not errorlevel 1 (
	Call %EINSTI% Ebg2 "1"
)
findstr /I /M %SITW%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
	%IFNS%d0questpack.exe Call %EINSTI% Ebg2 "3"
)
findstr /I /M %SPOR%>nul
if not errorlevel 1 (
	Call %EINSTI% Ebg2 "4"
)
findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% Ebg2 "5"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	findstr /I /M "TDD.TP2~.*#.*#1./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% Ebg2 "8 10 11 12 16 17"
		findstr /I /M "CRylornNoKit" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% Ebg2 "13"
		)
	) else (
		%IFS%Ebg2.exe %TXT% | findstr @306 | Call %C%>> %E%
	)
	Call %EINSTI% Ebg2 "9 14 15"
)

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	%IFNS%d0tweak.exe Call %EINSTI% Ebg2 "7"
	Call %EINSTI% Ebg2 "18"
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	findstr /I /M %SEIS%>nul
	if not errorlevel 1 (
		Call %EINST% foodmod "0"

		Call %EINST% rupert "0"

		Call %EINST% VolcanicArmoury "0"

		Call %EINST% RotBArmorSet "0"
	)

	findstr /I /M %SSIS%>nul
	if not errorlevel 1 (
		findstr /I /M %STAC%>nul
		if not errorlevel 1 (
			Call %EINSTI% StuffofTheMagi "0" "2 1"
		) else (
			Call %EINSTI% StuffofTheMagi "0" "1 2"
		)
	)
)

findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	%IFNS%ashesofembers%IFNIF%Kitanya%IFNIF%RPG-KP.exe Call %EINSTI% KonTwk "0"
)

findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% KonTwk "9"
)
findstr /I /M %SITM%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
	Call %EINSTI% KonTwk "11 13 14 15"

	Call %EINST% bolsa "0"

	Call %EINST% Charli "0"

	Call %EINST% DARRON "0"

	Call %EINST% nanstein "0"
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% Mhoram "0"
	)
)

findstr /I /M %SITM%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
	Call %EINSTI% Vendedor_DLAN "0 1"

	Call %EINST% Recarga "0"

	Call %EINST% Alchemy "0"

	Call %EINST% MerskStore "0"

	Call %EINST% Mystigan "0"

	Call %EINST% LavaIt "0"

	Call %EINST% OldModsPack "0"

	Call %EINST% RFWIP "0"

	Call %EINST% Houyi "0"

	Call %EINST% YLITEMS "0 1"
)

findstr /I /M %SSPL%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
	Call %EINSTI% DragonSummon "0" "1"
)

findstr /I /M %SSPL%>nul && findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINST% dsr "0"
)

findstr /I /M %SITM%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
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

	Call %EINST% Renal "0"

	Call %EINST% trovador "0"

	Call %EINST% Haendlermod "0"
)

findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINSTI% iwditempack "0 1 2 3 4 5 6 7 8 9 10 11"

	findstr /I /M "IWDITEMPACK.TP2~.*#.*#./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% iwditemfix "0"
	)
)

findstr /I /M %SITM%>nul && findstr /I /M %SINC%>nul
if not errorlevel 1 (

	Call %EINST% sigil-bd-mod "0"

	Call %EINST% d2item "0"
)

findstr /I /M %SITM%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	Call %EINST% BG2eeAR "0"

	Call %EINST% BG2eeW "0"
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% mih_ip "101 102 109 115 119 120 121 122 123"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	%IFNS%item_rev%IFNIF%spell_rev.exe Call %EINSTI% mih_ip "105"
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINST% iiItemMod "1" "0"
)
%.%
%.%
%.%15. MISCELLANEOUS DEPENDEND MODS | %M%
%.%
%.%
findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% arestorationp "0 1 2 3 4 5 6 7 8 10 11 12 13"
)

findstr /I /M %SATW%>nul
if not errorlevel 1 (
	Call %EINSTI% d0questpack "0 1"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "TACTICS.TP2~.*#.*#17./ TACTICS.TP2~.*#.*#18./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% d0questpack "401"
	) else (
		Call %EINSTI% d0questpack "4"
	)
	findstr /I /M %SXPL%>nul
	if not errorlevel 1 (
		Call %EINSTI% d0questpack "5"
	)
	Call %EINSTI% d0questpack "6 7 8 9 10 14 15 16 17 18 19 20 21"
	findstr /I /M "7C-Yoshi.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% d0questpack "13"
	) else (
		%IFS%d0questpack.exe %TXT% | findstr @317 | Call %C%>> %E%
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SBET%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		findstr /I /M "CKeepYosh" %CON%>nul
		if errorlevel 1 (
			Call %EINST% stivan "0"
		) else (
			%IFS%Stivan.exe %TXT% | findstr @394 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% alternatives "0"
)

findstr /I /M "IMOEN_FOREVER.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "SAERILETH.TP2~.*#.*#0./ ALTERNATIVES.TP2" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% Imoen_forever "9"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% ts25mini "0 1 2 3 4 5"
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Chloe "0"
) else (
	findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul
	if not errorlevel 1 (
		Call %EINST% Chloe "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINSTI% Yikari "0 3 4 5"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% TheBeaurinLegacy "1000"
)

findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% RevisedBattles "0 1 2 3 4 5 6 7 8"
	findstr /I /M "FIRKRAAG.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		findstr /I /M "BuTcHeR" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% RevisedBattles "9"
		)
	) else (
		%IFS%RevisedBattles.exe %TXT% | findstr @316 | Call %C%>> %E%
	)
	findstr /I /M "VCv21.TP2~.*#.*#11./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% RevisedBattles "10"
	) else (
		%IFS%RevisedBattles.exe %TXT% | findstr @354 | Call %C%>> %E%
	)
	Call %EINSTI% RevisedBattles "11 12 13 14 15 17 18 19 20 21 22"
	findstr /I /M "TACTICS.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% RevisedBattles "16"
	)
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% RevisedBattles "23 24 25 26 27"
)
findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		findstr /D:override /C:"B#BLADE" kit.ids> B#BLADEtemp.txt
		more +1 B#BLADEtemp.txt> B#BLADEstring.txt
		del B#BLADEtemp.txt
	)
)

findstr /I /M %SSPL%>nul
if not errorlevel 1 (
	Call %EINSTI% Grimuars "0 1"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M "REVISEDBATTLES.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% Grimuars "2"
	)
	Call %EINSTI% Grimuars "3 4"
)
						
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINST% Celestials "0"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tobr "0 1 2 3 4 5 6 7 8 9 10 11 12 13"
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	findstr /I /M "ACBRE.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% ACBre "2"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SMRD%>nul && findstr /I /M %SBUG%>nul
if not errorlevel 1 (
	findstr /I /M "CNoRylorn" %CON%>nul
	if errorlevel 1 (
		Call %EINST% Rylorn "0"
	)
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
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
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IFS%Rjali.exe %IFN% ".\override\ibrac21.bam" copy ".\%BWFP%\_override\missing\ibrac21.bam" ".\override" | %M%
	)
	Call %EINST% Rjali "3"
)
findstr /I /M "RJALI.TP2~.*#.*#3./" %ELOG%>nul && findstr /I /M %SOIS%>nul && findstr /I /M %SCTK%>nul
if not errorlevel 1 (
	Call %EINST% Rjali "4"
)

findstr /I /M "SandrahNPC_sig" %CON%>nul
if not errorlevel 1 (
	Call %EINST% Kivan "100 200"
) else (
	findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
	if not errorlevel 1 (
		findstr /I /M "CKhalid CBG1NPCSoA" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% Kivan "100 200"
		) else (
			%IFS%Kivan.exe %TXT% | findstr @129 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SVPC%>nul
	if errorlevel 1 (
		Call %EINST% adrian "0 10 20 30"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SCPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "ConSandrah" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% BG1NPCSoA "0 2 4 6 8 10 11 20 25 30 40 45 50 55 60 65 70 75 87"
	)
)

findstr /I /M %SBPC%>nul && findstr /I /M %SCPC%>nul
if not errorlevel 1 (
	Call %EINSTI% SmilingImpCrossBanterMod "0 1 2 3 4 5 6 7 9 10 11 12 14"
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M %SABC%>nul
	if errorlevel 1 (
		Call %EINSTI% Faren "0 2"
		findstr /I /M %SBPC%>nul
		if not errorlevel 1 (
			Call ".\%BWIPI%\Faren.bat"
		)
	)
)

findstr /I /M %SBPC%>nul
if not errorlevel 1 (
	Call %EINSTI% CrossmodBG2 "0 1 2"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% HerThiMoney "0 10 20 30 40"
)
%.%
%.%
%.%16. BG2 RULES, TWEAKS AND SPELLS | %M%
%.%
%.%
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "1010"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "1020"
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "1030"
)
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "1050"
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "1080 1090"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "2020 2030 2170 2180"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "2000 2010 2040 2050 2060 2160"
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "2070 2080 2090 2100 2110 2120 2130"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	%IFNS%fullplate.exe Call %EINSTI% klatu "2140 2150"
)
findstr /I /M %SATW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "2190"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	call %EINSTI% klatu "3070"

	Call %EINST% UCFOW "0"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% npckit "30 31 400 900 2100 2200 2300 2500 2510 2800"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% npc_tweak "0 2"
	%IFNS%phord_druidkits.exe Call %EINSTI% npc_tweak "1"
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SEAQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% hiddenadventure "0 2 9"
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% hiddenadventure "1 8"
	)
)
findstr /I /M %SCTW%>nul && findstr /I /M %SEAQ%>nul
if not errorlevel 1 (
	Call %EINSTI% hiddenadventure "3 4 5 10"
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% hiddenadventure "6"
	)
	findstr /I /M "CNPCStrong" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% hiddenadventure "7"
	)
)

findstr /I /M %SSPL%>nul
if not errorlevel 1 (
	Call %EINST% ghost "0"
)

findstr /I /M %SCOM%>nul && findstr /I /M %SBUG%>nul
if not errorlevel 1 (
	Call %EINST% FamiliarPack "0"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Vic "0 1"
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% Vic "2 5"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% Vic "3 4"
)
findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	Call %EINSTI% Vic "6"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M %SVXCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% Vic "7"
	)
	Call %EINSTI% Vic "9"
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SMRD%>nul
if not errorlevel 1 (
	Call %EINST% fadingpromises "0"
)

findstr /I /M %SGTW%>nul && findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	findstr /I /M "DRIZZTSAGA.TP2~.*#.*#3./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% DrizztIsNotStupid "0"
	)
)

findstr /I /M "SandrahNPC_req" %CON%>nul
if errorlevel 1 (
	findstr /I /M %SCTW%>nul
	if not errorlevel 1 (
		findstr /I /M "3D.Acceleration=1" baldur.ini
		if not errorlevel 1 (
			Call %EINST% nogameover "100"
		)
	)
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINST% DungeonBeGone "0"

	%IFNS%NeJ3v71%IFNIF%DungeonBeGone%.exe Call %EINST% SkipChateauIrenicus "0"

	%IFNS%stratagems%IFNIF%BG1NPC.exe Call %EINSTI% parting "0 2"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "CnoPCVamp" %CON%>nul
	if errorlevel 1 (
		Call %EINST% pcvamp "0"
	)
	if %PREVIEW%==0 (
		%.%Don't worry about the "WARNING: cannot find block matching [pcvamp/BCS/priest.bcs]"; the code block to be replaced is not existing in these files. | %M%
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% Drows "0"
)

findstr /I /M %SKTW%>nul && findstr /I /M %SXPL%>nul
if not errorlevel 1 (
	findstr /I /M "Raziel_Worgas" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINST% Mortis "0"
		)
	) else (
		%IFS%Mortis.exe %TXT% | findstr @403 | Call %C%>> %E%
	)
)
:: not together with Worgas or Raziel (and maybe some other mods) because it causes the game to crash.

findstr /I /M %SBG1%>nul && findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINST% 7C#SARTWEAK "100 251"
)
%.%
%.%
%.%17. KITS | %M%
%.%
%.%
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	REM misc kits
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

	REM bard and thief kits

	Call %EINSTI% Conductor "0 1"

	Call %EINSTI% HarpScout "0 1 2"

	Call %EINSTI% Pirate "0 2 6"

	Call %EINST% lyric "0"

	Call %EINST% ChanterKit "0"

	Call %EINST% rogue-switch "0"

	REM ranger and paladin kits

	Call %EINST% A4Auror "0"

	%IFS%infinityanimations%IFIF%Bear_Animations_D2.exe Call %EINST% BearWalker "1" "0"

	Call %EINSTI% AvengerKit "0 1 2 3"

	Call %EINST% fr_ombre "0"

	Call %EINST% Storm "0"

	Call %EINST% zulu "0"

	REM druid and cleric kits

	Call %EINST% SilverFur "0"

	Call %EINST% PBhaal "0"

	Call %EINST% HeartwarderKit "0"
	
	Call %EINSTI% DruidicSorcererKit "0 1"

	Call %EINSTI% druidsor "0"
	
	Call %EINST% ScionMod "0"

	REM fighter kits

	Call %EINST% elven_pack "0"

	Call %EINST% morituri "0"

	Call %EINST% RetaliatorKit "0"

	Call %EINSTI% werewarrior "0 1"

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

	findstr /I /M %SINC%>nul
	if not errorlevel 1 (
		Call %EINST% d2ama "0"
		Call %EINST% d2asn "0 1"
		Call %EINST% d2bar "0"
		Call %EINST% d2nec "0"
		Call %EINST% d2pal "0"

		Call %EINST% Jedi_Sith "0"
	)
	
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
			Call %EINSTI% RPG-KP "3"
		)
	)

	Call %EINSTI% spstuff "0 1 2 3 6"
	%IFNS%refinements.exe Call %EINSTI% spstuff "5"
)
findstr /I /M %SITM%>nul && findstr /I /M %SEIS%>nul
if not errorlevel 1 (
	Call %EINST% spstuff "4"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
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
)
%.%
%.%
%.%18. TWEAKS AND HLA-TABLES CHANGING MODS | %M%
%.%
%.%
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% ashesofembers "5 6 7 8 9 10 11"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
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
)

:: install monks before

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Oversight "2"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Oversight "3"
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	findstr /I /M "multistronghold" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Oversight "5"
	) else (
		%IFS%Oversight.exe %TXT% | findstr @417 | Call %C%>> %E%
	)
)
findstr /I /M %SHTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Oversight "6"
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% Oversight "7"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Oversight "8"
	findstr /I /M "DW_LANTHORN.TP2~.*#.*#10./ DW_LANTHORN.TP2~.*#.*#20./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% Oversight "10"
	)
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINST% AnimalCompanions "0" "TYPE AnimalCompanions_input.txt"
)

:: install thieves and bards before

findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	findstr /I /M "CnoSaSWeap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% song_and_silence "0"
	)
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% song_and_silence "1"
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% song_and_silence "2 3 4 5 6 7 8 9 10"
)

:: install fighters before

findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% sword_and_fist "1"
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% sword_and_fist "30 31 32 34"
	findstr /I /M "CRylornNoKit" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% sword_and_fist "33"
	)
)

:: install druids, clerics, paladin and rangers before

findstr /I /M "SpellRevStrict" %CON%>nul
if errorlevel 1 (
	rem component 0 exists only in v7.1, component 10 or 11 exist only in v8
	findstr /I /M "NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Divine_Remix "0"
	)
	findstr /I /M %SSTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% Divine_Remix "11"
	)
	findstr /I /M %SHTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% Divine_Remix "100"
	)
	findstr /I /M %SKIT%>nul
	if not errorlevel 1 (
		Call %EINSTI% Divine_Remix "103 107 109 112 115 118 121 124 127 130"
		%IFNS%ViconiaRevamped.exe Call %EINSTI% Divine_Remix "106"
	)
	findstr /I /M %SHTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% Divine_Remix "200"
	)
	findstr /I /M %SKIT%>nul
	if not errorlevel 1 (
		Call %EINSTI% Divine_Remix "203 403 406 409 412 415 600"
	)
)
%IFS%divine_remix.exe (
	findstr /I /M "VERSION.*~8" .\divine_remix\setup-divine_remix.tp2>nul
	if not errorlevel 1 (
		Call %EINST% DR8_hotfix "0"
	)
)

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	Call %EINSTI% d0tweak "19"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "CSOBWPO" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% RR "0"
	)
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "CWeaProMod" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% RR "1"
	)
)
findstr /I /M %SHTW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "2 5"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "3"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "CWeaProMod" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% RR "4"
	)
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "6"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "7 8"
)
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "9"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "11"
)
findstr /I /M %SATW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "12"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% RR "999"
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr /I /M "btweak_Restr" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% ashesofembers "0"
	)
	Call %EINSTI% ashesofembers "2"
	findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% ashesofembers "3"
	)
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	%IFNS%wsr.exe Call %EINSTI% ashesofembers "4"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% ashesofembers "12"
)
%IF% ".\AshesofEmbers\Backup\12\slmage1.cre" copy /Y ".\AshesofEmbers\Backup\12\slmage1.cre" ".\override" | %M% 
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	%IFNS%btweak%IFNIF%btweak_lite.exe Call %EINSTI% ashesofembers "16 17"
	Call %EINSTI% ashesofembers "18 19 20 21"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% Tactics "26"
	findstr /I /M "CRylornNoKit" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Tactics "27"
	)
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
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
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% BardSong_BG2_IWD "0"
)

findstr /I /M "ASHESOFEMBERS.TP2~.*#.*#4./ KONTWK.TP2~.*#.*#0./ KITANYA.TP2~.*#.*#1./" %ELOG%>nul
if errorlevel 1 (
	findstr /I /M %SKTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% wsr "100"
	)
	findstr /I /M %SHTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% wsr "200"
	)
	findstr /I /M %SITW%>nul
	if not errorlevel 1 (
		Call %EINSTI% wsr "302 999"
	)
) else (
	%IFS%WSR.exe %TXT% | findstr @386 | Call %C%>> %E%
)

findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	Call %EINSTI% celestiales "0 1 2"
)

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

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	call %EINSTI% item_rev "0"
)

findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
if errorlevel 1 (
	Call %EINSTI% 1pp "203 204 205 206 207 208"
)
Call %EINSTI% 1pp "210 300 301"

findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% VCv21 "20"
)

%IFNS%VCv21.exe Call %EINSTI% BDToBv175 "8"

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINST% W_3kradziej "0 1"
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	findstr /I /M "NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% spell_rev "0"
	)

	findstr /I /M "SpellRevStrict NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		if %PREVIEW%==0 (
			%IFS%SpellPackB6.exe (
				copy .\SpellPackB6\SpellsAndEffects\Priest\Level03\ADD_SPELL\*.* .\override | %M%  & rem These files are randomly not copied even if they are existing.
				copy ".\%BWFP%\_override\SpellPackB5\*.*" ".\override" | %M% & rem These files are missing.
			)
		)
		Call %EINSTI% SpellPackB6 "1116 1119 1113 1105 1131 1106 1109 1110 1151 1217 1223 1203 1206 1242 1243 1246 1250 1211 1213 1302 1328 1336 1313 1309 1310 1347 1348 1350 1351 1353 1354 1361 1419 1422 1427 1431 1405 1449 1453 1458 1459 1518 1503 1517 1506 1535 1539 1540 1541 1515 1544 1603 1621 1628 1637 1614 1645 1720 1705 1740 1743 1716 1728 2102 2103 2104 2117 2105 2107 2119 2116 2125 2217 2204 2238 2224 2240 2207 2211 2253 2213 2219 2331 2304 2303 2317 2305 2307 2308 2314 2315 2401 2402 2412 2404 2405 2450 2413 2459 2425 2501 2508 2502 2503 2506 2511 2514 2505 2549 2615 2614 2616 2619 2607 2648 2731 2736 2721 2716 2743 2714 2812 2821 2827 2810 2814 2915 2911 2912 2909 2913"
		%IFNS%stratagems.exe Call %EINSTI% SpellPackB6 "2203 2605 2713"
		)
	)

	findstr /I /M "ImprSummons SpellRev NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Spell50 "0 1 2"
	) else (
		%IFS%Spell50.exe %TXT% | findstr @128 | Call %C%>> %E%
	)
)

findstr /I /M %SSPL%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	findstr /I /M "SpellPack" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% WildMage "0 3 4"
		findstr /I /M %SKIT%>nul
		if not errorlevel 1 (
			Call %EINSTI% WildMage "1"
		)
	) else (
		%IFS%WildMage.exe %TXT% | findstr @415 | Call %C%>> %E%
	)
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINST% semi_multi_clerics "0"
)

findstr /I /M %SCOM%>nul
if not errorlevel 1 (
	Call %EINST% fairydragon "0"

	Call %EINST% WTPFamiliars "0"
)

findstr /I /M %SSPL%>nul && findstr /I /M %SSIS%>nul
if not errorlevel 1 (
	findstr /I /M "SandrahNPC_req" %CON%>nul
	if errorlevel 1 (
		call %EINSTI% Teleport "0 1"
	)
)

Call %EINSTI% infinityanimations "0"

findstr /I /M %SDTW%>nul && findstr /I /M %SSPL%>nul && findstr /I /M %SBET%>nul
if not errorlevel 1 (
	findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% iwdification "40"
	)
	Call %EINSTI% iwdification "30 60"
	%IFNS%BardSong_BG2_IWD.exe Call %EINSTI% iwdification "50"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINST% phord_druidkits "0"
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Z#Misc "1"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Z#Misc "17 18 19"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% Derats_kits "7"
)

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1c
)
findstr /I /M "CnoSandrah" %CON%>nul && findstr /I /M "SandrahNPC_skp" %CON%>nul
if errorlevel 1 (
	Call ".\%BWIPI%\BGTTweak.bat"
)
%IFS%BP-Balancer.exe Call %EINSTI% BGTTweak "1900"

:SKIPBG1c

findstr /I /M "CNoNPCStrong" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% NPC_Strongholds "0"
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% c#brandock "0"

	Call %EINST% c#husam "0 1 10"
)

%IFI% Call %EINSTI% Turambar_fixes_tweaks "10"
findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	Call %EINSTI% Turambar_fixes_tweaks "11 12 13 14 15 16 17 18 1055 1060 2000 2003"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Turambar_fixes_tweaks "2004 2005 2007 2010 2020 2023"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "DIVINE_REMIX.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		findstr /I /M "DRSPHERE" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% Turambar_fixes_tweaks "4010 4020"
		)
	)
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% ViconiaRevamped "0 60 70"
)
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

	Call %EINST% mwyvmtan "10 20" & rem this causes the game to crash immediately

	Call %EINST% Bear_Animations_D2 "0"
)

findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M %SCOR%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "2 26 27 29"
	)
	findstr /I /M %SRES%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 33"
		findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% JA#BGT_AdvPack "10"
		)
	)
	findstr /I /M %SSMQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %STRD%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "1 30 31 34 35 36 39"
		findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% JA#BGT_AdvPack "28 37"
		)
	)
	findstr /I /M %SBPC%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "32"
	)
	findstr /I /M %SCOS%>nul
	if not errorlevel 1 (
		Call %EINSTI% JA#BGT_AdvPack "38 100"
	)
)

findstr /I /M %SMEQ%>nul && findstr /I /M %SSTQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINST% tidings "0"
)

%IF% .\mih_eq\ssl\ssl.exe goto :miheqssl
:: This mod's components are not named consistently.
if %PREVIEW%==0 (
	rem %IFS%mih_eq.exe copy /Y ".\mih_eq\shared\new_monsters\scripts\mh#huecu.ssl" ".\mih_eq\shared\new_monsters\scripts\mh#huecu.baf" | %M%	
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M "Erevain" %CON%>nul
	if errorlevel 1 (
		Call %EINST% mih_eq "3"
	)
	rem the conflict with Erevain only exists with mih_eq v3
	Call %EINST% mih_eq "0 1 2 4 5 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27"
)
goto :skpmiheq

:miheqssl
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% mih_eq "101 103 104 105 106 107 143 156"
	%IFNS%polytweak.exe Call %EINST% mih_eq "108"
)
findstr /I /M %SSMQ%>nul
if not errorlevel 1 (
	Call %EINST% mih_eq "111 114 118 159"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINST% mih_eq "109 112 113 115 116 117 119 128 130 131 132 133 134 135 136 137 138 139 141 142 148 149 150 154 155 157"
)
:skpmiheq

findstr /I /M %SLAQ%>nul && findstr /I /M %STAC%>nul && findstr /I /M %SHVXCH%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% vecna "0"
	)
)

findstr /I /M %SNPC%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% aurora "0 10"
)

Call ".\%BWIPI%\define_BIG.bat"

:: Call %EINSTI% aurora "40 60"
:: Does not work correctly; no mousepointer finger

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr "0 1" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% aurora "115 170 215 247 420 470"
	)
	findstr "2 3 4 5 6 7" count2.txt
	if not errorlevel 1 (
		Call %EINSTI% aurora "105 180 210 247 420 467"
	)
)
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aurora "500"
)
findstr /I /M %SCOR%>nul && findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% aurora "520"
)
%IFNS%infinityanimations.exe Call %EINSTI% aurora "9000"

findstr /I /M "AURORA.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% tobaurora "0"
)

findstr /I /M %SCOM%>nul
if not errorlevel 1 (
	Call %EINSTI% Haiass "0 10"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% TB#KITS "0"
	findstr /I /M "HAIASS.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% TB#KITS "1"
	)
)

%IFN% .\DSotSC\modify\dlg\BLANE.d GOTO :SKIPSAND
findstr /I /M "CnoSandrah" %CON%>nul && findstr /I /M "SandrahNPC_skp" %CON%>nul && findstr /I /M "CRylornNoBig" %CON%>nul
if errorlevel 1 (
	findstr /I /M %SNPC%>nul && findstr /I /M %SLAQ%>nul && findstr /I /M %SNRD%>nul && findstr /I /M %SBET%>nul
	if not errorlevel 1 (
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

findstr /I /M %SFUN%>nul
if not errorlevel 1 (
	Call %EINST% G3Anniversary "0"
)

findstr /I /M %SCOM%>nul
if not errorlevel 1 (
	Call %EINST% c#greythedog "0"

	Call %EINST% DjinniCompanion "0"
	findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINST% DjinniCompanion "900"

		Call %EINST% w_packmule "0" "1"
	)
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINST% The_Old_Gold "100"
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
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
		) else (
			%IFS%spell_rev.exe %TXT% | findstr @318 | Call %C%>> %E%
		)
	)
)

findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Pack "0 1"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Pack "2 3"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Pack "4 5"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Pack "6 7"
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% Item_Pack "8"
	)
	findstr /I /M "TOBEX.TP2~.*#.*#100./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% Item_Pack "9"
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% trap_rev "0"
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		%IFS%cursed_items.exe copy ".\cursed_items\itm\IR\HELM02_.ITM" ".\override" | %M%
	)
	Call %EINSTI% cursed_items "0 10"
)

findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	Call %EINSTI% item_rev "3"
	findstr /I /M "Fullplate" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% item_rev "9"
	) else (
		%IFS%item_rev.exe %TXT% | findstr @440 | Call %C%>> %E%
	)
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% item_rev "10 11 12"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "CWeaProMod" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% item_rev "1093"
	)
)
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% item_rev "15"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% item_rev "17 18"

	Call %EINSTI% freeact "10"
	findstr /I /M "ITEM_REV.TP2~.*#.*#0./ SPELL_REV.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% freeact "50"
	) else (
		%IFS%freeact.exe %TXT% | findstr @359 | Call %C%>> %E%
	)

	if %PREVIEW%==0 (
		echo 1413 CLERIC_NEGATIVE_PLANE_PROTECTION>> override/spell.ids
	)
)

findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "ITEMREVS" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% fullplate "1 102 204"
	)
)

findstr /I /M %STAC%>nul && findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINSTI% HardTimes "0 1"
)

findstr /I /M %SPOR%>nul
if not errorlevel 1 (
	Call %EINSTI% NSCPortraits "0 1 10 20 21 30 50 300 305 310 1000 1001 1030 1031 1050 1051 1300 1310 1320 1330 1340 1350 1360 1370 1380 1390 1400 1410 1420 1430 1440 1450 1470 1480 1490 1500 1510 1520 1530 1540 1550 1580 1590 1600 1780 2000 2010 3000 3010 5000 5010"
)

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	rem Call %EINSTI% tb#tweaks "2050"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tb#tweaks "3550"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% BGII-Subrace "0 1"
)

findstr /I /M "C#SOLAUFEIN.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINST% c#solaufein "2 4"
)

findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% might_and_guile "50 125 130 151 155 165 230"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "CWeaProMod" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% might_and_guile "245"
		findstr /I /M "CMaGwithKit6" %CON%>nul
		if errorlevel 1 (
			Call %EINSTI% might_and_guile "205"
		)
		Call %EINSTI% might_and_guile "235 265 290"
	)
)
findstr /I /M %SKIT%>nul
if not errorlevel 1 (
	Call %EINSTI% might_and_guile "450 470 480 490"
)

findstr /I /M %SBG1%>nul
if errorlevel 1 (
	GOTO :SKIPBG1d
)
findstr /I /M %SCOS%>nul
if not errorlevel 1 (
	%IFG% Call %EINSTI% JA#BGT_Tweak "0"
)
findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "6 9"

)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "10 11 12 13"
	findstr /I /M "NPC_TWEAK.TP2~.*#.*#1./ PHORD_DRUIDKITS.TP2~.*#.*#1./ " %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% JA#BGT_Tweak "14"
	) else (
		%IFS%JA#BGT_TWEAK.exe %TXT% | findstr @367 | Call %C%>> %E%
	)
)
findstr /I /M %SCOS%>nul
if not errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "22"
	%IFG% Call %EINSTI% JA#BGT_Tweak "23"
)
findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "20 21 24 25 26 27 28 29 31"
)
findstr /I /M %SCOS%>nul
if not errorlevel 1 (
	Call %EINSTI% JA#BGT_Tweak "32"
)
:SKIPBG1d

:: correction of mismatching "Face" arguments caused by various mods 
Call %EINST% face_directions "0"

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINST% ua "0 1 2 3"

	Call %EINSTI% randomiser "510" "10"
	Call %EINSTI% randomiser "1300" "Y"
	Call %EINSTI% randomiser "5005 5015 5025 5035 5045 5055 5065 5075 5085 9000"
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		Call %EINSTI% randomiser "10200"
	)
	Call %EINSTI% randomiser "10210 10300"
)

findstr /I /M %SKTW%>nul
if not errorlevel 1 (
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
)

findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	%MAC% Call %EINSTI% cdtweaks "120"
	Call %EINSTI% cdtweaks "60 70 110 140 201"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "130 1010 1020"
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "1040"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	findstr /I /M "ZVA.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1075"
	)
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "1090 1120 1125"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "BGT.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		findstr /I /M "BGTTweak.TP2~.*#.*#2800./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% cdtweaks "1130"
		)
	)
	%IFNS%refinements.exe Call %EINSTI% cdtweaks "1150"
	findstr /I /M "NPC_STRONGHOLDS.TP2~.*#.*#0./ CLIFFHISTORY.TP2~.*#.*#0./ OVERSIGHT.TP2~.*#.*#5./ MULTISTRONGHOLD.TP2~.*#.*#./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1161"
	) else (
		%IFS%cdtweaks.exe %TXT% | findstr @335 | Call %C%>> %E%
	)
	findstr /I /M "FR_ROV.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1170"
	) else (
		%IFS%cdtweaks.exe %TXT% | findstr @336 | Call %C%>> %E%
	)
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	findstr /I /M "EDWINROMANCE.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "1180"
	)
)
findstr /I /M %SLMCH%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "1220 1230"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% cdtweaks "1270"
	findstr /I /M "CNPCStrong" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "CliffHistory" %CON%>nul
		if errorlevel 1 (
			Call %EINST% cdtweaks "1340"
		)
		Call %EINST% cdtweaks "1341 1342 1343 1344 1345 1346 1347"
	)
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "CSOBWPO" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "2040"
	)
)
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "2090"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr /I /M "CnoCDTWeap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% cdtweaks "2160"
	)
	Call %EINSTI% cdtweaks "2192"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	%IFNS%refinements.exe Call %EINSTI% cdtweaks "2200"

	findstr /I /M "CSOBWPO" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "TDD.TP2~.*#.*#0./ BP.TP2~.*#.*#50./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% cdtweaks "2210"
		) else (
			%IFS%cdtweaks.exe %TXT% | findstr @337 | Call %C%>> %E%
		)
		REM components 2240, 2250, 2260, 2270, 2280, 2290 will be skipped, if one of the conflicting mods is installed
		Call %EINSTI% cdtweaks "2240 2250"
		findstr /I /M %SPTW%>nul
		if errorlevel 1 (
			Call %EINSTI% cdtweaks "2260 2270 2280 2290"
		) else (
			Call %EINSTI% cdtweaks "2261 2271 2281 2291"
		)
	)
)
findstr /I /M %SHTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "2300"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "2320 2330 2340"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "2500 2530"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "3008 3050 3060 3115 3125 3230"
	%IFNS%virtue.exe Call %EINSTI% cdtweaks "3121"
)
findstr /I /M %SCTK%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "3031 3190"
)
Call %EINSTI% cdtweaks "3220"
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% cdtweaks "3010 3330 4000 4010 4025 4031 4041 4050 4061 4071 4100 4110 4150 4170"
	%IFNS%level1npcs.exe Call %EINSTI% cdtweaks "4020"
)

findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	findstr /I /M "SPELL_REV.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% d0tweak "0"
	) else (
		%IFS%d0tweak.exe %TXT% | findstr @339 | Call %C%>> %E%
	)
	Call %EINSTI% d0tweak "4 5 6"
	findstr /I /M "ITEM_REV.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% d0tweak "11"
	) else (
		%IFS%d0tweak.exe %TXT% | findstr @357 | Call %C%>> %E%
	)
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	findstr /I /M "ITEM_REV.TP2~.*#.*#18./ ITEM_REV.TP2~.*#.*#19./ ITEM_REV.TP2~.*#.*#20./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% d0tweak "18"
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "CImoen4Ever" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% ImoenIsStone "0"
	)
)

findstr /I /M %SSMQ%>nul && findstr /I /M %SNRD%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "0 1"
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "2"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "3"
	findstr /I /M "RECARGA.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% RezMod "4"
	)
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% RezMod "100 101 102 103 104 105 106 107 108"
	findstr /I /M "TOBEX.TP2~.*#.*#118./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% RezMod "109"
	)
)

:: change temporary the language numbers
%IF% BWIP_English call "%BWIPFIX%"\NMTP_language.bat"
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% NMTP "0 2"
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMTP "3 4 5"

		Call %EINST% NML "0"
	)
)


if %PREVIEW%==0 (
	%IFS%w_psionics_unleashed.exe Call ".\%BWIPFIX%\edit_string_w_psionics.bat"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M %SBET%>nul
	if not errorlevel 1 (
		Call %EINSTI% w_psionics_unleashed "10 61"
	)
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% hammers "0 15 25 35 50"
)

findstr /I /M "REVISEDBATTLES.TP2~.*#.*#24./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		type B#BLADEstring.txt>> ./override/kit.ids
		echo 1408 CLERIC_PROTECTION_FROM_EVIL_10_FOOT>> override/spell.ids
	)
)

findstr /I /M %SHTW%>nul
if not errorlevel 1 (
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
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% refinements "30"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% refinements "40"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	rem Call %EINSTI% refinements "50"
)

findstr /I /M %SKIT%>nul && findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "CMaGnoKit6 CnoKP6Weap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Kitpack6 "0 6"
	)
	findstr /I /M "CnoVicWeap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Vic "8"
	)
)

findstr /I /M %SDTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "324"
)

:: correct temporary the language numbers
if %PREVIEW%==0 (
	findstr /C:" - last updated version 3" stratagems\setup-stratagems.tp2>nul
	if errorlevel 1 goto :skpscsla
	findstr /C:"Spanish translation commented out" stratagems\setup-stratagems.tp2>nul
	if not errorlevel 1 call "%BWIPFIX%"\scs_language.bat"
)
:skpscsla

Call %EINSTI% stratagems "1000"
REM SCSv32 only
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "1901"
	findstr /I /M "NEJHalruaa" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "1910 2000 2010 2020 2030 2041 2060 2070 2080 2090 2100 2110 2120 2130 2140 2150 2170 2180 3030"
		REM components 2000 2020 2030 2040 2041 2060 2070 2080 2090 2100 2140 2150 will be skipped automatically if "Spell Revisions" is installed.
		findstr /I /M "ITEM_REV.TP2~.*#.*#1030./" %ELOG%>nul
		if errorlevel 1 (
			rem call %EINSTI% stratagems "2160"
		)
	)
)
REM all components above are SCSv31 only
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsss1
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "2900"
	REM SCSv32 only
)
:skscsss1
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr /I /M "CSOBIWO" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "3010 3022"
		REM both versions
	)
	Call %EINSTI% stratagems "3041 3060 3070 3080 3090 3110"
	REM components 3050 3060 3070 3080 3090 3100 3110 will be skipped automatically if "Spell Revisions" is installed
	REM all components above are SCSv31 only except component 3041 
)
findstr /I /M %SITM%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "3501"
	REM SCSv32 only
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "3541 3551"
	REM SCSv32 only
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "4000 4010 4020"
	REM component 4010 only exist in SCSv31
	%IFNS%level1npcs.exe call %EINSTI% stratagems "4099"
	REM SCSv32 only
	REM the foolwing components are identical in both versions
	findstr /I /M %SCTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4160 4170"
	)
	findstr /I /M %SETK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4050 4161 4171"
	)
	findstr /I /M %SSTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4051 4162 4172"
	)
	findstr /I /M %SHTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4052 4163 4173"
	)
	findstr /I /M %SXTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4053 4164 4174"
	)
	Call %EINSTI% stratagems "4146 4180 4200 4210 4217 4230"
	REM components 4180 4200 only exist in SCSv31
	findstr /I /M %SHTW%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "4240"
	)
)
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsss2
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "5000"
	REM component 5000 exists in both versions
)
:skscsss2
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "5020 5030 5070"
	REM components 5020 and 5030 are SCSv31 only, 5070 is SCSv32 only
)
findstr /I /M "32-bit" %IPL%>nul
if not errorlevel 1 (
	%IF% .\stratagems\ssl\ssl.exe goto :skscsssl
)

:: SCS AI
findstr /I /M %SATW%>nul
if not errorlevel 1 (
	Call %EINSTI% stratagems "5900"
	REM both versions
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
		REM call components 5900 - 6010 separately to avoid "out of memory"
	)
)
findstr /I /M %STAC%>nul && findstr /I /M %SHTW%>nul
if not errorlevel 1 (
	findstr /I /M "BP_AI" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "Tactics.TP2~.*#.*#10./" %ELOG%>nul
		if errorlevel 1 (
			findstr /I /M %SLCH%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6020"
			)
			findstr /I /M %SMCH%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6021"
			)
			findstr /I /M %SHCH%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6022"
			)
			findstr /I /M %SVCH%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6023"
			)
			findstr /I /M %SXCH%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6024"
			)
			REM components 6020 - 6024 exist only in v31
		)
	)
)
findstr /I /M %SATW%>nul
if not errorlevel 1 (
	findstr /I /M "BP_AI" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "Tactics.TP2~.*#.*#10./" %ELOG%>nul
		if errorlevel 1 (
			%IF% stratagems/iwdspells (
			rem only for detecting which version is existing
				Call %EINSTI% stratagems "6030 6040"
			) else (
				findstr /I /M %SCTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6034 6044"
				)
				findstr /I /M %SETK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6033 6043"
				)
				findstr /I /M %SSTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6032 6042"
				)
				findstr /I /M %SHTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6031 6041"
				)
				findstr /I /M %SXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6030 6040"
				)
			)
		)
	)
	%IF% stratagems/iwdspells (
		Call %EINSTI% stratagems "6100"
	) else (
		findstr /I /M %SCTK%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6100"
		)
		findstr /I /M %SETK%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6101"
		)
		findstr /I /M %SSTK%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6102"
		)
		findstr /I /M %SHTK%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6103"
		)
		findstr /I /M %SXTK%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6104"
		)
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
		) else (
			%IFS%stratagems.exe %TXT% | findstr @420 | Call %C%>> %E%
		)
		findstr /I /M "Tactics.TP2~.*#.*#12./ BP.TP2~.*#.*#2200./" %ELOG%>nul
		if errorlevel 1 (
			findstr /I /M "STRATAGEMS.TP2~.*#.*#603../ STRATAGEMS.TP2~.*#.*#604../" %ELOG%>nul
			if not errorlevel 1 (
				%IF% stratagems/iwdspells (
					Call %EINSTI% stratagems "6510"
				) else (
					findstr /I /M %SHXTK%>nul
					if not errorlevel 1 (
						Call %EINSTI% stratagems "6510"
					)
					findstr /I /M %SESTK%>nul
					if not errorlevel 1 (
						Call %EINSTI% stratagems "6511"
					)
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @421 | Call %C%>> %E%
		)
		%IF% stratagems/iwdspells (
			Call %EINSTI% stratagems "6520"
		) else (
			findstr /I /M %SHXTK%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6520"
			)
			findstr /I /M %SESTK%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6521"
			)
		)
		findstr /I /M "replace_SCS_6000" %CON%>nul
		if errorlevel 1 (
			findstr /I /M %SHXTK%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6530"
			)
			findstr /I /M %SESTK%>nul
			if not errorlevel 1 (
				Call %EINSTI% stratagems "6531"
			)
			REM components 6030 - 6031 exist only in v31
		)
		findstr /I /M "Tactics.TP2~.*#.*#22./" %ELOG%>nul
		if errorlevel 1 (
			%IF% stratagems/iwdspells (
				Call %EINSTI% stratagems "6540"
			) else (
				findstr /I /M %SHXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6540"
				)
				findstr /I /M %SESTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6541"
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @422 | Call %C%>> %E%
		)
		findstr /I /M "Tactics.TP2~.*#.*#23./" %ELOG%>nul
		if errorlevel 1 (
			%IF% stratagems/iwdspells (
				Call %EINSTI% stratagems "6550"
			) else (
				findstr /I /M %SETK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6551"
				)
				findstr /I /M %SSTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6550"
				)
				findstr /I /M %SHTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6553"
				)
				findstr /I /M %SXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6552"
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @423 | Call %C%>> %E%
		)
		findstr /I /M "Tactics.TP2~.*#.*#21./" %ELOG%>nul
		if errorlevel 1 (
			%IF% stratagems/iwdspells (
				Call %EINSTI% stratagems "6560"
			) else (
				findstr /I /M %SETK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6562"
				)
				findstr /I /M %SSTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6563"
				)
				findstr /I /M %SHTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6560"
				)
				findstr /I /M %SXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "6561"
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @424 | Call %C%>> %E%
		)
		Call %EINSTI% stratagems "6570"
	)
	findstr /I /M "DEVIN.TP2~.*#.*#0./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "6580"
	) else (
		%IFS%stratagems.exe %TXT% | findstr @442 | Call %C%>> %E%
	)
	Call %EINSTI% stratagems "6590"
	findstr /I /M %STAC%>nul
	if not errorlevel 1 (
		findstr /I /M "ASCENSION.TP2~.*#.*#0./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6800 6810 6820 6830 6850" & rem Ascension components
		)
		findstr /I /M "STRATAGEMS.TP2~.*#.*#603../" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% stratagems "6840"
		)
	)
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
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
		) else (
			%IFS%stratagems.exe %TXT% | findstr @426 | Call %C%>> %E%
		)
	)
	findstr /I /M "Tactics.TP2~.*#.*#37./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "8030"
		REM v31 only
	) else (
		%IFS%stratagems.exe %TXT% | findstr @427 | Call %C%>> %E%
	)
	findstr /I /M "BP_Encount" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "Tactics.TP2~.*#.*#16./ Tactics.TP2~.*#.*#25./ Tactics.TP2~.*#.*#34./" %ELOG%>nul
		if errorlevel 1 (
			%IF% stratagems/iwdspells (
				Call %EINSTI% stratagems "8040"
			) else (
				findstr /I /M %SETK%>nul
				if errorlevel 1 (
					Call %EINSTI% stratagems "8040"
				)
				findstr /I /M %SSTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "8041"
				)
				findstr /I /M %SHTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "8042"
				)
				findstr /I /M %SXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "8043"
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @428 | Call %C%>> %E%
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
				findstr /I /M %SESTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "8060"
				)
				findstr /I /M %SHXTK%>nul
				if not errorlevel 1 (
					Call %EINSTI% stratagems "8061"
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @430 | Call %C%>> %E%
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
						findstr /I /M %SESTK%>nul
						if not errorlevel 1 (
							Call %EINSTI% stratagems "8080"
						)
						findstr /I /M %SHXTK%>nul
						if not errorlevel 1 (
							Call %EINSTI% stratagems "8081"
						)
					)
				)
			)
		) else (
			%IFS%stratagems.exe %TXT% | findstr @432 | Call %C%>> %E%
		)
		findstr /I /M "Tactics.TP2~.*#.*#5./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% stratagems "8100"
		) else (
			%IFS%stratagems.exe %TXT% | findstr @433 | Call %C%>> %E%
		)
	)
	findstr /I /M "Tactics.TP2~.*#.*#3./" %ELOG%>nul
	if errorlevel 1 (
		call %EINSTI% stratagems "8110"
	) else (
		%IFS%stratagems.exe %TXT% | findstr @434 | Call %C%>> %E%
	)
	call %EINSTI% stratagems "8070"
	findstr /I /M %SHTK%>nul
	if not errorlevel 1 (
		call %EINSTI% stratagems "8141"
	)
	findstr /I /M %SXTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% stratagems "8140"
	)
	findstr /I /M "BP_Encount" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% stratagems "8150"
	) else (
		%IFS%stratagems.exe %TXT% | findstr @443 | Call %C%>> %E%
	)
	Call %EINSTI% stratagems "8090 8120 8160 8170 8190"
)
:skscsssl

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr /I /M "CNoSOBIWO" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% scales_of_balance "101"
	)
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "CnoSoBWeap" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% scales_of_balance "121"
	)
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M %SLMCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% scales_of_balance "206"
	)
	findstr /I /M %SHVXCH%>nul
	if not errorlevel 1 (
		Call %EINSTI% scales_of_balance "207"
	)
)
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	findstr /I /M "CHidekit" %CON%>nul && findstr /I /M "CSkipSoBHideKit" %CON%>nul 
	if errorlevel 1 (
		Call %EINSTI% scales_of_balance "210"
	)
)
Call %EINSTI% scales_of_balance "109 160 202 2123 227"

findstr /I /M %SCOR%>nul
if not errorlevel 1 (
	call %EINSTI% jimfix "0 1 2 3 4 5 100"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	call %EINSTI% jimfix "400 201"
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	call %EINSTI% jimfix "300 600"
)

findstr /I /M %SCTK%>nul
if not errorlevel 1 (
	call %EINSTI% jimfix "500"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% mih_eq "151"
)

findstr /I /M %SRES%>nul && findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	Call %EINST% thecalling "0"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% NMR "0 1 2 3 4 5 6 7 8"
)

findstr /I /M "NMR.TP2~.*#.*#0./ NMR.TP2~.*#.*#1./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M %SXTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMR-Happy "0"
	)
	findstr /I /M %SHTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMR-Happy "1"
	)
	findstr /I /M %SSTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMR-Happy "2"
	)
	findstr /I /M %SETK%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMR-Happy "3"
	)
	findstr /I /M %SCTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMR-Happy "4"
	)
) else (
	%IFS%NMR-Happy.exe %TXT% | findstr @366 | Call %C%>> %E%
)

:: BP AI
%IFNS%bpseries.exe Call %EINSTI% BP "10"
findstr /I /M %SATW%>nul
if not errorlevel 1 (
	Call %EINSTI% BP "325 440 475 550 625 675 725 750 760 800 875 900 925" & rem no equivalent in SCS
	findstr /I /M "SCS_AI" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% BP "350 375 390 400 425 500 525 575 600 650 700 150" & rem similar function also in SCS
	) else (
		%IFS%BP.exe %TXT% | findstr @444 | Call %C%>> %E%
	)
	findstr /I /M "replace_SCS_6000" %CON%>nul
	if not errorlevel 1 (
		Call %EINSTI% BP "350 375 500 525 575 600 150"
	)
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	findstr /I /M "BP.TP2~.*#.*#150./" %ELOG%>nul
		if not errorlevel 1 (
		Call %EINSTI% BP "175"
	)
)
findstr /I /M %SHCH%>nul
if not errorlevel 1 (
	findstr /I /M "SCS_Encount" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "BP.TP2~.*#.*#150./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% BP "1000"
		)
	) else (
		%IFS%BP.exe %TXT% | findstr @445 | Call %C%>> %E%
	)
)

findstr /I /M %STAC%>nul
if not errorlevel 1 (
	Call %EINST% Volcano "0"
)

findstr /I /M %SVXCH%>nul && findstr /I /M %SXPL%>nul
if not errorlevel 1 (
	findstr /I /M "BP_Encount" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% Tactics "19"
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% Turambar_fixes_tweaks "2050 2052"
)

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "100 101 102 103 110 115 125 130 140"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	findstr /I /M "KONTWK.TP2~.*#.*#9./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% aTweaks "120"
	) else (
		%IFS%aTweaks.exe %TXT% | findstr @360 | Call %C%>> %E%
	)
)
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "104 160 180 185 190"
	findstr /I /M "STRATAGEMS.TP2~.*#.*#603../ STRATAGEMS.TP2~.*#.*#651../" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% aTweaks "152 155 156"
	)
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "186 191 200 201 202 203 204 205 210 211 212"
)
findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "213 216 218"
)
findstr /I /M %SCPT%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "220 230 239"
)
Call %EINST% XP-info
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "261 270"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "301 302 310"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% aTweaks "315 500 510 999"
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% scales_of_balance "232"
)

findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% polytweak "50"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% polytweak "60 70 80 83 85"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	findstr /I /M "CSOBWPO" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% polytweak "97"
	)
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% polytweak "100 150 201 300 401 500 600 700"
)
Call %EINSTI% polytweak "800"
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% polytweak "900"
)

Call %EINST% XP-info
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
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
	
	findstr /I /M %SBG1%>nul
	if not errorlevel 1 (
		findstr /I /M "ATWEAKS.TP2~.*#.*#261./" %ELOG%>nul
		if not errorlevel 1 (
			Call %EINSTI% BP-Balancer "1 6 11"
		) else (
			Call %EINSTI% BP-Balancer "2 7 12"
		)
	)

	findstr /I /M "cdtweaks.TP2~.*#.*#2090./ cdtweaks.TP2~.*#.*#2091./ cdtweaks.TP2~.*#.*#2092./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% EET_Tweaks "2002"
	)
	Call %EINST% XP-info
	findstr /I /M "XPMOD.TP2~.*#.*#7./ XPMOD.TP2~.*#.*#8./ XPMOD.TP2~.*#.*#9./ XPMOD.TP2~.*#.*#10./ XPMOD.TP2~.*#.*#11./ XPMOD.TP2~.*#.*#12./ XPMOD.TP2~.*#.*#13./ BP-BALANCER.TP2~.*#.*#1./ BP-BALANCER.TP2~.*#.*#2./ BP-BALANCER.TP2~.*#.*#3./ BP-BALANCER.TP2~.*#.*#4./ BP-BALANCER.TP2~.*#.*#5./ BP-BALANCER.TP2~.*#.*#6./ BP-BALANCER.TP2~.*#.*#7./ BP-BALANCER.TP2~.*#.*#8./ BP-BALANCER.TP2~.*#.*#9./ BP-BALANCER.TP2~.*#.*#10./ BP-BALANCER.TP2~.*#.*#11./ BP-BALANCER.TP2~.*#.*#12./ BP-BALANCER.TP2~.*#.*#13./ BP-BALANCER.TP2~.*#.*#14./ BP-BALANCER.TP2~.*#.*#15./" %ELOG%>nul
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
	Call %EINSTI% EET_Tweaks "2070"
)
findstr /I /M %SPTW%>nul
if not errorlevel 1 (
	Call %EINSTI% EET_Tweaks "3010"
)

findstr /I /M %SITW%>nul
if not errorlevel 1 (
	findstr /I /M %SHTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% DiffTweak "8 15 22"
	)
	findstr /I /M %SSTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% DiffTweak "10 17 24"
	)
	findstr /I /M %SETK%>nul
	if not errorlevel 1 (
		Call %EINSTI% DiffTweak "12 19 26"
	)
	findstr /I /M %SCTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% DiffTweak "14 21 28"
	)
)
findstr /I /M %STAC%>nul
if not errorlevel 1 (
	findstr /I /M "STRATAGEMS.TP2~.*#.*#0./ BP.TP2~.*#.*#0./ TACTICS.TP2~.*#.*#./" %ELOG%>nul
	if errorlevel 1 (
		findstr /I /M %SLCH%>nul
		if errorlevel 1 (
			Call %EINSTI% DiffTweak "29 35"
		)
		findstr /I /M %SMCH%>nul
		if errorlevel 1 (
			Call %EINSTI% DiffTweak "30 36"
		)
		findstr /I /M %SHCH%>nul
		if not errorlevel 1 (
			Call %EINSTI% DiffTweak "31 38"
		)
		findstr /I /M %SVCH%>nul
		if not errorlevel 1 (
			Call %EINSTI% DiffTweak "32 40"
		)
		findstr /I /M %SXCH%>nul
		if not errorlevel 1 (
			Call %EINSTI% DiffTweak "33 41"
		)
	)
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% iiSpellSystemAdjustments "0" "3 30 11 4 Y 2"
	Call %EINSTI% iiSpellSystemAdjustments "1" "3 30 326 105 Y 2"
)
findstr /I /M %SXTW%>nul
if not errorlevel 1 (
	Call %EINSTI% iiSpellSystemAdjustments "2" "1 5 50 10 100 15 150 20 200 25 250 30 300 35 350 40 400 45 450"
	Call %EINSTI% iiSpellSystemAdjustments "3" "1 5 50 10 100 15 150 20 200 25 250 30 300 35 350"
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINST% iiProjectileR "2002" "2 2 60 2 70 2 50 2 70 2 80 2 90"

	Call %EINST% iiLearnThroughuse "2001" "10 20 40 80 160 0"
)

findstr /I /M %SCPT%>nul
if not errorlevel 1 (
	findstr /I /M "ImprSummons SpellRev" %CON%>nul
	if errorlevel 1 (
		Call %EINST% gMinion "0"
	) else (
		%IFS%gMinion.exe %TXT% | findstr @147 | Call %C%>> %E%
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "Spell50_gMinion SpellRev" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% ImprovedSummons "0 1 2 3 4 5 6 7 8 9 10"
	) else (
		%IFS%ImprovedSummons.exe %TXT% | findstr @146 | Call %C%>> %E%
	)
)

findstr /I /M %SCPT%>nul
if not errorlevel 1 (
	Call %EINSTI% bpseries "0 10 100"

	findstr /I /M "STRATAGEMS.TP2~.*#.*#1000./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMRF-PC "0"
		)
	findstr /I /M "ASCENSION.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		Call %EINSTI% NMRF-PC "1"
		)
	Call %EINSTI% NMRF-PC "2 3"
)

findstr /I /M %SMTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tb#tweaks "100 150 200 300 1250"
)
findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tb#tweaks "4000 4500 5000 6000 6500"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "ITEM_REV.TP2~.*#.*#15./ DIVINE_REMIX.TP2~.*#.*#403./ DIVINE_REMIX.TP2~.*#.*#409./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% tb#tweaks "7000"
	) else (
		%IFS%tb#tweaks.exe %TXT% | findstr @373 | Call %C%>> %E%
	)
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	findstr /I /M %SXTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#tweaks "9150"
	)
	findstr /I /M %SHTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#tweaks "9110"
	)
	findstr /I /M %SSTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#tweaks "9060"
	)
	findstr /I /M %SETK%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#tweaks "9030"
	)
	findstr /I /M %SCTK%>nul
	if not errorlevel 1 (
		Call %EINSTI% tb#tweaks "9000"
	)
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	findstr /I /M "TOBEX.TP2~.*#.*#121./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% P5Tweaks "10"
	) else (
		%IFS%P5Tweaks.exe %TXT% | findstr @361 | Call %C%>> %E%
	)
	findstr /I /M "TOBEX.TP2~.*#.*#120./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% P5Tweaks "20"
	) else (
		%IFS%P5Tweaks.exe %TXT% | findstr @362 | Call %C%>> %E%
	)
	findstr /I /M "TOBEX.TP2~.*#.*#122./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% P5Tweaks "40"
	) else (
		%IFS%P5Tweaks.exe %TXT% | findstr @363 | Call %C%>> %E%
	)
	Call %EINSTI% P5Tweaks "30 50"
	findstr /I /M "CSOBIWO" %CON%>nul
	if errorlevel 1 (
		findstr /I /M "ITEM_REV.TP2~.*#.*#17./" %ELOG%>nul
		if errorlevel 1 (
			Call %EINSTI% P5Tweaks "60"
		)
	) else (
		%IFS%P5Tweaks.exe %TXT% | findstr @364 | Call %C%>> %E%
	)
)

findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	findstr /I /M "bg1npcscs" %CON%>nul
	if errorlevel 1 (
		Call %EINSTI% bg1npcbeg "110 120 130 140 150 160 170 180 190 200 210"
	) else (
		%IFS%bg1npcbeg.exe %TXT% | findstr @406 | Call %C%>> %E%
	)
)
%.%
%.%
%.%20. CLOSER INSTALLATION | %M%
%.%
%.%
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% level1npcs "0"
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

	REM The regular expressions from Level1NPC don't consider the additions ("tF" and "tw") to the names made by Refinements and thus they corrupt the lines.
	findstr /I /M "REFINEMENTS.TP2~.*#.*#10./ REFINEMENTS.TP2~.*#.*#11./" %ELOG%>nul
	if not errorlevel 1 (
		if %PREVIEW%==0 (
			copy /Y ".\level1npcs\backup\0\kit.ids" ".\override" | %M%
		)
	)
)

findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "0 1 2 3 4 6 10 12 13 14 15 16 19 22"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "23 24 27 28 29 30 32 33 34 35 36 37 38 39 40"
)
findstr /I /M %SSTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "42 44 45 46 47 48 49 50 51 52 53"
)
findstr /I /M %SITW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "54 55 56 58 59 60"
)
findstr /I /M %SGTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "62 63 64 65 66"
)
findstr /I /M %SKTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "67 68 69"
)
findstr /I /M %SCTW%>nul
if not errorlevel 1 (
	Call %EINSTI% tnt "71 72 73 74 75 77 78 81"
)

findstr /I /M "SOS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	findstr /I /M %SMTW%>nul
	if not errorlevel 1 (
		Call %EINST% MTS_Crappack "23"
	)
	findstr /I /M %SITW%>nul
	if not errorlevel 1 (
		Call %EINST% MTS_Crappack "24"
	)
)

findstr /I /M %SRTW%>nul
if not errorlevel 1 (
	Call %EINST% Virtue "0"

	findstr /I /M "VIRTUE.TP2~.*#.*#0./" %ELOG%>nul && findstr /I /M "GLORAN.TP2~.*#.*#0./" %ELOG%>nul
	if not errorlevel 1 (
		rem Call %EINST% gloran "1" & rem not compatible with Virtue v20Alpha 
	)
)

findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINST% sarerestore "0"
)

findstr /I /M "DRSPHERE" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% Divine_Remix "1000"
)

findstr /I /M %SBG1%>nul
if not errorlevel 1 (
	findstr /I /M "1PP.TP2~.*#.*#203./ 1PP.TP2~.*#.*#204./" %ELOG%>nul
	if errorlevel 1 (
		Call %EINSTI% infinityanimations "8030 9520"
	) else (
		%IFS%infinityanimations.exe %TXT% | findstr @385 | Call %C%>> %E%
	)
)

findstr /I /M "INFINITYANIMATIONS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	if %PREVIEW%==0 (
		copy /Y ".\%BWFP%\_override\infinityanimations\*.*" ".\override" | %M%
	)
)

Call %EINSTI% 1pp "113"

rem Call %EINSTI% cdtweaks "50"

findstr /I /M %SPOR%>nul
if not errorlevel 1 (
	Call %EINSTI% eportraits "0 100 101 102 202 119 103 104 122 123 125 105 106 107 108 109 128 110 112 113 246 131 115 116 133 117 200 201 223 224 228 204 230 206 231 254 233 234 235 207 236 208 209 238 239 210 241 232 212 213 242 243 244 245 214 215 217 248 249 250 218 251 222 252 220 221 253"
)

Call %EINSTI% BP-BGT-Worldmap "0" "1 1"
Call %EINSTI% BP-BGT-Worldmap "1"

Call %EINSTI% mapnames "0 25"

findstr /I /M %SRES%>nul
if not errorlevel 1 (
	Call %EINSTI% BInfinitySounds "0"
	Call %EINSTI% BInfinitySounds "1" "Y Y Y Y 2 1 Y"
	Call %EINSTI% BInfinitySounds "2 3 4 5 6"
)

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
	Call %EINSTI% TutuGUI "0"
	%IF% BWP_widescreen_input.txt Call %EINSTI% TutuGUI "1"
)

findstr /I /M "W_GUI" %CON%>nul
if not errorlevel 1 (
	Call %EINSTI% W_GUI "0 11"
)

%NMAC% %IF% BWP_widescreen_input.txt Call %EINST% widescreen "0" "TYPE BWP_widescreen_input.txt"

findstr /I /M "TUTUGUI" "W_GUI" %CON%>nul
if errorlevel 1 (
	Call %EINSTI% bg2improvedgui "110 200 410 510 530 600 700 810 910 1000 1010 1120 1200 1310 1400 1580 1920 2040 2200 2500 2900 3000 3400 3600 4290"
)

Call ".\%BWIPI%\close1.bat"

Call ".\%BWIPI%\close2.bat"

:: Copyright 2008-2023 by Leonardo Watson
:: This file or parts of it may not be copied or changed without permission.