set tabstop=4

"Line numbers
set number
set numberwidth=4
" :hi LineNr ctermfg=black ctermbg=white 
:hi LineNr ctermfg=black

" Markera nuvarande rad där pekaren är
:set cursorline
" :set cursorcolumn
" :hi CursorLine ctermbg=white ctermfg=black
" cterm=NONE tar bort underline på hela markerade raden
:hi CursorLine cterm=NONE ctermbg=white
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
:nnoremap <Leader>c :set cursorline!<CR>
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Map jj to <esc>
imap jj <Esc>

" http://weierophinney.net/matthew/archives/249-Vim-Toolbox,-2010-Edition.html
