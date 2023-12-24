SETLOCAL
cd /d %DPATH%

:: variable definitions
SET MAIN_DIR=BiG World Installpack\BiG World Trimpack
SET INSTALL_MARKER=..\BWP_Trimpack.installed

CALL ".\%BWIP%\%BWPXPack.bat"
