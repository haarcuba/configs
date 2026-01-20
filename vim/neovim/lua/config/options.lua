-- Vim options (migrated from legacy.vim)

local opt = vim.opt

opt.compatible = false          -- Disable compatibility to old-time vi
opt.showmatch = true            -- Show matching brackets
opt.mouse = "v"                 -- middle-click paste with mouse
opt.hlsearch = true             -- highlight search results
opt.tabstop = 4                 -- number of columns occupied by a tab character
opt.softtabstop = 4             -- see multiple spaces as tabstops so <BS> does the right thing
opt.expandtab = true            -- converts tabs to white space
opt.shiftwidth = 4              -- width for autoindents
opt.autoindent = true           -- indent a new line the same amount as the line just typed
opt.number = true               -- add line numbers
opt.wildmode = "longest,list"   -- get bash-like tab completions
opt.guicursor = ""              -- disable GUI cursor
opt.clipboard = "unnamedplus"   -- use system clipboard

-- Enable filetype plugins
vim.cmd("filetype plugin on")

-- Markdown folding
vim.g.markdown_folding = 1

-- AutoSave enabled on startup
vim.g.auto_save = 1

-- YCM settings (disabled)
vim.g.ycm_auto_trigger = 0
