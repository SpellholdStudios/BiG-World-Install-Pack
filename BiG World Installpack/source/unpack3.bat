SETLOCAL
cd /d %DPATH%

for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set BG1=%%a

:: dialog corrections for BG1
%IF% %BG1% (
     %IFG% %IFN% "%BG1%\setup-bg1tp.exe" %IF% "%BWD%\dialog\MKs_BG1Textpatch_Revised-v3.3.zip" "%BWIPU%\7z.exe" x -y -o"%BG1%" "%BWD%\dialog\MKs_BG1Textpatch_Revised-v3.3.zip"
     %IFF% %IFN% "%BG1%\setup-correcfrbg1.exe" %IF% "%BWD%\dialog\correcfrBG1v*.zip" "%BWIPU%\7z.exe" x -y -o"%BG1%" "%BWD%\dialog\correcfrBG1v*.zip"
     %IFH% %IFN% "%BG1%\Setup-Abra.exe" %IF% "%BWD%\dialog\DLAN_BG1_TOTSC_v5.7z" "%BWIPU%\7z.exe" x -y -o"%BG1%" "%BWD%\dialog\DLAN_BG1_TOTSC_v5.7z"
     %IFH% %IF% "%BWD%\dialog\Sonidos_BG_TotSC_castellano.exe" "%BWIPU%\7z.exe" x -y -o"%BG1%\data" "%BWD%\Sonidos_BG_TotSC_castellano.exe"
     %IFH% %IF% "%BG1%\data\LEEME.htm" move "%BG1%\data\LEEME.htm" "%BG1%"
)

:: move all packages from the subfolders back for reasons of clarity
%IF% "%BWD%\dialog\*.*" move "%BWD%\dialog\*.*" "%BWD%"
%IF% "%BWD%\IA_add-onsC\*.*" move "%BWD%\IA_add-onsC\*.*" "%BWD%"
%IF% "%BWD%\IA_add-onsR\*.*" move "%BWD%\IA_add-onsR\*.*" "%BWD%"
%IF% "%BWD%\quarantine\*.*" move "%BWD%\quarantine\*.*" "%BWD%"
%IF% "%BWD%\special\*.*" move "%BWD%\special\*.*" "%BWD%"
:: %IF% "%BWD%\twice-packed\*.*" move "%BWD%\twice-packed\*.*" "%BWD%"
%IF% "%BWD%\worldmap_add-ons\*.*" move "%BWD%\worldmap_add-ons\*.*" "%BWD%"

