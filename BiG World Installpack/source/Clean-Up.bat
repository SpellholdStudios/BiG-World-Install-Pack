@echo off

SETLOCAL
cd /d %DPATH%

:: these directories should be cleaned
:: don't touch the TobEx_ini!
:: max-length for commandline is 2 KiB = 2048 chars, therefore split in four parts

SET MOD_DIRS_1="!BInfinitySounds" "1pp" "1pp_avatars" "1pp_female_dwarves" "1pp_hq_music_BGT" "1pp_hq_music_II" "1pp_hq_music_ToSC" "1pp_thieves_galore" "1Sylm" "7c#addlevel" "7c#sartweak" "7C-Yoshi" "A4Auror" "A6CharmPatch" "A6XPPatch" "A7#ImprovedArcher" "A7-CustomKits" "ab_mods" "AbyStore" "AC_QUEST" "ACBre" "acidelem_beta1" "aD&L" "ADPack" "adrian" "Aeon" "aip" "AjantisBG1" "AjantisBG2" "AjocMod" "AlabasterSands" "alassa" "Alchemy" "Alcool" "allison" "almaPlaces" "almaquest2" "alora" "alternatives" "AM" "amber" "Angelo" "AnimalCompanions" "Animus" "Anishai" "aranw" "aranw_aware" "Aran-Whitehand-Beta_Luridel" "arath" "ArcaneArcher" "Area_Patcher" "arena" "arestorationp" "Ariena" "Armiger" "ascension" "AsharNPC" "AshesofEmbers" "Askaria" "Assassinations" "aTweaks" "Auden" "AurenAseph" "Auror" "aurora" "AvengerKit" "AviM" "AzenMOD" "Azure" "b_tweak" "b_tweak_lite" "BackBrynnlaw" "BagBonus" "banterpack" "bardkit" "BardSong_BG2_IWD" "BBBKBG" "BBPBAG" "BBQUIV" "BBQUIVB" "BBQUIVC" "BBSCARDR" "BBSCCS" "Bdash" "Bear_Animations_D2" "BearWalker" "BG_Travel" "BG1Aerie" "bg1npc" "bg1npcbeg" "bg1npc_portrait_pack" "bg1npcmusic" "BG1NPCSoA" "bg1re" "BG1Sounds" "bg1ub" "BG2_Tweaks" "BG2eeAR" "BG2eeW" "bg2fixpack" "bg2improvedgui" "BG2SoA" "BGeeAR" "BGeeW" "bggoEET" "bggraphics" "BGII-Subrace" "bgqe" "BGSpawn" "BGT" "BGTComp" "BGTNeJ" "BGTNeJ2" "BGT-NPCSound" "bgtsongs" "BGTTweak" "BIDDE" "BloodMort" "bolsa" "Bonehillv275" "BonsBruce" "BP" "BP-Balancer" "BP-BGT-Worldmap" "bpseries" "Branwen" "BranwenNPC" "BridgesBlock" "bst" "BuTcHeRy" "BW_Herbs" "BW_Herbs_BG2" "BWL_Contest" "BWQuest" "c#brage" "c#brandock" "c#endlessbg1" "c#greythedog" "c#husam" "c#sb_silber" "c#solaufein" "c2" "c2audio" "cal" "calin" "cassius" "cdtweaks" "celestiales" "celestials" "Cerberus" "cernd" "ChanterKit" "ChaosKnight" "Charli" "chiara" "Chloe" "CliffHistory" "CliffKey" "ClubOfPain" "com_encounters" "contain" "Contest" "Coondred" "Coran" "coranbgfriend" "correcfrBG1" "correcfrBG2" "corthalaromantique" "cre_check" "Cre_Patcher" "crefixer" "CritterParts" "CrossmodBG2" "Crusade" "CScripts" "CtB" "CtB_FF" "CtBcutImp" "cursed_items" "CustomKits" "CWS"

