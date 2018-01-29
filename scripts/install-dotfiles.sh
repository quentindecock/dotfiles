#!/bin/sh
echo 'installing dotfiles ...'
cd
git clone https://github.com/quentindecock/dotfiles.git .dotfiles
cd .dotfiles
./setup.sh
chsh -s /bin/zsh
zsh
cd
