#!/bin/sh
echo 'installing dependencies ...'
apt-get update
apt-get install -y aptitude
aptitude install -y zsh git git-core tmux nodejs npm
echo 'installing dotfiles ...'
cd
git clone https://github.com/quentindecock/dotfiles.git .dotfiles
cd .dotfiles
./setup.sh
zsh
cd
