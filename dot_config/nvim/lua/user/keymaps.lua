local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


---- n: Normal ----
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Swap 0 and ^
keymap("n", "0", "^", opts)
keymap("n", "^", "0", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)

-- Buffers / barbar
keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
keymap("n", "<S-l>", ":BufferNext<CR>", opts)
keymap("n", "<A-,>", ":BufferPrevious<CR>", opts)
keymap("n", "<A-.>", ":BufferNext<CR>", opts)

keymap("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", ":BufferMoveNext<CR>", opts)

keymap("n", "<A-1>", ":BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", ":BufferLast<CR>", opts)

keymap("n", "<A-p>", ":BufferPin<CR>", opts)

keymap("n", "<A-c>", ":BufferClose<CR>", opts)

keymap("n", "<C-s>", ":BufferPick<CR>", opts)

---- i: Insert ----
-- Fast escape
-- keymap("i", "jk", "<ESC>", opts)


---- v: Visual ----
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Don't yank on visual paste
keymap("v", "p", '"_dP', opts)


---- x: Visual Block ----
-- Move text up and down
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


---- t: Terminal ----
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


---- c: Command ----

