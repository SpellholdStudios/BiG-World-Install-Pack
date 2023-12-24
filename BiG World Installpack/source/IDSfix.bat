SETLOCAL
cd /d %DPATH%

SET fix=stats.ids

::create a new file only with LFCR but only space
ECHO.>%OV%CRLF

::delete first line
@echo off
for %%i in (%OV%%fix%) do (
more +1 "%%i">"%%i.temp"
del "%%i"
)
ren %OV%*.temp *.

::combine both files to one
copy /b %OV%CRLF+%OV%%fix% %OV%newIDSfile.txt
del %OV%%fix%
ren %OV%newIDSfile.txt %fix%
del %OV%CRLF
