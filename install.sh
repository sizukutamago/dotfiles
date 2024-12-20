#!/usr/bin/env bash

PATH="$PATH:/opt/homebrew/bin"

#
# Homebrew
#
if ! which brew; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

#
# Config Dir
#
mkdir -p $HOME/.config/

#
# zsh 補完
#
brew install zsh-completions
chmod -R go-w /opt/homebrew/share
brew install zsh-autosuggestion

#
# Starship
#
brew install starship


#
# zsh
#
mkdir -p $HOME/.config/zsh
ln -sf .zshrc $HOME/.zshrc

#
# neovim
#
brew install neovim
ln -sf nvim $HOME/.config/nvim

source $HOME/.zshrc
rm -f ~/.zcompdump; compinit
