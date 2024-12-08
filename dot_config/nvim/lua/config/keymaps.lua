-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<C-c>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>zse", "<cmd>SopsEncrypt<cr>", { desc = "SOPS Encrypt" })
vim.keymap.set("n", "<leader>zsd", "<cmd>SopsDecrypt<cr>", { desc = "SOPS Decrypt" })
