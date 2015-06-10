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
git config --global user.email "christoffer@christofferholmstedt.se"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
git config --global core.editor "vim"
git config --global core.abbrev 12
git config --replace-all --global pretty.fixes 'Fixes: %h ("%s")'

git config --global alias.graph 'log --graph --decorate --oneline'
git config --global alias.network '!git graph'
git config --global alias.branch-relations '!git graph --simplify-by-decoration'

git config --global sendemail.smtpserver box.christofferholmstedt.se
git config --global sendemail.smtpuser christoffer@christofferholmstedt.se
git config --global sendemail.smtpserverport 587
git config --global sendemail.smtpencryption tls
git config --global sendemail.from "Christoffer Holmstedt <christoffer@christofferholmstedt.se>"
git config --global sendemail.suppresscc self
git config --global sendemail.suppressfrom true
git config --global sendemail.chainreplyto false

git config --global sendemail.wpan.to "linux-wpan@vger.kernel.org"

### Keyboard mappings (Assumes XFCE)
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

    cd ~/dotfiles/
fi

### Mutt
if [ ! -f ../.muttrc ]; then
	mkdir -pv ../applications/mailtogit
	mkdir -pv ../applications/patches
	ln -sv ./dotfiles/mutt/.muttrc ../.muttrc
	ln -sv ./dotfiles/mutt/.signature ../.signature

	ln -sv ../../dotfiles/mutt/mailtogit/mail-to-mbox ../applications/mailtogit/mail-to-mbox
	ln -sv ../../dotfiles/mutt/mailtogit/procmail ../applications/mailtogit/procmail
	ln -sv ../../dotfiles/mutt/mailtogit/procmailrc ../applications/mailtogit/procmailrc
fi
