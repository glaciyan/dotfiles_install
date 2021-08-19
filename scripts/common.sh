#!/bin/sh
# slimetsp dotfile installation script for debian

sudo apt update
sudo apt install neovim zsh git wget -y
sudo apt upgrade -y

# $$-> insert

# Get dotfiles
cd $HOME
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore

git clone --bare --recursive https://github.com/slimetsp/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config checkout
config submodule update --recursive

config config --local status.showUntrackedFiles no

# Create empty .paths file so zsh wont complain
touch .paths

# Set up node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Create neovim config
mkdir ~/.config
mkdir ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > .config/nvim/init.vim

echo "Remember to change the remote to ssh when pushing dotfiles"
echo "# Set up git"
echo "  git config --global user.name"
echo "  git config --global user.email"
echo "# Set up ssh"
echo "  ssh-keygen -t ed25519 -C <email>"
echo '  eval "$(ssh-agent -s)"'
echo '  ssh-add ~/.ssh/id_ed25519'
echo "  cat ~/.ssh/id_ed25519.pub"
echo
echo "remember to switch to zsh"