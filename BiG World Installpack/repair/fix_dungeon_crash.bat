:: Run this simple batch if you get a crash and the error message "abnormal program termination" at the first auto-save in Irenicus’ Dungeon after Imoen talks to the protagonist.

SETLOCAL
cd /d %DPATH%

@echo off

if exist temp RMDIR /s /q temp
if exist temp del temp
"BiG World Installpack\utils\sleep.exe" 2s
mkdir temp
mkdir temp\default.tot

