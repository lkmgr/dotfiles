local map = vim.keymap.set

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- smart-splits
map("n", "<C-h>", function()
  require("smart-splits").move_cursor_left()
end, { desc = "Move to left split" })
map("n", "<C-j>", function()
  require("smart-splits").move_cursor_down()
end, { desc = "Move to below split" })
map("n", "<C-k>", function()
  require("smart-splits").move_cursor_up()
end, { desc = "Move to above split" })
map("n", "<C-l>", function()
  require("smart-splits").move_cursor_right()
end, { desc = "Move to right split" })

map("n", "<C-Up>", function()
  require("smart-splits").resize_up()
end, { desc = "Resize split up" })
map("n", "<C-Down>", function()
  require("smart-splits").resize_down()
end, { desc = "Resize split down" })
map("n", "<C-Left>", function()
  require("smart-splits").resize_left()
end, { desc = "Resize split left" })
map("n", "<C-Right>", function()
  require("smart-splits").resize_right()
end, { desc = "Resize split right" })

-- bufferline
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
map("n", "<A-s-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer tab right" })
map("n", "<A-s-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer tab left" })

-- move text up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move text down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move text up" })

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of current symbol" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation of current symbol" })
map("n", "gr", vim.lsp.buf.references, { desc = "References of current symbol" })
map("n", "go", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "gk", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "gj", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol details" })

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Save and Quit
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Write" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- disable Ex mode:
map("n", "Q", "<Nop>")

-- Move text up and down
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move text down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move text up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", { desc = "move text down" })
map("v", "<A-k>", "<cmd>m .-2<CR>==", { desc = "move text up" })

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
