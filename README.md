My vim settings
===============
These vim settings are mainly used for php, html and css development.
Settings are applied on a default vim installation on Ubuntu 12.04 LTS.

#### Installation
Clone or copy this project, in your terminal do the following from your home directory.

    # Create symbolic links in your home directory to load main .vimrc and pathongen settings
    ln -s /path/to/repository/.vimrc .vimrc
    ln -s /path/to/repository/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

    # Create symbolic links in your .vim/pathogen directory for the plugins you want to use.
    ln -s ~/Vim-Settings/vim-surround ~/.vim/pathogen/vim-surround
