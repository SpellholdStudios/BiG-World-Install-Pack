:: Replace ####\###\*.d with the modfolder's\subfolder's names where the .d-files are stored.
:: If needed, replace ####\###\*.baf with the modfolder's\subfolder's names where the .baf-files are stored.
:: If you want to have the string's content behind the string number use --traify-comment

:: Replace SETUP-#######.TP2 with the file name you want to traify.
:: Note: With some mods it may also be #######/SETUP-#######.TP2 or #######.TP2 (without "SETUP")


@echo off
for %%d in (####\###\*.d) do (
	WeiDU.exe --traify %%d --out %%d .tra
)

for %%d in (####\###\*.baf) do (
	WeiDU.exe --traify %%d --out %%d .tra
)

WeiDU.exe --traify SETUP-#######.TP2 --out SETUP-#######.tra
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                traify finished 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
echo.