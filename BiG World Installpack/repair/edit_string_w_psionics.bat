:: edit patch for for w_psionics patch

SETLOCAL
cd /d %DPATH%

SET BWIP=BiG World Installpack

:: step 1: decompile bcs to baf
WeiDU.exe ar0602.bcs --out .\BWP_workspace

:: step 2: extract the string you are looking for
type "%CD%\BWP_workspace\ar0602.baf" | findstr /I /M "DisplayStringHead(Myself," > BWP_workspace\baf-string.txt

:: step 3: extract the part to be replaced
type "BWP_workspace\baf-string.txt" | "%BWIPU%"\cut -c22-36 > BWP_workspace\baf-stringcut.txt

:: step 4: replace existing strings
:: now all instances of "(Myself,76038)" in the old file and the new file will be replaced with the new value stored in the baf-stringcut.txt.
:: This code handles also a bug in "setlocal EnableDelayedExpansion" that now all exclamation marks and empty lines will remain.

call :REPLACE o
call :REPLACE n

:: step 5: replace existing files with new ones
del .\w_psionics_unleashed\baf\bgt\ar0602_o.baf
del .\w_psionics_unleashed\baf\bgt\ar0602_n.baf
ren .\w_psionics_unleashed\baf\bgt\ar0602_o_1%.baf ar0602_o.baf
ren .\w_psionics_unleashed\baf\bgt\ar0602_n_1%.baf ar0602_n.baf
goto :EOF

:REPLACE

SET x=%1

SET "source=.\w_psionics_unleashed\baf\bgt\ar0602_%x%.baf"
set "search=(Myself,76038)"

FOR /f "delims=" %%i IN (.\BWP_workspace\baf-stringcut.txt) DO (
	SET "replace=%%i"
)

SET "target=.\w_psionics_unleashed\baf\bgt\ar0602_%x%_1.baf"
if exist "%target%" del "%target%"
setlocal DisableDelayedExpansion
(
  for /f "delims=" %%i in ('findstr /n "^" "%source%"') do (
    set "Line=%%i"
    setlocal EnableDelayedExpansion
    set "Line=!Line:%search%=%replace%!" 
    set "Line=!Line:*:=!"
    (echo(!Line!)
    endlocal
  )
) > %target%

exit /b 0