#!/bin/sh
SKIP=1
set -x

#====================================================================
# APT

if [ $SKIP -eq 0 ]; then
sudo apt update

sudo apt -y install git curl wget hpptie awscli
sudo apt -y install vim colordiff htop bat ncdu fd-find ripgrep
sudo apt -y install nodejs npm
sudo apt -y install ffmpeg
fi

#====================================================================
# NPM

if [ $SKIP -eq 0 ]; then
sudo npm install -g @google/gemini-cli
sudo npm install -g @qwen-code/qwen-code
fi

#====================================================================
# OTHERS 

if [ $SKIP -eq 0 ]; then
# dotfiles
curl -s https://raw.githubusercontent.com/quocvu/dotfiles/master/homesetup.sh | /bin/bash

wget -qO- https://astral.sh/uv/install.sh | sh
fi


