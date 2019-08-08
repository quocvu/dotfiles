#!/bin/bash

echo "==========================================="
echo "  Setting up your Node project"
echo "==========================================="

FILES=( ".editorconfig" ".eslintrc" ".gitconfig" ".jshintrc" ".npmrc" )

for f in "${FILES[@]}"
do 
    echo "Coping $f"
    curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/$f -o $f
done

echo "All done!"
exit 0
