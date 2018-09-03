#!/bin/sh

ln -sf ~/dotfiles/vimrc ~/.vimrc

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

mkdir -p ./vim/dein

sh ~/dotfiles/installer.sh ~/dotfiles/vim/dein
