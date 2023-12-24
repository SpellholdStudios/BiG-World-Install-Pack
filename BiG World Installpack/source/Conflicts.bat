SETLOCAL
cd /d %DPATH%

%TXT1% | findstr @000 | Call %C% 
%IF% "BWP Conflicts.txt" del "BWP Conflicts.txt"
%IFS%TDD.exe (
	rem Install BGT after TDD to have imported BGT NPC's from BG1 to get the quests offered by TDD.
	echo BGT2DTDD>> %CON%

	rem Install TDD after BGT for TDD NPC's to have their quests function.
	rem echo TDD2DBGT>> %CON%
)

:CONNEJSA
%IFS%NeJ3v71%IFIF%SandrahNPC.exe GOTO :RUNNEJSA
%IFS%NeJ3v71.exe GOTO :CONNEJB2
%IFS%SandrahNPC.exe GOTO :REQSANDR
GOTO :CONRYLO2
:RUNNEJSA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @196 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoSandrah>> %CON% & goto :CONNEJB2
if /I "%X%"=="2" echo CnoNEJ>> %CON% & goto :REQSANDR
if /I "%X%"=="3" goto :REQSANDR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNNEJSA


::#1 only if Sandrah is selected
:REQSANDR
findstr /I /M "CnoSandrah" %CON%>nul
if not errorlevel 1 (
	goto :CONKELB2
)
findstr /I /M "individual" %CON%>nul
if not errorlevel 1 (
	goto :CONSAND1
)
%IFS%SandrahNPC.exe GOTO :RUNSANDR
GOTO :CONKELB2
:RUNSANDR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @193 | Call %C% & %TXT% | findstr @547 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :SANDRREQ
if /I "%X%"=="2" goto :SANDRSIG
if /I "%X%"=="3" goto :SANDRLES
if /I "%X%"=="4" echo SandrahNPC_skp>> %CON% & goto :CONKELB2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSANDR
:SANDRLES
echo SandrahNPC_les>> %CON%
:SANDRSIG
echo SandrahNPC_sig>> %CON%
:SANDRREQ
echo SandrahNPC_req>> %CON%

:CONSAND1
%IFS%SandrahNPC.exe (
	%IFS%DKDrizzt.exe GOTO :RUNSAND1
	%IFS%sharteel.exe GOTO :RUNSAND1
	%IFS%JA#BGT_AdvPack.exe GOTO :RUNSAND1
)
GOTO :CONKELB2
:RUNSAND1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @194 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo ConSandrah>> %CON% & goto :CONKELB2
if /I "%X%"=="2" goto :CONKELB2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSAND1


::#2 only if NEJ is selected
:CONNEJB2
%IFNS%NeJ3v71.exe GOTO :CONKELB2
%IFS%NeJ3v71.exe (
	%IFNS%CtB%IFNIF%SoS%IFNIF%TDD%IFNIF%RoT.exe GOTO :CONNEJSP
)
:RUNNEJB2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @651 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoBig4BG2>> %CON% & goto :CONNEJSP
if /I "%X%"=="2" goto :CONNEJSP
if /I "%X%"=="3" echo CnoNEJ>> %CON% & goto :CONKELB2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNNEJB2

:CONNEJSP
%IFS%NeJ3v71.exe (
	%IFNS%spell_rev%IFNIF%Spell50%IFNIF%SpellPackB6%IFNIF%stratagems.bat goto :CONSHART
)
:CONNEJS2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @188 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo NEJHalruaa>> %CON% & goto :CONSHART
if /I "%X%"=="2" echo NoNEJHalruaa>> %CON% & goto :CONSHART
if /I "%X%"=="3" goto :CONSHART
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONNEJS2

:CONSHART
findstr /I /M "CnoNEJ" %CON%>nul
if errorlevel 1 (
	%IFS%NeJ3v71%IFIF%sharteel.exe GOTO :RUNSHART
)
GOTO :CONKELB2
:RUNSHART
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @154 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CNoFirewalker>> %CON% & goto :CONKELB2
if /I "%X%"=="2" echo CFirewalker>> %CON% & goto :CONKELB2
if /I "%X%"=="3" goto :CONKELB2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSHART


