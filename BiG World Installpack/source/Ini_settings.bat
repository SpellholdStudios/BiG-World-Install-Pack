SETLOCAL
cd /d %DPATH%

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:: Token => Current keys that should be skipped because we already set them "manually"
:: LINE  => The current line. Used because %%a cannot be used to get the first character of a line

:: Hardware settings for max PC
:: Game settings:
:: Pausing Map - pausing game when using map; 0 = off, 1 = on
:: Display Subtitles - useful if you use forein languages; 0 = off, 1 = on

SET TOKEN=0
for /f "delims=" %%A in ('type Baldur.ini') do (
    SET LINE=%%A
	If "!LINE:~0,1!" == "[" (
		If !TOKEN! NEQ 0 SET TOKEN=0
		If "!LINE!" == "[Program Options]" (
			SET TOKEN="|Path Search Nodes|Volume Movie|Volume Music|Volume Voices|Volume Ambients|Volume SFX|Display Subtitles|"
			echo %%A
			echo Path Search Nodes=400000
				echo Volume Movie=150
				echo Volume Music=150
				echo Volume Voice=150
				echo Volume Ambients=150
				echo Volume SFX=150
				echo Display Subtitles=1
		) Else (
			If "!LINE!" == "[Game Options]" (
				SET TOKEN="|Mid Level Brighten|High Level Brighten|Tiles Precache Percent|Use 3d Animations|Footsteps|Pausing Map|Low End Machine|"
				echo %%A
				echo Mid Level Brighten=1
				echo High Level Brighten=1
				echo Tiles Precache Percent=100
				echo Use 3d Animations=1
				echo Footsteps=1
				echo Pausing Map=1
				echo Low End Machine=1
			) Else (		
			If "!LINE!" == "[Config]" (
				SET TOKEN="|General|Graphics|Sound|CacheSize|"
				echo %%A
				echo General=1
				echo Graphics=1
				echo Sound=1
				echo CacheSize=1000
			) Else (
				echo %%A)
			)	
		)
	) Else (
		If !TOKEN! NEQ 0 (
			FOR /F "tokens=1 delims==" %%i IN ("!LINE!") DO SET KEY=%%i
			echo !TOKEN! | find /I /C "|!KEY!|" > NUL
			If !errorlevel! == 1 echo %%A
		) Else (
			echo %%A
		)
	)
)>>"%temp%\text.tmp"
move "%temp%\text.tmp" "baldur.ini"

ENDLOCAL
