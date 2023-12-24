SETLOCAL
cd /d %DPATH%

if #%1# neq ## goto %~1

COLOR FC
%.%
%.%
%TXT% | findstr @081 | Call %C%
%.%
pause
COLOR 0F

:BWSStart
%TXT% | findstr @082 | Call %C%
Call ".\%BWIPS%\ReplaceWeiDU.bat"
%.%ReplaceWeiDU>> %IPL%

:CONVERSI
Call ".\%BWIPS%\conversion.bat"
%IFS%CritterParts_v1.1.exe copy .\PCU\Input\CritterParts\Script\AR4300.baf .\CritterParts\Script\AR3200.baf
%.%conversion>> %IPL%

:RESIZBMP
Call ".\%BWIPS%\resize.bat"
%.%resizeBMP>> %IPL%

%IF% BWP_BGT_input.txt ECHO ^N>> BWP_BGT_input.txt

:TRIMPACK
%IFN% BWP_Trimpack.installed CALL ".\%BWIP%\%BWBP%.bat"
%.%Trimpack>> %IPL%

:RIGHTPAT
Call ".\%BWIPS%\right_patch.bat"
%.%rightPatch>> %IPL%

:FIXPACK
%IFN% BWP_Fixpack.installed CALL "%BWFP%.bat"
%IFS%saradas_magic.exe call ".\%BWIPFIX%\ren_Saradas.bat
%IFS%TheUndying.exe ren TheUndying\cremod\SLMAGE1.cre SLMAGE0.cre
%.%Fixpack>> %IPL%

:TEXTPACK
%IFN% BWP_Textpack.installed CALL "%BWTP%.bat"
%.%Textpack>> %IPL%

:SMOOTHPK
%IFN% BWP_Smoothpack.installed CALL ".\%BWIP%\%BWSP%.bat"
%.%Smoothpack>> %IPL%

:CONVANSI
Call ".\%BWIPS%\iconv.bat"
%.%convertANSII>> %IPL%

:BWPFIXIN
%IFN% ".\BWP_workspace\override" MD ".\BWP_workspace\override" | %M%
%IF% tisunpack.exe copy tisunpack.exe ".\BWP_workspace" | %M%
%IFS%xulaye.exe copy ".\%BWIPU%\oggdec.exe" xulaye\audio | %M%
%IFS%calin.exe copy ".\%BWIPU%\oggdec.exe" calin\audio | %M%
%IFS%amber.exe copy ".\%BWIPU%\oggdec.exe" amber\sounds | %M%
%IFS%aurenaseph.exe copy ".\%BWIPU%\oggdec.exe" aurenaseph\audio | %M%
Call ".\%BWIPR%\call_fixing.bat"
%.%Fixing>> %IPL%

:BWMODING
Call ".\%BWIPS%\Modding.bat"
%.%RunModding>> %IPL%

:INIPATCH
:: check for the correct pathname - essential
Call ".\%BWIPS%\Ini_path.bat"

:: add cheats - essential
Call ".\%BWIPS%\Ini_cheats.bat"

:: add movies - optional
Call ".\%BWIPS%\Ini_movies.bat"

:: change settings - optional
Call ".\%BWIPS%\Ini_settings.bat"
%.%inipatch>> %IPL%

:EXPLANAI
%TXT% | findstr @140 | Call %C%>> %E%

call ".\%BWIPS%\config.bat" ":INSTALLB"
