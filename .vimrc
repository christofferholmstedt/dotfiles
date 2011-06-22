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

" Map jj to <ESC>
imap jj <Esc>

" Add mapping for swithcing tabs in normal mode
nmap ö :tabp<CR>
nmap ä :tabn<CR>

" More tips and tricks available at:
" http://vi-improved.org/vimrc.php
" http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
