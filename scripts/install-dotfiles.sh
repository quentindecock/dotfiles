#!/bin/sh
echo 'installing dotfiles ...'
cd
git clone -b qd-readme-2 https://github.com/quentindecock/dotfiles.git .dotfiles
cd .dotfiles
./setup.sh
chsh -s /bin/zsh
zsh
cd
