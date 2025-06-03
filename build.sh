#!/bin/bash

set -e  # Exit on any error

#clean 
git checkout release
rm -rf assets/ index.html vite.svg || true
rm -rf tic-tac-toe || true

#build
git clone git@github.com:abinopoulose/tic-tac-toe.git
cd tic-tac-toe
git checkout main
git pull

npm install
npm run build
cd ..

#copy build files correct path
cp -r tic-tac-toe/dist/* .
sed -i 's|assets|tic-tac-toe/assets|g' index.html assets/*


# commit and push
rm -rf tic-tac-toe || true
rm -rf vite.svg || true
git add .
DATETIME=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "release @ $DATETIME"
git push

echo "script completed successfully!"