SET MOD_DIRS_2="d0tweak" "d2ama" "d2asn" "d2bar" "d2item" "d2nec" "d2pal" "dace" "dakkon" "darian" "dark" "DarkHorizons" "DARRON" "DC" "deArnise" "Derats_kits" "Derats_Ogre" "Devin" "DiffTweak" "Divine_Remix" "DjinniCompanion" "DKDrizzt" "DNT" "DofD" "dq" "DR8_hotfix" "DragonSummon" "DrizztIsNotStupid" "DRIZZTSAGA" "Drows" "Druid" "DruidGroveMakeover" "DruidSor" "DruidicSorcererKit" "DSoA" "DSotSC" "DSR" "dw_lanthorn" "ebg2" "edwin" "EET_Tweaks" "Eilistraee" "eldoth" "elven_pack" "EMaD" "enemyupgrade" "eportraits" "evandra" "Exnem" "Fade" "fadingpromises" "fairydragon" "FamiliarPack" "Faren" "FinchNPC" "FishingForTrouble" "foodmod" "FotD" "Foundling" "FoxMonster" "FR_ROV" "freeact" "frenmod" "fullplate" "G3Anniversary" "Gahesh" "garrick_flirt" "garrick-tt" "gavin" "gavin_bg2" "gavin_bg2_bgt" "gavin_kickout_hotfix" "GBThfKp" "Ghareth" "Ghost" "ggib_tweaks" "GlamNPCPack" "gloran" "gminion" "Goo" "GreyA" "grimuars" "GRoA" "GUI_Mods" "Haendlermod" "haerdalis_friendship" "haerdalisromance" "Haiass" "haldamir" "hammers" "Hanna" "HardTimes" "HarpScout" "HeartwarderKit" "HeartWood" "HerThiMoney" "hessa" "hf_HHG" "hiddenadventure" "highlevelABILITIES" "homewardbound" "Horace" "HouseTweaks" "houyi" "Huple_NPC" "iaaurfix" "ianinja" "iepbanters" "iiItemMod" "iiKeyNames" "iiLearnThroughUse" "iiProjectileR" "iiSpellSystemAdjustments" "IK" "imnesvale" "imoen_forever" "imoenfriendship" "ImoenIsStone" "ImoenRom" "imoenRomance" "impasylum" "ImprovedBAMs" "ImprovedSummons" "IndiNPC" "infinityanimations" "Innate_Fix" "Innershade" "Intro" "ISNF" "Isra" "Isra_bg2" "Item_Pack" "Item_Patcher" "item_rev" "itemupgrade" "iwdification" "iwditemfix" "iwditempack" "iylos" "JA#BGT_AdvPack" "JA#BGT_Tweak" "Jandor" "JanQuest" "jassy" "jcbruce" "Jedi&Sith" "jimfix" "JKits" "JklHel" "JL#ZULU" "JondalarFix" "JZ" "karatur" "Kari" "KeldornR" "keldorn_rom" "kelsey" "keto" "Khalid" "Kiara-Zaiya" "Kido" "KimNPC" "Kindrek" "King_Dutka's_Thief" "kit_rev" "Kitanya" "Kitpack6" "kittomes" "kivan" "KKitNPC" "KKits" "klatu" "KonTwk" "Korgan" "KorganFriendship" "ktweaks" "KWolf"

