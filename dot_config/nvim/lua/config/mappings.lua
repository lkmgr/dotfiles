local M = {}

-- make all keymaps silent by default
local map = function(mode, lhs, rhs, opts)
  -- opts = opts or {}
  -- opts.silent = opts.silent ~= false
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  return vim.keymap.set(mode, lhs, rhs, opts)
end

function M.lsp_buf_mappings(client, bufnr)
  map("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = bufnr })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Definition", buffer = bufnr })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover", buffer = bufnr })
  map("n", "gI", vim.lsp.buf.implementation, { desc = "Implementation", buffer = bufnr })
  map("n", "gr", vim.lsp.buf.references, { desc = "References", buffer = bufnr })
  map("n", "<leader>lk", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
  map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type Definition", buffer = bufnr })
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
  map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder", buffer = bufnr })
  map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder", buffer = bufnr })
  map(
    "n",
    "<leader>lwl",
    function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    { desc = "List Workspace Folders", buffer = bufnr }
  )

  if client.server_capabilities.codeActionProvider then
    map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
  end

  if client.server_capabilities.documentFormattingProvider then
    map("n", "<leader>lf", require("utils.format").format, { desc = "Format Document", buffer = bufnr })
  end

  if client.server_capabilities.documentRangeFormattingProvider then
    map("v", "<leader>lF", require("utils.format").format, { desc = "Format Range", buffer = bufnr })
  end
end

function M.setup()
  map("n", "<Space>", "<Nop>")
  map("v", "<Space>", "<Nop>")

  -- disable Ex mode:
  map("n", "Q", "<Nop>")

  -- General mappings
  -- map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save" })
  map({ "i", "v", "n", "s" }, "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
  map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

  map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true })
  map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true })

  map("n", "gO", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
  map("n", "go", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")

  -- Copy/paste with system clipboard
  map({ "n", "x" }, "gy", '"+y', { desc = "Copy to system clipboard" })
  map("n", "gp", '"+p', { desc = "Paste from system clipboard" })
  -- Paste in Visual with `P` to not copy selected text (`:h v_P`)
  map("x", "gp", '"+P', { desc = "Paste from system clipboard" })

  -- Reselect latest changed, put, or yanked text
  map("n", "gV", '"`[" . strpart(getregtype(), 0, 1) . "`]"', { expr = true, desc = "Visually select changed text" })

  -- Search inside visually highlighted text. Use `silent = false` for it to
  -- make effect immediately.
  map("x", "g/", "<esc>/\\%V", { silent = false, desc = "Search inside visual selection" })

  -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
  map("x", "*", [[y/\V<C-R>=escape(@", '/\')<CR><CR>]])
  map("x", "#", [[y?\V<C-R>=escape(@", '?\')<CR><CR>]])

  -- Alternative way to save and exit in Normal mode.
  -- NOTE: Adding `redraw` helps with `cmdheight=0` if buffer is not modified
  map("n", "<C-S>", "<Cmd>silent! update | redraw<CR>", { desc = "Save" })
  map({ "i", "x" }, "<C-S>", "<Esc><Cmd>silent! update | redraw<CR>", { desc = "Save and go to Normal mode" })

  -- Window navigation
  map("n", "<C-H>", "<C-w>h", { desc = "Focus on left window" })
  map("n", "<C-J>", "<C-w>j", { desc = "Focus on below window" })
  map("n", "<C-K>", "<C-w>k", { desc = "Focus on above window" })
  map("n", "<C-L>", "<C-w>l", { desc = "Focus on right window" })

  map("t", "<C-W>", [[<C-\><C-N><C-w>]], { desc = "Focus other window" })

  -- Window resize (respecting `v:count`)
  map("n", "<C-Left>", '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, desc = "Decrease window width" })
  map("n", "<C-Down>", '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, desc = "Decrease window height" })
  map("n", "<C-Up>", '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, desc = "Increase window height" })
  map("n", "<C-Right>", '"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, desc = "Increase window width" })

  -- Move text up and down
  -- map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move text down" })
  -- map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move text up" })
  -- map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
  -- map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move text up" })

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
  map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
  map("n", "<C-c>", "<cmd>lua MiniBufremove.delete(0, true)<cr>", { desc = "Delete buffer" })

  -- Diagnostic mappings
  map("n", "gl", vim.diagnostic.open_float, { desc = "Hover diagnostics" })
  map("n", "gk", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
  map("n", "gj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
  map("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

  -- Toggle options
  map("n", "<leader>uf", require("utils.format").toggle, { desc = "Toggle format on save" })

  -- File explorer
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })
  map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus Neotree" })
  -- map("n", "<leader>e", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })

  -- Telescope
  map("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  map("n", "<leader>j", "<cmd>Telescope live_grep<cr>", { desc = "Find text" })
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

  -- Spectre
  map("n", "<leader>r", function() require("spectre").open() end, { desc = "Search and replace" })
end

return M
