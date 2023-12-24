SETLOCAL
cd /d %DPATH%

for /f %%x in ('type BWP_LANGUAGE') do set /p .= %%x <nul>>BWP_language.txt
