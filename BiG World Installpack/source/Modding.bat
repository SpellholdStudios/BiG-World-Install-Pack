SETLOCAL
cd /d %DPATH%


findstr /I /M "modchores" %SET%>nul
if not errorlevel 1 call ".\%BWIPM%\chores_1.bat"



