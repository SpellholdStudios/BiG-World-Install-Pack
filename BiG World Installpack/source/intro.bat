SETLOCAL
cd /d %DPATH%


%TXT1% | findstr @003 | Call %C%
%W2%
%.%
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\triangle.png" /t 100 /c
%TXT1% | findstr @000 | Call %C%
%W2%
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\triangle.png" /t 0 /c

:selectla
%TXT1% | findstr @000 | Call %C% & %TXT1% | findstr @004 | Call %C% & %TXT1% | findstr @001 | Call %C%

%IF% BWIP_* del BWIP_*
set X=
:: this resets the previous input
set /P X=
if /I "%X%"=="E" (
	type NUL> BWIP_English
	copy /Y ".\%BWIPL%\English\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="G" (
	type NUL> BWIP_German
	copy /Y ".\%BWIPL%\German\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
goto :noavail1
if /I "%X%"=="S" (
	type NUL> BWIP_Spanish
	copy /Y ".\%BWIPL%\Spanish\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="R" (
	type NUL> BWIP_Russian
	copy /Y ".\%BWIPL%\Russian\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
:noavail1
if /I "%X%"=="F" (
	type NUL> BWIP_French
	copy /Y ".\%BWIPL%\French\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
goto :noavail2
if /I "%X%"=="I" (
	type NUL> BWIP_Italian
	copy /Y ".\%BWIPL%\Italian\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="P" (
	type NUL> BWIP_Polish
	copy /Y ".\%BWIPL%\Polish\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="CZ" (
	type NUL> BWIP_Czech
	copy /Y ".\%BWIPL%\Czech\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="CH" (
	type NUL> BWIP_Chinese
	copy /Y ".\%BWIPL%\Chinese\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="KO" (
	type NUL> BWIP_Korean
	copy /Y ".\%BWIPL%\Korean\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
if /I "%X%"=="JA" (
	type NUL> BWIP_Japanese
	copy /Y ".\%BWIPL%\Japanese\*" ".\%BWIP%\temp" | %M%
	goto :eof
)
:noavail2
%TXT1% | findstr @000 | Call %C% & %TXT1% | findstr @005 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
goto :selectla
