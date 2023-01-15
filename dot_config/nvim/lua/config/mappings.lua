local map = require("utils.mappings").map
local nmap = require("utils.mappings").nmap
local vmap = require("utils.mappings").vmap
local imap = require("utils.mappings").imap

local M = {}

function M.lsp_buf_mappings(bufnr)
  nmap("gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = bufnr })
  nmap("gd", vim.lsp.buf.definition, { desc = "Definition", buffer = bufnr })
  nmap("K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
  nmap("gI", vim.lsp.buf.implementation, { desc = "Implementation", buffer = bufnr })
  nmap("gr", vim.lsp.buf.references, { desc = "References", buffer = bufnr })
  nmap("<leader>lk", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
  nmap("<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition", buffer = bufnr })
  nmap("<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
  nmap("<leader>la", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
  nmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder", buffer = bufnr })
  nmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder", buffer = bufnr })
  nmap("<leader>lwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "List Workspace Folders", buffer = bufnr })
  nmap("<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "Format", buffer = bufnr })
end

function M.setup()
  nmap("<Space>", "<Nop>")
  vmap("<Space>", "<Nop>")

  -- disable Ex mode:
  map("n", "Q", "<Nop>")

  -- General mappings
  map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save" })
  map({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
  map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

  -- Move text up and down
  imap("<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move text down" })
  imap("<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move text up" })
  map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
  map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

  -- Don't yank on x
  map({ "n", "v" }, "x", '"_x')
  map({ "n", "v" }, "X", '"_X')

  -- Don't yank on visual paste
  vmap("p", '"_dP')
  vmap("P", '"_dP')

  -- Remap for dealing with word wrap
  nmap("k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
  nmap("j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

  -- Stay in indent mode
  vmap("<", "<gv")
  vmap(">", ">gv")

  -- Focus windows
  nmap("<C-h>", "<C-w>h", { desc = "Go to left window" })
  nmap("<C-j>", "<C-w>j", { desc = "Go to lower window" })
  nmap("<C-k>", "<C-w>k", { desc = "Go to upper window" })
  nmap("<C-l>", "<C-w>l", { desc = "Go to right window" })

  -- Resize windows
  nmap("<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
  nmap("<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
  nmap("<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
  nmap("<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

  -- Diagnostic mappings
  nmap("gl", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
  nmap("gk", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
  nmap("gj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  nmap("<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

  -- Telescope
  nmap("<leader>e", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })
  nmap("<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  nmap("<leader>j", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
  nmap("<C-_>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search current buffer" }) -- CTRL-/
  nmap("<leader>/", "<cmd>Telescope resume<cr>", { desc = "Resume Telescope" })
  nmap("<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
  nmap("<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
  nmap("<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
  nmap("<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find hidden file" })
  nmap("<leader>st", function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end, { desc = "Find text in hidden files" })
  nmap("<leader>sy", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter nodes" })
  nmap("<leader>sze", function() require("telescope.builtin").symbols { sources = { "emoji" } } end, { desc = "Emoji" })
  nmap("<leader>szg", function() require("telescope.builtin").symbols { sources = { "gitmoji" } } end, { desc = "Gitmoji" })
  nmap("<leader>szn", function() require("telescope.builtin").symbols { sources = { "nerd" } } end, { desc = "Nerd" })
end

return M
