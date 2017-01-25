set nocompatible
filetype off
set path+=**
set wildmenu
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/paredit.vim'
Plugin 'vim-scripts/mako.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fugitive'
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'easymotion/vim-easymotion'
Plugin 'nvie/vim-flake8'

Plugin 'python-mode/python-mode'
let g:pymode_options_max_line_length=200
let g:pymode_folding=0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pyflakes']
let g:pymode_rope = 0

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
set tabstop=4
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
filetype plugin indent on
