SETLOCAL
cd /d %DPATH%
	
%GOG% GOTO :CHITINCH
%IF% CD5\movies\25Movies.bif %IF% BG2-ToBPatchReadMe.txt GOTO :CHITINCH

:: missing 25Movies.bif 
:BG2CHCK1
%IFN% CD5\movies\25Movies.bif (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @016 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @011 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :BG2CHCK1
)
%
:: missing BG2 patch 26498
:BG2CHCK2
%IFN% BG2-ToBPatchReadMe.txt (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @016 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @017 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :BG2CHCK2
)

:CHITINCH
%IF% CHITIN.KEY (
	goto :FINBG2CK
) else (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @016 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @005 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :CHITINCH
)

:FINBG2CK
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @016 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @006 | Call %C%
%.%

