SETLOCAL
cd /d %DPATH%

setlocal enabledelayedexpansion

%TXT1% | findstr @000 | Call %C% | %M% & %TXT% | findstr @054 | Call %C% | %M%

findstr /I /M "BWP_BG1" %SET%>nul & findstr /I /M "BWP_BG2" %SET%>nul
if %errorlevel%==0 (
	%TXT%  | findstr @055 | Call %C% | %M%
	goto :foundgam
)
findstr /I /M "BWP_BG1" %SET%>nul
if %errorlevel%==0 (
	%TXT% | findstr @057 | Call %C% | %M%
)
findstr /I /M "BWP_BG2" %SET%>nul
if %errorlevel%==0 (
	%TXT% | findstr @056 | Call %C% | %M%
)
:foundgam

findstr /I /M "LargeQuest MediumQuest SmallQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @553 ^| Call %C%') do set quest=!quest!%%a
) else (
	%TXT% | findstr @608 | Call %C%
	goto :noquestf
)
findstr /I /M "LargeQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @554 ^| Call %C%') do set quest=!quest!%%a
)
findstr /I /M "LargeQuest" %SET%>nul & findstr /I /M "MediumQuest" %SET%>nul & findstr /I /M "SmallQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set quest=!quest!%%a
	goto :foundque
)
findstr /I /M "LargeQuest" %SET%>nul & findstr /I /M "MediumQuest SmallQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set quest=!quest!%%a
)
:foundque
findstr /I /M "MediumQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @555 ^| Call %C%') do set quest=!quest!%%a
)
findstr /I /M "MediumQuest" %SET%>nul & findstr /I /M "SmallQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set quest=!quest!%%a
)
findstr /I /M "SmallQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @556 ^| Call %C%') do set quest=!quest!%%a
)
for /f "delims=" %%a in ('%TXT% ^| findstr @557 ^| Call %C%') do set quest=!quest!%%a
findstr /I /M "ExpertQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @558 ^| Call %C%') do set quest=!quest!%%a
	goto :founfdif
)
findstr /I /M "HardQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @559 ^| Call %C%') do set quest=!quest!%%a
	goto :founfdif
)
findstr /I /M "StandardQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @560 ^| Call %C%') do set quest=!quest!%%a
	goto :founfdif
)
findstr /I /M "EasyQuest" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @561 ^| Call %C%') do set quest=!quest!%%a
	goto :founfdif
)
:founfdif
%.% !quest! | %M%
:noquestf

for /f "delims=" %%a in ('%TXT% ^| findstr @562 ^| Call %C%') do set npcs=!npcs!%%a
findstr /I /M "NewAddedNPC" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @563 ^| Call %C%') do set npcs=!npcs!%%a
)
findstr /I /M "NewAddedNPC" %SET%>nul & findstr /I /M "ContinuingNPC" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set npcs=!npcs!%%a
)
findstr /I /M "ContinuingNPC" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @564 ^| Call %C%') do set npcs=!npcs!%%a
)
findstr /I /M "NewAddedNPC ContinuingNPC" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set npcs=!npcs!%%a
)
findstr /I /M "SoAToBContentNPCOnly" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @567 ^| Call %C%') do set npcs=!npcs!%%a
) else (
	for /f "delims=" %%a in ('%TXT% ^| findstr @720 ^| Call %C%') do set npcs=!npcs!%%a
)
for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set npcs=!npcs!%%a
findstr /I /M "VoicedNPCOnly" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @568 ^| Call %C%') do set npcs=!npcs!%%a
) else (
	for /f "delims=" %%a in ('%TXT% ^| findstr @719 ^| Call %C%') do set npcs=!npcs!%%a
)
%.% !npcs! | %M%

findstr /I /M "NPCBanter" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @565 ^| Call %C%') do set npcs2=!npcs2!%%a
)
findstr /I /M "NPCBanter" %SET%>nul & findstr /I /M "OneDayNPC Companions" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set npcs2=!npcs2!%%a
)
findstr /I /M "OneDayNPC" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @566 ^| Call %C%') do set npcs2=!npcs2!%%a
)
findstr /I /M "OneDayNPC" %SET%>nul & findstr /I /M "Companions" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set npcs2=!npcs2!%%a
)
findstr /I /M "Companions" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @569 ^| Call %C%') do set npcs2=!npcs2!%%a
)
%.% !npcs2! | %M%

findstr /I /M "NewItems" %SET%>nul & findstr /I /M "NewSpells" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @572 ^| Call %C%') do set strength=!strength!%%a
	goto :founItSp
) 
findstr /I /M "NewItems" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @570 ^| Call %C%') do set strength=!strength!%%a
)
findstr /I /M "NewSpells" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @571 ^| Call %C%') do set strength=!strength!%%a
)
:founItSp
findstr /I /M "EasyItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @573 ^| Call %C%') do set strength=!strength!%%a
)
findstr /I /M "EasyItemSpell" %SET%>nul & findstr /I /M "StandardItemSpell" %SET%>nul & findstr /I /M "OverpoweredItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set strength=!strength!%%a
	goto :foundspe
)
findstr /I /M "EasyItemSpell" %SET%>nul & findstr /I /M "StandardItemSpell OverpoweredItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set strength=!strength!%%a
)
:foundspe
findstr /I /M "StandardItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @574 ^| Call %C%') do set strength=!strength!%%a
)
findstr /I /M "StandardItemSpell" %SET%>nul & findstr /I /M "OverpoweredItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set strength=!strength!%%a
)
findstr /I /M "OverpoweredItemSpell" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @575 ^| Call %C%') do set strength=!strength!%%a
)
%.% !strength! | %M%

