Basic information about this directory
======================================
The directory "requiredFiles" include the necessary files
to install different stuff for vim. I've included
them here so all I need to do when configuring vim for a
new computer is to clone my github repository.

### How to install wombat256mod Color scheme
    mkdir -p ~/.vim/colors && cd ~/.vim/colors
    wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

or

    mkdir -p ~/.vim/colors && cd ~/.vim/colors
    copy the wombat256mod.vim from this directory to ~/vim/colors

### Pathogen
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

or

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    cp the pathogen.vim file to the autoload directory.

Add the following to .vimrc if you don't have it already:
call pathogen#infect()

### Python folding
    mkdir -p ~/.vim/ftplugin
    wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492

or

    mkdir -p ~/.vim/ftplugin
    copy the python_editing.vim file to the ftplugin directory


### Install these into the ~/.vim/bundle directory.
    
    git clone https://github.com/klen/python-mode
    git clone https://github.com/kien/ctrlp.vim.git
    git clone git://github.com/Lokaltog/vim-powerline.git