::#3 only if big BG2 mods are not deselected
:CONKELB2
findstr /I /M "CnoBig4BG2" %CON%>nul
if not errorlevel 1 (
	goto :CONRYLO2
)

%IFNS%CtB%IFNIF%SoS%IFNIF%TDD%IFNIF%RoT.exe GOTO :CONRYLOR
:CONVLADS
%IFNS%VCv21.exe GOTO :CONKELDOR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @650 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoBig4BG2>> %CON% & goto :CONRYLO2
if /I "%X%"=="2" goto :CONRYLOR
if /I "%X%"=="3" echo CnoKeldornv101 CnoTS>> %CON% & goto :CONRYLOR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONVLADS

:CONKELDOR
%IFNS%Keldornv101.exe GOTO :CONRYLOR
%IFNS%VCv21.exe GOTO :CONRYLOR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @652 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoBig4BG2>> %CON% & goto :CONRYLO2
if /I "%X%"=="2" goto :CONRYLOR
if /I "%X%"=="3" echo CnoKeldornv101>> %CON% & goto :CONRYLOR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONKELDOR

:CONRYLOR
%IFNS%Rylorn.exe goto :CONELLES
%IFNS%CtB%IFNIF%NeJ3v71%IFNIF%RoT%IFNIF%SOS%IFNIF%TDD%IFNIF%TS.exe GOTO :CONELLES
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 goto :CONRYSAN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @648 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoBig4BG2 CnoNeJ CnoTS>> %CON% & goto :CONRYLO2
if /I "%X%"=="2" echo CNoRylorn>> %CON% & goto :CONELLES
if /I "%X%"=="3" goto :CONELLES
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONRYLOR

:CONRYSAN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @670 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CNoRylorn>> %CON% & goto :CONELLES
if /I "%X%"=="2" goto :CONELLES
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONRYLOR

:CONELLES
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 goto :CONDRIZZ
%IFS%TDD%IFIF%sharteel.exe GOTO :RUNELLES
GOTO :CONDRIZZ
:RUNELLES
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @160 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CTDDCSharTeel>> %CON% & goto :CONDRIZZ
if /I "%X%"=="2" echo CSharTeel>> %CON% & goto :CONDRIZZ
if /I "%X%"=="3" goto :CONDRIZZ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNELLES

:CONDRIZZ
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 goto :CONRYLO2
%IFS%ROT%IFIF%DKDrizzt.exe GOTO :RUNDRIZZ
GOTO :CONRYLO2
:RUNDRIZZ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @153 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo COctDrizzt>> %CON% & goto :CONRYLO2
if /I "%X%"=="2" echo CRoTDrizzt>> %CON% & goto :CONRYLO2
if /I "%X%"=="3" goto :CONRYLO2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNDRIZZ


::#4 quest mods conflicts
:CONRYLO2
%IFNS%Rylorn.exe goto :CONINNER
findstr /I /M "CNoRylorn" %CON%>nul
if not errorlevel 1 goto :CONINNER
%IFNS%sword_and_fist%IFNIF%PPK%IFNIF%kitrtt%IFNIF%Tactics%IFNIF%Ebg2%IFNIF%x0black.exe GOTO :CONINNER
:RUNRYLO2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @649 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CRylornNoKit>> %CON% & goto :CONINNER
if /I "%X%"=="2" echo CNoRylorn>> %CON% & goto :CONINNER
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNRYLO2

:CONINNER
%IFS%Innershade%IFIF%Severian.exe GOTO :RUNINNER
GOTO :CONMORTI
:RUNINNER
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @187 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CSeverian>> %CON% & goto :CONMORTI
if /I "%X%"=="2" echo CInner>> %CON% & goto :CONMORTI
if /I "%X%"=="3" goto :CONMORTI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNINNER

:CONMORTI
%IFS%Mortis.exe (
	%IFS%Raziel.exe GOTO :RUNMORTI
	%IFS%worgas.exe GOTO :RUNMORTI
)
goto :CONASCEN
:RUNMORTI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @183 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo Mortis>> %CON% & goto :CONASCEN
if /I "%X%"=="2" echo Raziel_Worgas>> %CON% & goto :CONASCEN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNMORTI

:CONASCEN
%IFS%Ascension%IFIF%BP.exe GOTO :RUNASCEN
goto :CONMIHEQ
:RUNASCEN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @176 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo orig_Ascension>> %CON% & goto :CONMIHEQ
if /I "%X%"=="2" echo BP_Ascension>> %CON% & goto :CONMIHEQ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONASCEN

:CONMIHEQ
%IFS%NeJ3v71%IFIF%mih_eq.exe %IFN% .\mih_eq\ssl\ssl.exe GOTO :RUNMIHEQ
goto :CONIMO4E
:RUNMIHEQ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @251 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo Erevain>> %CON% & goto :CONIMO4E
if /I "%X%"=="2" echo MiH_EQ>> %CON% & goto :CONIMO4E
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONMIHEQ

:CONIMO4E
%IFS%imoen_forever%IFIF%imoenRomance.exe GOTO :RUNIMO4E
%IFS%imoen_forever%IFIF%ImoenIsStone.exe GOTO :RUNIMO4E
goto :CONNALIA
:RUNIMO4E
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @728 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CImoen4Ever>> %CON% & goto :CONNALIA
if /I "%X%"=="2" echo CImoenRom>> %CON% & goto :CONNALIA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONIMO4E


::#5 npc mods conflicts
:CONNALIA
%IFS%LuvNalia%IFIF%deArnise.exe GOTO :RUNNALIA
GOTO :CONKIARA
:RUNNALIA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @150 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CLuvNalia>> %CON% & goto :CONKIARA
if /I "%X%"=="2" echo CDArnise>> %CON% & goto :CONKIARA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNNALIA

:CONKIARA
%IFS%Saerileth%IFIF%Kiara-Zaiya.exe GOTO :RUNKIARA
GOTO :CONYOSH
:RUNKIARA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @159 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CKIARA>> %CON% & goto :CONYOSH
if /I "%X%"=="2" echo CSaerileth>> %CON% & goto :CONYOSH
if /I "%X%"=="3" goto :CONYOSH
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNKIARA

:CONYOSH
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 echo CYoshFriend>> %CON% & goto :CONCORAN
%IFS%7C-Yoshi.exe (
	%IFS%yoshimo.exe GOTO :RUNYOSH
	%IFS%TS.exe GOTO :RUNYOSH
	%IFS%Keto.exe GOTO :RUNYOSH
)
GOTO :CONCORAN
:RUNYOSH
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @155 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CKeepYosh>> %CON% & goto :CONCORAN
if /I "%X%"=="2" echo CYoshFriend>> %CON% & goto :CONCORAN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNYOSH

:CONCORAN
findstr /I /M "SandrahNPC_req" %CON%>nul
if not errorlevel 1 echo CCoranBG2>> %CON% & goto :CONKHALI
%IFS%Coran.exe GOTO :RUNCORAN
GOTO :CONKHALI
:RUNCORAN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @156 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CCoranMod>> %CON% & goto :CONGARRI
if /I "%X%"=="2" echo CCoranBG2>> %CON% & goto :CONKHALI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNCORAN

:CONKHALI
%IFS%Khalid.exe (
	%IFS%Imoen.exe GOTO :RUNKHALI
	%IFS%imoenRomance.exe GOTO :RUNKHALI
	%IFS%iepbanters.exe GOTO :RUNKHALI
	%IFS%kitanya.exe GOTO :RUNKHALI
	%IFS%kivan.exe GOTO :RUNKHALI
	%IFS%Xan.exe GOTO :RUNKHALI
)
GOTO :CONGARRI
:RUNKHALI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @157 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CKhalid>> %CON% & goto :CONGARRI
if /I "%X%"=="2" echo CNoKkalid>> %CON% & goto :CONGARRI
if /I "%X%"=="3" goto :CONGARRI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNKHALI

