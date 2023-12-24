SETLOCAL
cd /d %DPATH%

for /f "delims=" %%a in ('type BWP_DL_input.txt') do @set BWD=%%a

:: correct wrongly extracted files
%IF% "%BWD%\GharethNPC.exe" (
	MD "GharethNPC\2da"
	MD "GharethNPC\Audio"
	MD "GharethNPC\Backup"
	MD "GharethNPC\CRE"
	MD "GharethNPC\d"
	MD "GharethNPC\english"
	MD "GharethNPC\epilogue"
	MD "GharethNPC\portraits"
	MD "GharethNPC\scripts"
	Move GharethNPC\fwghand1.2DA GharethNPC\2da"
	Move GharethNPC\*.ogg GharethNPC\Audio"
	Move GharethNPC\oggdec.exe GharethNPC\Audio"
	Move GharethNPC\keep-me GharethNPC\Backup"
	Move GharethNPC\*.cre GharethNPC\CRE"
	Move GharethNPC\*.d GharethNPC\d"
	Move GharethNPC\*.bmp GharethNPC\portraits"
	Move GharethNPC\*.baf GharethNPC\scripts"
	Move "GharethNPC\Setup-Ghareth.* "."
	%W5%
	ren GharethNPC Ghareth
)

%IF% "%BWD%\TurnaboutV1.exe" (
	MD "TurnaboutV1\2da"
	MD "TurnaboutV1\backup"
	MD "TurnaboutV1\baf"
	MD "TurnaboutV1\baf-extend"
	MD "TurnaboutV1\balthazar"
	MD "TurnaboutV1\copy"
	MD "TurnaboutV1\dialog"
	MD "TurnaboutV1\dialogsep"
	MD "TurnaboutV1\portrait"
	MD "TurnaboutV1\scripts"
	MD "TurnaboutV1\wavs"
	Move TurnaboutV1\*.2DA TurnaboutV1\2da"
	Move TurnaboutV1\keepme TurnaboutV1\backup"
	Move TurnaboutV1\ar6200.baf TurnaboutV1\baf-extend"
	Move TurnaboutV1\yoshimox.baf TurnaboutV1\baf-extend"
	Move TurnaboutV1\*.baf TurnaboutV1\baf"
	Move TurnaboutV1\BALTHAZS.bmp TurnaboutV1\balthazar"
	Move TurnaboutV1\NBALTHAL.bmp TurnaboutV1\balthazar"
	Move TurnaboutV1\*.cre TurnaboutV1\copy"
	Move TurnaboutV1\*.spl TurnaboutV1\copy"
	Move TurnaboutV1\*.itm TurnaboutV1\copy"
	Move TurnaboutV1\1.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\2.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\3.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\4.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\5.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\6.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\7.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\7b.d TurnaboutV1\dialogsep"
	Move TurnaboutV1\*.d TurnaboutV1\dialog"
	Move TurnaboutV1\*.bmp TurnaboutV1\portrait"
	Move TurnaboutV1\*.bcs TurnaboutV1\scripts"
	Move TurnaboutV1\*.ogg TurnaboutV1\wavs"
	Move "TurnaboutV1\setup-turnabout.* "."
	%W5%
	ren TurnaboutV1 turnabout
)


:: delete older versions if newer ones had been downloaded manually from MediaFire
%IF% "%BWD%\Morituri v5.zip" %IF% "%BWD%\Morituri_v3.zip" del "%BWD%\Morituri_v3.zip"
%IF% "%BWD%\Mortis Mini Mod 2.33.zip" %IF% "%BWD%\Mortis_WeiDU_v2.32.zip" del "%BWD%\Mortis_WeiDU_v2.32.zip"
%IF% "%BWD%\Huxalteks Pirate kit v2.zip" %IF% "%BWD%\Pirate Kit Mod v1.1.zip" del "%BWD%\Pirate Kit Mod v1.1.zip"
%IF% "%BWD%\Semi_Multi_Clerics_0.4.zip" %IF% "%BWD%\Semi_Multi_Clerics_0.2.3_Windows.zip" del "%BWD%\Semi_Multi_Clerics_0.2.3_Windows.zip"
%IF% "%BWD%\Severian_de_Demerya_v0.3.3.zip" %IF% "%BWD%\severiandedemeryav02a.rar" del "%BWD%\severiandedemeryav02a.rar"

