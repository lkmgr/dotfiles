local map = vim.keymap.set
local utils = require "core.utils"

-- ##################
-- ##### NORMAL #####
-- ##################

-- Leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- General
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>m", "<cmd>noautocmd w<CR>", { desc = "Save without formatting" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohl<CR>", { desc = "No Highlight" })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neotree" })
map("n", "<leader>o", "<cmd>Neotree focus<CR>", { desc = "Focus Neotree" })
map("n", "<leader>r", require("smart-splits").start_resize_mode, { desc = "Start Window Resize Mode" })
map("n", "<leader>f", function()
  require("telescope.builtin").find_files()
end, { desc = "Telescope Find File" })
map("n", "<leader>j", function()
  require("telescope.builtin").live_grep()
end, { desc = "Telescope Find Text" })
map("n", "<C-p>", function()
  require("telescope.builtin").buffers()
end, { desc = "Telescope Buffers" })
map("n", "<C-_>", function() -- CTRL-/
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Search current buffer" })
map("n", "<leader>/", function()
  require("telescope.builtin").resume()
end, { desc = "Resume Telescope" })
map("n", "<S-h>", "^", { desc = "Move to first char of line" })
map("n", "<S-l>", "$", { desc = "Move to end of line" })

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<CR>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<CR>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<CR>", { desc = "Packer Sync" })
map("n", "<leader>pS", utils.packer_snap_and_sync, { desc = "Packer Snapshot and Sync" })
map("n", "<leader>pt", "<cmd>PackerStatus<CR>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<CR>", { desc = "Packer Update" })

-- Diagnostics
map("n", "go", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "gl", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "gk", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "gj", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Git
map("n", "<leader>gj", function()
  require("gitsigns").next_hunk()
end, { desc = "Next git hunk" })
map("n", "<leader>gk", function()
  require("gitsigns").prev_hunk()
end, { desc = "Previous git hunk" })
map("n", "<leader>gl", function()
  require("gitsigns").blame_line()
end, { desc = "View git blame" })
map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview git hunk" })
map("n", "<leader>gh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset git hunk" })
map("n", "<leader>gr", function()
  require("gitsigns").reset_buffer()
end, { desc = "Reset git buffer" })
map("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Stage git hunk" })
map("n", "<leader>gu", function()
  require("gitsigns").undo_stage_hunk()
end, { desc = "Unstage git hunk" })
map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "View git diff" })
map("n", "<leader>gg", function()
  utils.toggle_term_cmd "lazygit"
end, { desc = "Lazygit" })

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

-- Telescope
map("n", "<leader>sR", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Open Recent File" })
map("n", "<leader>sb", function()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })
map("n", "<leader>sc", function()
  require("telescope.builtin").commands()
end, { desc = "Commands" })
map("n", "<leader>sf", function()
  require("telescope.builtin").find_files()
end, { desc = "Find File" })
map("n", "<leader>sh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Find Help" })
map("n", "<leader>sk", function()
  require("telescope.builtin").keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>sr", function()
  require("telescope.builtin").registers()
end, { desc = "Registers" })
map("n", "<leader>st", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find Text" })
map("n", "<leader>sy", function()
  require("telescope.builtin").find_files { hidden = true }
end, { desc = "Find Hidden File" })
map("n", "<leader>sT", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Current Buffer Fuzzy Find" })
map("n", "<leader>ss", function()
  require("telescope.builtin").grep_string()
end, { desc = "Search Hovered String" })
map("n", "<leader>sp", "<cmd>Telescope projects<CR>", { desc = "Projects" })

-- Buffers
map("n", "<leader>c", "<cmd>Bdelete!<CR>", { desc = "Close Buffer" })
map("n", "<C-c>", "<cmd>Bdelete!<CR>", { desc = "Close Buffer" })
map("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
map("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
map("n", "<A-S-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer tab right" })
map("n", "<A-S-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer tab left" })

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble<CR>", { desc = "Open Trouble" })
map("n", "<leader>tw", "<cmd>Trouble workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>te", "<cmd>Trouble document_diagnostics<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>tl", "<cmd>Trouble loclist<CR>", { desc = "Location List" })
map("n", "<leader>tq", "<cmd>Trouble quickfix<CR>", { desc = "Quickfix" })
map("n", "<leader>td", "<cmd>Trouble lsp_definitions<CR>", { desc = "LSP Definitions" })
map("n", "<leader>tr", "<cmd>Trouble lsp_references<CR>", { desc = "LSP References" })

-- move text up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move text down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move text up" })

-- DAP
local dap_loaded, _ = pcall(require, "dap")
if dap_loaded then
  map("n", "<F5>", require("dap").continue, { desc = "DAP Continue" })
  map("n", "<F10>", require("dap").step_over, { desc = "DAP Step Over" })
  map("n", "<F11>", require("dap").step_into, { desc = "DAP Step Into" })
  map("n", "<F12>", require("dap").step_out, { desc = "DAP Step Out" })

  map("n", "<leader>dt", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
  map("n", "<leader>db", require("dap").step_back, { desc = "Step Back" })
  map("n", "<leader>dc", require("dap").continue, { desc = "Continue" })
  map("n", "<leader>dC", require("dap").run_to_cursor, { desc = "Run To Cursor" })
  map("n", "<leader>dd", require("dap").disconnect, { desc = "Disconnect" })
  map("n", "<leader>dg", require("dap").session, { desc = "Get Session" })
  map("n", "<leader>di", require("dap").step_into, { desc = "Step Into" })
  map("n", "<leader>do", require("dap").step_over, { desc = "Step Over" })
  map("n", "<leader>du", require("dap").step_out, { desc = "Step Out" })
  map("n", "<leader>dp", require("dap").pause, { desc = "Pause" })
  map("n", "<leader>dr", require("dap").repl.toggle, { desc = "Toggle Repl" })
  map("n", "<leader>ds", require("dap").continue, { desc = "Start" })
  map("n", "<leader>dq", require("dap").close, { desc = "Quit" })
end

-- Terminal
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Save and Quit
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Write" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- misc
map("n", "<leader>zf", "<cmd>.!figlet<CR>", { desc = "Figlet" })
map("n", "<leader>zs", "<cmd>.!figlet -f small<CR>", { desc = "Figlet Small" })
map("n", "<leader>zt", utils.toggle_theme, { desc = "Toggle Theme" })
map("n", "<leader>zu", utils.open_uri_under_cursor, { desc = "Open URI under Cursor" })

-- disable Ex mode:
map("n", "Q", "<Nop>")

-- Don't yank on x
map("n", "x", '"_x', { silent = true })
map("n", "X", '"_X', { silent = true })

-- ##################
-- ##### INSERT #####
-- ##################

-- Move text up and down
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move text down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move text up" })

-- ##################
-- ##### VISUAL #####
-- ##################

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", { desc = "move text down" })
map("v", "<A-k>", "<cmd>m .-2<CR>==", { desc = "move text up" })

-- Don't yank on x
map("v", "x", '"_x', { silent = true })
map("v", "X", '"_X', { silent = true })

-- Don't yank on visual paste
map("v", "p", '"_dP', { silent = true })

-- ##################
-- ##### VBLOCK #####
-- ##################

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

-- ####################
-- ##### TERMINAL #####
-- ####################

-- Improved Terminal Mappings
-- map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })
