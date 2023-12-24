SETLOCAL
cd /d %DPATH%



:: backup necessary files



%IFN% "..\BGII - SoA restore" MD "..\BGII - SoA restore"
%IF% "..\BGII - SoA restore" robocopy "%CD%" "..\BGII - SoA restore" /E /JOB:"%BWIPS%\exclude.rcj"

%.%backup>> %IPL%
