#!/bin/bash

# Install vim
# Already done...sudo apt-get install git vim
# is the default installation command I use when I have a new machine

# Configure vim
# Assumption is made that this script is run from the dotfiles folder
# which as been cloned directly into your home folder
dotfiles_dir=$(pwd)
echo $dotfiles_dir

### Git
git config --global user.name "Christoffer Holmstedt"
git config --global user.email "christoffer.holmstedt@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global core.editor "vim"

git config --global alias.graph 'log --graph --decorate --oneline'
git config --global alias.network '!git graph'
git config --global alias.branch-relations '!git graph --simplify-by-decoration'

### Keyboard mappings (Assumes XFCE)
OUTPUT_FILE="$HOME/.config/autostart/keybindings.desktop"

if [ ! -f $OUTPUT_FILE ]; then

cat > $OUTPUT_FILE << EOL
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Set keybindings
Comment=Custom keybindings for AltGr and Caps Lock
Exec=$dotfiles_dir/keyboard_bindings/keyboard_bindings.sh
StartupNotify=false
Terminal=false
Hidden=false
EOL

fi

### Vim
if [ ! -f ../.vimrc ]; then
    ln -sv ./dotfiles/vim/.vimrc ../.vimrc
    mkdir -v ../.vim
    cp -rv ./vim/requiredFiles/* ../.vim/
    cd ../.vim/bundle/

    # git clone https://github.com/klen/python-mode
    # git clone https://github.com/kien/ctrlp.vim.git
    git clone https://github.com/Lokaltog/vim-powerline.git
fi
