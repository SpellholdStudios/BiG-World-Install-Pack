SETLOCAL
cd /d %DPATH%

SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:: Token => Current keys that should be skipped because we already set them "manually"
:: LINE  => The current line. Used because %%a cannot be used to get the first character of a line

SET TOKEN=0
for /f "delims=" %%A in ('type Baldur.ini') do (
    SET LINE=%%A
	If "!LINE:~0,1!" == "[" (
		If !TOKEN! NEQ 0 SET TOKEN=0
		If "!LINE!" == "[MOVIES]" (
			SET TOKEN="|BISLOGO|BWDRAGON|BEREGOST|BGENTER|BGINTRO|BGSUNRIS|BGSUNSET|BHALL|CAMP|CBCTMOVE|CBSOUBAR|CNDLKEEP|DAYNITE|DEATHAND|DUNGEON|DURLAG|ELDRCITY|END15FPS|ENDCRDIT|ENDMOVIE|FLYTHR01|FLYTHR02|FLYTHR03|FLYTHR04|FRARMINN|GNOLL|NTRO|INTRO15F|IRONTHRN|JZINTRO|MANAFORG|MELISSAN|MINEFLOD|NASHKELL|NITEDAY|OUTRO|PALACE|POCKETZZ|RESTCAMP|RESTDUNG|RESTINN|SARADUSH|SEWER|SOAINTRO|VA#MOV01|WOTC|WOTH|WRECK|WYVERN|"
			echo %%A
			echo BISLOGO=1
			echo BWDRAGON=1
			echo BEREGOST=1
			echo BGENTER=1
			echo BGINTRO=1
			echo BGSUNRIS=1
			echo BGSUNSET=1
			echo BHALL=1
			echo CAMP=1
			echo CBCTMOVE=1
			echo CBSOUBAR=1
			echo CNDLKEEP=1
			echo DAYNITE=1
			echo DEATHAND=1
			echo DUNGEON=1
			echo DURLAG=1
			echo ELDRCITY=1
			echo END15FPS=1
			echo ENDCRDIT=1
			echo ENDMOVIE=1
			echo FLYTHR01=1
			echo FLYTHR02=1
			echo FLYTHR03=1
			echo FLYTHR04=1
			echo FRARMINN=1
			echo GNOLL=1
			echo NTRO=1
			echo INTRO15F=1
			echo IRONTHRN=1
			echo JZINTRO=1
			echo MANAFORG=1
			echo MELISSAN=1
			echo MINEFLOD=1
			echo NASHKELL=1
			echo NITEDAY=1
			echo OUTRO=1
			echo PALACE=1
			echo POCKETZZ=1
			echo RESTCAMP=1
			echo RESTDUNG=1
			echo RESTINN=1
			echo SARADUSH=1
			echo SEWER=1
			echo SOAINTRO=1
			echo VA#MOV01=1
			echo WOTC=1
			echo WOTH=1
			echo WRECK=1
			echo WYVERN=1
		) Else (
				echo %%A
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