SET MOD_DIRS_3="Larsha" "LavaIt!" "LaValygar" "laviconia" "Lena" "lester_the_npc" "level1npcs" "lightmaps" "LOHMod" "lolfixer" "LongerRoad" "LostItems" "LR" "lucy" "LuvNalia" "LuxleySoA" "LyricKit" "Malthis" "mapnames" "Margarita" "MawgulNPC" "mazzy" "MDX" "MegaModKits" "MerskStore" "Mhoram" "might_and_guile" "mih_eq" "mih_ip" "minscfriendship" "Miriam" "ModKitRemover" "morituri" "Mortis" "MTS" "MTSTaim" "MulgoreXaviaNPC" "multistronghold" "Munchmod" "Mur'Neth" "musica" "mwyvmtan" "Mystigan" "nanstein" "Nathaniel" "Neh'taniel" "NeJ" "NeJ2" "NeJ2pat" "NeJ2v602" "NEJ3" "NeJE" "nephele" "Nikita" "NikitaRedux" "ninde" "ninjawakifix" "NML" "NMR" "NMRF-PC" "NMR-HAPPY" "NMT" "NMTP" "nogameover" "npc_ee" "NPC_Strongholds" "npc_tweak" "npcflirt" "NPCKit" "NSC_Portraits" "NTotSC" "NTotSCv171" "OldModsPack" "Ooze" "Oversight" "p5tweaks" "parting" "PCU" "pcvamp" "Petsy" "phord_druidkits" "Pirate" "planarspheremod" "PlasmoPortraits" "POB" "PofKits" "PoFQuestPack" "polytweak" "portablehole" "PPK" "Pretre_de_Bhaal" "Px_Chantelame" "quallofix" "Quayle" "Questor" "questpack" "randomiser" "raziel" "RE" "Recarga" "redemption" "refinements" "Renal" "res_fixer" "RetaliatorKit" "Reunion" "RevisedBattles" "RezMod" "RFWIP" "RGenie" "Rjali" "RItemPack" "roar" "Rodeur_de_lombre" "RogueSwitch" "Rolles" "rose" "RoT" "RotBArmorSet" "RPG-KP" "rpgsolaflirtpack" "RR" "rttitempack" "rttkit" "ruad" "rukrakia" "Run" "rupert" "Rylorn"

SET MOD_DIRS_4="S#ElvanA" "Saerileth" "sagaman" "SamuraiKit" "SandrahItm" "SandrahNPC" "SandrahRTF" "SandrahTOT" "saradas_magic" "Saradas_Magic_2" "sarahtob" "sarerestore" "sarevokfriendship" "sarevokromance" "SBS" "SC#Hub" "scales_of_balance" "ScionMod" "scs" "scsII" "SDMODS" "Sellswords" "semi_multi_clerics" "seqmem" "Setup-BoM" "Severian" "shardsofice" "shartel" "Sheena" "sigil_bd_mod" "SilverFur" "SirinesCall" "Skie" "SkieCost" "SkipChateauIrenicus" "SkooterTheNPC" "slandor" "SmilingImpCrossBanterMod" "SNAKES" "soa" "solarom" "song_and_silence" "SouthernEdge" "SOS" "Sovereign" "spell_rev" "spell50" "SpellPackB6" "SPGaunt" "spitems" "spstuff" "Star" "stivan" "Storm" "stratagems" "stratagems_external" "StuffofTheMagi" "summons" "sword_and_fist" "swordap" "Swylif" "tactics2" "TangledIsle" "Tashia" "tb#kits" "tb#quest" "tb#tweaks" "TDD" "teddy" "Teleport" "Tempest" "TenyaThermidor" "TethyrForestPatch" "TGC1e" "Thael" "thalan" "The_Old_Gold" "TheBeaurinLegacy" "thecalling" "THEONEDRIZZT" "TherrinNPC" "TheUndying" "ThOghma" "Tiax" "Tidings" "TIGER" "tnt" "ToA" "tob_hacks" "tobaurora" "TobEx" "tobr" "TOD" "tooltipfix" "TotDG" "totemiccernd" "touched" "tp" "Traduccion_Mejorada" "trap_rev" "Trovador" "TS" "ts25mini" "Tsujatha" "TsukiBG2" "TTSQ" "Turambar_fixes_tweaks" "turnabout" "TurnipGolem" "TutuGUI" "TxtMusic" "TyrisFlare" "tzshop01" "ub" "UCFOW" "Uldar" "underrep" "uniqueartifacts" "UoT" "Vagrant" "valen" "valerie" "valhorn" "VampireTales" "vanim" "Varshoon" "Vault" "vecna" "Vecna v23 - Text Overhaul v1.0" "ua" "valygarfriendship" "Vendedor_DLAN" "vic" "viconia" "ViconiaRevamped" "Vildra" "Virtue" "VolcanicArmoury" "volcano" "vynd" "w_3kradziej" "W_GUI" "w_packmule" "w_psionics_unleashed" "WandCase" "WarslingSniperKit" "WBGTAP" "weidu_external" "werewarrior" "wheels" "white" "WhiteQueen" "widescreen" "Wikaede" "WikaedeR" "WildMage" "WillyB" "WizWomJon" "wmart" "worgas" "Worldmap" "wsr" "WTPFamiliars" "x0black" "Xan" "XanBG1Friend" "XanBG2Voice" "xpmod" "xulaye" "Yasraena" "yeslicknpc" "Yikari" "YLITEMS" "yoshimo" "YoshimosRemorse" "YoshimoRomance" "Yvette" "Z#Conduc" "Z#HideKt" "Z#Misc" "Zakrion_BG1" "Zalnoya" "ZELINK" "ZFA"


