@echo off

SETLOCAL
cd /d %DPATH%

"%BWIPU%"\cut -c5- > BWP_strg.txt & type BWP_strg.txt
:: Without this batshit workaround in Windows7 the strings from a file in Unicode cannot be displayed correctly when they are cut back.