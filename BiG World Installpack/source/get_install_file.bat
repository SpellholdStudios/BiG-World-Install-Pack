SETLOCAL
cd /d %DPATH%

%TXT1% | findstr @000 | Call %C%
call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\triangle.png" /t 40 /c

findstr /I /M "process allyouget" %SET%>nul
if %errorlevel%==0 (
	call ".\%BWIPI%\process.bat"
)
findstr /I /M "total_happy happy_plus phlaphee Arkenor Februarius Jourin micbaldur" %SET%>nul
if %errorlevel%==0 (
	call ".\%BWIPI%\compilation.bat"
)
findstr /I /M "individual" %SET%>nul
if %errorlevel%==0 (
	call ".\%BWIPI%\individual.bat"
)

call "%BWIPU%\cmdbkg\cmdbkg.exe" "%BWIPU%\pics\triangle.png" /t 0 /c