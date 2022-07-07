local navic = require "nvim-navic"

local map = vim.keymap.set

local M = {}

function M.setup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- underline = true,
    virtual_text = false,
    underline = {
      severity = { min = vim.diagnostic.severity.WARN },
    },
    -- virtual_text = {
    --   severity = vim.diagnostic.severity.ERROR,
    -- },
    signs = { active = signs },
    update_in_insert = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- nvim 0.7: client.resolved_capabilities.document_highlight
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.on_attach = function(client, bufnr)
  local navic_enabled = { "tsserver", "sumneko_lua", "jsonls" }
  local formatting_disabled = { "tsserver", "jsonls", "html", "sumneko_lua" }

  if vim.tbl_contains(formatting_disabled, client.name) then
    -- nvim 0.7: client.resolved_capabilities.document_formatting
    client.server_capabilities.documentFormattingProvider = false
  end

  if vim.tbl_contains(navic_enabled, client.name) then
    navic.attach(client, bufnr)
  end

  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Buffer mappings
  map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration of current symbol", buffer = bufnr })
  map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current symbol", buffer = bufnr })
  map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation of current symbol", buffer = bufnr })
  map("n", "gr", vim.lsp.buf.references, { desc = "References of current symbol", buffer = bufnr })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover symbol details", buffer = bufnr })
  map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
  map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Hover Diagnostic", buffer = bufnr })
  map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format", buffer = bufnr })
  map("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Info", buffer = bufnr })
  map("n", "<leader>lI", "<cmd>LspInstallInfo<CR>", { desc = "Install Info", buffer = bufnr })
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })
  map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = bufnr })
  map("n", "<leader>lwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { desc = "List Workspace Folders", buffer = bufnr })
  map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder", buffer = bufnr })
  map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder", buffer = bufnr })

  vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, { desc = "Format file with LSP" })
  lsp_highlight_document(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

-- from cmp_nvim_lsp plugin
-- capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     "documentation",
--     "detail",
--     "additionalTextEdits",
--   },
-- }

-- M.capabilities = capabilities

return M