findstr /I /M "Correction" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @576 ^| Call %C%') do set correct=!correct!%%a
)
findstr /I /M "Correction" %SET%>nul & findstr /I /M "Cosmetic" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set correct=!correct!%%a	
)
findstr /I /M "Cosmetic" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @627 ^| Call %C%') do set correct=!correct!%%a
)
%.% !correct! | %M%

findstr /I /M "NewKit" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @577 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "NewKit" %SET%>nul & findstr /I /M "Scripts Graphic Portrait" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "Scripts" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @597 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "Scripts" %SET%>nul & findstr /I /M "Graphic Portrait" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "Graphic" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @620 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "Graphic" %SET%>nul & findstr /I /M "Portrait" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set modtype=!modtype!%%a
)
findstr /I /M "Portrait" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @598 ^| Call %C%') do set modtype=!modtype!%%a
)
%.% !modtype! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @578 ^| Call %C%') do set tactic=!tactic!%%a
findstr /I /M "ExtremeChallenges" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @582 ^| Call %C%') do set tactic=!tactic!%%a
	goto :foundtct
)
findstr /I /M "VeryHardChallenges" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @618 ^| Call %C%') do set tactic=!tactic!%%a
	goto :foundtct
)
findstr /I /M "HeavyChallenges" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @581 ^| Call %C%') do set tactic=!tactic!%%a
	goto :foundtct
)
findstr /I /M "MediumChallenges" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @580 ^| Call %C%') do set tactic=!tactic!%%a
	goto :foundtct
)
findstr /I /M "LightChallenges" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @579 ^| Call %C%') do set tactic=!tactic!%%a
	goto :foundtct
)
:foundtct
%.% !tactic! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @583 ^| Call %C%') do set tweak=!tweak!%%a
findstr /I /M "ItemTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @584 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "SpellTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @585 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "KitTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @586 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "GameplayTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @587 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "AITweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @588 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "XPTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @589 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "HLATweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @590 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "PnPTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @591 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "IWDTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @592 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "RuleTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @593 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "ConvenienceTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @595 ^| Call %C%') do set tweak=!tweak!%%a
)
findstr /I /M "MiscTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @594 ^| Call %C%') do set tweak=!tweak!%%a
)
%.% !tweak! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @596 ^| Call %C%') do set Difftwk=!Difftwk!%%a
findstr /I /M "ExtremeTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @558 ^| Call %C%') do set Difftwk=!Difftwk!%%a
	goto :foundtwk
)
findstr /I /M "HeavyTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @559 ^| Call %C%') do set Difftwk=!Difftwk!%%a
	goto :foundtwk
)
findstr /I /M "StandardTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @560 ^| Call %C%') do set Difftwk=!Difftwk!%%a
	goto :foundtwk
)
findstr /I /M "EasyTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @561 ^| Call %C%') do set Difftwk=!Difftwk!%%a
	goto :foundtwk
)
findstr /I /M "CheatTweak" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @613 ^| Call %C%') do set Difftwk=!Difftwk!%%a
	goto :foundtwk
)
:foundtwk
%.% !Difftwk! | %M%

for /f "delims=" %%a in ('%TXT% ^| findstr @551 ^| Call %C%') do set includ=!includ!%%a
findstr /I /M "FunMod" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @599 ^| Call %C%') do set includ=!includ!%%a
)
findstr /I /M "FunMod" %SET%>nul & findstr /I /M "AdultContent IncongruousMod" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set includ=!includ!%%a
)
findstr /I /M "AdultContent" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @600 ^| Call %C%') do set includ=!includ!%%a
)
findstr /I /M "AdultContent" %SET%>nul & findstr /I /M "IncongruousMod" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set includ=!includ!%%a
)
findstr /I /M "IncongruousMod" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @615 ^| Call %C%') do set includ=!includ!%%a
)
%.% !includ! | %M%

findstr /I /M "CheatTweak" %SET%>nul
if %errorlevel%==0 (
	%TXT% | findstr @621 | Call %C% | %M% & goto :SKIPINC2
)

for /f "delims=" %%a in ('%TXT% ^| findstr @617 ^| Call %C%') do set includ2=!includ2!%%a
findstr /I /M "ExperiencedPlayer" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @616 ^| Call %C%') do set includ2=!includ2!%%a
)
findstr /I /M "ExperiencedPlayer" %SET%>nul & findstr /I /M "Buggymod BetaVersion" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set includ2=!includ2!%%a
)
findstr /I /M "Buggymod" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @614 ^| Call %C%') do set includ2=!includ2!%%a
)
findstr /I /M "Buggymod" %SET%>nul & findstr /I /M "BetaVersion" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @550 ^| Call %C%') do set includ2=!includ2!%%a
)
findstr /I /M "BetaVersion" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @601 ^| Call %C%') do set includ2=!includ2!%%a
)
%.% !includ2! | %M%

:SKIPINC2
findstr /I /M "TopRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @603 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "TopRated" %SET%>nul & findstr /I /M "HighRated MidRated NotRated LowRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "HighRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @628 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "HighRated" %SET%>nul & findstr /I /M "MidRated NotRated LowRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "MidRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @604 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "MidRated" %SET%>nul & findstr /I /M "NotRated LowRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "NotRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @606 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "LowRated" %SET%>nul & findstr /I /M "LowRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @552 ^| Call %C%') do set rated=!rated!%%a
)
findstr /I /M "LowRated" %SET%>nul
if %errorlevel%==0 (
	for /f "delims=" %%a in ('%TXT% ^| findstr @605 ^| Call %C%') do set rated=!rated!%%a
)
for /f "delims=" %%a in ('%TXT% ^| findstr @602 ^| Call %C%') do set rated=!rated!%%a
%.% !rated! | %M%

endlocal


