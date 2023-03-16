#!/bin/sh

echo Installing dotfiles...

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