:CONGARRI
%IFS%garrick_flirt%IFIF%garrick-tt.exe GOTO :RUNGARRI
GOTO :CONBRAN
:RUNGARRI
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @163 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CGarrickflirt>> %CON% & goto :CONBRAN
if /I "%X%"=="2" echo CGarricktales>> %CON% & goto :CONBRAN
if /I "%X%"=="3" goto :CONBRAN
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNGARRI

:CONBRAN
findstr /I /M "CFirewalker" %CON%>nul
if not errorlevel 1 (
	goto :CONIMNEJ
)
%IFS%BranwenNPC%IFIF%POB.exe GOTO :RUNBRANW
GOTO :CONIMNEJ
:RUNBRANW
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @152 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CBranwen>> %CON% & goto :CONIMNEJ
if /I "%X%"=="2" echo CPerils>> %CON% & goto :CONIMNEJ
if /I "%X%"=="3" goto :CONIMNEJ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNBRANW

:CONIMNEJ
%IFS%imoenRomance%IFIF%BDToBv175.exe GOTO :RUNIMNEJ
%IFS%imoenRomance%IFIF%VCv21.exe GOTO :RUNIMNEJ
goto :CONSAND2
:RUNIMNEJ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @161 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CImoenBDash>> %CON% & goto :CONSAND2
if /I "%X%"=="2" echo CNoBDashImoen>> %CON% & goto :CONSAND2
if /I "%X%"=="3" goto :CONSAND2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNIMNEJ

:CONSAND2
%.%
%.%
%IFNS%SandrahNPC.exe GOTO :CONBG1NP
findstr /I /M "CnoSandrah" %CON%>nul
if not errorlevel 1 (
	GOTO :CONBG1NP
)
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @195 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :CONKELDO

:CONBG1NP
%IFNS%BG1NPCSoA.exe GOTO :CONKELDO
%IFS%sharteel.exe GOTO :RUNBG1NP
%IFS%yeslicknpc.exe GOTO :RUNBG1NP
%IFS%garrick_flirt.exe GOTO :RUNBG1NP
%IFS%garrick-tt.exe GOTO :RUNBG1NP
%IFS%POB.exe GOTO :RUNBG1NP
%IFS%BranwenNPC.exe GOTO :RUNBG1NP
%IFS%Skie.exe GOTO :RUNBG1NP
%IFS%Coran.exe GOTO :RUNBG1NP
%IFS%alora.exe GOTO :RUNBG1NP
%IFS%c#ajantis_sva.exe GOTO :RUNBG1NP
%IFS%Kivan.exe GOTO :RUNBG1NP
%IFS%Xan.exe GOTO :RUNBG1NP
%IFS%Quayle.exe GOTO :RUNBG1NP
%IFS%Tiax.exe GOTO :RUNBG1NP
%IFS%NeJ3v71.exe GOTO :RUNBG1NP
goto: :CONKELDO
:RUNBG1NP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @158 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CBG1NPCSoA>> %CON% & goto :CONKELDO
if /I "%X%"=="2" goto :CONKELDO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNBG1NP

:CONKELDO
findstr /I /M "CnoKeldornv101" %SET%>nul
if not errorlevel 1 goto :CONVALYG
%IFNS%keldorn_rom%IFNIF%Keldornv101.exe GOTO :CONVALYG
:RUNKELDO
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @653 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CSenkaKeldorn>> %CON% & goto :CONVALYG
if /I "%X%"=="2" echo CBerelKeldorn>> %CON% & goto :CONVALYG
if /I "%X%"=="3" goto :CONVALYG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNKELDO

:CONVALYG
findstr /I /M "CnoTS" %SET%>nul
if not errorlevel 1 goto :CONVALY2
%IFS%VCv21%IFIF%corthalaromantique.exe GOTO :RUNVALYG
%IFS%TS%IFIF%corthalaromantique.exe GOTO :RUNVALYG
GOTO :RUNVALY2
:RUNVALYG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @706 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoTS>> %CON% & goto :CONVALY2
if /I "%X%"=="2" echo CnoValygarRom>> %CON% & goto :CONPCVAM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNVALYG

:CONVALY2
%IFS%RE%IFIF%corthalaromantique.exe GOTO :RUNVALY2
goto :CONPCVAM
:RUNVALY2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @707 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :CONPCVAM
if /I "%X%"=="2" echo CnoREValygar>> %CON% & goto :CONPCVAM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNVALYG

:CONPCVAM
%IFS%RE%IFIF%pcvamp.exe GOTO :RUNPCVAM
goto :CONACBRE
:RUNPCVAM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @708 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoREBohdi>> %CON% & goto :CONACBRE
if /I "%X%"=="2" echo CnoPCVamp>> %CON% & goto :CONACBRE
if /I "%X%"=="3" goto :AD&DRULE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNPCVAM

:CONACBRE
findstr /I /M "ShortWorgIntr" %SET%>nul
if not errorlevel 1 goto :AD&DRULE
%IFS%ACBre%IFIF%PoFQuestPack%IFIF%Worgas.exe GOTO :RUNACBRE
goto :AD&DRULE
:RUNACBRE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @730 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CACBrePoFQ>> %CON% & goto :AD&DRULE
if /I "%X%"=="2" echo CACBreWorgas>> %CON% & goto :AD&DRULE
if /I "%X%"=="3" echo CWorgasPoFQ>> %CON% & goto :AD&DRULE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNACBRE


::#6 rules conflicts
:AD&DRULE
findstr /I /M "NEJHalruaa" %CON%>nul
if errorlevel 1 (
	GOTO :RULESYST
)
%IFS%FotD.exe GOTO :AD&DSELE
%IFS%KKits.exe GOTO :AD&DSELE
GOTO :RULESYST
:AD&DSELE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @632 | Call %C%
%IFS%FotD%IFIF%KKits.exe %TXT% | findstr @633 | Call %C%
%IFS%KKits%IFNIF%FotD.exe %TXT% | findstr @638 | Call %C%
%IFS%FotD%IFNIF%KKits.exe %TXT% | findstr @639 | Call %C%
%TXT% | findstr @634 | Call %C%
%IFS%FotD%IFNIF%KKits.exe %TXT% | findstr @635 | Call %C% & %TXT% | findstr @545 | Call %C%
%IFS%KKits%IFNIF%FotD.exe %TXT% | findstr @636 | Call %C% & %TXT% | findstr @545 | Call %C%
%IFS%FotD%IFIF%KKits.exe %TXT% | findstr @635 | Call %C% & %TXT% | findstr @637 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo NoRuleChange>> %CON% & goto :RULESYST
if /I "%X%"=="2" %IFS%FotD%IFNIF%KKits.exe echo FotD>> %CON% & goto :RULESYST
                 %IFS%KKits%IFNIF%FotD.exe echo KKits>> %CON% & goto :CONSPHER
if /I "%X%"=="3" echo KKits>> %CON% & goto :CONSPHER
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :AD&DSELE

:RULESYST
%IFS%fullplate%IFIF%item_rev.exe GOTO :RULESELE
GOTO :CONSPHER
:RULESELE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @039 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo ITEMREVS>> %CON% & goto :CONSPHER
if /I "%X%"=="2" echo FULLPLATE>> %CON% & goto :CONSPHER
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RULESELE

:CONSPHER
%IFNS%divine_remix.exe GOTO :AICHECK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @255 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo DRSPHERE>> %CON% & goto :AICHECK
if /I "%X%"=="2" goto :AICHECK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :CONSPHER


