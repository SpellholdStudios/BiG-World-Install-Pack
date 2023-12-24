SETLOCAL
cd /d %DPATH%

:: For some foreign languages this adds English text files to the mods as a substitute to prevent that the installation failes because of missing files.
%IF% "%BWTP% GERMAN" xcopy /Y /S /E ".\%BWTP% GERMAN\_English_files" ".\%BWTP% GERMAN" | %M%

:: Note: There must be no lines comment out with colons in a code block but only with rem!
%IF% "%BWFP%" (
	ren ".\%BWFP%\_aD&L" "aD&L" | %M%
	rem Workaround to be able to use this patch also without a megamod (shall not be applied without a megamod)
	rem Thanks to microsoft the patch does not work as intended because of the "&" in the name.
	rem Don't worry about the message about a syntax error! The file will be renamed to "aD&L" and will be patched correctly.

	xcopy /Y /S /E ".\%BWFP%\_BWP compatibility\*.*" ".\%BWFP%" | %M%
	xcopy /Y /S /E ".\%BWFP%\_BWP_conversion\*.*" ".\%BWFP%" | %M%
	xcopy /Y /S /E ".\%BWFP%\_Area_Patcher\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_Ascension_Fix\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_Cre_Patcher\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_crefixer_v2\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_CtBcutImp\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_DR8_hotfix\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_face_directions\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_Innate_Fix\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_Item_Patcher\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_resfixer_v1\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_tooltipfix\*.*" "." | %M%
	xcopy /Y /S /E ".\%BWFP%\_XP-info\*.*" "." | %M%
	%IFNS%lolfixer.exe xcopy /Y /S /E ".\%BWFP%\_Lolfixer\*.*" "." | %M%
	%IFS%Ascension.exe xcopy /Y /S /E ".\%BWFP%\_Ascension_Fix\*.*" "." | %M%
	%IFS%ctb.exe xcopy /Y /S /E ".\%BWFP%\_CtBcutImp\*.*" "." | %M%
	%IFS%iwditempack.exe xcopy /Y /S /E ".\%BWFP%\_iwditemfix\*.*" "." | %M%
	copy /Y ".\%BWFP%\_IDS_ref\*.IDS" ".\override" | %M%
)
copy /Y ".\bp-bgt-worldmap\bam\bpbgtmap.bam"  ".\override" | %M%

%IF% "%BWTP% GERMAN" copy /Y ".\%BWTP% GERMAN\_messages\opt_install.txt" ".\%BWFP%\_messages" | %M%
%IF% "%BWTP% RUSSIAN" copy /Y ".\%BWTP% RUSSIAN\_messages\opt_install.txt" ".\%BWFP%\_messages" | %M%
%IF% "%BWTP% SPANISH" copy /Y ".\%BWTP% SPANISH\_messages\opt_install.txt" ".\%BWFP%\_messages" | %M%