:: correct wrongly packed files
:: because of a bug in Windows (who is surprised?) the subfolder must be removed separately otherwise all files and folders may randomly vanish or not.
%IF% "7C-Yoshi-master" (
	Move ".\7C-Yoshi-master\7C-Yoshi" "."
	RD /S /Q ".\7C-Yoshi-master"
)
%IF% "A4Auror" (
	Move ".\A4Auror\Setup-A4Auror.exe" "."
)
%IF% "A7-CustomKits-v1.6" (
	Move ".\A7-CustomKits-v1.6\setup-*" "."
	Move ".\A7-CustomKits-v1.6\A7-CustomKits" "."
	RD /S /Q ".\A7-CustomKits-v1.6"
)
%IF% "A7-ImprovedArcher-master" (
	Move ".\A7-ImprovedArcher-master\A7#ImprovedArcher" "."
	RD /S /Q ".\A7-ImprovedArcher-master"
)
%IF% "A7-SkipChateauIrenicus-master" (
	Move ".\A7-SkipChateauIrenicus-master\SkipChateauIrenicus" "."
	RD /S /Q ".\A7-SkipChateauIrenicus-master"
)
%IF% "AC_QUEST-master" (
	Move ".\AC_QUEST-master\setup-*" "."
	Move ".\AC_QUEST-master\AC_QUEST" "."
	RD /S /Q ".\AC_QUEST-master"
)
%IF% "ACBre-master" (
	Move ".\ACBre-master\Setup-*" "."
	Move ".\ACBre-master\ACBre" "."
	RD /S /Q ".\ACBre-master"
)
%IF% "acidelem" (
	Move ".\acidelem\Setup-acidelem_beta1.exe" "."
	Move ".\acidelem\acidelem_beta1" "."
	RD /S /Q ".\acidelem
)
%IF% "Adalons_Blood-main" (
	Move ".\Adalons_Blood-main\c#sb_silber" "."
	RD /S /Q ".\Adalons_Blood-main"
)
%IF% "Ajantis_BG1_Expansion-17" (
	Move ".\Ajantis_BG1_Expansion-17\ajantisbg1" "."
	RD /S /Q ".\Ajantis_BG1_Expansion-17"
)
%IF% "AllThingsMazzy 2.65+Russian" (
	Move ".\AllThingsMazzy 2.65+Russian\AllThingsMazzy" "."
	Move ".\AllThingsMazzy 2.65+Russian\Setup-AllThingsMazzy.exe" "."
	RD /S /Q ".\AllThingsMazzy 2.65+Russian"
)
%IF% "Alternatives-master" (
	Move ".\Alternatives-master\alternatives" "."
	RD /S /Q ".\Alternatives-master"
)
%IF% "angelo-master" (
	Move ".\Angelo-master\setup-*" "."
	Move ".\Angelo-master\angelo" "."
	RD /S /Q ".\Angelo-master"
)
%IF% "Ascalons_Breagar-main" (
	Move ".\Ascalons_Breagar-main\ACBre" "."
	RD /S /Q ".\Ascalons_Breagar-main"
)
%IF% "Ascalons_Questpack-main" (
	Move ".\Ascalons_Questpack-main\AC_QUEST" "."
	RD /S /Q ".\Ascalons_Questpack-main"
)
%IF% "Ascension-master" (
	Move ".\Ascension-master\setup-ascension.exe" "."
	Move ".\Ascension-master\ascension" "."
	RD /S /Q ".\Ascension-master"
)
%IF% "bgee-animus-master" (
	Move ".\bgee-animus-master\Setup-Animus.exe" "."
	Move ".\bgee-animus-master\Animus" "."
	RD /S /Q ".\bgee-animus-master"
)
%IF% "Aran-Whitehand-Beta_Luridel" %IFN% "Aran-Whitehand-master" (
	Move ".\Aran-Whitehand-Beta_Luridel\setup-*" "."
	Move ".\Aran-Whitehand-Beta_Luridel\aranw" "."
	RD /S /Q ".\Aran-Whitehand-Beta_Luridel"
)
%IF% "Aran-Whitehand-master" (
	Move ".\Aran-Whitehand-master\setup-*" "."
	Move ".\Aran-Whitehand-master\aranw" "."
	RD /S /Q ".\Aran-Whitehand-master"
)
%IF% "Assassinations-master" (
	Move ".\Assassinations-master\Assassinations" "."
	RD /S /Q ".\Assassinations-master"
)
%IF% "Auroras-Shoes-and-Boots-master" (
	Move ".\Auroras-Shoes-and-Boots-master\Setup-*" "."
	Move ".\Auroras-Shoes-and-Boots-master\aurora" "."
	RD /S /Q ".\Auroras-Shoes-and-Boots-master"
)
%IF% "AurenAseph-master" (
	Move ".\AurenAseph-master\aurenaseph" "."
	RD /S /Q ".\AurenAseph-master"
)
%IF% "Back_to_Brynnlaw-master" (
	Move ".\Back_to_Brynnlaw-master\BackBrynnlaw" "."
	RD /S /Q ".\Back_to_Brynnlaw-master"
)
%IF% "Banter_Pack-master" (
	Move ".\Banter_Pack-master\banterpack" "."
	RD /S /Q ".\Banter_Pack-master"
)
%IF% "BG_Quests_And_Encounters-24" (
	Move ".\BG_Quests_And_Encounters-24\bgqe" "."
	RD /S /Q ".\BG_Quests_And_Encounters-24"
)
%IF% "BG1NPC-master" (
	Move ".\BG1NPC-master\Setup-bg1npc.exe" "."
	Move ".\BG1NPC-master\bg1npc" "."
	RD /S /Q ".\BG1NPC-master"
)
%IF% "bg1npcmusic-master" (
	Move ".\bg1npcmusic-master\bg1npcmusic" "."
	RD /S /Q ".\bg1npcmusic-master"
)
%IF% "bg1ub-master" (
	Move ".\bg1ub-master\bg1ub" "."
	RD /S /Q ".\bg1ub-master"
)
%IF% "BG2-Fixpack-11" (
	Move ".\BG2-Fixpack-11\setup-*" "."
	Move ".\BG2-Fixpack-11\bg2fixpack" "."
	RD /S /Q ".\BG2-Fixpack-11"
)
%IF% "bg2-tweaks-and-tricks-*" (
	Move ".\bg2-tweaks-and-tricks-*\tnt" "."
	Move ".\bg2-tweaks-and-tricks-*\docs" ".\tnt"
	Move ".\bg2-tweaks-and-tricks-*\README.md" ".\tnt"
	RD /S /Q ".\bg2-tweaks-and-tricks-*"
)
%IF% "BGEE_Helarine-master" (
	Move ".\BGEE_Helarine-master\Helarine Mod\JklHel\Helarine_BGEE.Tp2" ".\setup-Helarine_BGEE.Tp2"
	Move ".\BGEE_Helarine-master\Helarine Mod\JklHel" "."
	RD /S /Q ".\BGEE_Helarine-master"
)
%IF% "BGGOEET-master" (
	Move ".\BGGOEET-master\setup-bggoEET.exe" "."
	Move ".\BGGOEET-master\bggoEET" "."
	RD /S /Q ".\BGGOEET-master"
)
%IF% "BGT-WeiDU-master" (
	Move ".\BGT-WeiDU-master\bgt" "."
	RD /S /Q ".\BGT-WeiDU-master"
)
%IF% "BPSeries_v03121" (
	Move ".\BPSeries_v03121\setup-bpseries.exe" "."
	Move ".\BPSeries_v03121\bpseries" "."
	RD /S /Q ".\BPSeries_v03121"
)
%IF% "bp-bgt-worldmap-v1024" (
	Move ".\bp-bgt-worldmap-v1024\bp-bgt-worldmap" "."
	Move ".\bp-bgt-worldmap-v1024\setup-bp-bgt-worldmap.exe" "."
	RD /S /Q ".\bp-bgt-worldmap-v1024"
)
%IF% "Brages_Redemption-master" (
	Move ".\Brages_Redemption-master\c#brage" "."
	RD /S /Q ".\Brages_Redemption-master"
)
%IF% "Branwen_for_BGII-master" (
	Move ".\Branwen_for_BGII-master\Branwen" "."
	RD /S /Q ".\Branwen_for_BGII-master"
)
%IF% "BS_Baldurans_Seatower-main" (
	Move ".\BS_Baldurans_Seatower-main\bst" "."
	RD /S /Q ".\BS_Baldurans_Seatower-main"
)
%IF% "CerndFriendship-master" (
	Move ".\CerndFriendship-master\cernd" "."
	RD /S /Q ".\CerndFriendship-master"
)
%IF% "Club Of Pain V1.6" (
	Move ".\Club Of Pain V1.6\*.*" "."
	Move ".\Club Of Pain V1.6\ClubOfPain" "."
	RD /S /Q ".\Club Of Pain V1.6"
)
%IF% "Coran_for_BGII-master" (
	Move ".\Coran_for_BGII-master\Coran" "."
	RD /S /Q ".\Coran_for_BGII-master"
)
%IF% "Corthala_Romantique-master" (
	Move ".\Corthala_Romantique-master\corthalaromantique" "."
	RD /S /Q ".\Corthala_Romantique-master"
)
%IF% "CritterParts-1.1" (
	Move ".\CritterParts-1.1\*.*" "."
	Move ".\CritterParts-1.1\CritterParts" "."
	RD /S /Q ".\CritterParts-1.1"
)
%IF% "Crossmod_Banter_Pack_for_Baldurs_Gate_II-master" (
	Move ".\Crossmod_Banter_Pack_for_Baldurs_Gate_II-master\crossmodbg2" "."
	RD /S /Q ".\Crossmod_Banter_Pack_for_Baldurs_Gate_II-master"
)
%IF% "CtBv1.13a" (
	Move ".\CtBv1.13a\CtBv1.13\*.*" "."
	Move ".\CtBv1.13a\CtBv1.13\CtB" "."
	Move ".\CtBv1.13a\CtBv1.13\CtB_FF" "."
	RD /S /Q ".\CtBv1.13a\CtBv1.13"
	RD /S /Q ".\CtBv1.13a"
)
%IF% "D0Tweak-master" (
	Move ".\D0Tweak-master\d0Tweak" "."
	RD /S /Q ".\D0Tweak-master"
)
%IF% "D0XPmod-master" (
	Move ".\D0XPmod-master\xpmod" "."
	RD /S /Q ".\D0XPmod-master"
)
%IF% "Dark_Tidings" (
	Move ".\Tidings" "."
	Move ".\Dark_Tidings\setup-tidings.exe" "."
	RD /S /Q ".\Dark_Tidings"
)
%IF% "deArnise_Romance-master" (
	Move ".\deArnise_Romance-master\deArnise" "."
	RD /S /Q ".\deArnise_Romance-master"
)
%IF% "Diff_Tweak" (
	Move ".\Diff_Tweak\*.*" "."
	Move ".\Diff_Tweak\DiffTweak" "."
	RD /S /Q ".\Diff_Tweak"
)
%IF% "Ardanis-divine_remix-2f5752e" (
	Move ".\Ardanis-divine_remix-2f5752e\divine_remix" "."
	RD /S /Q ".\Ardanis-divine_remix-2f5752e"
)
%IF% "Divine_Remix-master" (
	Move ".\Divine_Remix-master\divine_remix" "."
	RD /S /Q ".\Divine_Remix-master"
)
%IF% "DjinniCompanion-master" (
	Move ".\DjinniCompanion-master\DjinniCompanion" "."
	RD /S /Q ".\DjinniCompanion-master"
)
%IF% "DSotSC-master" (
	Move ".\DSotSC-master\DSotSC" "."
	Move ".\DSotSC-master\setup-DSotSC.exe" "."
	RD /S /Q ".\DSotSC-master"
)
%IF% "Dungeon_Crawl-master" (
	Move ".\Dungeon_Crawl-master\DC" "."
	RD /S /Q ".\Dungeon_Crawl-master"
)
%IF% "EET_Tweaks-master" (
	Move ".\EET_Tweaks-master\setup-EET_Tweaks.exe" "."
	Move ".\EET_Tweaks-master\EET_Tweaks" "."
	RD /S /Q ".\EET_Tweaks-master"
)
%IF% "EndlessBG1-6" (
	Move ".\EndlessBG1-6\c#endlessbg1" "."
	RD /S /Q ".\EndlessBG1-6"
)
%IF% "Finch_NPC-main" (
	Move ".\Finch_NPC-main\FinchNPC" "."
	RD /S /Q ".\Finch_NPC-main"
)
%IF% "FishingForTrouble-master" (
	Move ".\FishingForTrouble-master\Setup-FishingForTrouble.exe" "."
	Move ".\FishingForTrouble-master\FishingForTrouble" "."
	RD /S /Q ".\FishingForTrouble-master"
)
%IF% "Full_Plate_and_Packing_Steel-master" (
	Move ".\Full_Plate_and_Packing_Steel-master\setup-fullplate.exe" "."
	Move ".\Full_Plate_and_Packing_Steel-master\fullplate" "."
	RD /S /Q ".\Full_Plate_and_Packing_Steel-master"
)
%IF% "g3anniversary-master" (
	Move ".\g3anniversary-master\g3anniversary" "."
	RD /S /Q ".\g3anniversary-master"
)
%IF% "Garricks_Infatuation-master" (
	Move ".\Garricks_Infatuation-master\garrick_flirt" "."
	RD /S /Q ".\Garricks_Infatuation-master"
)
%IF% "Gavin_BG-master" (
	Move ".\Gavin_BG-master\Gavin" "."
	RD /S /Q ".\Gavin_BG-master"
)
%IF% "Gavin_BG2-master" (
	Move ".\Gavin_BG2-master\gavin_bg2" "."
	RD /S /Q ".\Gavin_BG2-master"
)
%IF% "Geomantic_Sorcerer-master" (
	Move ".\Geomantic_Sorcerer-master\druidsor" "."
	RD /S /Q ".\Geomantic_Sorcerer-master"
)
%IF% "ggib_tweaks-master" (
	Move ".\ggib_tweaks-master\ggib_tweaks" "."
	RD /S /Q ".\ggib_tweaks-master"
)
%IF% "Glam-NPC-Pack-master" (
	Move ".\Glam-NPC-Pack-master\GlamNPCPack" "."
	RD /S /Q ".\Glam-NPC-Pack-master"
)
%IF% "Grey_The_Dog-master" (
	Move ".\Grey_The_Dog-master\c#greythedog" "."
	RD /S /Q ".\Grey_The_Dog-master"
)
%IF% "HaerdalisFriendship-master" (
	Move ".\HaerdalisFriendship-master\haerdalis_friendship" "."
	RD /S /Q ".\HaerdalisFriendship-master"
)
%IF% "Haldamir-master" (
	Move ".\Haldamir-master\haldamir" "."
	RD /S /Q ".\Haldamir-master"
)
%IF% "hiddenadventure-master" (
	Move ".\hiddenadventure-master\hiddenadventure" "."
	RD /S /Q ".\hiddenadventure-master"
)
%IF% "House-Rule-Tweaks-master" (
	Move ".\House-Rule-Tweaks-master\HouseTweaks" "."
	Move ".\House-Rule-Tweaks-master\Setup-HouseTweaks.exe" "."
	RD /S /Q ".\House-Rule-Tweaks-master"
)
%IF% "Husam_NPC-main" (
	Move ".\Husam_NPC-main\c#husam" "."
	RD /S /Q ".\Husam_NPC-main"
)
%IF% Imoen-v1202Full %IFN% "Imoen Romance - v3.3" (
	Move ".\Imoen-v1202Full\*.*" "."
	Move ".\Imoen-v1202Full\ImoenRom" "."
	RD /S /Q ".\Imoen-v1202Full"
)
%IF% "Imoen Romance - v3.3" (
	Move ".\Imoen Romance - v3.3\*.*" "."
	Move ".\Imoen Romance - v3.3\imoenRomance" "."
	RD /S /Q ".\Imoen Romance - v3.3"
)
%IF% "Indira_NPC-main" (
	Move ".\Indira_NPC-main\IndiNPC" "."
	RD /S /Q ".\Indira_NPC-main"
)
%IF% "InifKit" (
	Move ".\InifKit\*.*" "."
	Move ".\InifKit\IK" "."
	RD /S /Q ".\InifKit"
)
%IF% "Item_Upgrade-master" (
	Move ".\Item_Upgrade-master\itemupgrade" "."
	RD /S /Q ".\Item_Upgrade-master"
)
%IF% "IWD Item Pack" (
	Move ".\IWD Item Pack\setup-*" "."
	Move ".\IWD Item Pack\iwditempack" "."
	RD /S /Q ".\IWD Item Pack"
)
%IF% "iwdification-master" (
	Move ".\iwdification-master\iwdification" "."
	RD /S /Q ".\iwdification-master"
)
%IF% "JA-AdventurePack-master" (
	Move ".\JA-AdventurePack-master\setup-*" "."
	Move ".\JA-AdventurePack-master\JA#BGT_AdvPack" "."
	RD /S /Q ".\JA-AdventurePack-master"
)
%IF% "Jimfix-master" (
	Move ".\Jimfix-master\jimfix" "."
	RD /S /Q ".\Jimfix-master"
)
%IF% "Keenmarker" (
	Move ".\Keenmarker\*.*" "."
	Move ".\Keenmarker\portraits" "."
	Move ".\Keenmarker\Storm" "."
	RD /S /Q ".\Keenmarker"
)
%IF% "Keldorn_Romance-master" (
	Move ".\Keldorn_Romance-master\keldorn_rom" "."
	RD /S /Q ".\Keldorn_Romance-master"
)
%IF% "Kelsey-master" (
	Move ".\Kelsey-master\kelsey" "."
	RD /S /Q ".\Kelsey-master"
)
%IF% "Keto-master" (
	Move ".\Keto-master\keto" "."
	RD /S /Q ".\Keto-master"
)
%IF% "Kiara-Zaiya\Sounds" ren Kiara-Zaiya Kiara-Zaiya-Sounds
%IF% "Kiara-Zaiya-master" (
	Move ".\Kiara-Zaiya-master\kiara-zaiya" "."
	RD /S /Q ".\Kiara-Zaiya-master"
)
%IF% Kiara-Zaiya-Sounds (
	move /y ".\Kiara-Zaiya-Sounds\Sounds\*.*" ".\Kiara-Zaiya\Sounds"
	RD /S /Q ".\Kiara-Zaiya-Sounds
)
%IF% "King_Dutka's_Thief v1.1" (
	Move ".\King_Dutka's_Thief v1.1\*.*" "."
	Move ".\King_Dutka's_Thief v1.1\King_Dutka's_Thief" "."
	RD /S /Q ".\King_Dutka's_Thief v1.1"
)
%IF% "Kivan_and_Deheriana-master" (
	Move ".\Kivan_and_Deheriana-master\kivan" "."
	RD /S /Q ".\Kivan_and_Deheriana-master"
)
%IF% "KorganFriendship-master" (
	Move ".\KorganFriendship-master\korganfriendship" "."
	RD /S /Q ".\KorganFriendship-master"
)
%IF% "bg2-npcmod-lena-master" (
	Move ".\bg2-npcmod-lena-master\setup-*" "."
	Move ".\bg2-npcmod-lena-master\Lena" "."
	RD /S /Q ".\bg2-npcmod-lena-master"
)
%IF% "bg2-tweaks-and-tricks-master" (
	Move ".\bg2-tweaks-and-tricks-master\tnt" "."
	Move ".\bg2-tweaks-and-tricks-master\docs" ".\tnt"
	RD /S /Q ".\bg2-tweaks-and-tricks-master"
)
%IF% "bg2-wildmage-2.1" (
	Move ".\bg2-wildmage-2.1\wildmage" "."
	Move ".\bg2-wildmage-2.1\docs" ".\wildmage"
	RD /S /Q ".\bg2-wildmage-2.1"
)
%IF% "bg2-npcmod-lena-master" (
	Move ".\bg2-npcmod-lena-master\Lena" "."
	RD /S /Q ".\bg2-npcmod-lena-master"
)
%IF% "Lure_Of_Sirines_Call-master" (
	Move ".\Lure_Of_Sirines_Call-master\SirinesCall" "."
	RD /S /Q ".\Lure_Of_Sirines_Call-master"
)
%IF% "MadeInHeaven_EncountersAndQuests-main" (
	Move ".\MadeInHeaven_EncountersAndQuests-main\mih_eq" "."
	RD /S /Q ".\MadeInHeaven_EncountersAndQuests-main"
)
%IF% "MadeInHeaven_ItemPack-main" (
	Move ".\MadeInHeaven_ItemPack-main\mih_ip" "."
	RD /S /Q ".\MadeInHeaven_ItemPack-main"
)
%IF% "Margarita\Margarita" (
	ren Margarita Margaritax
	Move ".\Margaritax\Margarita" "."
	Move ".\Margaritax\Margarita\Setup-*" "."
	RD /S /Q ".\Margaritax"
)
%IF% "Might_and_Guile-master" (
	Move ".\Might_and_Guile-master\Setup-*" "."
	Move ".\Might_and_Guile-master\might_and_guile" "."
	RD /S /Q ".\Might_and_Guile-master"
)
%IF% "Murneth-master" (
	Move ".\Murneth-master\mur'neth" "."
	RD /S /Q ".\Murneth-master"
)
%IF% "Ninde_NPC-master" (
	Move ".\Ninde_NPC-master\ninde" "."
	RD /S /Q ".\Ninde_NPC-master"
)
%IF% "NPC_EE-master" (
	Move ".\NPC_EE-master\Setup-*" "."
	Move ".\NPC_EE-master\npc_ee" "."
	RD /S /Q ".\NPC_EE-master"
)
%IF% "NPC_Flirt_Packs-master" (
	Move ".\NPC_Flirt_Packs-master\npcflirt" "."
	RD /S /Q ".\NPC_Flirt_Packs-master"
)
%IF% "NTotSC-3.0.0" (
	Move ".\NTotSC-3.0.0\Setup-*" "."
	Move ".\NTotSC-3.0.0\NTotSC" "."
	RD /S /Q ".\NTotSC-3.0.0"
)
%IF% "Paladins_of_Faerun_Kitpack_V4" (
	Move ".\Paladins_of_Faerun_Kitpack_V4\Setup-*" "."
	Move ".\Paladins_of_Faerun_Kitpack_V4\PofKits" "."
	RD /S /Q ".\Paladins_of_Faerun_Kitpack_V4"
)
%IF% "PnP_Celestials-master" (
	Move ".\PnP_Celestials-master\celestials" "."
	RD /S /Q ".\PnP_Celestials-master"
)
%IF% "PoFqp v3" (
	Move ".\PoFqp v3\PoFQuestPack" "."
	Move ".\PoFqp v3\SETUP-PoFQuestPack.exe" "."
	RD /S /Q ".\PoFqp v3"
)
%IF% "simding0_questpack-main" (
	Move ".\simding0_questpack-main\setup-*" "."
	Move ".\simding0_questpack-main\questpack" "."
	RD /S /Q ".\simding0_questpack-main"
)
%IF% "refinements-master" (
	Move ".\refinements-master\setup-refinements.exe" "."
	Move ".\refinements-master\refinements" "."
	RD /S /Q ".\refinements-master"
)
%IF% "Reunion-master" (
	Move ".\Reunion-master\reunion" "."
	RD /S /Q ".\Reunion-master"
)
%IF% "RItemPackV2" (
	Move ".\RItemPackV2\setup-RItemPack.*" "."
	Move ".\RItemPackV2\RItemPack" "."
	RD /S /Q ".\RItemPackV2"
)
%IF% "Romantic_Encounters_BG2-master" (
	Move ".\Romantic_Encounters_BG2-master\setup-refinements.exe" "."
	Move ".\Romantic_Encounters_BG2-master\RE" "."
	RD /S /Q ".\Romantic_Encounters_BG2-master"
)
%IF% "Rolles-master" (
	Move ".\Rolles-master\rolles" "."
	RD /S /Q ".\Rolles-master"
)
%IF% "RotB Armor Set v1.0" (
	Move ".\RotB Armor Set v1.0\*.*" "."
	Move ".\RotB Armor Set v1.0\RotBArmorSet" "."
	RD /S /Q ".\RotB Armor Set v1.0"
)
%IF% SETUP-ROTBARMORSET.DEBUG del SETUP-ROTBARMORSET.DEBUG
%IF% "RoTerror-EE-master" (
	Move ".\RoTerror-EE-master\Setup-RoTerror.exe" "."
	Move ".\RoTerror-EE-master\RoTerror" "."
	RD /S /Q ".\RoTerror-EE-master"
)
%IF% "%BWD%\1309492052_rukrakiav.08.7z" %IFN% Setup-rukrakia.exe call ".\%BWIPS%\rukrakia.vbs"
%W5%
%IF% "루크모드v.08" ren "루크모드v.08" "rukrakia_v.08"
%IF% "rukrakia_v.08" (
	Move ".\rukrakia_v.08\*.*" "."
	Move ".\rukrakia_v.08\rukrakia" "."
	RD /S /Q ".\rukrakia_v.08
)
%IF% "Samurai_Kit" (
	Move ".\Samurai_Kit\Setup-SamuraiKit.exe" "."
	Move ".\Samurai_Kit\SamuraiKit" "."
	RD /S /Q ".\Samurai_Kit
)
%IF% "SandrahItm-master" (
	Move ".\SandrahItm-master\Setup-*" "."
	Move ".\SandrahItm-master\SandrahItm" "."
	RD /S /Q ".\SandrahItm-master"
)
%IF% "SandrahNPC-master" (
	Move ".\SandrahNPC-master\Setup-*" "."
	Move ".\SandrahNPC-master\SandrahNPC" "."
	RD /S /Q ".\SandrahNPC-master"
)
%IF% "SandrahRTF-master" (
	Move ".\SandrahRtF-master\Setup-*" "."
	Move ".\SandrahRtF-master\SandrahRTF" "."
	RD /S /Q ".\SandrahRTF-master"
)
%IF% "SandrahToT-master" (
	Move ".\SandrahToT-master\SandrahToT-Setup*" "."
	Move ".\SandrahToT-master\SandrahToT" "."
	RD /S /Q ".\SandrahToT-master"
)
%IF% "Sarah-master" (
	Move ".\Sarah-master\sarahtob" "."
	RD /S /Q ".\Sarah-master"
)
%IF% "Scales_of_Balance-master" (
	Move ".\Scales_of_Balance-master\Setup-*" "."
	Move ".\Scales_of_Balance-master\scales_of_balance" "."
	RD /S /Q ".\Scales_of_Balance-master"
)
%IF% "ScionMod" (
	Move ".\ScionMod\ScionMod.exe" "."
	ren ScionMod.exe setup-ScionMod.exe
)
%IF% "Sellswords-master" (
	Move ".\Sellswords-master\Sellswords" "."
	RD /S /Q ".\Sellswords-master"
)
%IF% "semi_multi_clerics-master" (
	Move ".\semi_multi_clerics-master\semi_multi_clerics" "."
	Move ".\semi_multi_clerics-master\setup-semi_multi_clerics.tp2" "."
	RD /S /Q ".\semi_multi_clerics-master"
)
%IF% "Severian de Demerya v0.3.3" (
	Move ".\Severian de Demerya v0.3.3\Setup-*" "."
	Move ".\Severian de Demerya v0.3.3\Severian" "."
	RD /S /Q ".\Severian de Demerya v0.3.3"
)
%IF% "Shards_of_Ice-master" (
	Move ".\Shards_of_Ice-master\shardsofice" "."
	RD /S /Q ".\Shards_of_Ice-master"
)
%IF% "Sheena_v2.5" (
	Move ".\Sheena_v2.5\*.*" "."
	Move ".\Sheena_v2.5\Sheena" "."
	RD /S /Q ".\Sheena_v2.5
)
%IF% "Silver_Star_NPC-master" (
	Move ".\Silver_Star_NPC-master\star" "."
	RD /S /Q ".\Silver_Star_NPC-master"
)
%IF% "SP_Collection-master" (
	Move ".\SP_Collection-master\spstuff" "."
	RD /S /Q ".\SP_Collection-master"
)
%IF% "SmilingImp-s_CrossBanterMod-1.2" (
	Move ".\SmilingImp-s_CrossBanterMod-1.2\Setup-SmilingImpCrossBanterMod.exe" "."
	Move ".\SmilingImp-s_CrossBanterMod-1.2\SmilingImpCrossBanterMod" "."
	RD /S /Q ".\SmilingImp-s_CrossBanterMod-1.2"
)
%IF% "Solaufeins_Rescue_NPC-master" (
	Move ".\Solaufeins_Rescue_NPC-master\c#solaufein" "."
	RD /S /Q ".\Solaufeins_Rescue_NPC-master"
)
%IF% "SpellRevisions-master" (
	Move ".\SpellRevisions-master\docs" ".\SpellRevisions-master\spell_rev"
	Move ".\SpellRevisions-master\spell_rev" "."
	RD /S /Q ".\SpellRevisions-master"
)
%IF% "stivan-master" (
	Move ".\stivan-master\stivan" "."
	RD /S /Q ".\stivan-master"
)
%IF% "StuffofTheMagi v4" (
	Move ".\StuffofTheMagi v4\*.*" "."
	Move ".\StuffofTheMagi v4\StuffofTheMagi" "."
	RD /S /Q ".\StuffofTheMagi v4"
)
%IF% "SwordCoastStratagems-master" (
	Move ".\SwordCoastStratagems-master\stratagems" "."
	RD /S /Q ".\SwordCoastStratagems-master"
)
%IF% "SwordCoastStratagems-31_RC3" (
	Move ".\SwordCoastStratagems-31_RC3\stratagems" "."
	RD /S /Q ".\SwordCoastStratagems-31_RC3"
)
%IF% "tb-kits-master" (
	Move ".\tb-kits-master\tb#kits" "."
	RD /S /Q ".\tb-kits-master"
)
%IF% "tb-tweaks-master" (
	Move ".\tb-tweaks-master\tb#tweaks" "."
	RD /S /Q ".\tb-tweaks-master"
)
%IF% "thalan-4.2.5" (
	Move ".\thalan-4.2.5\setup-thalan.exe" "."
	Move ".\thalan-4.2.5\thalan" "."
	RD /S /Q ".\thalan-4.2.5"
)
%IF% "The_Calling-master" (
	Move ".\The_Calling-master\thecalling" "."
	RD /S /Q ".\The_Calling-master"
)
%IF% "ToA-master" (
	Move ".\ToA-master\ToA" "."
	RD /S /Q ".\ToA-master"
)
%IF% "ToBR beta 4" (
	Move ".\ToBR beta 4\*.*" "."
	Move ".\ToBR beta 4\tobr" "."
	RD /S /Q ".\ToBR beta 4"
)
%IF% "ThrownHammers-master" (
	Move ".\ThrownHammers-master\*.*" "."
	Move ".\ThrownHammers-master\hammers" "."
	RD /S /Q ".\ThrownHammers-master"
)
%IF% "Tiax_for_BGII-master" (
	Move ".\Tiax_for_BGII-master\Tiax" "."
	RD /S /Q ".\Tiax_for_BGII-master"
)
%IF% "TowerOfDeception-master" (
	Move ".\TowerOfDeception-master\TOD" "."
	Move ".\TowerOfDeception-master\Setup-ToD.exe" "."
	RD /S /Q ".\TowerOfDeception-master"
)
%IF% "Turnabout-main" (
	Move ".\Turnabout-main\turnabout" "."
	RD /S /Q ".\Turnabout-main"
)
%IF% "Tweaks-Anthology-master" (
	Move ".\Tweaks-Anthology-master\cdtweaks" "."
	RD /S /Q ".\Tweaks-Anthology-master"
)
%IF% "UnfinishedBusiness-master" (
	Move ".\UnfinishedBusiness-master\ub" "."
	RD /S /Q ".\UnfinishedBusiness-master"
)
%IF% "Under-Respresented_Items-master" (
	Move ".\Under-Respresented_Items-master\underrep" "."
	RD /S /Q ".\Under-Respresented_Items-master"
)
%IF% "bg2-uniqueartifacts-master" (
	Move ".\bg2-uniqueartifacts-master\ua" "."
	Move ".\bg2-uniqueartifacts-master\docs" ".\ua"
	RD /S /Q ".\bg2-uniqueartifacts-master"
)
%IF% "unique-artifacts-v7.13" (
	Move ".\unique-artifacts-v7.13\ua" "."
	Move ".\unique-artifacts-v7.13\setup-ua.exe" "."
	RD /S /Q ".\unique-artifacts-v7.13"
)
%IF% "VolcanicArmoury1.5" (
	Move ".\VolcanicArmoury1.5\VolcanicArmoury" "."
	Move ".\VolcanicArmoury1.5\*.*" "."
	RD /S /Q ".\VolcanicArmoury1.5"
)
%IF% "WheelsOfProphecy-master" (
	Move ".\WheelsOfProphecy-master\wheels" "."
	RD /S /Q ".\WheelsOfProphecy-master"
)
%IF% "widescreen-master" (
	Move ".\widescreen-master\wheels" "."
	RD /S /Q ".\widescreen-master"
)
%IF% "Xan_BG1_Friendship-master" (
	Move ".\Xan_BG1_Friendship-master\XanBG1Friend" "."
	RD /S /Q ".\Xan_BG1_Friendship-master"
)
%IF% "Xan_for_BGII-master" (
	Move ".\Xan_for_BGII-master\Xan" "."
	RD /S /Q ".\Xan_for_BGII-master"
)


