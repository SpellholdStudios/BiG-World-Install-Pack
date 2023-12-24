SETLOCAL
cd /d %DPATH%

:MANDMODS
%TXT1% | findstr @006 | Call %C%
%IF% BWP_BG1 %IFS%TobEx%IFIF%BGT%IFIF%TxtMusic%IFIF%bp-bgt-worldmap.exe (
	%IFGS%TP%IFIF%BGT-NPCSound.exe GOTO :MANDMOD2
	%IFE% GOTO :MANDMOD2
	%IFFS%correcfrbg2.exe GOTO :MANDMOD2
	%IFHS%Traduccion_Mejorada.exe GOTO :MANDMOD2
	%IFS% GOTO :MANDMOD2
)

:MANDMOD2
%IF% BWP_BG2 %IFS%TobEx%IFIF%bg2fixpack%IFIF%bp-bgt-worldmap.exe (
	%IFGS%TP.exe GOTO :MISSINGM
	%IFE% GOTO :MISSINGM
	%IFFS%correcfrbg2.exe GOTO :MISSINGM
	%IFHS%Traduccion_Mejorada.exe GOTO :MISSINGM
	%IFR% GOTO :MISSINGM
)
%.%
:: minimum requirements
%TXT% | findstr @019 | Call %C%
%.%
%.%
%IFGNS%TP%MOD% BG2 Textpatch
%IFFNS%correcfrbg2%MOD% Correctif de BG2
%IFHNS%Traduccion_Mejorada%MOD% BG2 Traduccion Mejorada
%IFNS%TobEx%MOD% TobEx
%IFNS%bg2fixpack%MOD% BG2 Fixpack
%IF% BWP_BG1 %IFNS%BGT%MOD% Baldur's Gate Trilogy
%IF% BWP_BG1 %IFGNS%BGT-NPCSound%MOD% BGT-NPCSound
%IF% BWP_BG1 %IFNS%TxtMusic%MOD% TxtMusic
%IFNS%bp-bgt-worldmap%MOD% BP-BGT-Worldmap
%.%
%.%
:: mandatory mods
%TXT% | findstr @031 | Call %C%
%.%
%.%
%.%
pause
GOTO :MANDMODS

:MISSINGM
set bool=0
%.%
%IFNS%TDD%IFIF%AjocMod.exe %TXT% | findstr @100 | Call %C% & set bool=1
%IFNS%Kelsey%IFIF%GRoA.exe %TXT% | findstr @105 | Call %C% & set bool=1
%IFE% %IFN% CespyAudioV1.exe %IFS%ItemUpgrade.exe %TXT% | findstr @119 | Call %C% & set bool=1
%IFN% ".\Kiara-Zaiya\Sounds\Kiara0.ogg" %IFS%Kiara-Zaiya.exe %TXT% | findstr @108 | Call %C% & set bool=1
if %bool%==0 (
	goto :MISSING2
)
%.%
%TXT% | findstr @043 | Call %C%
%.%
%.%
pause
goto :MANDMODS

:MISSING2
set bool=0
%IFNS%Solaufein%IFIF%rpgsolaflirtpack.exe %TXT% | findstr @115 | Call %C% & set bool=1
%IFNS%BP%IFNIF%Ascension.exe (
	%IFNS%LongerRoad%IFNIF%Turnabout.exe goto :TethyrFo
	%IFS%LongerRoad.exe goto :MISSASCE
	%IFS%Turnabout.exe goto :MISSASCE
:MISSASCE
%TXT% | findstr @118 | Call %C% & set bool=1
)

:TethyrFo
%IFNS%TethyrForestPatch%IFIF%CtB.exe (
	%IFNS%TS%IFNIF%VCv21%IFNIF%Tashia.exe goto :FinTethy
	%IFS%TS.exe goto :MISSTETH
	%IFS%VCv21.exe goto :MISSTETH
	%IFS%Tashia.exe goto :MISSTETH
:MISSTETH
%TXT% | findstr @142 | Call %C% & set bool=1
)
:FinTethy

if %bool%==0 (
	goto :MISSING3
)
%.%
%TXT% | findstr @043 | Call %C%
%.%
%.%
pause
goto :MANDMODS

:MISSING3
set bool=0
%IFNS%VCv21%IFNIF%BDToBv175%IFIF%NeJ3v71.exe %TXT% | findstr @110 | Call %C% & set bool=1
%IFNS%BDToBv175%IFIF%TS.exe %TXT% | findstr @109 | Call %C% & set bool=1
%IFNS%SandrahNPC%IFIF%SandrahRTF.exe %TXT% | findstr @219 | Call %C% & set bool=1

if %bool%==0 (
	goto :MISSINGS
)
%.%
%TXT% | findstr @043 | Call %C%
%.%
%.%
pause
goto :MANDMODS

