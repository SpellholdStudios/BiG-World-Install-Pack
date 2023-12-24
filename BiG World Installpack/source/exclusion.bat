SETLOCAL
cd /d %DPATH%

%IF% "BGII - S*A" goto :exclusn1
%IF% "Baldur*s Gate 2" goto :exclusn1
goto :exclusn2

:exclusn1
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @654 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
exit

:exclusn2
%IFN% "data\bgee.bif" goto :exclusn3
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @656 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @655 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
exit

:exclusn3

