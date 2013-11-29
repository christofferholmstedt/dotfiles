" Default settings in the top from me, Christoffer Holmstedt

" A tab expands to four spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Basic colors
" set background=dark

" Line numbers, 9999 lines should be enough.
" Line number color is black and the background is default color(not set).
set number " show line numbers
set numberwidth=3 
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
" set fo-=t " don't automatically wrap when typing 
set colorcolumn=80
highlight ColorColumn ctermbg=233

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
" Map to Swedish keyboard layout
noremap j h
noremap k j
noremap l k
noremap ö l

" Add mapping for switching tabs in normal mode
nmap ä :tabp<CR>
nmap ' :tabn<CR>

"""""""""""""""""""""""
" Visual mode
"""""""""""""""""""""""
" Map jj to <ESC> in visual mode
" This didn't work out very well when I select entire line with V and 
" want to select the lines below as fast as possible.
" vmap jj <Esc>

" ***************************************************************
" Basic structure from http://www.youtube.com/watch?v=YhqsjUUHj6g
" Vim as a Python IDE - Martin Brochhaus

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
let mapleader = ","

" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?13400
set t_Co=256
color wombat256mod

" useful settings
set history=700
set undolevels=700

" easier formatting of paragraphs 
vmap Q gq
nmap Q gqap

" Disable stupid backup and swap files - they trigger too many events for file
" system watchers
" Run unit test on filesystem save is good
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your plugins
call pathogen#infect()

" =====================================
" Setup VIM as Python IDE with plugins.
" =====================================

" vim-powerline
" cd ~/.vim/bundle
"git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" Quickly navigating through files and opening files.
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
