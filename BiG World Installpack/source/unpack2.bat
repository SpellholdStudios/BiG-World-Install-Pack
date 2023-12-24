SETLOCAL
cd /d %DPATH%

SET CBG2=create BGII - SoA

:: extract the mods
%IF% "%BWD%\*.7z" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\*.7z"
%IF% "%BWD%\*.exe" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\*.exe"
%IF% "%BWD%\*.rar" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\*.rar"
%IF% "%BWD%\*.tar" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\*.tar"
%IF% "%BWD%\*.zip" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\*.zip"

%IF% "%BWD%\infinityanimations-b5.rar" (
	%IF% "%BWD%\IA_add-onsC\*.rar" "%BWIPU%\7z.exe" e -y -o"..\%CBG2%\infinityanimations\content" "%BWD%\IA_add-onsC\*.rar"
	%IF% "%BWD%\IA_add-onsC\*.zip" "%BWIPU%\7z.exe" e -y -o"..\%CBG2%\infinityanimations\content" "%BWD%\IA_add-onsC\*.zip"
	%IF% "%BWD%\IA_add-onsR\*.rar" "%BWIPU%\7z.exe" e -y -o"..\%CBG2%\infinityanimations\restore" "%BWD%\IA_add-onsR\*.rar"
)

%IF% "%BWD%\bp-bgt-worldmap*.zip" %IF% "%BWD%\worldmap_add-ons\*.7z" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%" "%BWD%\worldmap_add-ons\*.7z"

%IF% "%BWD%\special\GharethNPC.exe" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%\GharethNPC" "%BWD%\special\GharethNPC.exe"
%IF% "%BWD%\special\TurnaboutV1.exe" "%BWIPU%\7z.exe" x -y -o"..\%CBG2%\TurnaboutV1" "%BWD%\special\TurnaboutV1.exe"
