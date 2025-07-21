#!/bin/bash

echo "==========================================="
echo "  Setting up your home directory"
echo "==========================================="

FILES=( ".bash_aliases" ".editorconfig" ".eslintrc" ".gitconfig" ".jshintrc" ".npmrc" ".nvmrc" ".prettierrc" )

for f in "${FILES[@]}"
do
    echo "Coping $f"
    curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/$f -o $f
done

curl -s https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore -o .gitignore

echo "All done!"
