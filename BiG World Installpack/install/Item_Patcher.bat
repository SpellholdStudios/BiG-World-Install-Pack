SETLOCAL
cd /d %DPATH%


Call %EINSTI%  Item_Patcher "0 100"
findstr /I /M "BP.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "101"
)
findstr /I /M "CtB.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "102"
)
findstr /I /M "Huple_NPC.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "103"
)
findstr /I /M "Iylos.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "104"
)
findstr /I /M "Keto.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "105"
)
findstr /I /M "Kim.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "106"
)
findstr /I /M "Kivan.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "107"
)
findstr /I /M "Lena.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "108"
)
findstr /I /M "Devin.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "109"
)
findstr /I /M "Ninde.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "110"
)
findstr /I /M "Skie.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "111"
)
findstr /I /M "TDD.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "112"
)
findstr /I /M "Tashia.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "113"
)
findstr /I /M "TS.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
	Call %EINSTI% Item_Patcher "115"
)
findstr /I /M "AviM.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
    Call %EINSTI% Item_Patcher "116"
)
findstr /I /M "Aeon.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 (
    Call %EINSTI% Item_Patcher "117"
)