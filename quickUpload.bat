:: win-bat
git add .

set "commit=%~1"
setlocal EnableDelayedExpansion
if "!commit!"==""  (
	git commit -m "�ճ�����"
) else (
	git commit -m %1
)

git push -f github-origin main
git push -f gitee-origin main
pause