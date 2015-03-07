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
set makeprg=jam
map <C-J> :cn<CR>
map <C-K> :cp<CR>
set number
set grepprg=ack-grep\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m
set expandtab
filetype plugin indent on
execute pathogen#infect()