:: correct wrongly packed files with extended filenames
%IF% "*-CoranBGFriend-*" (
	PUSHD "*-CoranBGFriend-*"
	Move /y "coranbgfriend" ".."
	Move /y "setup-coranbgfriend.exe" ".."
	POPD
	for /d %%i in (".\*-CoranBGFriend-*") do RD /S /Q %%i
)
%IF% "DruidGroveMakeover\DruidGroveMakeover" (
	ren "DruidGroveMakeover" "DruidGroveMakeoverX"
	Move /y "DruidGroveMakeoverX\DruidGroveMakeover" "."
	Move /y "DruidGroveMakeoverX\SETUP-DruidGroveMakeover.exe" "."
	RD /S /Q ".\DruidGroveMakeoverX"
)
%IF% "*-ItemRevisions-*" (
	PUSHD "*-ItemRevisions-*"
	Move /y "item_rev" ".."
	POPD
	for /d %%i in (".\*-ItemRevisions-*") do RD /S /Q %%i
)
%IF% "*-Might_and_Guile-*" (
	PUSHD "*-Might_and_Guile-*"
	Move /y "might_and_guile" ".."
	Move /y "setup-might_and_guile.exe" ".."
	POPD
	for /d %%i in (".\*-Might_and_Guile-*") do RD /S /Q %%i
)
%IF% "*-NPC_EE-*" (
	PUSHD "*-NPC_EE-*"
	Move /y "NPC_EE" ".."
	Move /y "setup-npc_ee.exe" ".."
	POPD
	for /d %%i in (".\*-NPC_EE-*") do RD /S /Q %%i
)
%IF% "*-Scales_of_Balance-*" (
	PUSHD "*-Scales_of_Balance-*"
	Move /y "scales_of_balance" ".."
	Move /y "setup-scales_of_balance.exe" ".."
	POPD
	for /d %%i in (".\*-Scales_of_Balance-*") do RD /S /Q %%i
)
%IF% "*-SongAndSilence-*" (
	PUSHD "*-SongAndSilence-*"
	Move /y "song_and_silence" ".."
	POPD
	for /d %%i in (".\*-SongAndSilence-*") do RD /S /Q %%i
)
%IF% "*-SpellRevisions-*" (
	PUSHD "*-SpellRevisions-*"
	Move /y "spell_rev" ".."
	POPD
	for /d %%i in (".\*-SpellRevisions-*") do RD /S /Q %%i
)
%IF% "*-SwordCoastStratagems-*" (
	PUSHD "*-SwordCoastStratagems-*"
	Move /y "stratagems" ".."
	POPD
	for /d %%i in (".\*-SwordCoastStratagems-*") do RD /S /Q %%i
)
%IF% "*-ThrownHammers-*" (
	PUSHD "*-ThrownHammers-*"
	Move /y "hammers" ".."
	Move /y "*.*" ".."
	POPD
	for /d %%i in (".\*-ThrownHammers-*") do RD /S /Q %%i
)
%IF% "*-TowerOfDeception-*" (
	PUSHD "*-TowerOfDeception-*"
	Move /y "*.*" ".."
	Move /y "TOD" ".."
	POPD
	for /d %%i in (".\*-TowerOfDeception-*") do RD /S /Q %%i
)
%IF% "*-widescreen-*" (
	PUSHD "*-widescreen-*"
	Move /y "widescreen" ".."
	POPD
	for /d %%i in (".\*-widescreen-*") do RD /S /Q %%i
)

