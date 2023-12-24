SETLOCAL
cd /d %DPATH%

%IF% "%BWD%\download_latest_version.php*" del "%BWD%\download_latest_version.php*"
%IF% "%BWD%\download_repair.php*" del "%BWD%\download_repair.php*"
%IF% "%BWD%\error.php*" del "%BWD%\error.php*"
%IF% "%BWD%\file" del "%BWD%\file"
%IF% "%BWD%\file.*" del "%BWD%\file.*"
%IF% "%BWD%\index.php*" del "%BWD%\index.php*"
%IF% "%BWD%\index.*.php*" del "%BWD%\index.*.php*"
%IF% "%BWD%\viewforum.php*" del "%BWD%\viewforum.php*"
%IF% "%BWD%\viewtopic.php*" del "%BWD%\viewtopic.php*"

%IF% "%BWD%\9a463b0e3974fff30b6d0cdb316320.rar" ren "%BWD%\9a463b0e3974fff30b6d0cdb316320.rar" WandCase.rar
%IF% "%BWD%\8119c1a2115e753479e8ff3536b57b.zip" ren "%BWD%\8119c1a2115e753479e8ff3536b57b.zip" b!tweak_lite.zip
%IF% "%BWD%\036111ebc68d2a7a81d91441d2c799.7z" ren "%BWD%\036111ebc68d2a7a81d91441d2c799.7z" dakkon.7z
%IF% "%BWD%\1309492052_rukrakiav.08.7z" ren "%BWD%\1309492052_rukrakiav.08.7z" rukrakiav.08.7z
%IF% "%BWD%\50711178201d3e91530b441364728b.zip" ren "%BWD%\50711178201d3e91530b441364728b.zip" FinchNPC.zip
%IF% "%BWD%\ab51a0f54a4b498cb2c37c9a47d655.zip" ren "%BWD%\ab51a0f54a4b498cb2c37c9a47d655.zip" 7c#addlevel.zip
%IF% "%BWD%\ekq36xcdbv1p.zip" ren "%BWD%\ekq36xcdbv1p.zip" karatur.zip
%IF% "%BWD%\hcv698q6oaev.zip" ren "%BWD%\hcv698q6oaev.zip" JKits.zip
%IF% "%BWD%\k3uwg162pgn5.zip" ren "%BWD%\k3uwg162pgn5.zip" Samurai Kit.zip

%TXT1% | findstr @000 | Call %C% & %TXT% | findstr @252 | Call %C% & %TXT1% | findstr @006 | Call %C% & pause
EXIT