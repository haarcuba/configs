-- LSP configuration (migrated from config.lua)

-- install: pip install python-lsp-server
vim.lsp.config.pylsp = {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 100,
        },
      },
    },
  },
}

-- install: npm install -g typescript-language-server typescript
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.lsp.enable("pylsp")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  callback = function()
    vim.lsp.enable("ts_ls")
  end,
})

-- install: gem install ruby-lsp
vim.lsp.config.ruby_lsp = {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.enable("ruby_lsp")
  end,
})

-- LSP Keybindings
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  end,
})
