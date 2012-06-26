#!/bin/bash
cd /var/applications/zf2/library/Zend
exec ctags-exuberant -f ~/.vim/tags/zendframeworktwo \
    -h \".php\" -R \
    --exclude=\"\.git\" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+c \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

#
# Author: Matthew Weier O'Phinney
# Source: http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
#
# Help found at: http://ctags.sourceforge.net/ctags.html
#
# Edited by: Christoffer Holmstedt on the 24th of june 2012
# 1) Changed .svn to .git
