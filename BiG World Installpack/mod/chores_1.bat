:: skip Chores review
@echo on

SETLOCAL
cd /d %DPATH%

SETLOCAL enabledelayedexpansion

For /r "%DPATH%CtB\Chores\scripts\" %%k in (CB__6*.baf) do (
    set "source=%%k"
    set "target=%%k_1"

    call ".\%BWIPM%\chores_2.bat"
)

