:: search and replace a string that has an equals sign "=" inside

SETLOCAL
cd /d %DPATH%


@echo off & setlocal

set "searchItem=stratagems"
set "searchVal=En-0,Sp-1,Po-2,Ge-3,Fr-4,It-5,Ru-6,Ko-7,Ch-8"
set "newVal=En-0,Po-1,Ge-2,Fr-3,It-4,Ru-5"
set "textFile=.\%BWIPI%\Tra.txt"

call ".\%BWIPFIX%\sr_val.bat"
