local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  return vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<C-c>", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
map("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })
map("n", "<leader>bD", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Delete Buffer (Force)" })

map({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- files
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fm", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files" })
map("n", "<leader>fM", function()
  require("mini.files").open(vim.uv.cwd())
end, { desc = "Open mini.files (cwd)" })
map("n", "<leader>e", function()
  require("mini.files").open(vim.api.nvim_buf_get_name(0))
end, { desc = "Open mini.files" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- spectre
map("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre",
})
map("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})

-- Sessions
-- map("n", "<leader>zc", "<cmd>lua MiniSessions.select()<CR>", { desc = "Choose Session" })
-- map("n", "<leader>zw", function()
--   local name = vim.fn.input("Session name: ")
--   if name ~= "" then
--     vim.api.nvim_command('lua MiniSessions.write("' .. name .. '")')
--   end
-- end, { desc = "Write Session" })
map("n", "<leader>zl", '<cmd>lua require("persistence").load()<CR>', { desc = "Load Session" })
