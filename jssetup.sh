#!/bin/bash

echo "==========================================="
echo "  Setting up your Node project"
echo "==========================================="

FILES=( ".editorconfig" ".eslintrc" "jest.config.js" ".jshintrc" ".npmrc" ".prettierrc" )

for f in "${FILES[@]}"
do
    echo "Coping $f"
    curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/$f -o $f
done

curl -s https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore -o .gitignore

npm install -s -D babel-eslint babel-jest babel-plugin-rewir eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react prettier eslint-config-prettier eslint-plugin-prettier jest jest-extended prettier

echo "All done!"
exit 0
