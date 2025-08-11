#!/bin/sh
SKIP=1
set -x

#====================================================================
# APT

if [ $SKIP -eq 0 ]; then
sudo add-apt-repository ppa:xtradeb/apps # avidemux 
sudo apt update

sudo apt -y install git gitg curl hpptie awscli
sudo apt -y install vim colordiff s3fs tmux terminator htop bat ncdu fd-find ripgrep
sudo apt -y install nodejs npm
sudo apt -y install flatpak gnome-software-plugin-flatpak
sudo apt -y install ffmpeg vlc
sudo apt -y install avidemux-qt avidemux-cli
sudo apt -y install filezilla qbittorrent evolution evolution-ews
sudo apt -y install gnome-shell-extension-manager
sudo apt -y install nomacs
sudo apt -y install usb-creator-gtk
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

#====================================================================
# SNAP

if [ $SKIP -eq 0 ]; then
sudo snap install snap-store
sudo snap install bitwarden
sudo snap install youtube-music-desktop-app
sudo snap install krita 
sudo snap install spotify
sudo snap install openscad
sudo snap install --classic code # vs code
sudo snap install raindrop # bookmark manager
sudo snap install vivaldi # web browser
sudo snap install brave # web browser
sudo snap install marktext # markdown editor
sudo snap install insomnia # REST client
sudo snap install localsend # local file sharing
fi

#====================================================================
# FLATPAK
if [ $SKIP -eq 0 ]; then
sudo flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub net.mkiol.SpeechNote
sudo flatpak install flathub fr.handbrake.ghb
sudo flatpak install flathub com.google.Chrome
sudo flatpak install flathub com.protonvpn.www
fi

#====================================================================
# VSCODE EXTENSION 

if [ $SKIP -eq 0 ]; then
code --install-extension ms-python.black-formatter 
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.python
code --install-extension ms-python.debugpy
code --install-extension johnpapa.vscode-peacock
code --install-extension mechatroner.rainbow-csv
code --install-extension rooveterinaryinc.roo-cline
code --install-extension codeium.codeium
code --install-extension google.geminicodeassist
code --install-extension ms-vscode.vscode-speech
fi

# find app to save window config and restore upon restart

#====================================================================
# MORE
# Using Extension Manager, install
# * https://extensions.gnome.org/extension/16/auto-move-windows/
# * https://extensions.gnome.org/extension/779/clipboard-indicator/
# * https://extensions.gnome.org/extension/3539/downfall/

# * Link google account: Settings > Online Accounts
# * Generate ssh key `ssh-keygen` then add to github account
# * Put `<YOUR_AWS_ACCESS_KEY_ID>:<YOUR_AWS_SECRET_ACCESS_KEY>` in `~/.passwd-s3fs` and chmod 600. Create a mount point 

# disable defective onboard wifi
% sudo vi /etc/modprobe.d/blacklist.conf
# add this `blacklist iwlwifi`

# setup s3-fuse
# echo ${ACCESS_KEY_ID}:${SECRET_ACCESS_KEY} > ${HOME}/.passwd-s3fs
chmod 600 ${HOME}/.passwd-s3fs

# docker
sudo apt -y install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
docker pull lscr.io/linuxserver/faster-whisper:latest
sudo docker container create lscr.io/linuxserver/faster-whisper
sudo docker container start 976e62b379c8c29677f41fe64564f792ac205529db5e99bf1a5d5d09e27d39b7

# voice-mode for MCP
sudo apt -y install libasound2-dev libasound2-plugins libportaudio2 portaudio19-dev ffmpeg pulseaudio pulseaudio-utils
uvx voice-mode

# https://github.com/kvadratni/speech-mcp