:: Vecna text replacement
%IF% vecna %IF% "Vecna v23 - Text Overhaul v1.1" (
	copy /y ".\Vecna v23 - Text Overhaul v1.1\Language\English\*.*" ".\vecna\Language\English"
	copy /y ".\Vecna v23 - Text Overhaul v1.1\Vecna v23 - Text Overhaul v1.1 - ReadMe.txt" ".\vecna"
	RD /S /Q ".\Vecna v23 - Text Overhaul v1.1"
)

:: IR revision
%IF% item_rev %IF% IR_Revised-master (
	robocopy /S ".\IR_Revised-master\spell_rev" item_rev
	RD /S /Q ".\IR_Revised-master"
)

:: SR revision
%IF% spell_rev %IF% SR_Revised-master (
	robocopy /S ".\SR_Revised-master\spell_rev" spell_rev
	RD /S /Q ".\SR_Revised-master"
)

:: IA add-ons
%IF% .\infinityanimations (
	%IF% .\frost_giant (
		move .\frost_giant\*.* .\infinityanimations\content
		RD /S /Q .\frost_giant
	)
	%IF% .\harpy (
		move .\harpy\*.* .\infinityanimations\content
		RD /S /Q .\harpy
		)
	%IF% .\shadow_large_murky (
		move .\shadow_large_murky\*.* .\infinityanimations\content
		RD /S /Q .\shadow_large_murky
	)
	%IF% .\shadow_small_murky (
		move .\shadow_small_murky\*.* .\infinityanimations\content
		RD /S /Q .\shadow_small_murky
	)
)