:: exclamation marks and spaces must be temporary replaced by underline.
%IF% "b!tweak" ren "b!tweak" "b_tweak"
%IF% "b!tweak_lite" ren "b!tweak_lite" "b_tweak_lite"
%IF% "BWL Contest" ren "BWL Contest" "BWL_Contest"
%IF% "NSC Portraits" ren "NSC Portraits" "NSC_Portraits"

:: to rename a file with an accented character the current codepage must be changed
For /F "Tokens=2 Delims=:" %%I In ('Chcp ') Do Set /A _CurCP=%%I
Chcp 1252
%IF% "Prêtre de Bhaal" ren "Prêtre de Bhaal" "Pretre_de_Bhaal"
%IF% "Rôdeur de l'ombre" ren "Rôdeur de l'ombre" "Rodeur_de_lombre"
Chcp %_CurCP%


findstr /I /M "cleaned" %IPL%>nul
if not errorlevel 1 goto :CLEARBIF

%IF% StopLBar del StopLBar
start "pulse bar" "%BWIPS%\pulse_bar.bat"


:: Step 1
:: Now files that should not be in the override will be deleted. Don't worry about the "not found" messages!
:: Some of these files are markers that are needed for uninstall/re-install that not do any harm.
FOR %%f IN (
	%OV%z#misc.*
	%OV%*.aup
	%OV%*.B
	%OV%*.baf
	%OV%*.bak
	%OV%*.bat
	%OV%*.d
	%OV%*.exe
	%OV%*.g3
	%OV%*.jpg
	%OV%*.ks
	%OV%*.log
	%OV%*.mp3
	%OV%*.mrk
	%OV%*.ogg
	%OV%*.rpgd
	%OV%*.RR
	%OV%*.sfk
	%OV%*.slh
	%OV%*.tiz
	%OV%*.txt
	%OV%*.UB
	%OV%*.xxx
	%OV%.DS_Store
	%OV%AR0500-bcs
	%OV%fhlplay.fh
	%OV%BBlade1
	%OV%BBlade2
	:: %OV%BP-BGT_WM6.wm6
	%OV%CELES
	%OV%CLOUDKA
	%OV%Desktop.ini
	%OV%DFOGA
	%OV%dummy.blarg
	:: %OV%dw#*
	%OV%ESHIELC
	%OV%f_dagaxe
	%OV%firebrn
	%OV%ICARMOR
	%OV%ICINHIT
	%OV%ICWRATI
	:: %OV%ION*
	:: %OV%IOUNX*
	%OV%KRDL1
	%OV%KRGLOBD
	%OV%LPOOMV
	%OV%otthelm
	%OV%PGDARN.bam.gif
	%OV%PSHELLC
	%OV%RPGSolaFlirtPack.rpgd
	%OV%S#Eye
	%OV%sharea
	%OV%spheart
	%OV%spwi910cre
	%OV%spwm104
	%OV%SSHELLC
	%OV%TRBLOBA
	%OV%tz25mnds.tmn
	%OV%va#tod.nul
	%OV%"Service-Version 1.txt"
	%OV%The_Lady's_Shadow.rar
	%OV%b!romkil.x
) DO del %%f 2>nul


