" NeoVim entry point configuration
" This file sources both legacy vimscript and modern Lua configurations

" Source legacy vimscript configuration
source ~/.config/nvim/legacy.vim

" Source Lua configuration
lua require('config')
