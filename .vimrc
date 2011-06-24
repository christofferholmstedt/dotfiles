" A tab expands to four spaces
set tabstop=4

" Line numbers, 9999 lines should be enough.
" Line number color is black and the background is default color(not set).
set number
set numberwidth=4
" :hi LineNr ctermfg=black ctermbg=white 
:hi LineNr ctermfg=black

" Start VIM with colored line where the cursor is located.
:set cursorline
" :set cursorcolumn
" :hi CursorLine ctermbg=white ctermfg=black
" cterm=NONE removes underline from the line that is highlighted.
:hi CursorLine cterm=NONE ctermbg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
" Toggle line highlighting.
:nnoremap <Leader>c :set cursorline!<CR>
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Autoindent
set autoindent

"""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""
" Map jj to <ESC> in insert mode
imap jj <Esc>

" Add mapping for saving without exiting from insert mode
imap ffj <Esc>:w<CR>i

" Add mapping for saving and exiting directly from insert mode 
imap fjf <Esc>ZZ

""""""""""""""""""""""" 
" Normal mode
"""""""""""""""""""""""
" Add mapping for switching tabs in normal mode
nmap ö :tabp<CR>
nmap ä :tabn<CR>

" Add mapping for saving without exiting from normal mode
nmap ffj :w<CR>

" Add mapping for saving and exiting directly from normal mode
nmap fjf ZZ

" More tips and tricks available at:
" http://vi-improved.org/vimrc.php
" http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
