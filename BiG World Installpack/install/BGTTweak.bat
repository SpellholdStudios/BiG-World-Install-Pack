SETLOCAL
cd /d %DPATH%

findstr /I /M "ALORA.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#2./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @342 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1800"
)
findstr /I /M "BRANWENNPC.TP2~.*#.*#0./ POB.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#2./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @343 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1801"
)
findstr /I /M "ELDOTH.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @344 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1802"
)
findstr /I /M "TDD.TP2~.*#.*#0./ ACBRE.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#4./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @345 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1803"
)
findstr /I /M "TDD.TP2~.*#.*#0./ KIVAN.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#6./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @346 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1804"
)
findstr /I /M "BGTNEJ2.TP2~.*#.*#3./ NEJ2v68.TP2~.*#.*#6./ NEJ2v691.TP2~.*#.*#6./ TDD.TP2~.*#.*#0./ SHARTEEL.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @347 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1805"
)
findstr /I /M "SKIE.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @348 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1806"
)
findstr /I /M "XAN.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#8./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @349 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1807"
)
findstr /I /M "TDD.TP2~.*#.*#0./ BG1NPCSOA.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	%IFS%BGTTweak.exe %TXT% | findstr @356 | Call %C%>> %E%
) else (
	Call %EINSTI% BGTTweak "1808"
)
findstr /I /M "DSOTSC.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	Call %EINSTI% BGTTweak "1809 1810 1811 1812 1813 1814"
)
findstr /I /M "NTOTSC.TP2~.*#.*#0./" %ELOG%>nul
if %errorlevel%==0 (
	Call %EINSTI% BGTTweak "1815"
)
