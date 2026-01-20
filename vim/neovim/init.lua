-- NeoVim configuration entry point
-- Using lazy.nvim for plugin management

-- Load core options first (before plugins)
require("config.options")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup("config.lazy")

-- Load keymaps after plugins are loaded
require("config.keymaps")

-- Load LSP configuration
require("config.lsp")
