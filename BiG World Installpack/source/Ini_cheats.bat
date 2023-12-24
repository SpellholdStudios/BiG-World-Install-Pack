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
		If "!LINE!" == "[Program Options]" (
			SET TOKEN="|Cheats|Debug Mode|Logging On|"
			echo %%A
			echo Cheats=1
			echo Debug Mode=1
			echo Logging On=1
		) Else (
			If "!LINE!" == "[Game Options]" (
				SET TOKEN="|Memory Access|"
				echo %%A
				echo Memory Access=100
			) Else (
				echo %%A
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
