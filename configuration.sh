#!/bin/bash

# Install some required packages
# sudo apt-get update
# sudo apt-get install vim mutt procmail

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
git config --global core.abbrev 12
git config --replace-all --global pretty.fixes 'Fixes: %h ("%s")'

git config --global alias.graph 'log --graph --decorate --oneline'
git config --global alias.network '!git graph'
git config --global alias.branch-relations '!git graph --simplify-by-decoration'

### Keyboard mappings (Assumes *buntu)
OUTPUT_FILE="$HOME/.config/autostart/keybindings.desktop"

if [ ! -f $OUTPUT_FILE ]; then

    mkdir -pv $HOME/.config/autostart

cat > $OUTPUT_FILE << EOL
[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=Set keybindings
Comment=Custom keybindings for AltGr and Caps Lock
Exec=/bin/bash -c "sleep 15 && $dotfiles_dir/keyboard_bindings/keyboard_bindings.sh"
StartupNotify=false
Terminal=false
Hidden=false
X-GNOME-Autostart-enabled=true
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

    cd ~/dotfiles/
fi