:: Step 2
:: Delete unecessary files after installation.
:: The idea is to mark important files as read-only and delete the rest.
:: This stuff is needed for a changelog: weidu.log, tp2, backups, tra.

:: save these file types (also include tpx files)
SET DOC_FILES=*.txt *.doc *.html *.htm *.pdf *.rtf *.tp? *.tra *.ini *.lua

:: set this to echo to only look what would happen
SET DEBUG=

:: mark backup directories
SETLOCAL ENABLEDELAYEDEXPANSION

FOR /R %%t IN (*.tp2) DO (
    SET FOUND=false
    FOR /F "delims=" %%l IN ('findstr /I /C:"BACKUP " "%%t"') DO (
        IF "!FOUND!" == "false" (
            :: extract backup dir from line ^
            :: we replace any " with ' for the delims in the FOR loop :/
            SET LINE=!LINE:"='!
            FOR /F "tokens=2 delims='~ " %%b IN ("%%l") DO (
                %IF% "%%b" (
                    %DEBUG% attrib +R "%%b"
                    %DEBUG% attrib /S /D +R -H "%%b\*.*"
                    SET FOUND=true
                )
            )
        )
    )
)

ENDLOCAL

FOR %%d IN (%MOD_DIRS_1% %MOD_DIRS_2% %MOD_DIRS_3% %MOD_DIRS_4%) DO (
    %IF% %%d (
        :: mark all documentation files in the mod directories ^
        :: use cd as workaround for broken FOR /R %var%
        cd %%d
        FOR /R %%h IN (%DOC_FILES%) DO (
            %DEBUG% attrib +R -H "%%h"
        )
        cd ..

        :: delete unprotected stuff
        %DEBUG% del /S /Q /A:-R %%d >nul 2>&1

        :: remove the read-only attribute
        %DEBUG% attrib -R %%d
        %DEBUG% attrib /S /D -R "%%~d/*.*"

        call :delete_empty_dirs %%d
    )
)

for /D %%e in (
	".\* Bonus Portrait *"
	".\* Bonus Portrait"
	".\* Original Portrait"
	".\Jaheira's Original Portrait"
) do rd /s /q "%%e" 2>nul

%IF% ".\Custom Portraits" rd /s /q ".\Custom Portraits"
%IF% Aran-Whitehand-Beta_Luridel rmdir /s /q Aran-Whitehand-Beta_Luridel

%IF% "b_tweak" ren "b_tweak" "b!tweak"
%IF% "b_tweak_lite" ren "b_tweak_lite" "b!tweak_lite"
%IF% "BWL_Contest" ren "BWL_Contest" "BWL Contest"
%IF% "NSC_Portraits" ren "NSC_Portraits" "NSC Portraits"

For /F "Tokens=2 Delims=:" %%I In ('Chcp ') Do Set /A _CurCP=%%I
Chcp 1252
%IF% "Pretre_de_Bhaal" ren "Pretre_de_Bhaal" "Prêtre de Bhaal"
%IF% "Rodeur_de_lombre" ren "Rodeur_de_lombre" "Rôdeur de l'ombre"
Chcp %_CurCP%

type NUL> StopLBar


:step3
:: Delete unecessary files from the main directoy.
attrib +r "BiG World Install.bat"
FOR %%g IN (
	CespyAudioV1.exe
	JZMovie.exe
	NoCD.exe
	oggdec.exe
	acm2wav.exe
	acm_upsample.exe
	snd2acm.exe
	tispack.exe
	wavc.exe
	*.2da
	*.ids
	*.mp4
	*.bat
	.gitattributes
	*.command
	*.jpg
	*.rar
	nwn_1.mpg
	UPX*
) DO del /q %%g 2>nul

%IF% "Harper Scout.jpg" del "Harper Scout.jpg"

:: Delete BWP installation remains from the main directoy.

FOR %%h IN (
	*.count*
	count*.txt
	dir*.txt
	*.installed
	B#BLADEstring.txt
	sub
	"BiG World Fixpack.bat"
	"BiG World Textpack.bat"
	"BiG World Trimpack.bat"
	BWP Settings.bak
	BiG World Debug.txt
	BWP*.log
) DO del %%h 2>nul

