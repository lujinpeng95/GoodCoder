git add .

if [ -z "$1" ]; then
    git commit -m "日常更新"
    else
        git commit -m $1
fi

git push github-origin main
git push gitee-origin main
echo 请按任意键继续. . .
read -n 1