SETLOCAL
cd /d %DPATH%

:: convert the tp2-files and tra-files of EE-mods from UTF-8 to ANSI
:: for Western European use cp1252, for Central European use cp1250, for Cyrillic use cp1251, for Korean use cp949, for Simplified Chinese use cp936, for Traditional Chinese use cp950, for Japanese use cp932


%IFS%ClubOfPain.exe (
	.\%CONV% -f utf-8 -t cp1252 .\ClubOfPain\lang\english.tra > .\ClubOfPain\lang\english.ansi
	.\%CONV% -f utf-8 -t cp1252 .\ClubOfPain\lang\italian.tra > .\ClubOfPain\lang\italian.ansi
	del .\ClubOfPain\lang\*.tra
	ren .\ClubOfPain\lang\*.ansi *.tra
)

%IFS%karatur.exe (
	.\%CONV% -f utf-8 -t cp1252 .\karatur\setup-karatur.tp2 > .\karatur\setup-karatur.ansi
	del .\karatur\setup-karatur.tp2
	ren .\karatur\setup-karatur.ansi setup-karatur.tp2
)

%IFS%PoFQuestPack.exe (

	copy /Y ".\%BWFP%\_PoFQuest\English\SETUP-PoFQuestPack.tra .\PoFQuestPack\English | %M%

	mkdir .\PoFQuestPack\English\Baf_are_ansi
	FOR %%i IN (
		.\PoFQuestPack\English\Baf_are\*.tra
	) DO (
		.\%CONV% -f utf-8 -t cp1252 "%%i" > .\PoFQuestPack\English\Baf_are_ansi\%%~nxi"
	)
	RMDIR /s /q .\PoFQuestPack\English\Baf_are
	ren .\PoFQuestPack\English\Baf_are_ansi Baf_are

	mkdir .\PoFQuestPack\English\Baf_new_ansi
	FOR %%i IN (
		.\PoFQuestPack\English\Baf_new\*.tra
	) DO (
		.\%CONV% -f utf-8 -t cp1252 "%%i" > .\PoFQuestPack\English\Baf_new_ansi\%%~nxi"
	)
	RMDIR /s /q .\PoFQuestPack\English\Baf_new
	ren .\PoFQuestPack\English\Baf_new_ansi Baf_new

	mkdir .\PoFQuestPack\English\D_ansi
	FOR %%i IN (
		.\PoFQuestPack\English\D\*.tra
	) DO (
		.\%CONV% -f utf-8 -t cp1252 "%%i" > .\PoFQuestPack\English\D_ansi\%%~nxi"
	)
	RMDIR /s /q .\PoFQuestPack\English\D
	ren .\PoFQuestPack\English\D_ansi D
)