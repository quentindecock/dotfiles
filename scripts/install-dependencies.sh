#!/bin/sh
echo 'installing dependencies ...'
apt-get update
apt-get install -y zsh git git-core tmux nodejs npm

if [ ! -d 'jsxhint' ]; then
  echo 'installing jsxhint via npm'
  sudo npm install -g jsxhint
fi
