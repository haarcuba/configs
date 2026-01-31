-- Key mappings (migrated from legacy.vim)

local map = vim.keymap.set

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

map("n", "<C-F>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<C-B>", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<C-L>", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })

-- Quickfix navigation
map("n", "<C-J>", "<cmd>cn<cr>", { desc = "Next quickfix" })
map("n", "<C-K>", "<cmd>cp<cr>", { desc = "Previous quickfix" })

-- Diagnostics quickfix
map("n", "<C-W><C-D>", function()
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, { desc = "Diagnostics to quickfix" })

-- Terminal escape
map("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Insert mode escape
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Custom commands
vim.api.nvim_create_user_command("MasterDiff", "Git diff --src-prefix= --dst-prefix= master..HEAD", {})
vim.api.nvim_create_user_command("MainDiff", "Git diff --src-prefix= --dst-prefix= main..HEAD", {})
vim.api.nvim_create_user_command("PutDate", "put =strftime('%Y-%m-%d %a')", {})
