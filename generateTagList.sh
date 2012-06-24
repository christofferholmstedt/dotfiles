#!/bin/bash
cd /var/applications/zf2
exec ctags-exuberant -f ~/.vim/tags/zendframeworktwo \
    -h \".php\" -R \
    --exclude=\"\.git\" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

#
# Author: Matthew Weier O'Phinney
# Source: http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
#
# Edited by: Christoffer Holmstedt on the 24th of june 2012
# 1) Changed .svn to .git
