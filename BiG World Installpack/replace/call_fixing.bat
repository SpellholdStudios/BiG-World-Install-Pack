SETLOCAL
cd /d %DPATH%



%IFS%bg2fixpack.exe call "%BWIPR%\fixing_kit-ids.bat" ".\bg2fixpack\setup-bg2fixpack.tp2"

%IFS%fadingpromises.exe call "%BWIPR%\fixing_kit-ids.bat" ".\fadingpromises\setup-fadingpromises.tp2"

%IFS%Kido.exe call "%BWIPR%\fixing_kit-ids.bat" ".\Setup-Kido.tp2"

%IFS%Kitanya.exe call "%BWIPR%\fixing_kit-ids.bat" ".\Kitanya\setup-kitanya.tp2"

%IFS%Oversight.exe call "%BWIPR%\fixing_kit-ids.bat" ".\Setup-Oversight.tp2"

%IFS%Pirate.exe call "%BWIPR%\fixing_kit-ids.bat" ".\Pirate\Setup-Pirate.tp2"






