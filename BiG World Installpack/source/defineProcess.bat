SETLOCAL
cd /d %DPATH%

:QUESTTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @505 | Call %C%
%TXT% | findstr @548 | Call %C%
:LARGEQUE
%TXT% | findstr @506 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo LargeQuest>> %SET% & goto :MEDIUMQU
if /I "%X%"=="N" goto :MEDIUMQU
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :QUESTTYP

:MEDIUMQU
%TXT% | findstr @507 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo MediumQuest>> %SET% & goto :SMALLQUE
if /I "%X%"=="N" goto :SMALLQUE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :QUESTTYP

:SMALLQUE
%TXT% | findstr @508 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo SmallQuest>> %SET% & goto :DIFFICUL
if /I "%X%"=="N" goto :DIFFICUL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :QUESTTYP

:DIFFICUL
findstr /I /M "LargeQuest MediumQuest SmallQuest" %SET%>nul
if %errorlevel%==0 (
	goto :DIFFICU1
) else (
	goto :NPCTYPE
)
:DIFFICU1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @509 | Call %C%
%TXT% | findstr @547 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :EASYQUES
if /I "%X%"=="2" goto :STANQUES
if /I "%X%"=="3" goto :HARDQUES
if /I "%X%"=="4" goto :EXPEQUES
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :DIFFICU1
:EXPEQUES
echo ExpertQuest>> %SET%
:HARDQUES
echo HardQuest>> %SET%
:STANQUES
echo StandardQuest>> %SET%
:EASYQUES
echo EasyQuest>> %SET%

:NPCTYPE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @510 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
:NEWNPCS
%TXT% | findstr @511 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo NewAddedNPC>> %SET% & goto :CONTINPC
if /I "%X%"=="N" goto :CONTINPC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:CONTINPC
%TXT% | findstr @512 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo ContinuingNPC>> %SET% & goto :NPCBANTE
if /I "%X%"=="N" goto :NPCBANTE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:NPCBANTE
%TXT% | findstr @513 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo NPCBanter>> %SET% & goto :ONEDAYNP 
if /I "%X%"=="N" goto :ONEDAYNP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:ONEDAYNP
%TXT% | findstr @514 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo OneDayNPC>> %SET% & goto :SOATOBNP
if /I "%X%"=="N" goto :SOATOBNP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:SOATOBNP
%TXT% | findstr @515 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo SoAToBContentNPCOnly>> %SET% & goto :VOICEDNP
if /I "%X%"=="N" goto :VOICEDNP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:VOICEDNP
%TXT% | findstr @516 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo VoicedNPCOnly>> %SET% & goto :AGREENPC
if /I "%X%"=="N" goto :AGREENPC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:AGREENPC
%.%
%TXT% | findstr @496 | Call %C%
%TXT% | findstr @545 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :COMPANIO
if /I "%X%"=="2" goto :NPCTYPE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NPCTYPE

:COMPANIO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @517 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Companions>> %SET% & goto :ITEMTYPE
if /I "%X%"=="N" goto :ITEMTYPE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :COMPANIO

:ITEMTYPE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @518 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo NewItems>> %SET% & goto :SPELLTYP
if /I "%X%"=="N" goto :SPELLTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :ITEMTYPE

:SPELLTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @519 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo NewSpells>> %SET% & goto :STRENGTH
if /I "%X%"=="N" goto :STRENGTH
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :SPELLTYP

:STRENGTH
findstr /I /M "NewItems NewSpells" %SET%>nul
if %errorlevel%==0 (
	goto :STRENGT1
) else (
	goto :CORRESTA
)
:STRENGT1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @520 | Call %C%
%TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :EASYSTRE
if /I "%X%"=="2" goto :STANSTRE
if /I "%X%"=="3" goto :OVERSTRE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :STRENGT1
:OVERSTRE
echo OverpoweredItemSpell>> %SET%
:STANSTRE
echo StandardItemSpell>> %SET%
:EASYSTRE
echo EasyItemSpell>> %SET%

:CORRESTA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @521 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Correction>> %SET% & echo Restoration>> %SET% & goto :NEWKITS
if /I "%X%"=="N" goto :NEWKITS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CORRESTA

:NEWKITS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @522 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo NewKit>> %SET% & goto :TACTICMO
if /I "%X%"=="N" goto :TACTICMO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :NEWKITS

:TACTICMO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @523 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo TacticMod>> %SET% & goto :CHALLANG
if /I "%X%"=="N" goto :TWEAKTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TACTICMO

:CHALLANG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @524 | Call %C%
%TXT% | findstr @549 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo LightChallenges>> %SET% & goto :TWEAKTYP
if /I "%X%"=="2" echo MediumChallenges>> %SET% & goto :TWEAKTYP
if /I "%X%"=="3" echo HeavyChallenges>> %SET% & goto :TWEAKTYP
if /I "%X%"=="4" echo VeryHardChallenges>> %SET% & goto :TWEAKTYP
if /I "%X%"=="5" echo ExtremeChallenges>> %SET% & goto :TWEAKTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CHALLANG

:TWEAKTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @525 | Call %C%
%TXT% | findstr @548 | Call %C%
:ITEMTWEA
%TXT% | findstr @526 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo ItemTweak>> %SET% & goto :SPELTWEA
if /I "%X%"=="N" goto :SPELTWEA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:SPELTWEA
%TXT% | findstr @527 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo SpellTweak>> %SET% & goto :KITTWEAK
if /I "%X%"=="N" goto :KITTWEAK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:KITTWEAK
%TXT% | findstr @528 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo KitTweak>> %SET% & goto :GAMETWEA
if /I "%X%"=="N" goto :GAMETWEA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:GAMETWEA
%TXT% | findstr @529 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo GameplayTweak>> %SET% & goto :AITWEAKS
if /I "%X%"=="N" goto :AITWEAKS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:AITWEAKS
%TXT% | findstr @530 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo AITweak>> %SET% & goto :XPTWEAKS
if /I "%X%"=="N" goto :XPTWEAKS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:XPTWEAKS
%TXT% | findstr @531 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo XPTweak>> %SET% & goto :HLATWEAK
if /I "%X%"=="N" goto :HLATWEAK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:HLATWEAK
%TXT% | findstr @532 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo HLATweak>> %SET% & goto :PNPTWEAK
if /I "%X%"=="N" goto :PNPTWEAK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:PNPTWEAK
%TXT% | findstr @533 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo PnPTweak>> %SET% & goto :IWDTWEAK
if /I "%X%"=="N" goto :IWDTWEAK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:IWDTWEAK
%TXT% | findstr @534 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo IWDTweak>> %SET% & goto :RULETWEA
if /I "%X%"=="N" goto :RULETWEA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:RULETWEA
%TXT% | findstr @535 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo RuleTweak>> %SET% & goto :MISCTWEA
if /I "%X%"=="N" goto :MISCTWEA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:MISCTWEA
%TXT% | findstr @536 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo MiscTweak>> %SET% & goto :CONVTWEA
if /I "%X%"=="N" goto :CONVTWEA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:CONVTWEA
%TXT% | findstr @537 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" echo ConvenienceTweak>> %SET% & goto :AGREETWK
if /I "%X%"=="N" goto :STRENTWK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:AGREETWK
%.%
%TXT% | findstr @495 | Call %C%
%TXT% | findstr @545 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :STRENTWK
if /I "%X%"=="2" goto :TWEAKTYP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :TWEAKTYP

:STRENTWK
findstr /I /M "ItemTweak SpellTweak KitTweak GameplayTweak AITweak XPTweak HLATweak PnPTweak IWDTweak RuleTweak MiscTweak ConvenienceTweak" %SET%>nul
if %errorlevel%==0 (
	goto :STRNTWK1
) else (
	goto :SKRIPTS
)
:STRNTWK1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @538 | Call %C%
%TXT% | findstr @549 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" echo CheatTweak>> %SET% & goto :SKRIPTS
if /I "%X%"=="2" echo EasyTweak>> %SET% & goto :SKRIPTS
if /I "%X%"=="3" echo StandardTweak>> %SET% & goto :SKRIPTS
if /I "%X%"=="4" echo HeavyTweak>> %SET% & goto :SKRIPTS
if /I "%X%"=="5" echo ExtremeTweak>> %SET% & goto :SKRIPTS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :STRNTWK1

:SKRIPTS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @539 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Scripts>> %SET% & goto :PORTRAIT
if /I "%X%"=="N" goto :PORTRAIT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :SKRIPTS

:PORTRAIT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @540 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Portrait>> %SET% & goto :GRAPHICS
if /I "%X%"=="N" goto :GRAPHICS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :PORTRAIT

:GRAPHICS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @619 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Graphic>> %SET% & goto :COSMETIC
if /I "%X%"=="N" goto :COSMETIC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :GRAPHICS

:COSMETIC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @626 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Cosmetic>> %SET% & goto :FUNMODS
if /I "%X%"=="N" goto :FUNMODS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :COSMETIC

:FUNMODS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @541 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo FunMod>> %SET% & goto :INCONGRU
if /I "%X%"=="N" goto :INCONGRU
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :FUNMODS

:INCONGRU
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @609 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo IncongruousMod>> %SET% & goto :ADULTCON
if /I "%X%"=="N" goto :ADULTCON
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :INCONGRU

:ADULTCON
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @542 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo AdultContent>> %SET% & goto :CHEATORX
if /I "%X%"=="N" goto :CHEATORX
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :ADULTCON

:CHEATORX
findstr /I /M "CheatTweak" %SET%>nul
if %errorlevel%==0 (
	goto :CHEATMOD
) else (
	goto :EXPERIEN
)
:EXPERIEN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @611 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo ExperiencedPlayer>> %SET% & goto :BETAVERS
if /I "%X%"=="N" goto :BETAVERS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :EXPERIEN

:BETAVERS
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @543 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo BetaVersion>> %SET% & goto :BUGGYMOD
if /I "%X%"=="N" goto :BUGGYMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :BETAVERS

:BUGGYMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @610 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Buggymod>> %SET% & goto :RATEDMOD
if /I "%X%"=="N" goto :RATEDMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :BUGGYMOD

:CHEATMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%.%
%TXT% | findstr @612 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo Cheatmod>> %SET% & goto :RATEDMOD
if /I "%X%"=="N" goto :RATEDMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CHEATMOD

:RATEDMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @497 | Call %C%
%.%
%TXT% | findstr @544 | Call %C%
%TXT% | findstr @549 | Call %C%
set X=
set /P X=
if /I "%X%"=="1" goto :TOPRATED
if /I "%X%"=="2" goto :HIGHRATED
if /I "%X%"=="3" goto :MIDRATED
if /I "%X%"=="4" goto :NOTRATED
if /I "%X%"=="5" goto :LOWRATED
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RATEDMOD
:LOWRATED
echo LowRated>> %SET%
:NOTRATED
echo NotRated>> %SET%
:MIDRATED
echo MidRated>> %SET%
:HIGHRATED
echo HighRated>> %SET%
:TOPRATED
echo TopRated>> %SET%