:AICHECK
%IFS%stratagems%IFIF%BP.exe GOTO :AISELECT
GOTO :CONSPELL
:AISELECT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @038 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo BP_AI>> %CON% & goto :CONSPELL
if /I "%X%"=="2" echo SCS_AI>> %CON% & goto :CONSPELL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :AISELECT


::#7 spell conflicts
:CONSPELL
findstr /I /M "KKits NEJHalruaa" %CON%>nul
if errorlevel 1 (
	%IFS%spell_rev%IFIF%SpellPackB6.exe GOTO :RUNSPELL
)
goto :CONWEAPR
:RUNSPELL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @178 | Call %C% & %TXT% | findstr @546 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo SpellPack>> %CON% & goto :CONWEAPR
if /I "%X%"=="2" echo SpellRevStrict>> %CON% & goto :CONWEAPR
if /I "%X%"=="3" echo SpellRev SpellPack>> %CON% & goto :CONWEAPR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSPELL

:CONSPLB6
%IFS%WildMage%IFIF%SpellPackB6.exe GOTO :RUNSPLB6
goto :CONSPL50
:RUNSPLB6
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @179 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo SpellPack>> %CON% & goto :CONWEAPR
if /I "%X%"=="2" echo Wildmage>> %CON% & goto :CONWEAPR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSPLB6

:CONSPL50
%IFS%spell_rev.exe (
	%IFS%Spell50.exe GOTO :RUNSPL50
	%IFS%gMinion.exe GOTO :RUNSPL50
	%IFS%ImprovedSummons.exe GOTO :RUNSPL50
)
goto :CONIMSUM
:RUNSPL50
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @181 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo SpellRev>> %CON% & goto :CONWEAPR
if /I "%X%"=="2" echo Spell50_gMinion>> %CON% & goto :CONIMSUM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSPL50

:CONIMSUM
%IFS%ImprovedSummons.exe (
	%IFS%Spell50.exe GOTO :RUNIMSUM
	%IFS%gMinion.exe GOTO :RUNIMSUM
)
goto :CONDIVRM
:RUNIMSUM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @182 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo ImprSummons>> %CON% & goto :CONWEAPR
if /I "%X%"=="2" echo Spell50_gMinion>> %CON% & goto :CONWEAPR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNIMSUM

:CONDIVRM
%IFS%spell_rev%IFIF%Divine_Remix.exe GOTO :RUNDIVRM
goto :CONWEAPR
:RUNDIVRM
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @180 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo SpellRev SpellRevStrict>> %CON% & goto :CONWEAPR
if /I "%X%"=="2" echo SpellRev>> %CON% & goto :CONWEAPR
if /I "%X%"=="3" echo DivineR>> %CON% & goto :CONWEAPR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNDIVRM


::#8 tweaks conflicts
:CONWEAPR
%IFS%scales_of_balance.exe set SoB=1
%IFS%cdtweaks.exe set CDT=1
%IFS%ashesofembers.exe set AoE=1
%IFS%Vic.exe set Vic=1
%IFS%Kitpack6.exe set KP6=1
%IFS%level1npcs.exe set LV1=1
set /A weapprof=SoB+CDT+AoE+Vic+KP6+LV1
if %weapprof% GEQ 2 (goto :RUNWEAPR) else (goto :CONRESTR)

:RUNWEAPR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @709 | Call %C%
%IFS%scales_of_balance.exe %TXT% | findstr @710 | Call %C%
%IFS%cdtweaks.exe %TXT% | findstr @711 | Call %C%
%IFS%ashesofembers.exe %TXT% | findstr @712 | Call %C%
%IFS%Vic.exe %TXT% | findstr @713 | Call %C%
%IFS%Kitpack6.exe %TXT% | findstr @714 | Call %C%
%IFS%level1npcs.exe %TXT% | findstr @715 | Call %C%
%IFS%song_and_silence.exe %TXT% | findstr @716 | Call %C%
%TXT% | findstr @727 | Call %C%

