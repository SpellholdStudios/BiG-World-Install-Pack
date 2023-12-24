:: search and replace a string that has an equals sign "=" inside

SETLOCAL
cd /d %DPATH%


@echo off & setlocal

set "searchItem=DSotSC"
set "searchVal=En-0,Sp-1,It-2,Ru-3,Po-4,Ge-5"
set "newVal=En-0,Sp-1,It-2,Ge-3,Po-4,Ru-5"
set "textFile=.\%BWIPI%\Tra.txt"

call ".\%BWIPFIX%\sr_val.bat"
