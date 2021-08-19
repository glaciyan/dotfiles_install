#!/bin/sh
# slimetsp dotfile installation script for debian
echo
echo
echo 'Welcome to the'
echo '-----------------------------------------------------------------------'
echo -e '\033[1;96m           $$\ $$\                          $$\                         '
echo -e '\033[1;96m           $$ |\__|                         $$ |                        '
echo -e '\033[1;96m  $$$$$$$\ $$ |$$\ $$$$$$\$$$$\   $$$$$$\ $$$$$$\    $$$$$$$\  $$$$$$\  '
echo -e '\033[1;96m $$  _____|$$ |$$ |$$  _$$  _$$\ $$  __$$\\_ $$  _|  $$  _____|$$  __$$\ '
echo -e '\033[1;96m \$$$$$$\  $$ |$$ |$$ / $$ / $$ |$$$$$$$$ | $$ |    \$$$$$$\  $$ /  $$ |'
echo -e '\033[1;96m  \____$$\ $$ |$$ |$$ | $$ | $$ |$$   ____| $$ |$$\  \____$$\ $$ |  $$ |'
echo -e '\033[1;96m $$$$$$$  |$$ |$$ |$$ | $$ | $$ |\$$$$$$$\  \$$$$  |$$$$$$$  |$$$$$$$  |'
echo -e '\033[1;96m \_______/ \__|\__|\__| \__| \__| \_______|  \____/ \_______/ $$  ____/ '
echo -e '\033[1;96m                                                              $$ |      '
echo -e '\033[1;96m                                                              $$ |      '
echo -e '\033[1;96m                                                              \__|      '
echo -e '\033[1;95m       $$\            $$\      $$$$$$\  $$\ $$\                     '
echo -e '\033[1;95m       $$ |           $$ |    $$  __$$\ \__|$$ |                    '
echo -e '\033[1;95m  $$$$$$$ | $$$$$$\ $$$$$$\   $$ /  \__|$$\ $$ | $$$$$$\   $$$$$$$\ '
echo -e '\033[1;95m $$  __$$ |$$  __$$\\_ $$  _|  $$$$\     $$ |$$ |$$  __$$\ $$  _____|'
echo -e '\033[1;95m $$ /  $$ |$$ /  $$ | $$ |    $$  _|    $$ |$$ |$$$$$$$$ |\$$$$$$\  '
echo -e '\033[1;95m $$ |  $$ |$$ |  $$ | $$ |$$\ $$ |      $$ |$$ |$$   ____| \____$$\ '
echo -e '\033[1;95m \$$$$$$$ |\$$$$$$  | \$$$$  |$$ |      $$ |$$ |\$$$$$$$\ $$$$$$$  |'
echo -e '\033[1;95m  \_______| \______/   \____/ \__|      \__|\__| \_______|\_______/ '
echo -e '\033[1;95m                                                                    '
echo -e '\033[1;95m                                                                    '
echo -e '\033[1;95m                                                                    '


# Dependencies
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

# End message
echo '# Self Note'
echo "  Remember to change the remote to ssh when pushing dotfiles"
echo
echo "# Set up git"
echo "  git config --global user.name"
echo "  git config --global user.email"
echo "# Set up ssh"
echo "  ssh-keygen -t ed25519 -C <email>"
echo '  eval "$(ssh-agent -s)"'
echo '  ssh-add ~/.ssh/id_ed25519'
echo "  cat ~/.ssh/id_ed25519.pub"
echo
echo "Remember to switch to zsh and then relog"