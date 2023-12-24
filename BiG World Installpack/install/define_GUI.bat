SETLOCAL
cd /d %DPATH%

:: dependent on the number of the GUI mods the component number will be defined.
type NUL> tob.count
:: %IFS%NEJ3v702.DEBUG type NUL> nej.count
%IFS%TDD.DEBUG type NUL> tdd.count
%IFS%SOS.DEBUG type NUL> sos.count
%IFS%CTB.DEBUG type NUL> ctb.count
:: %IFS%TS.DEBUG type NUL> ts.count
:: %IFS%VCv10.DEBUG type NUL> ts.count
%IFS%ROT.DEBUG type NUL> rot.count
%IFS%BGT.DEBUG type NUL> bgt.count

dir *.count /b /s > dir.txt
find /c /i ".count" dir.txt> count.txt

SETLOCAL enabledelayedexpansion

SET "source=count.txt"
SET "target=GUI_input.txt"
SET "search=---------- DIR.TXT: "
SET "replace="

FOR /f "delims=" %%i IN ('FINDSTR . "%source%"') DO (
	SET line=%%i& CALL :change !line!
)
GOTO :eof
:change

SET line=!line:%search%=%replace%!

IF [!line!] EQU [] (ECHO.>>%target%) ELSE (ECHO !line!>>%target%)
GOTO :eof

:eof
