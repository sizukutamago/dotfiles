#!/bin/sh

#ln -sf ~/dotfiles/vim/vimrc ~/vimrc

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

mkdir vim/dein

sh ./installer.sh ./vim/dein
