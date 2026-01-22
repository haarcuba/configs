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
  -- Pinned to last version before tree-sitter CLI was required
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "cbd5a533e6ef49c5a43672f59562f5e4e5e4d2c0",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "yaml",
          "json",
          "markdown",
          "vim",
          "vimdoc",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
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