:: remove empty folders
for /D %%a in ("infinityanimations\content\*") do rd /q /s "%%a"

:: remove unnecessary OneNote files
%IF% NMTP (
	attrib "NMTP\*.*" -s -h -r /D /S
	For /R "NMTP" %%G IN (*.onetoc2) do del "%%G"
)

:: add missing setup-###.exe
%IF% 7C-Yoshi\7C-Yoshi.tp2 copy /Y WeiDU.exe SETUP-7C-Yoshi.exe | %M%
%IF% 7c#addlevel\7c#addlevel.tp2 copy /Y WeiDU.exe Setup-7c#addlevel.exe | %M%
%IF% 7c#sartweak\7c#sartweak.tp2 copy /Y WeiDU.exe SETUP-7c#sartweak.exe | %M%
%IF% A7#ImprovedArcher\setup-A7#ImprovedArcher.tp2 copy /Y WeiDU.exe setup-A7#ImprovedArcher.exe | %M%
%IF% AC_QUEST\ac_quest.TP2 copy /Y WeiDU.exe setup-ac_quest.exe | %M%
%IF% ACBre\ACBre.TP2 copy /Y WeiDU.exe setup-ACBre.exe | %M%
%IF% ajantisbg1\Setup-AjantisBG1.tp2 copy /Y WeiDU.exe setup-AjantisBG1.exe | %M%
%IF% alternatives\setup-alternatives.tp2 copy /Y WeiDU.exe setup-alternatives.exe | %M%
%IF% amber\amber.tp2 copy /Y WeiDU.exe setup-amber.exe | %M%
%IF% angelo\setup-angelo.tp2 copy /Y WeiDU.exe setup-angelo.exe | %M%
%IF% aranw\setup-aranw.tp2 copy /Y WeiDU.exe setup-aranw.exe | %M%
%IF% Setup-Area_Patcher.tp2 copy /Y WeiDU.exe Setup-Area_Patcher.exe | %M%
%IF% ascension\Ascension.tp2 copy /Y WeiDU.exe setup-ascension.exe | %M%
%IF% Assassinations\Assassinations.TP2 copy /Y WeiDU.exe setup-Assassinations.exe | %M%
%IF% atweaks\setup-atweaks.tp2 copy /Y WeiDU.exe setup-atweaks.exe | %M%
%IF% aurenaseph\setup-aurenaseph.tp2 copy /Y WeiDU.exe setup-aurenaseph.exe | %M%
%IF% backbrynnlaw\backbrynnlaw.tp2 copy /Y WeiDU.exe setup-backbrynnlaw.exe | %M%
%IF% banterpack\Setup-banterpack.tp2 copy /Y WeiDU.exe setup-banterpack.exe | %M%
%IF% bg1npc\bg1npc.tp2 copy /Y WeiDU.exe setup-bg1npc.exe | %M%
%IF% bg1npcmusic\setup-bg1npcmusic.tp2 copy /Y WeiDU.exe setup-bg1npcmusic.exe | %M%
%IF% bg1ub\setup-bg1ub.tp2 copy /Y WeiDU.exe setup-bg1ub.exe | %M%
%IF% bg2fixpack\setup-bg2fixpack.tp2 copy /Y WeiDU.exe setup-bg2fixpack.exe | %M%
%IF% bgt\bgt.tp2 copy /Y WeiDU.exe setup-bgt.exe | %M%
%IF% bgqe\setup-bgqe.tp2 copy /Y WeiDU.exe setup-bgqe.exe | %M%
%IF% Branwen\branwen.tp2 copy /Y WeiDU.exe setup-branwen.exe | %M%
%IF% bst\setup-bst.tp2 copy /Y WeiDU.exe setup-bst.exe | %M%
%IF% c#brage\c#brage.tp2 copy /Y WeiDU.exe setup-c#brage.exe | %M%
%IF% c#endlessbg1\c#endlessbg1.tp2 copy /Y WeiDU.exe Setup-c#endlessbg1.exe | %M%
%IF% c#greythedog\Setup-c#greythedog.tp2 copy /Y WeiDU.exe Setup-c#greythedog.exe | %M%
%IF% c#husam\c#husam.tp2 copy /Y WeiDU.exe setup-c#husam.exe | %M%
%IF% c#sb_silber\setup-c#sb_silber.tp2 copy /Y WeiDU.exe Setup-c#sb_silber.exe | %M%
%IF% c#solaufein\c#solaufein.tp2 copy /Y WeiDU.exe Setup-c#solaufein.exe | %M%
%IF% cdtweaks\setup-cdtweaks.tp2 copy /Y WeiDU.exe setup-cdtweaks.exe | %M%
%IF% celestials\setup-celestials.tp2 copy /Y WeiDU.exe setup-celestials.exe | %M%
%IF% cernd\cernd.tp2 copy /Y WeiDU.exe setup-cernd.exe | %M%
%IF% Coran\Coran.tp2 copy /Y WeiDU.exe setup-Coran.exe | %M%
%IF% corthalaromantique\corthalaromantique.tp2 copy /Y WeiDU.exe setup-corthalaromantique.exe | %M%
%IF% Setup-Cre_Patcher.tp2 copy /Y WeiDU.exe Setup-Cre_Patcher.exe | %M%
%IF% setup-crefixer.tp2 copy /Y WeiDU.exe setup-crefixer.exe | %M%
%IF% crossmodbg2\setup-crossmodbg2.tp2 copy /Y WeiDU.exe setup-crossmodbg2.exe | %M%
%IF% CtBcutImp\setup-CtBcutImp.tp2 copy /Y WeiDU.exe setup-CtBcutImp.exe | %M%
%IF% d0tweak\setup-d0tweak.tp2 copy /Y WeiDU.exe setup-d0tweak.exe | %M%
%IF% DC\DC.tp2 copy /Y WeiDU.exe setup-DC.exe | %M%
%IF% deArnise\deArnise.tp2 copy /Y WeiDU.exe setup-deArnise.exe | %M%
%IF% divine_remix\setup-divine_remix.tp2 copy /Y WeiDU.exe setup-divine_remix.exe | %M%
%IF% DjinniCompanion\DjinniCompanion.tp2 copy /Y WeiDU.exe setup-DjinniCompanion.exe | %M%
%IF% druidsor\setup-druidsor.tp2 copy /Y WeiDU.exe setup-druidsor.exe | %M%
%IF% DSotSC\DSotSC.tp2 copy /Y WeiDU.exe setup-DSotSC.exe | %M%
%IF% FinchNPC\FinchNPC.tp2 copy /Y WeiDU.exe Setup-FinchNPC.exe | %M%
%IF% FishingForTrouble\FishingForTrouble.tp2 copy /Y WeiDU.exe setup-FishingForTrouble.exe | %M%
%IF% g3anniversary\setup-g3anniversary.tp2 copy /Y WeiDU.exe setup-g3anniversary.exe | %M%
%IF% garrick_flirt\setup-garrick_flirt.tp2 copy /Y WeiDU.exe setup-garrick_flirt.exe | %M%
%IF% Gavin\gavin.tp2 copy /Y WeiDU.exe setup-gavin.exe | %M%
%IF% gavin_bg2\setup-gavin_bg2.tp2 copy /Y WeiDU.exe setup-gavin_bg2.exe | %M%
%IF% GlamNPCPack\setup-glamnpcpack.tp2 copy /Y WeiDU.exe setup-glamnpcpack.exe | %M%
%IF% ggib_tweaks\ggib_tweaks.tp2 copy /Y WeiDU.exe setup-ggib_tweaks.exe | %M%
%IF% haerdalis_friendship\haerdalis_friendship.tp2 copy /Y WeiDU.exe setup-haerdalis_friendship.exe | %M%
%IF% haldamir\setup-haldamir.tp2 copy /Y WeiDU.exe setup-haldamir.exe | %M%
%IF% setup-Helarine_BGEE.Tp2 copy /Y WeiDU.exe setup-Helarine_BGEE.exe | %M%
%IF% hiddenadventure\hiddenadventure.tp2 copy /Y WeiDU.exe setup-hiddenadventure.exe | %M%
%IF% IndiNPC\Setup-IndiNPC.tp2 copy /Y WeiDU.exe setup-IndiNPC.exe | %M%
%IF% Setup-Item_Patcher.tp2 copy /Y WeiDU.exe Setup-Item_Patcher.exe | %M%
%IF% item_rev\item_rev.tp2 copy /Y WeiDU.exe setup-item_rev.exe | %M%
%IF% itemupgrade\itemupgrade.tp2 copy /Y WeiDU.exe setup-itemupgrade.exe | %M%
%IF% iwdification\setup-iwdification.tp2 copy /Y WeiDU.exe setup-iwdification.exe | %M%
%IF% jimfix\setup-jimfix.tp2 copy /Y WeiDU.exe setup-jimfix.exe | %M%
%IF% keldorn_rom\keldorn_rom.tp2 copy /Y WeiDU.exe setup-keldorn_rom.exe | %M%
%IF% kelsey\kelsey.tp2 copy /Y WeiDU.exe setup-kelsey.exe | %M%
%IF% keto\Setup-Keto.tp2 copy /Y WeiDU.exe Setup-Keto.exe | %M%
%IF% kiara-zaiya\kiara-zaiya.tp2 copy /Y WeiDU.exe setup-kiara-zaiya.exe | %M%
%IF% kivan\setup-kivan.tp2 copy /Y WeiDU.exe setup-kivan.exe | %M%
%IF% korganfriendship\korganfriendship.tp2 copy /Y WeiDU.exe setup-korganfriendship.exe | %M%
%IF% Lena\Setup-Lena.tp2 copy /Y WeiDU.exe setup-Lena.exe | %M%
%IF% setup-lolfixer.tp2 copy /Y WeiDU.exe setup-lolfixer.exe | %M%
%IF% mih_eq\setup-mih_eq.tp2 copy /Y WeiDU.exe setup-mih_eq.exe | %M%
%IF% mih_ip\setup-mih_ip.tp2 copy /Y WeiDU.exe setup-mih_ip.exe | %M%
%IF% mur'neth\mur'neth.tp2 copy /Y WeiDU.exe setup-mur'neth.exe | %M%
%IF% ninde\ninde.tp2 copy /Y WeiDU.exe setup-ninde.exe | %M%
%IF% SETUP-NMT.tp2 copy /Y WeiDU.exe SETUP-NMT.exe | %M%
%IF% SETUP-NMR-HAPPY.tp2 copy /Y WeiDU.exe SETUP-NMR-HAPPY.exe | %M%
%IF% npc_tweak\npc_tweak.tp2 copy /Y WeiDU.exe setup-npc_tweak.exe | %M%
%IF% npcflirt\setup-npcflirt.tp2 copy /Y WeiDU.exe Setup-npcflirt.exe | %M%
%IF% refinements\setup-refinements.tp2 copy /Y WeiDU.exe setup-refinements.exe | %M%
%IF% RE\Setup-RE.tp2 copy /Y WeiDU.exe Setup-RE.exe | %M%
%IF% reunion\reunion.tp2 copy /Y WeiDU.exe Setup-reunion.exe | %M%
%IF% rolles\rolles.tp2 copy /Y WeiDU.exe setup-rolles.exe | %M%
%IF% rr\setup-rr.tp2 copy /Y WeiDU.exe setup-rr.exe | %M%
%IF% sarahtob\setup-sarahtob.tp2 copy /Y WeiDU.exe setup-sarahtob.exe | %M%
%IF% Sellswords\Sellswords.tp2 copy /Y WeiDU.exe setup-Sellswords.exe | %M%
%IF% setup-semi_multi_clerics.tp2 copy /Y WeiDU.exe setup-semi_multi_clerics.exe | %M%
%IF% shardsofice\setup-shardsofice.tp2 copy /Y WeiDU.exe setup-shardsofice.exe | %M%
%IF% SirinesCall\Setup-SirinesCall.tp2 copy /Y WeiDU.exe Setup-SirinesCall.exe | %M%
%IF% SkipChateauIrenicus\setup-SkipChateauIrenicus.tp2 copy /Y WeiDU.exe setup-SkipChateauIrenicus.exe | %M%
%IF% song_and_silence\setup-song_and_silence.tp2 copy /Y WeiDU.exe setup-song_and_silence.exe | %M%
%IF% spstuff\setup-spstuff.tp2 copy /Y WeiDU.exe setup-spstuff.exe | %M%
%IF% spell_rev\setup-spell_rev.tp2 copy /Y WeiDU.exe setup-spell_rev.exe | %M%
%IF% star\star.tp2 copy /Y WeiDU.exe setup-star.exe | %M%
%IF% stivan\setup-stivan.tp2 copy /Y WeiDU.exe setup-stivan.exe | %M%
%IF% stratagems\setup-stratagems.tp2 copy /Y WeiDU.exe setup-stratagems.exe | %M%
%IF% tb#kits\tb#kits.tp2 copy /Y WeiDU.exe setup-tb#kits.exe | %M%
%IF% tb#tweaks\tb#tweaks.tp2 copy /Y WeiDU.exe setup-tb#tweaks.exe | %M%
%IF% thecalling\thecalling.tp2 copy /Y WeiDU.exe setup-thecalling.exe | %M%
%IF% setup-tooltipfix.tp2 copy /Y WeiDU.exe setup-tooltipfix.exe | %M%
%IF% Tiax\Tiax.tp2 copy /Y WeiDU.exe setup-Tiax.exe | %M%
%IF% tnt\tnt.tp2 copy /Y WeiDU.exe setup-tnt.exe | %M%
%IF% ToA\setup-toa.tp2 copy /Y WeiDU.exe setup-toa.exe | %M%
%IF% TOD\tod.tp2 copy /Y WeiDU.exe setup-TOD.exe | %M%
%IF% turnabout\setup-turnabout.tp2 copy /Y WeiDU.exe setup-turnabout.exe | %M%
%IF% ub\setup-ub.tp2 copy /Y WeiDU.exe setup-ub.exe | %M%
%IF% ua\ua.tp2 copy /Y WeiDU.exe setup-ua.exe | %M%
%IF% underrep\setup-underrep.tp2 copy /Y WeiDU.exe setup-underrep.exe | %M%
%IF% Setup-W_3kradziej.tp2 copy /Y WeiDU.exe Setup-W_3kradziej.exe | %M%
%IF% wheels\setup-wheels.tp2 copy /Y WeiDU.exe setup-wheels.exe | %M%
%IF% widescreen\widescreen.tp2 copy /Y WeiDU.exe setup-widescreen.exe | %M%
%IF% setup-XP-info.tp2 copy /Y WeiDU.exe setup-XP-info.exe | %M%
%IF% xpmod\setup-xpmod.tp2 copy /Y WeiDU.exe setup-xpmod.exe | %M%
%IF% XanBG1Friend\Setup-XanBG1Friend.tp2 copy /Y WeiDU.exe Setup-XanBG1Friend.exe | %M%
%IF% Xan\xan.tp2 copy /Y WeiDU.exe setup-xan.exe | %M%