%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CnoCDTWeap CnoAoEWeap CnoVicWeap CnoKP6Weap CnoLV1Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="2" echo CnoSoBWeap CnoAoEWeap CnoVicWeap CnoKP6Weap CnoLV1Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="3" echo CnoSoBWeap CnoCDTWeap CnoVicWeap CnoKP6Weap CnoLV1Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="4" echo CnoSoBWeap CnoCDTWeap CnoAoEWeap CnoKP6Weap CnoLV1Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="5" echo CnoSoBWeap CnoCDTWeap CnoAoEWeap CnoVicWeap CnoLV1Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="6" echo CnoSoBWeap CnoCDTWeap CnoAoEWeap CnoVicWeap CnoKP6Weap CnoSaSWeap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="7" echo CnoSoBWeap CnoCDTWeap CnoAoEWeap CnoVicWeap CnoKP6Weap CnoLV1Weap CWeaProMod>> %CON% & goto :CONRESTR
if /I "%X%"=="8" echo CnoSoBWeap CnoCDTWeap CnoAoEWeap CnoVicWeap CnoKP6Weap CnoLV1Weap CnoSaSWeap>> %CON% & goto :CONRESTR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNWEAPR

:CONRESTR
findstr /I /M "KKits" %CON%>nul
if errorlevel 1 (
	%IFS%ashesofembers%IFIF%btweak.exe GOTO :RUNRESTR
	%IFS%ashesofembers%IFIF%btweak_lite.exe GOTO :RUNRESTR
)
GOTO :CONSOBIW
:RUNRESTR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @184 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo AoE_Restr>> %CON% & goto :CONSOBIW
if /I "%X%"=="2" echo btweak_Restr>> %CON% & goto :CONSOBIW
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNRESTR

:CONSOBIW
%IFS%scales_of_balance%IFIF%stratagems.exe goto :RUNSOBIW
goto :CONMGKI6
:RUNSOBIW
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @198 | Call %C% & %TXT% | findstr @190 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CSOBIWO>> %CON% & goto :CONMGKI6
if /I "%X%"=="2" echo CNoSOBIWO>> %CON% & goto :CONMGKI6
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSOBIW

:CONMGKI6
%IFS%might_and_guile%IFIF%Kitpack6.exe goto :RUNMGKI6
GOTO :CONFIRKG
:RUNMGKI6
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @197 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CMaGwithKit6>> %CON% & goto :CONFIRKG
if /I "%X%"=="2" echo CMaGnoKit6>> %CON% & goto :CONFIRKG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNMGKI6

:CONFIRKG
%IFS%BuTcHeRy.exe (
	%IFS%Firkraag.exe GOTO :RUNFIRKG
	%IFS%RevisedBattles.exe GOTO :RUNFIRKG
)
goto :KITSELEC
:RUNFIRKG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @191 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo BuTcHeRy>> %CON% & goto :KITSELEC
if /I "%X%"=="2" echo Firkraag>> %CON% & goto :KITSELEC
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNFIRKG


::#9 kits conflicts
:KITSELEC
%IFNS%ashesofembers.exe GOTO :CONHIDEK
findstr /I /M "KKits" %CON%>nul
if errorlevel 1 (
	GOTO :CONHIDEK
)
:RUNAOEKI
%TXT1% | findstr @000 | Call %C%
%IFS%ashesofembers.exe %TXT% | findstr @036 | Call %C%
%IFS%worgas.exe %TXT% | findstr @035 | Call %C%
%IFS%ashesofembers.exe %TXT% | findstr @037 | Call %C%
%TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="N" GOTO :CONHIDEK
if /I "%X%"=="Y" echo AOE_Kits>> %CON% & goto :CONHIDEK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNAOEKI

