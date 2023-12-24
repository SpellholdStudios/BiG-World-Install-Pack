:: correct tooltip.2da Item_Pack entry

SETLOCAL
cd /d %DPATH%


set "source=.\override\tooltip.2da
set "search=         wastaff"
set "replace=wastaff"

call ".\%BWIPFIX%\sr_code.bat"

