rsync -r src/ docs/
rsync build/contracts/* docs/
git add .
git commit -m "compile assets for github pages"
git push -u origin master
