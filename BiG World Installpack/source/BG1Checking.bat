SETLOCAL
cd /d %DPATH%
%.%
%.%
%.%
for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set BG1=%%a

%NGOG% %IF% "%BG1%"\readme_patch.txt (
	%IFF% %IF% "%BG1%"\SETUP-CORRECFRBG1.DEBUG GOTO :BG1CHCK2
	%IFG% %IF% "%BG1%"\SETUP-BG1TP.DEBUG GOTO :BG1CHCK2
	%IFH% %IF% "%BG1%"\SETUP-ABRA.DEBUG GOTO :BG1CHCK2
	%IFNF% %IFNG% %IFNH% GOTO :BG1CHCK2
)
%GOG% (
	%IFF% %IF% "%BG1%"\SETUP-CORRECFRBG1.DEBUG GOTO :BG1CHCK2
	%IFG% %IF% "%BG1%"\SETUP-BG1TP.DEBUG GOTO :BG1CHCK2
	%IFH% %IF% "%BG1%"\SETUP-ABRA.DEBUG GOTO :BG1CHCK2
	%IFNF% %IFNG% %IFNH% GOTO :BG1CHCK2
)
:: missing BG1 patch 5512
:BG1CHCK1
%NGOG% %IFN% "%BG1%"\readme_patch.txt (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @014 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @012 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :BG1CHCK1
)
%.%
:: missing BG1 text patch
:TP1CHECK
%IFF% %IFN% "%BG1%"\SETUP-CORRECFRBG1.DEBUG (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @014 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @013 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :TP1CHECK
)
%IFG% %IFN% "%BG1%"\SETUP-BG1TP.DEBUG (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @014 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @013 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :TP1CHECK
)
%IFH% %IFN% "%BG1%"\SETUP-ABRA.DEBUG (
	%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @014 | Call %C% & %TXT1% | findstr @001 | Call %C% & %TXT% | findstr @013 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	GOTO :TP1CHECK
)

%IF% "%BG1%"\goggame.dll GOTO :FINBG1CK
:BG1CHCK2
:: BG1 completeness check
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @014 | Call %C%
%.%
CALL ".\%BWIPS%\BG1_check.bat"
if not errorlevel 1 (
	GoTo :FINBG1CK
) else (
	%.%
	%TXT% | findstr @015 | Call %C% & %TXT1% | findstr @001 | Call %C% & pause
	goto :BG1CHCK2
)
:FINBG1CK

%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @006 | Call %C%
