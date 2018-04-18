repo=$1
cd app
git init
git remote remove origin
git remote add origin $repo
git add --all
git commit -m "dev"
git push origin master

cd -
