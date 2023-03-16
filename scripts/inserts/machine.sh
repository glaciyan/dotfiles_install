# For installation on a machine

# Dependencies
sudo apt update
sudo apt install neovim zsh git wget -y
sudo apt upgrade -y

# Set up node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Create neovim config
mkdir ~/.config
mkdir ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > .config/nvim/init.vim