:: rename filenames otherwise these mods cannot be installed automatically by WeiDU or checked by List.bat
%IF% "1Sylm-setup.tp2" ren "1Sylm-setup.tp2" "setup-1Sylm.tp2" | %M%
%IF% "1Sylm-setup.exe" ren "1Sylm-setup.exe" "setup-1Sylm.exe" | %M%
%IF% "setup RGenie.tp2" ren "setup RGenie.tp2" "setup-RGenie.tp2" | %M%
%IF% "setup RGenie.exe" ren "setup RGenie.exe" "setup-RGenie.exe" | %M%
%IF% "Setup-BWL Contest.tp2" ren "Setup-BWL Contest.tp2" "Setup-BWL_Contest.tp2" | %M%
%IF% "Setup-BWL Contest.exe" ren "Setup-BWL Contest.exe" "Setup-BWL_Contest.exe" | %M%
%IF% "SandrahToT-setup.tp2" ren "SandrahToT-setup.tp2" "setup-SandrahToT.tp2" | %M%
%IF% "SandrahToT-setup.exe" ren "SandrahToT-setup.exe" "setup-SandrahToT.exe" | %M%

:: workaround to handle filenames with special charcters
%IF% setup-b!tweak.exe move .\b!tweak\setup-b!tweak.tp2 "." | %M%
%IF% setup-b!tweak.exe ren setup-b!tweak.exe setup-btweak.exe | %M%
%IF% setup-b!tweak.tp2 ren setup-b!tweak.tp2 setup-btweak.tp2 | %M%

