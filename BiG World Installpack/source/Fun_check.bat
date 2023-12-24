:: Checks if fun-mods are present.

SETLOCAL
cd /d %DPATH%

call :CheckFun
If %errorlevel% == 1 (
	GOTO :DESELECT
) else (
	GOTO :ADULTSEL
)

:CheckFun
For /d %%s In (CWS JZ Skooter tb#quest aip mdx hf_HHG G3Anniversary Swylif) DO (
	%IFS%%%s.exe Exit /b 1
)
Exit /b 0

:DESELECT

:ADULTSEL
