:: search and replace a string that has an equals sign "=" inside

SETLOCAL
cd /d %DPATH%


@echo off & setlocal


>"outfile.txt" (
    for /f "eol=; usebackq tokens=1* delims==" %%I in ("%textFile%") do (
        if /I "%%~I"=="%searchItem%" (
            if "%%~J"=="%searchVal%" (
                echo %%I=%newVal%
            ) else echo %%I=%%J
        ) else (
            if not "%%~J"=="" (echo %%I=%%J) else echo %%I
        )
    )
)
move /y "outfile.txt" "%textFile%"