%IF% setup-b!tweak_lite.exe move .\b!tweak_lite\setup-b!tweak_lite.tp2 "." | %M%
%IF% setup-b!tweak_lite.exe ren setup-b!tweak_lite.exe setup-btweak_lite.exe | %M%
%IF% setup-b!tweak_lite.tp2 ren setup-b!tweak_lite.tp2 setup-btweak_lite.tp2 | %M%

%IF% setup-LavaIt!.exe move .\LavaIt!\Setup-LavaIt!.tp2 "." | %M%
%IF% Setup-LavaIt!.exe ren Setup-LavaIt!.exe Setup-LavaIt.exe | %M%
%IF% Setup-LavaIt!.tp2 ren Setup-LavaIt!.tp2 Setup-LavaIt.tp2 | %M%

%IF% "Setup-R*deur.exe" ren "Setup-R*deur.exe" "Setup-Rodeur.exe" | %M%
%IF% "Setup-R*deur.tp2" ren "Setup-R*deur.tp2" "Setup-Rodeur.tp2" | %M%

%IF% "SetupP!Bhaal.exe" ren "SetupP!Bhaal.exe" "Setup-PBhaal.exe" | %M%
%IF% "SetupP!Bhaal.tp2" ren "SetupP!Bhaal.tp2" "Setup-PBhaal.tp2" | %M%

