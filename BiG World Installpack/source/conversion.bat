SETLOCAL
cd /d %DPATH%


copy /Y ".\%BWIPS%\MakeList.bat" .\PCU
copy /Y ".\%BWIPU%\sed.exe" .\PCU

%IFS%BG1Aerie.exe move BG1Aerie .\PCU\input & move setup-BG1Aerie.tp2 .\PCU\input
%IFS%ClubOfPain.exe move ClubOfPain .\PCU\input
%IFS%Coran.exe move Coran .\PCU\input
%IFS%CritterParts_v1.1.exe move CritterParts .\PCU\input & move setup-CritterParts_v1.1.tp2 .\PCU\input
%IFS%Helarine_BGEE.exe move JklHel .\PCU\input & move setup-Helarine_BGEE.Tp2 .\PCU\input
%IFS%karatur.exe move karatur .\PCU\input
%IFS%Margarita.exe move Margarita .\PCU\input
%IFS%saradas_magic.exe move saradas_magic .\PCU\input
%IFS%ScionMod.exe move ScionMod .\PCU\input
%IFS%SotSC.exe move SotSC .\PCU\input
%IFS%TenyaThermidor.exe move TenyaThermidor .\PCU\input & move setup-TenyaThermidor.tp2 .\PCU\input

%IFS%PCU.exe Setup-PCU.exe --language 0 --skip-at-view --noautoupdate --force-install-list 2

%IFS%BG1Aerie.exe move .\PCU\output\BG1Aerie "." & move .\PCU\output\setup-BG1Aerie.tp2 "."
%IFS%ClubOfPain.exe move .\PCU\output\ClubOfPain "."
%IFS%Coran.exe move .\PCU\output\Coran "."
%IFS%CritterParts_v1.1.exe move .\PCU\output\CritterParts "." & move .\PCU\output\setup-CritterParts_v1.1.tp2 "."
%IFS%Helarine_BGEE.exe move .\PCU\output\JklHel "." & move .\PCU\output\setup-Helarine_BGEE.Tp2 "."
%IFS%karatur.exe move .\PCU\output\karatur "."
%IFS%Margarita.exe move .\PCU\output\Margarita "."
%IFS%saradas_magic.exe move .\PCU\output\saradas_magic "."
%IFS%ScionMod.exe move .\PCU\output\ScionMod "."
%IFS%SotSC.exe move .\PCU\output\SotSC "."
%IFS%TenyaThermidor.exe move .\PCU\output\TenyaThermidor "." & move .\PCU\output\setup-TenyaThermidor.tp2 "."

type nul>BWP_converted