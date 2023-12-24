SETLOCAL
cd /d %DPATH%

setlocal disabledelayedexpansion

SET found=false

for /f "tokens=*" %%i in ('findstr /n "^" %~1') do (
	for /f "tokens=1* delims=:" %%a in ("%%i") do set "line=%%b"

	setlocal enabledelayedexpansion
	if "!found!" == "true" (
		set result=false
		if "!line!" == "  UNLESS ~\bWILDMAGE\b~" set result=true
		if "!line!" == "APPEND ~kit.ids~ ~0x80000000 WILDMAGE~ UNLESS ~\bWILDMAGE\b~" set result=true
		if !result! == true (
			endlocal
			SET found=false
			setlocal enabledelayedexpansion
			type "%BWIPR%\fixing_kit-ids_new.txt" >> out.txt
		)
	) else (
		if "!line!" == "  REPLACE_TEXTUALLY ~.*\bTRUECLASS\b~              ~0x4000 TRUECLASS~" (
			
			endlocal
			SET found=true
			setlocal enabledelayedexpansion
		) else (
			if not defined line (
		 		echo. >> out.txt
			) else (
				if "!line: =!" == "" (
					echo. >> out.txt
				) else (
					echo !line! >> out.txt
				)
			)
		)
	)
	endlocal
)

copy /Y out.txt %~1
if exist out.txt del out.txt

exit /b