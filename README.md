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