%IF% "Setup-Grimuars_v4.1.exe" ren "Setup-Grimuars_v4.1.exe" "Setup-Grimuars.exe" | %M%
%IF% "Setup-Grimuars_v4.1.tp2" ren "Setup-Grimuars_v4.1.tp2" "Setup-Grimuars.tp2" | %M%

%IF% "lyricsetup.exe" ren "lyricsetup.exe" "Setup-lyric.exe" | %M%
%IF% "lyricsetup.tp2" ren "lyricsetup.tp2" "Setup-lyric.tp2" | %M%

:: There may be no "%M%" in the following lines because otherwise "^&Sith" causes a syntax error.
%IF% Setup-Jedi^&Sith.exe ren Setup-Jedi^&Sith.exe Setup-Jedi_Sith.exe
%IF% Setup-Jedi^&Sith.tp2 ren Setup-Jedi^&Sith.tp2 Setup-Jedi_Sith.tp2

%IF% Setup-!BInfinitySounds.exe move .\!BInfinitySounds\Setup-!BInfinitySounds.tp2 "." | %M%
%IF% Setup-!BInfinitySounds.exe ren Setup-!BInfinitySounds.exe Setup-BInfinitySounds.exe | %M%
%IF% Setup-!BInfinitySounds.tp2 ren Setup-!BInfinitySounds.tp2 Setup-BInfinitySounds.tp2 | %M%

:: add missing folder
xcopy /i /y .\bgt\install\win32\x86 .\bgt\install\win32\amd64
