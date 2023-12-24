SETLOCAL
cd /d %DPATH%

if %PREVIEW%==0 (
	%IFS%saradas_magic.exe %IF% ".\override\!1ARADAS.CRE" move ".\override\!1ARADAS.CRE" ".\BWP_workspace\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\override\!SARADAS.CRE" move ".\override\!SARADAS.CRE" ".\BWP_workspace\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\override\!SARAFIN.CRE" move ".\override\!SARAFIN.CRE" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrfuller.cre" move ".\override\mrfuller.cre" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrkhalid.cre" move ".\override\mrkhalid.cre" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrobe.cre" move ".\override\mrobe.cre" ".\BWP_workspace\override" | %M%
)
Call %EINST% crefixer "0"
if %PREVIEW%==0 (
	%IFS%saradas_magic.exe %IF% ".\BWP_workspace\override\!1ARADAS.CRE" move ".\BWP_workspace\override\!1ARADAS.CRE" ".\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\BWP_workspace\override\!SARADAS.CRE" move ".\BWP_workspace\override\!SARADAS.CRE" ".\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\BWP_workspace\override\!SARAFIN.CRE" move ".\BWP_workspace\override\!SARAFIN.CRE" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrfuller.cre" move ".\BWP_workspace\override\mrfuller.cre" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrkhalid.cre" move ".\BWP_workspace\override\mrkhalid.cre" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrobe.cre" move ".\BWP_workspace\override\mrobe.cre" ".\override" | %M%
)

findstr /I /M "ITEM_PACK.TP2~.*#.*#0./" %ELOG%>nul
if not errorlevel 1 call ".\%BWIPFIX%\sr_wastaff.bat"

Call %EINST% tooltipfix "0"

if %PREVIEW%==0 (
	%IFS%LongerRoad.exe %IF% ".\override\ahjon.BCS" move ".\override\ahjon.BCS" ".\BWP_workspace\override" | %M%
)
findstr /I /M "BPSERIES.TP2~.*#.*#10./" %ELOG%>nul
if %errorlevel%==1 (
	Call %EINST% Innate_Fix "0"
	if %PREVIEW%==0 (
		%IFS%LongerRoad.exe %IF% ".\BWP_workspace\override\ahjon.BCS" move ".\BWP_workspace\override\ahjon.BCS" ".\override" | %M%
		findstr /I /M "BOM.TP2~.*#.*#0./" %ELOG%>nul
		if %errorlevel%==0 move ".\Innate_Fix\backup\O!TALT.BCS ".\override" | %M%
	)
)

Call %EINST% Area_Patcher "0 2001 2002"
findstr /I /M "BG1NPC.TP2~.*#.*#80./" %ELOG%>nul
if %errorlevel%==0 Call %EINST% Area_Patcher "5000 5001"

Call %EINST% Cre_Patcher "0"
findstr /I /M "SOS.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 Call %EINST% Cre_Patcher "100"
findstr /I /M "BP.TP2~.*#.*#440./" %ELOG%>nul
if %errorlevel%==0 Call %EINST% Cre_Patcher "200"

Call ".\%BWIPI%\Item_Patcher.bat"

