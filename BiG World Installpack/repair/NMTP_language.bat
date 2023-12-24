:: search and replace a string that has an equals sign "=" inside

SETLOCAL
cd /d %DPATH%


@echo off & setlocal

set "searchItem=NMTP"
set "searchVal=Ch-0,Ge-2"
set "newVal=Ch-0"
set "textFile=.\%BWIPI%\Tra.txt"

call ".\%BWIPFIX%\sr_val.bat"
