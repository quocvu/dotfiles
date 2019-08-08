#!/bin/bash

echo "==========================================="
echo "  Setting up your Node project"
echo "==========================================="

DIR=$1
FILES=( ".editorconfig" ".eslintrc" ".gitconfig" ".jshintrc" ".npmrc" )

mkdir $DIR
cd $DIR
npm init

for f in "${FILES[@]}"
do 
    echo "Coping $f"
    curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/$f -o $f
done

echo "All done!"
exit 0
