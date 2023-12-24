SETLOCAL
cd /d %DPATH%

If Exist "%OV%Action.ids" (
	findstr /vlxg:"%OV%Action.ids" ".\%BWFP%\_IDS_ref\Action.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> %OV%Action.ids
)
If Exist "%OV%Animate.ids" (
	findstr /vlxg:"%OV%Animate.ids" ".\%BWFP%\_IDS_ref\Animate.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> %OV%Animate.ids
)

If Exist "%OV%stats.ids" (
	findstr /vlxg:"%OV%stats.ids" ".\%BWFP%\_IDS_ref\stats.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> "%OV%stats.ids"
)

If Exist "%OV%Spell.ids" (
	findstr /vlxg:"%OV%Spell.ids" ".\%BWFP%\_IDS_ref\Spell.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> "%OV%Spell.ids"
)

If Exist "%OV%kit.ids" (
	findstr /vlxg:"%OV%kit.ids" ".\%BWFP%\_IDS_ref\kit.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> "%OV%kit.ids"
)

If Exist "%OV%gtimes.ids" (
	findstr /vlxg:"%OV%gtimes.ids" ".\%BWFP%\_IDS_ref\gtimes.ids"> "%temp%\ids.tmp"
	type "%temp%\ids.tmp">> "%OV%gtimes.ids"
)

:: correct some possibly corrupted IDS files
Call ".\%BWIPS%\fix_Kit_IDS.bat"

:eof