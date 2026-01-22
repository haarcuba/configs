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
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- Disable treesitter highlighting for JS/JSX - using vim-jsx-pretty instead
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        callback = function()
          vim.treesitter.stop()
        end,
      })
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
  { "pangloss/vim-javascript" },
  { "maxmellon/vim-jsx-pretty" },
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
