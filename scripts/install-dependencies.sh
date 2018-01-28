#!/bin/sh
echo 'installing dependencies ...'
apt-get update
apt-get install -y zsh git git-core tmux nodejs npm
