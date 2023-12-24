SETLOCAL
cd /d %DPATH%

:: restore sound files from BG1 that were overwritten by Vlad's Compilation and new sound files from IWD


for /f "delims=" %%a in ('type BWP_BG1_input.txt') do @set BG1=%%a
for /f "delims=" %%a in ('type BWP_BG2_input.txt') do @set BG2=%%a
for /f "delims=" %%c in ('type BWP_IWD1_input.txt') do @set IWD1=%%c
for /f "delims=" %%a in ('type BWP_IWD2_input.txt') do @set IWD2=%%a

chcp 1252>nul 
set ue=ü
set ae=ä
set oe=ö
set Uue=Ü
set Aae=Ä
set Ooe=Ö
set ss=ß
:: Umlauts must be renamed because otherwise batch will not work.


findstr /I /M "VCV21.TP2~.*#.*#11./" %ELOG%>nul
if not errorlevel 1 (
	%IF% "%BG1%" (
		copy /y weidu.exe "%BG1%"
		CD /D "%BG1%"
		weidu --biff-get SHART.*wav --out "%BG2%\override"
		CD /D "%BG2%"
	)
)

findstr /I /M "NEJ3V71.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	%IF% "%BG1%" (
		copy /y weidu.exe "%BG1%"
		CD /D "%BG1%"
		weidu --biff-get BRANW.*wav --out "%BG2%\override"
		weidu --biff-get INNKE.*wav --out "%BG2%\override"
		CD /D "%BG2%"
	)
	%IF% "%IWD1%" (
		copy /y weidu.exe "%IWD1%"
		CD /D "%IWD1%"
		weidu --biff-get ARUN_.*wav --out "%BG2%\override"
		weidu --biff-get BELH_.*wav --out "%BG2%\override"
		weidu --biff-get CYXU_.*wav --out "%BG2%\override"
		weidu --biff-get EVER_.*wav --out "%BG2%\override"
		weidu --biff-get FAB_.*wav --out "%BG2%\override"
		weidu --biff-get HROT_.*wav --out "%BG2%\override"
		weidu --biff-get KRES_.*wav --out "%BG2%\override"
		weidu --biff-get LARR_.*wav --out "%BG2%\override"
		weidu --biff-get NARR_CH1.wav --out "%BG2%\override"
		weidu --biff-get NARR_CH4.wav --out "%BG2%\override"
		weidu --biff-get POQU_.*wav --out "%BG2%\override"
		weidu --biff-get YXUN_.*wav --out "%BG2%\override"
		rem weidu --biff-get AVALANCH.MVE --out "%BG2%\override"
		rem weidu --biff-get RETURN.MVE --out "%BG2%\override"
		rem weidu --biff-get SCRY.MVE --out "%BG2%\override"
		copy /y ".\Sounds\HdW_Männlich_1\*.wav" "%BG2%\override"
		CD /D "%BG2%"
	)
)


findstr /I /M "DSOTSC.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	%IF% "%BG1%" (
		copy /y "%IWD1%\Sounds\HdW_Männlich_1\*.wav" "%BG2%\override"
	)
	%IF% "%IWD2%" (
		copy /y "%IWD2%\Sounds\Barbar_männlich_1\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Mönch_weiblich_1\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Kämpfer_männlich_2\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Magier_männlich_1\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Magier_männlich_2\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Kämpfer_weiblich_2\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\Schurke_männlich_2\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\HdW_männlich_1\*.wav" "%BG2%\override"
		copy /y "%IWD2%\Sounds\HdW_männlich_2\*.wav" "%BG2%\override"
	)
)


chcp 850>nul
