set nocompatible
filetype off
set wildmenu
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/vim-auto-save'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()


version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Monospace\ 12
set helplang=en
set history=50
set nomodeline
set mouse=a
set printoptions=paper:letter
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
" vim: set ft=vim :

colors blackboard
set tabstop=2
set shiftwidth=4
set hlsearch
set smartindent
map <C-J> :cn<CR>
map <C-K> :cp<CR>
set number
set grepprg=ack-grep\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
set expandtab
set laststatus=2
set noswapfile
filetype plugin indent on
:inoremap jj <Esc>
map <C-F> :Files<CR>
map <C-B> :Buffers<CR>
map <C-L> :Lines<CR>
colorscheme desert
let g:auto_save = 1  " enable AutoSave on Vim startup