:step4
MD "read me files"
for %%k IN ("*.txt" "*.doc" "*.rtf" "*.pdf" "*.htm" "*.md") do move "%%k" ".\read me files"

FOR %%l IN (
	"language.txt"
	"BiG World Debug.txt"
	"BWP Conflicts.txt"
	"BWP Settings.txt"
	"BWP_BG1_input.txt"
	"BWP_BG2_input.txt"
	"BWP_BGT_input.txt"
	"BWP_DL_input.txt"
	"BWP_IWD1_input.txt"
	"BWP_IWD2_input.txt"
) DO move ".\read me files\"%%l"" "."

::delete directories with files or directories within
for %%a IN (PCU BWP_workspace __MACOSX) do rmdir /s /q "%%a"

::delete whole directories with spaces in their name
FOR /D %%a in ("BiG World Fixpack" "BiG World Trimpack") DO RMDIR %%a /S /Q

::delete whole directories with spaces and asterix in their name
for /d %%x in ("BiG World Textpack *") do rd /s /q "%%x"

%.%cleaned>> %IPL%


:CLEARBIF
findstr /I /M "cleared" %IPL%>nul
if not errorlevel 1 goto :CLEAROUT

:: Delete gen_biff's HUGE prod
findstr /I /M "clearbiff" %SET%>nul
if errorlevel 1 goto :finished

rmdir /s /q "generalized_biffing\prod"
%.%cleared>> %IPL%


:CLEAROUT
findstr /I /M "removemods" %SET%>nul
if errorlevel 1 goto :finished

findstr /I /M "emptied" %IPL%>nul
if not errorlevel 1 goto :finished

SET DEB=..\"BGII - SoA debug"
MD %DEB%

FOR %%d IN (%MOD_DIRS_1% %MOD_DIRS_2% %MOD_DIRS_3% %MOD_DIRS_4%) DO move %%d %DEB%
%IF% generalized_biffing move generalized_biffing %DEB%
%IF% bg1textpack move bg1textpack %DEB%

move *.command %DEB%
move setup-* %DEB%
move *.tp2 %DEB%
%IF% __MACOSX move __MACOSX %DEB%

%IF% "inlined-macro" rmdir /s /q "inlined-macro"
%IF% change-log move change-log %DEB%
%IF% change-log.bat move change-log.bat %DEB%
%IF% "read me files" move "read me files" %DEB%
%IF% ReadMe move ReadMe %DEB%
%IF% ArcadeInstallBG2TOB101b.exe move ArcadeInstallBG2TOB101b.exe %DEB%
%IF% BG2-ToB-26498-Europe.exe move BG2-ToB-26498-Europe.exe %DEB%
%IF% BGMain.exe.backup move BGMain.exe.backup %DEB%
%IF% wget.txt move wget.txt %DEB%
%IF% WeiDU.log move WeiDU.log %DEB%
%IF% WeiDU.exe move WeiDU.exe %DEB%

:: Now remaining markers will be deleted.
FOR %%f IN (
	%OV%*.D5
) DO del %%f 2>nul

%IF% "BiG World Debug.txt" move "BiG World Debug.txt" %DEB%
move BWP*.txt %DEB%
move BWP_* %DEB%
move BWIP_* %DEB%
%IF% "BiG World Installpack" move "BiG World Installpack" %DEB%
%IF% "BiG World Install.bat" move "BiG World Install.bat" %DEB%

%.%emptied>> %IPL%


:finished
findstr /I /M "BWPinstalled" %IPL%>nul
if errorlevel 1 (
	call ".\%BWIPS%\finish.bat" ":LEVEL1NP"
) else (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @006 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause & call ".\%BWIPS%\Service.bat" ":SERVICET"
)

:delete_empty_dirs
FOR /D %%d in ("%~1\*.*") DO (
    call :delete_empty_dirs "%%d"
    %DEBUG% rmdir "%%d" 2>nul
)

