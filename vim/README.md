My vim settings
===============
These vim settings are mainly used for php, html and css development, the layout of my keyboard is "Swedish" so my mappings might not be good for you.
Settings are applied on a default vim installation on Ubuntu 12.04 LTS.

#### Installation

    ln -s /path/to/repository/.vimrc .vimrc

    mkdir ~/.vim
    cd ~/.vim

    ### Copy required folders and files to correct place
    cp /path/to/repository/vim/requiredFiles/* .

    ### Install these into the ~/.vim/bundle directory.
    git clone https://github.com/klen/python-mode
    git clone https://github.com/kien/ctrlp.vim.git
    git clone git://github.com/Lokaltog/vim-powerline.git

#### Old installation instructions
Clone or copy this project, in your terminal do the following from your home directory.

    # Create symbolic links in your home directory to load main .vimrc and pathongen settings
    ln -s /path/to/repository/.vimrc .vimrc
    ln -s /path/to/repository/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload/pathogen.vim

    # Create symbolic links in your .vim/pathogen directory for the plugins you want to use.
    ln -s /path/to/repository/vim-surround ~/.vim/pathogen/vim-surround
