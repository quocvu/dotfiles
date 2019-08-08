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

npm install -s -d babel-eslint eslint eslint-config-airbnb eslint-plugin-import prettier eslint-config-prettier eslint-plugin-prettier mocha rewire should sinon

echo "All done!"
exit 0
