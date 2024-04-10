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
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'aklt/plantuml-syntax'
Plug 'github/copilot.vim'
Plug 'fidian/hexmode'
Plug 'chrisbra/unicode.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'stephpy/vim-yaml'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
"
"
"
let g:markdown_folding = 1
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

map <C-F> :Telescope find_files<CR>
map <C-B> :Telescope buffers<CR>
map <C-L> :Telescope live_grep<CR>
map <C-J> :cn<CR>
map <C-K> :cp<CR>

map <C-]> :RopeGotoDefinition<CR>

:tnoremap <ESC> <C-\><C-n>
:inoremap jj <Esc>
let g:auto_save = 1  " enable AutoSave on Vim startup
colorscheme gruvbox
set clipboard=unnamedplus
command MasterDiff Git diff --src-prefix= --dst-prefix= master..HEAD
command PutDate put =strftime('%Y-%m-%d %a')