:CONHIDEK
%IFS%HideKt.exe (
	%IFS%scales_of_balance.exe goto :RUNHIDEK
	%IFS%might_and_guile.exe goto :RUNHIDEK
)
GOTO :GUISTYLE
:RUNHIDEK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @640 | Call %C%
%IFS%scales_of_balance.exe %TXT% | findstr @641 | Call %C%
%IFS%might_and_guile.exe %TXT% | findstr @642 | Call %C%
%TXT% | findstr @643 | Call %C%
%IFS%scales_of_balance%IFIF%might_and_guile.exe %TXT% | findstr @644 | Call %C%
%IFS%scales_of_balance%IFNIF%might_and_guile.exe %TXT% | findstr @645 | Call %C% &  %TXT% | findstr @545 | Call %C% & goto :RUNHIDE2
%IFS%might_and_guile%IFNIF%scales_of_balance.exe %TXT% | findstr @646 | Call %C%
%IFS%might_and_guile.exe %TXT% | findstr @647 | Call %C%
%TXT% | findstr @546 | Call %C%
:RUNHIDE2
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CHideKit>> %CON% & goto :GUISTYLE
if /I "%X%"=="2" echo CNoHideKit>> %CON% & goto :GUISTYLE
if /I "%X%"=="3" echo CSkipSoBHideKit>> goto :GUISTYLE
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNHIDEK

::#10 misc conflicts

:GUISTYLE
%IFNS%TutuGUI%IFNIF%W_GUI%IFNIF%1pp.exe GOTO :CONENCNT
:RUNGUIST
%TXT1% | findstr @000 | Call %C%
%TXT% | findstr @172 | Call %C%
%IFS%1pp.exe %TXT% | findstr @173 | Call %C%
%IFS%TutuGUI.exe %TXT% | findstr @174 | Call %C%
%IFS%W_GUI.exe %TXT% | findstr @175 | Call %C%
%TXT% | findstr @547 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :CONENCNT
if /I "%X%"=="2" echo PP1GUI>> %CON% & goto :CONENCNT
if /I "%X%"=="3" echo TUTUGUI>> %CON% & goto :CONENCNT
if /I "%X%"=="4" echo W_GUI>> %CON% & goto :CONENCNT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNGUIST

:CONENCNT
%IFS%stratagems.exe (
	%IFS%BP.exe GOTO :RUNENCNT
	%IFS%DSoA.exe GOTO :RUNENCNT
	%IFS%Tactics.exe GOTO :RUNENCNT
)
goto :CONSTRNG
:RUNENCNT
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @177 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo BP_Encount>> %CON% & goto :CONSTRNG
if /I "%X%"=="2" echo SCS_Encount>> %CON% & goto :CONSTRNG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNENCNT

:CONSTRNG
%IFS%NPC_Strongholds.exe (
	%IFS%multistronghold.exe GOTO :RUNSTRNG
	%IFS%cdtweaks.exe GOTO :RUNSTRNG	
	%IFS%cliffhistory.exe GOTO :RUNSTRNG
	%IFS%Oversight.exe GOTO :RUNTRNG
	%IFS%hiddenadventure.exe GOTO :RUNTRNG
)
GOTO :CONCLIFF
:RUNSTRNG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @162 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CNPCStrong>> %CON% & goto :CONMOVNP
if /I "%X%"=="2" echo CNoNPCStrong>> %CON% & goto :CONCLIFF
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNSTRNG

:CONCLIFF
%IFS%multistronghold.exe (
	%IFS%cliffhistory.exe GOTO :RUNCLIFF
	%IFS%Oversight.exe GOTO :RUNCLIFF
)
GOTO :CONMOVNP
:RUNCLIFF
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @185 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo CliffHistory>> %CON% & goto :CONMOVNP
if /I "%X%"=="2" echo multistronghold>> %CON% & goto :CONMOVNP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNCLIFF

:CONMOVNP
%IFS%bg1npcbeg.exe (
	%IFS%bg1npc.exe GOTO :RUNMOVNP
	%IFS%stratagems.exe GOTO :RUNMOVNP
)
GOTO :ENDCONFL
:RUNMOVNP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @186 | Call %C% & %TXT% | findstr @545 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" echo bg1npcscs>> %CON% & goto :ENDCONFL
if /I "%X%"=="2" echo bg1npcbeg>> %CON% & goto :ENDCONFL
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RUNMOVNP

:ENDCONFL
