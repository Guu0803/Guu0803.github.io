
set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'
git push -f https://github.com/Guu0803/Guu0803.github.io/tree/main master:gh-pages

cd -