" Default settings in the top from me, Christoffer Holmstedt

" A tab expands to four spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Basic colors
" set background=dark

" Line numbers, 9999 lines should be enough.
" Line number color is black and the background is default color(not set).
set number
set numberwidth=3

" :hi LineNr ctermfg=black ctermbg=white 
" :hi LineNr ctermfg=white

" Start VIM with colored line where the cursor is located.
" :set cursorline
" :set cursorcolumn
" :hi CursorLine ctermbg=white ctermfg=black
" cterm=NONE removes underline from the line that is highlighted.
" :hi CursorLine cterm=NONE ctermbg=DarkBlue
" :hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
" Toggle line highlighting.
" :nnoremap <Leader>c :set cursorline!<CR>
" :nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""
" Map jj to <ESC> in insert mode
imap jj <Esc>

""""""""""""""""""""""" 
" Normal mode
"""""""""""""""""""""""
" Add mapping for switching tabs in normal mode
nmap ö :tabp<CR>
nmap ä :tabn<CR>

"""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""
" Map jj to <ESC> in visual mode
vmap jj <Esc>

" ***************************************************************
" Basic structure from http://www.youtube.com/watch?v=YhqsjUUHj6g
" Vim as a Python IDE - Martin Brochhaus

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

