repo=$1
cd my_app
git init
bundle update
git remote remove origin
git remote add origin $repo
git add --all
git commit -m "dev"
git push origin master

cd -
