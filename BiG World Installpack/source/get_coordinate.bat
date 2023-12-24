SETLOCAL
cd /d %DPATH%

for /f %%x in ('type BWP_widescreen_input.txt') do set /p .= %%x <nul>>BWP_coordinate.txt
