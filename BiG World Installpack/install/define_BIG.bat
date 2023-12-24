SETLOCAL
cd /d %DPATH%

:: dependent on the number of the big BG2 mods the values for Aurora and XP will be defined.
if %PREVIEW%==0 (
	%IFS%NEJ3V71.DEBUG type NUL> nej.count2
	%IFS%TDD.DEBUG type NUL> tdd.count2
	%IFS%SOS.DEBUG type NUL> sos.count2
	%IFS%CTB.DEBUG type NUL> ctb.count2
	%IFS%VCV21.DEBUG type NUL> ts.count2
	%IFS%ROT.DEBUG type NUL> rot.count2
	%IFS%BGT.DEBUG type NUL> bgt.count2
) else (
	findstr /I /M "NEJ3V71.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> nej.count2
	)
	findstr /I /M "TDD.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> tdd.count2
	)
	findstr /I /M "SOS.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> sos.count2
	)
	findstr /I /M "CTB.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> ctb.count2
	)
	findstr /I /M "VCV21.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> ts.count2
	)
	findstr /I /M "ROT.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> rot.count2
	)
	findstr /I /M "BGT.TP2~" "BWP preview.log">nul
	if %errorlevel%==0 (
		type NUL> bgt.count2
	)
)

dir *.count2 /b /s > dir2.txt
find /c /i ".count2" dir2.txt> count2.txt

:eof
