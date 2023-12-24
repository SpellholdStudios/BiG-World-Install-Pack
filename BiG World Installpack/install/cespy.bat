SETLOCAL
cd /d %DPATH%

if %PREVIEW%==0 (
	%IFE% %IF% CespyAudioV1.exe (
		Call ".\%BWIPU%\mute.exe"
		%W5%
		call ".\%BWIPS%\cespy.vbs" "%DPATH%"
		Call ".\%BWIPU%\mute.exe"
	)
)