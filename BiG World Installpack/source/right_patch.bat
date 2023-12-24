SETLOCAL
cd /d %DPATH%

findstr /I /M "VERSION.*.*~v7.1~" .\Divine_Remix\Setup-Divine_Remix.tp2>nul
if not errorlevel 1 (
	ren .\"%BWFP%"\Divine_Remix_v7 Divine_Remix
	ren .\"%BWTP% GERMAN"\Divine_Remix_v7 Divine_Remix
)

findstr /I /M "VERSION.*.*~v8~ VERSION.*.*~v8.1~" .\Divine_Remix\Setup-Divine_Remix.tp2>nul
if not errorlevel 1 (
	ren .\"%BWFP%"\Divine_Remix_v8 Divine_Remix
)

%IFS%TDD%IFNIF%ninde%IFNIF%Rylorn.exe ren .\"%BWFP%"\TDD\Setup-TDD.tp2.noNinde_noRylorn Setup-TDD.tp2.patch

%IFS%TDD%IFIF%ninde%IFIF%Rylorn.exe (
	findstr /I /M "CNoRylorn" %SET%>nul
	if errorlevel 1 (
		ren .\"%BWFP%"\TDD\Setup-TDD.tp2.Ninde_Rylorn Setup-TDD.tp2.patch & ren .\"%BWFP%\Ninde\lk#nindj.d.TDD" lk#nindj.d.patch
	) else (
		ren .\"%BWFP%"\TDD\Setup-TDD.tp2.Ninde_noRylorn Setup-TDD.tp2.patch & ren .\"%BWFP%\Ninde\lk#nindj.d.TDD" lk#nindj.d.patch
	)
	goto :NEJ3BRAN
)

%IFS%TDD%IFNIF%ninde%IFIF%Rylorn.exe (
	findstr /I /M "CNoRylorn" %SET%>nul
	if errorlevel 1 (
		ren .\"%BWFP%"\TDD\Setup-TDD.tp2.noNinde_Rylorn Setup-TDD.tp2.patch
	) else (
		ren .\"%BWFP%"\TDD\Setup-TDD.tp2.noNinde_noRylorn Setup-TDD.tp2.patch
	)
)


:NEJ3BRAN
%IFS%NeJ3v71%IFIF%BranwenNPC.exe (
	copy /Y ".\%BWFP%\_override\AR0602-CELL07\*.*" ".\override" | %M%
	xcopy /Y /S ".\%BWFP%\_mod\BranwenNPC" ".\%BWFP%\BranwenNPC" | %M%
)

findstr /I /M "ShortWorgIntr" %SET%>nul
if not errorlevel 1 (
	copy /Y ".\%BWFP%\_mod\worgas\*.*" ".\%BWFP%\worgas" | %M%
)

findstr /I /M "skipPoFQIntr" %SET%>nul
if not errorlevel 1 (
	copy /Y ".\%BWFP%\_mod\PoFQuestPack\*.*" ".\%BWFP%\PoFQuestPack" | %M%
)

findstr /C:"VERSION ~v3.1~ //" DSOTSC/DSOTSC.TP2>nul
if not errorlevel 1 (
	ren .\"%BWTP%"\DSotSC\DSotSC.tp2.patch DSotSC.tp2.patch.bak
	ren .\"%BWTP%"\DSotSC\DSotSC.tp2.patch_v3.1 .\DSotSC.tp2
)

%IF% virtue\Version20Alpha_readme.txt (
	ren .\"%BWFP%"\virtue_v20 virtue
	) else (
	ren .\"%BWFP%"\virtue_v19 virtue
)