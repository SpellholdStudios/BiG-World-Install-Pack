SETLOCAL
cd /d %DPATH%

%IFS%CtB.exe GOTO :RNMDCHOR
GOTO :MODWORGA
:RNMDCHOR
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @800 | Call %C% & %TXT% | findstr @801 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo modchores>> %SET% & goto :MODWORGA
if /I "%X%"=="N" goto :MODWORGA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RNMDCHOR

:MODWORGA
%IFS%Worgas.exe GOTO :RNMDWORG
GOTO :MODPOFQP
:RNMDWORG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @800 | Call %C% & %TXT% | findstr @802 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo ShortWorgIntr>> %SET% & goto :NEXTMOD
if /I "%X%"=="N" goto :MODPOFQP
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RNMDWORG

goto :NEXTMOD
:: this part is buggy
:MODPOFQP
%IFS%PoFQuestPack.exe GOTO :RNMDPOFQ
GOTO :NEXTMOD
:RNMDPOFQ
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @800 | Call %C% & %TXT% | findstr @802 | Call %C% & %TXT% | findstr @548 | Call %C%
%.%
%.%
set X=
set /P X=
if /I "%X%"=="Y" echo skipPoFQIntr>> %SET% & goto :NEXTMOD
if /I "%X%"=="N" goto :NEXTMOD
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @500 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
goto :RNMDPOFQ


:NEXTMOD
