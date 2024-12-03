-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- escape jj
vim.keymap.set("i", "jj", "<esc>", { desc = "Escape" })

-- New tab
vim.keymap.set("n", "tn", ":tabnew %<CR>", { desc = "New tab" })
vim.keymap.set("n", "tc", ":tabclose<CR>", { desc = "Close tab" })

-- Split window
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { desc = "Split window horizontally" }) -- Horizontal
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { desc = "Split window vertically" }) -- Vertical

-- Open LazyGit
-- vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open lazygit" })
