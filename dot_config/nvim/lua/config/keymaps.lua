-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<C-c>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>ze", "<cmd>SopsEncrypt<cr>", { desc = "SOPS Encrypt" })
vim.keymap.set("n", "<leader>zd", "<cmd>SopsDecrypt<cr>", { desc = "SOPS Decrypt" })
