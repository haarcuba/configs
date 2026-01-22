-- Plugin specifications for lazy.nvim
-- Migrated from vim-plug configuration

return {
  -- Motion and editing
  { "easymotion/vim-easymotion" },
  { "tpope/vim-surround" },
  { "scrooloose/nerdcommenter" },
  { "vim-scripts/vim-auto-save" },
  { "jlanzarotta/bufexplorer" },

  -- Git
  { "tpope/vim-fugitive" },

  -- Telescope (fuzzy finder)
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      -- Install parsers on build
      local parsers = { "lua", "python", "javascript", "typescript", "tsx", "html", "css", "yaml", "json", "markdown", "vim", "vimdoc" }
      for _, parser in ipairs(parsers) do
        vim.cmd("TSInstall " .. parser)
      end
    end,
    lazy = false,
    config = function()
      -- Use tsx parser for JSX files (javascriptreact filetype)
      vim.treesitter.language.register("tsx", "javascriptreact")
    end,
  },

  -- Colorschemes
  {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Language/syntax support
  { "leafgarland/typescript-vim" },
  { "stephpy/vim-yaml" },
  { "pedrohdz/vim-yaml-folds" },
  { "aklt/plantuml-syntax" },
  { "jvirtanen/vim-hcl" },

  -- Utilities
  { "github/copilot.vim" },
  { "fidian/hexmode" },
  { "chrisbra/unicode.vim" },
  { "andreshazard/vim-logreview" },
  { "mhinz/vim-rfc" },
}
