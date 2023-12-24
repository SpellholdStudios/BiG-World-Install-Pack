SETLOCAL
cd /d %DPATH%

:: extract the mods
%IF% "%BWD%\*.7z" "%BWIPU%\7z.exe" x -y "%BWD%\*.7z"
%IF% "%BWD%\*.exe" "%BWIPU%\7z.exe" x -y "%BWD%\*.exe"
%IF% "%BWD%\*.rar" "%BWIPU%\7z.exe" x -y "%BWD%\*.rar"
%IF% "%BWD%\*.tar" "%BWIPU%\7z.exe" x -y "%BWD%\*.tar"
%IF% "%BWD%\*.zip" "%BWIPU%\7z.exe" x -y "%BWD%\*.zip"

%IF% "%BWD%\infinityanimations-b5.rar" (
	%IF% "%BWD%\IA_add-onsC\*.rar" "%BWIPU%\7z.exe" e -y -o".\infinityanimations\content" "%BWD%\IA_add-onsC\*.rar"
	%IF% "%BWD%\IA_add-onsC\*.zip" "%BWIPU%\7z.exe" e -y -o".\infinityanimations\content" "%BWD%\IA_add-onsC\*.zip"
	%IF% "%BWD%\IA_add-onsR\*.rar" "%BWIPU%\7z.exe" e -y -o".\infinityanimations\restore" "%BWD%\IA_add-onsR\*.rar"
)

%IF% "%BWD%\bp-bgt-worldmap*.zip" %IF% "%BWD%\worldmap_add-ons\*.7z" "%BWIPU%\7z.exe" x -y "%BWD%\worldmap_add-ons\*.7z"

%IF% "%BWD%\special\GharethNPC.exe" "%BWIPU%\7z.exe" x -y -o".\GharethNPC" "%BWD%\special\GharethNPC.exe"
%IF% "%BWD%\special\TurnaboutV1.exe" "%BWIPU%\7z.exe" x -y -o".\TurnaboutV1" "%BWD%\special\TurnaboutV1.exe"
