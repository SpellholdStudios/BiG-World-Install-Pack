SETLOCAL
cd /d %DPATH%


:ANIMCOMP
%IFNS%AnimalCompanions.exe goto :eof
ECHO ^0> AnimalCompanions_input.txt
%.%
%.%
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @164 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
ECHO %X%>> AnimalCompanions_input.txt
ECHO ^1>> AnimalCompanions_input.txt
%.%
%.%
%TXT% | findstr @166 | Call %C%
%.%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="1" goto :eof
if /I "%X%"=="2" goto :ANIMCOMP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :ANIMCOMP