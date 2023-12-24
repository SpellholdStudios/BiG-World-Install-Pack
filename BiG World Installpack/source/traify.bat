SETLOCAL
cd /d %DPATH%

:TRAIFTP2
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @212 | Call %C% & %TXT% | findstr @213 | Call %C% & %TXT1% | findstr @001 | Call %C%
set V=
set /P V=
%IFN% %V% (
	%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @210 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	goto :TRAIFTP2
)
:TRAIFDLG
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @214 | Call %C% & %TXT1% | findstr @006 | Call %C%
set Y=
set /P Y=
%.%
%IFN% %Y% (
	%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @218 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	goto :TRAIFDLG
)
:TRAIFBAF
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @215 | Call %C% & %TXT1% | findstr @006 | Call %C%
set Z=
set /P Z=
%.%
%IFN% %Z% (
	%TXT1% | findstr @001 | Call %C% & %TXT% | findstr @218 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
	goto :TRAIFBAF
)
:TRAIFTRA
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @216 | Call %C% & %TXT1% | findstr @006 | Call %C%
set W=
set /P W=
MD %W%
%.%
SETLOCAL ENABLEDELAYEDEXPANSION
WeiDU.exe --traify !V! --out !V!.tra
for %%d in (!Y!\*.d) do (
	WeiDU.exe --traify %%d --out %%d .tra
)
for %%d in (!Z!\*.baf) do (
	WeiDU.exe --traify %%d --out %%d .tra
)
del /q !V!
copy !V!.tp2 !V!
del !V!.tp2
move !V!.tra !W!\setup.tra
move !Y!\*.tra !W!
move !Z!\*.tra !W!
set V=
set W=
set Y=
set Z=
endlocal
%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @006 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
EXIT