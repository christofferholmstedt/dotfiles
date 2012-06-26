" A tab expands to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Basic colors
set background=dark

" Line numbers, 9999 lines should be enough.
" Line number color is black and the background is default color(not set).
set number
set numberwidth=3
" :hi LineNr ctermfg=black ctermbg=white 
:hi LineNr ctermfg=white

" Start VIM with colored line where the cursor is located.
:set cursorline
" :set cursorcolumn
"
" :hi CursorLine ctermbg=white ctermfg=black
" cterm=NONE removes underline from the line that is highlighted.
:hi CursorLine cterm=NONE ctermbg=DarkBlue
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
" Toggle line highlighting.
:nnoremap <Leader>c :set cursorline!<CR>
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Autoindent
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocompletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Not sure what the effect of these are
" http://css.dzone.com/articles/vim-php-developers
syntax on
filetype on
filetype indent on

filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" Settings for using tab with omnicompletion instead of
" <ctrl+X><ctrl+O> and closing the scratch buffer when 
" autocompletion selection is done.
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 
" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"

" InsertLeave below closes the scratch buffer.
" When leaving insert mode.
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Add Zend Framework 2 tags to omnicompletion
":set tags=~/.vim/tags/zendframeworktwo

" Colors for omnicompletion popup/dropdown list
:highlight Pmenu ctermbg=lightgray ctermfg=black
:highlight PmenuSel ctermbg=blue ctermfg=white gui=bold

" complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

"""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""
" Map jj to <ESC> in insert mode
imap jj <Esc>

" Add mapping for saving without exiting from insert mode
"imap ffj <Esc>:w<CR>i

" Add mapping for saving and exiting directly from insert mode 
"imap fjf <Esc>ZZ

""""""""""""""""""""""" 
" Normal mode
"""""""""""""""""""""""
" Add mapping for switching tabs in normal mode
nmap ö :tabp<CR>
nmap ä :tabn<CR>

" Add mapping for saving without exiting from normal mode
" nmap ffj :w<CR>

" Add mapping for saving and exiting directly from normal mode
" nmap fjf ZZ

" More tips and tricks available at:
" http://vi-improved.org/vimrc.php
" http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
