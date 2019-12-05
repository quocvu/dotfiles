#!/bin/bash

echo "==========================================="
echo "  Setting up your Node project"
echo "==========================================="

FILES=( ".editorconfig" ".eslintrc" "jest.config.js" ".npmrc" ".prettierrc" )

for f in "${FILES[@]}"
do
    echo "Coping $f"
    curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/$f -o $f
done

curl -s https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore -o .gitignore

npm install -s -D babel-eslint babel-jest babel-plugin-rewire eslint eslint-config-prettier eslint-plugin-prettier jest jest-extended prettier
npx install-peerdeps --dev eslint-config-airbnb

echo "All done!"
