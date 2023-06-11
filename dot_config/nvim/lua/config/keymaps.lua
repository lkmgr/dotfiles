local M = {}

local Util = require "util"

-- make all keymaps silent by default
local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  return vim.keymap.set(mode, lhs, rhs, opts)
end

function M.setup()
  -- map("n", "<Space>", "<Nop>")
  -- map("v", "<Space>", "<Nop>")

  -- disable Ex mode:
  map("n", "Q", "<Nop>")

  -- General mappings
  map("n", "<C-s>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
  map({ "i", "x" }, "<C-s>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })
  map({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
  map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

  -- better up/down
  map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
  map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

  map("n", "gO", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
  map("n", "go", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

  -- Copy/paste with system clipboard
  -- map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
  -- map("n", "gp", '"+p', { desc = "Paste from system clipboard" })

  -- Paste in Visual with `P` to not copy selected text (`:h v_P`)
  -- map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

  -- Reselect latest changed, put, or yanked text
  map("n", "gV", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, desc = "Visually select changed text" })

  -- Search inside visually highlighted text
  map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

  -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
  map("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
  map("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])

  -- Move to window using the <ctrl> hjkl keys
  map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
  map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
  map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
  map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

  -- Resize window using <ctrl> arrow keys
  map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
  map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
  map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
  map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

  -- Don't yank on x
  map({ "n", "v" }, "x", '"_x')
  map({ "n", "v" }, "X", '"_X')

  -- Don't yank on visual paste
  map("v", "p", '"_dP')
  map("v", "P", '"_dP')

  -- Stay in indent mode
  map("v", "<", "<gv")
  map("v", ">", ">gv")

  -- Buffers
  -- map("n", "<Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  -- map("n", "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  -- map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  -- map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  -- map("n", "<C-c>", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete buffer" })
  -- map("n", "<leader>bd", function() require("mini.bufremove").delete(0, false) end, { desc = "Delete Buffer" })
  -- map("n", "<leader>bD", function() require("mini.bufremove").delete(0, true) end, { desc = "Delete Buffer (Force)" })
  -- map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
  -- map("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
  map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
  map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

  -- Toggle options
  map("n", "<leader>uf", require("util.format").toggle, { desc = "Toggle format on save" })
  map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })

  -- lazy
  map("n", "<leader>p", "<cmd>:Lazy<cr>", { desc = "Lazy" })

  -- new file
  -- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

  map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
  map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

  -- if not Util.has("trouble.nvim") then
  --   map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  --   map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
  -- end

  -- toggle options
  -- map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
  -- map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
  -- map("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
  -- map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
  -- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
  -- map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

  -- lazygit
  map(
    "n",
    "<leader>gg",
    function() Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false }) end,
    { desc = "Lazygit (root dir)" }
  )
  map("n", "<leader>gG", function() Util.float_term({ "lazygit" }, { esc_esc = false }) end, { desc = "Lazygit (cwd)" })

  -- quit
  map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

  -- highlights under cursor
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

  -- floating terminal
  -- map(
  --   "n",
  --   "<leader>ft",
  --   function() Util.float_term(nil, { cwd = Util.get_root() }) end,
  --   { desc = "Terminal (root dir)" }
  -- )
  -- map("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
  map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

  -- windows
  map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
  map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
  map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
  map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
  map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
  map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

  -- tabs
  map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
  map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
  map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
  map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
  map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
  map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

  -- File explorer
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })

  -- Spectre
  map("n", "<leader>r", function() require("spectre").open() end, { desc = "Search and replace" })

  -- Telescope
  map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  map("n", "<leader>t", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
  map("n", "<C-_>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search current buffer" }) -- CTRL-/
  map("n", "<leader>/", "<cmd>Telescope resume<cr>", { desc = "Resume Telescope" })
  map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
  map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
  map("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
  map("n", "<leader>sf", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find hidden file" })
  map("n", "<leader>st", function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end, { desc = "Find text in hidden files" })
  map("n", "<leader>sy", "<cmd>Telescope treesitter<cr>", { desc = "Treesitter nodes" })
  map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Grep string" })
  map("v", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Grep string" })
  map(
    "n",
    "<leader>sze",
    function() require("telescope.builtin").symbols { sources = { "emoji" } } end,
    { desc = "Emoji" }
  )
  map(
    "n",
    "<leader>szg",
    function() require("telescope.builtin").symbols { sources = { "gitmoji" } } end,
    { desc = "Gitmoji" }
  )
  map(
    "n",
    "<leader>szn",
    function() require("telescope.builtin").symbols { sources = { "nerd" } } end,
    { desc = "Nerd" }
  )
end

function M.lsp_buf_mappings(client, bufnr)
  local has_provider = function(name) return client.server_capabilities[name .. "Provider"] end

  local diag_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function() go { severity = severity } end
  end

  map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = bufnr })
  map("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type Definition", buffer = bufnr })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
  map("n", "gI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementation", buffer = bufnr })
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References", buffer = bufnr })
  map("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics", buffer = bufnr })
  map("n", "]d", diag_goto(true), { desc = "Next Diagnostic", buffer = bufnr })
  map("n", "[d", diag_goto(false), { desc = "Prev Diagnostic", buffer = bufnr })
  map("n", "]e", diag_goto(true, "ERROR"), { desc = "Next Error", buffer = bufnr })
  map("n", "[e", diag_goto(false, "ERROR"), { desc = "Prev Error", buffer = bufnr })
  map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics", buffer = bufnr })
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
  map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info", buffer = bufnr })
  -- map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder", buffer = bufnr })
  -- map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder", buffer = bufnr })
  -- map("n", "<leader>lwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc = "List Workspace Folders", buffer = bufnr })

  if has_provider "definition" then
    map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Definition", buffer = bufnr })
  end

  if has_provider "signatureHelp" then
    map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
    map("i", "<c-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
  end

  if has_provider "codeAction" then
    map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
  end

  if has_provider "documentFormatting" then
    map("n", "<leader>lf", require("util.format").format, { desc = "Format Document", buffer = bufnr })
  end

  if has_provider "documentRangeFormatting" then
    map("v", "<leader>lF", require("util.format").format, { desc = "Format Range", buffer = bufnr })
  end
end

return M
