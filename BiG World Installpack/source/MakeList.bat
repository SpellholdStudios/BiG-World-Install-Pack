SETLOCAL
cd /d %DPATH%

cd PCU

IF NOT EXIST "Filelist.txt" GOTO NODELETE
call deldir Output
del Filelist.txt

:NODELETE
::create filelist
xcopy Input\*.* /E /L>> Filelist2.txt

sed "$d" Filelist2.txt>>  Filelist.txt
del Filelist2.txt




