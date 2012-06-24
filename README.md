My vim settings
===============
These vim settings are mainly used for php, html and css development.
Settings are applied on a default vim installation on Ubuntu 12.04 LTS.

#### Installation
Clone or copy this project, in your terminal do the following from your home directory.

    # Create symbolic link to load main .vimrc settings
    ln -s /path/to/copied/.vimrc .vimrc

    # Create symbolic link to load filetype specfic settings
    ln -s /path/to/copied/php.vim ~/.vim/ftplugin/php.vim

Install SuperTab.plugin
    Download supertab.vmb
    Open supertab.vmb in vim
    type ":so %"
    
#### TODO

1. Add autocompletion
    - Begin typing a variable, function or class name
    - Suggestion shows in dropdown-list
        * Use "Tab" to move to next item in the list.
        * Use "Space" to choose hightlighted item.
        * Continue to type the name to filter the dropdown-list more.
    - Begin typing "->"
        * Autocompletion should look for all variables and function names 
            in the class in front of "->"
    - Autocompletion should search for
        * All variables in current file.
        * All function and class names in pre-configured folders.

#### Sources

1. http://css.dzone.com/articles/vim-php-developers
1. http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
1. http://www.vim.org/scripts/script.php?script_id=1318
1. https://github.com/tobyS/vip
1. http://ctags.sourceforge.net/
1. http://phuzz.org/vimrc.html
1. http://superuser.com/questions/305945/gvim-omni-completion-preview-window-doesnt-go-away
1. SuperTab plugin
    - http://www.vim.org/scripts/script.php?script_id=1643
    - https://github.com/ervandew/supertab
1. Change highligh color for the omnicompletion popup
    - http://vim.wikia.com/wiki/VimTip1486