:MISSINGS
set bool=0
%IFS%SandrahNPC.exe (
	%IFNS%SandrahRTF.exe %TXT% | findstr @244 | Call %C% & set bool=1
	%IFNS%BGT.exe %TXT% | findstr @220 | Call %C% & set bool=1
	%IFNS%Ascension%IFNIF%BP.exe %TXT% | findstr @243 | Call %C% & set bool=1
	%IFNS%BG1NPC.exe %TXT% | findstr @227 | Call %C% & set bool=1
)
if %bool%==0 (
	goto :MISSINS1
)
%.%
%TXT% | findstr @058 | Call %C%
%.%
%.%
pause
goto :MANDMODS

:MISSINS1
set bool=0
%IFS%SandrahNPC.exe (
	%IFNS%CtB.exe %TXT% | findstr @221 | Call %C% & set bool=1
	%IFNS%TDD.exe %TXT% | findstr @222 | Call %C% & set bool=1
	%IFNS%RoT.exe %TXT% | findstr @223 | Call %C% & set bool=1
	%IFNS%DSotSC.exe %TXT% | findstr @224 | Call %C% & set bool=1
	%IFNS%NTotSC.exe %TXT% | findstr @225 | Call %C% & set bool=1
	%IFNS%drizztsaga.exe %TXT% | findstr @226 | Call %C% & set bool=1
)
if %bool%==0 (
	goto :SANDRAHM
)
%.%
%TXT% | findstr @058 | Call %C%
%.%
%.%
pause
goto :MANDMODS

:SANDRAHM
%IFNS%SandrahNPC.exe GOTO :FINMISSI
%IFS%SandrahNPC.exe (
	%IFS%ac_quest%IFIF%bgqe%IFIF%ACBre%IFIF%Chloe%IFIF%FinchNPC%IFIF%FishingForTrouble%IFIF%Kivan%IFIF%planarspheremod%IFIF%Saerileth%IFIF%soa%IFIF%TGC1E%IFIF%Vault%IFIF%Yasraena.exe GOTO :FINMISSI
	%IFS%ac_quest%IFIF%bgqe%IFIF%ACBre%IFIF%Chloe%IFIF%FinchNPC.exe GOTO :MISSAND1
	%IFNS%ac_quest.exe %TXT% | findstr @230 | Call %C%
	%IFNS%bgqe.exe %TXT% | findstr @231 | Call %C%
	%IFNS%ACBre.exe %TXT% | findstr @232 | Call %C%
	%IFNS%Chloe.exe %TXT% | findstr @233 | Call %C%
	%IFNS%FinchNPC.exe %TXT% | findstr @234 | Call %C%
	%.%
	%TXT% | findstr @229 | Call %C% & %.% & pause
	:MISSAND1
	%TXT1% | findstr @006 | Call %C% & %TXT% | findstr @018 | Call %C%
	%.%
	%IFS%FishingForTrouble%IFIF%Kivan%IFIF%planarspheremod%IFIF%Saerileth.exe GOTO :MISSAND2
	%IFNS%FishingForTrouble.exe %TXT% | findstr @235 | Call %C%
	%IFNS%Kivan.exe %TXT% | findstr @236 | Call %C%
	%IFNS%planarspheremod.exe %TXT% | findstr @237 | Call %C%
	%IFNS%Saerileth.exe %TXT% | findstr @238 | Call %C%
	%.%
	%TXT% | findstr @229 | Call %C% & %.% & pause
	:MISSAND2
	%TXT1% | findstr @006 | Call %C% & %TXT% | findstr @018 | Call %C%
	%.%
	%IFS%soa%IFIF%TGC1E%IFIF%Vault%IFIF%Yasraena.exe GOTO :REPSANDR
	%IFNS%soa.exe %TXT% | findstr @239 | Call %C%
	%IFNS%TGC1E.exe %TXT% | findstr @240 | Call %C%
	%IFNS%Vault.exe %TXT% | findstr @241 | Call %C%
	%IFNS%Yasraena.exe %TXT% | findstr @242 | Call %C%
	%TXT% | findstr @229 | Call %C% & %.% & pause
)
:REPSANDR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @245 | Call %C% & %TXT% | findstr @548 | Call %C% & %TXT1% | findstr @001 | Call %C%
set X=
set /P X=
if /I "%X%"=="Y" goto :MANDMODS
if /I "%X%"=="N" goto :FINMISSI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :REPSANDR

:FINMISSI

:X86STRAT
if %PROCESSOR_ARCHITECTURE% == x86 %IF% .\stratagems\ssl\ssl.exe (
	for %%F in ("stratagems\ssl\ssl.exe") do set sizeF=%%~zF
	%W2%
	if "%sizeF%" == "493923" goto :X86WHEEL
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @724 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	goto :X86STRAT
)

:X86WHEEL
if %PROCESSOR_ARCHITECTURE% == x86 %IF% .\wheels\ssl\ssl.exe (
	for %%F in ("wheels\ssl\ssl.exe") do set sizeF=%%~zF
	%W2%
        if "%sizeF%" == "493923" goto :X86MIHEQ
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @725 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	goto :X86WHEEL
)

:X86MIHEQ
if %PROCESSOR_ARCHITECTURE% == x86 %IF% .\mih_eq\ssl\ssl.exe (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @726 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	goto :X86MIHEQ
)
%.%
%.%
%TXT% | findstr @006 | Call %C%

%.%modcheck>> %IPL%