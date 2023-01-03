local nmap = require("utils.mappings").nmap

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
  nmap("<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "List Workspace Folders", buffer = bufnr })
  nmap("<leader>lf", function() vim.lsp.buf.format { async = true } end, { desc = "Format", buffer = bufnr })
end

function M.setup()
  -- make all keymaps silent by default
  local keymap_set = vim.keymap.set
  vim.keymap.set = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    return keymap_set(mode, lhs, rhs, opts)
  end

  nmap("gl", vim.diagnostic.open_float)
  nmap("gk", vim.diagnostic.goto_prev)
  nmap("gj", vim.diagnostic.goto_next)
  nmap("<leader>lq", vim.diagnostic.setloclist)
end

return M
