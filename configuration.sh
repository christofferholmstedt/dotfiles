#!/bin/bash

# Install vim
# Already done...sudo apt-get install git vim
# is the default installation command I use when I have a new machine

# Configure vim
# Assumption is made that this script is run from the dotfiles folder
# which as been cloned directly into your home folder
dotfiles_dir=$(pwd)
echo $dotfiles_dir
ln -sv ./dotfiles/vim/.vimrc ../.vimrc
mkdir -v ../.vim
cp -rv ./vim/requiredFiles/* ../.vim/
cd ../.vim/bundle/

git clone https://github.com/klen/python-mode
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/Lokaltog/vim-powerline.git

# Configure git
git config --global user.name "Christoffer Holmstedt"
git config --global user.email "christoffer.holmstedt@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