if %PREVIEW%==0 (
	%IF% lolfixer_ONLY_DEBUG_MODE.bat (
		%IF% StopLBar del StopLBar
		start "pulse bar" "%BWIPS%\pulse_bar.bat"
		rem Without a title the directory will be misinterpreted when it is enclosed in quotation marks.
		rem call lolfixer_ONLY_DEBUG_MODE.bat
		type NUL> StopLBar
	)
)
if %PREVIEW%==0 (
	FOR %%f IN (
		%OV%ESX01.wav
		%OV%ISHXAR1.wav
		%OV%ISHXAR6.wav
		%OV%ISHXAR7.wav
		%OV%ISHXAR8.wav
		%OV%ISHXAR9.wav
		%OV%DGMAIN.wav
		%OV%F_6666.ARE

		rem Lolfixer component 0 mess with Jarl’s BGT Adventure Pack : Jarl’s BGT Adventure Pack put existences of doppleganger to 0, lolfixer put them back to another value. the following files have to be moved before patching
		%OV%AR7208.ARE
		%OV%AR7210.ARE
		%OV%AR7211.ARE
		%OV%AR7229.ARE
		%OV%AR7239.ARE
		%OV%AR7240.ARE
		%OV%AR7407.ARE
		%OV%AR7705.ARE
		%OV%AR9501.ARE
		%OV%AR7603.ARE
		%OV%AR8009.ARE
	) DO move %%f %WSO%
)
::Call %EINSTI% lolfixer "0"
if %PREVIEW%==0 (
	FOR %%f IN (
		%WSO%ESX01.wav
		%WSO%ISHXAR1.wav
		%WSO%ISHXAR6.wav
		%WSO%ISHXAR7.wav
		%WSO%ISHXAR8.wav
		%WSO%ISHXAR9.wav
		%WSO%DGMAIN.wav
		%WSO%F_6666.ARE

		%WSO%AR7208.ARE
		%WSO%AR7210.ARE
		%WSO%AR7211.ARE
		%WSO%AR7229.ARE
		%WSO%AR7239.ARE
		%WSO%AR7240.ARE
		%WSO%AR7407.ARE
		%WSO%AR7705.ARE
		%WSO%AR9501.ARE
		%WSO%AR7603.ARE
		%WSO%AR8009.ARE
	) DO move %%f %OV%
)
Call %EINSTI% lolfixer "1 3 5 6"
if %PREVIEW%==0 (
	%IFS%saradas_magic.exe %IF% ".\override\!1ARADAS.CRE" move ".\override\!1ARADAS.CRE" ".\BWP_workspace\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\override\!SARADAS.CRE" move ".\override\!SARADAS.CRE" ".\BWP_workspace\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\override\!SARAFIN.CRE" move ".\override\!SARAFIN.CRE" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrfuller.cre" move ".\override\mrfuller.cre" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrkhalid.cre" move ".\override\mrkhalid.cre" ".\BWP_workspace\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\override\mrobe.cre" move ".\override\mrobe.cre" ".\BWP_workspace\override" | %M%
)
::Call %EINSTI% lolfixer "4"
if %PREVIEW%==0 (
	%IFS%saradas_magic.exe %IF% ".\BWP_workspace\override\!1ARADAS.CRE" move ".\BWP_workspace\override\!1ARADAS.CRE" ".\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\BWP_workspace\override\!SARADAS.CRE" move ".\BWP_workspace\override\!SARADAS.CRE" ".\override" | %M%
	%IFS%Saradas_Magic_2.exe %IF% ".\BWP_workspace\override\!SARAFIN.CRE" move ".\BWP_workspace\override\!SARAFIN.CRE" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrfuller.cre" move ".\BWP_workspace\override\mrfuller.cre" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrkhalid.cre" move ".\BWP_workspace\override\mrkhalid.cre" ".\override" | %M%
	%IFS%imoenRomance.exe %IF% ".\BWP_workspace\override\mrobe.cre" move ".\BWP_workspace\override\mrobe.cre" ".\override" | %M%
)
if %PREVIEW%==0 (
	%IF% ".\override\RJDTEARS.ITM" move ".\override\RJDTEARS.ITM" ".\BWP_workspace\override" | %M%
)
Call %EINSTI% lolfixer "7"
if %PREVIEW%==0 (
	%IF% ".\BWP_workspace\override\RJDTEARS.ITM" move ".\BWP_workspace\override\RJDTEARS.ITM" ".\override" | %M%
)
Call %EINSTI% lolfixer "8 9 10 11 12 13 14 15"

findstr /I /M "SANDRAHNPC.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 Call %EINST% SandrahItem "0"
