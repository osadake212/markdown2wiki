@echo off

set OUT_PATH=%~dpn1.txt

echo 変換を開始します。
echo   変換するファイル：%~nx1
pause

ruby libs\markdown2wiki.rb %1 %OUT_PATH%

echo 変換が終了しました。
echo   変換結果：%~n1.txt
pause