set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set expandtab
set guicursor=
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')
Plug 'python-rope/ropevim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'aklt/plantuml-syntax'
Plug 'github/copilot.vim'
Plug 'fidian/hexmode'
call plug#end()

let g:jedi#auto_initialization=0
let g:jedi#popup_on_dot=0

let g:ycm_auto_trigger=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_min_num_of_chars_for_completion=1000

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1

map <C-F> :Files<CR>
map <C-B> :Buffers<CR>
map <C-L> :Lines<CR>
map <C-J> :cn<CR>
map <C-K> :cp<CR>
:tnoremap <ESC> <C-\><C-n>
:inoremap jj <Esc>
let g:auto_save = 1  " enable AutoSave on Vim startup
colorscheme gruvbox
set clipboard=unnamedplus
