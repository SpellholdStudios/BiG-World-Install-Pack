SETLOCAL
cd /d %DPATH%


for %%i in (".\BG1Aerie\portraits" ".\CritterParts\Images" ".\karatur\BMP" ".\Rjali\Portraits\Jini" ".\Rjali\Portraits\Main" ".\Rjali\Portraits\Ravel" ".\Saradas_Magic_2" ".\TenyaThermidor\Portraits") do (
	for %%a in (%%i\*L.BMP) do ".\%BWIPU%\convert\convert.exe" "%%a" -resize 210x330 "%%a" 
	for %%a in (%%i\*M.BMP) do ".\%BWIPU%\convert\convert.exe" "%%a" -resize 110x173 "%%a" 
	for %%a in (%%i\*S.BMP) do ".\%BWIPU%\convert\convert.exe" "%%a" -resize 38x60 "%%a" 
)


for %%i in (".\CritterParts\Images") do (
	for %%a in (%%i\RLCSC*.BMP) do ".\%BWIPU%\convert\convert.exe" "%%a" -resize 64x64 "%%a"
)
