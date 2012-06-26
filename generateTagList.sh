#!/bin/bash
FILEPATH=$1
TAGFILENAME=$2

cd $FILEPATH 
exec ctags-exuberant -f ~/.vim/tags/$TAGFILENAME \
    -h \".php\" -R \
    --exclude=\".git\" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cfiv \
    --regex-PHP='/(abstract)?\s+class\s+([^ ]+)/\2/c/' \
    --regex-PHP='/(static|abstract|public|protected|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/' \
    --regex-PHP='/interface\s+([^ ]+)/\1/i/' -R

#######
# Original PHP Regex
#######
#   --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
#   --regex-PHP='/interface ([^ ]*)/\1/c/' \
#   --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

#######
# Added from comments from the blog source below
#######
#   --regex-PHP='/(abstract)?\s+class\s+([^ ]+)/\2/c/' \
#   --regex-PHP='/(static|abstract|public|protected|private)\s+(final\s+)?function\s+(\&\s+)?([^ (]+)/\4/f/' \
#   --regex-PHP='/interface\s+([^ ]+)/\1/i/' \
#   --regex-PHP='/\$([a-zA-Z_][a-zA-Z0-9_]*)/\1/v/' -R

#
# Author: Matthew Weier O'Phinney
# Source: http://mwop.net/blog/134-exuberant-ctags-with-PHP-in-Vim.html
#
# Help found at: http://ctags.sourceforge.net/ctags.html
#
# Edited by: Christoffer Holmstedt on the 24th of june 2012
# 1) Changed .svn to .git
