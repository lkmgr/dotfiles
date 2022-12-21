local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

local sources = {
  -- formatting.eslint_d,
  -- diagnostics.eslint_d,
  -- code_actions.eslint_d,
  -- formatting.prettierd.with {
  --   extra_filetypes = { "json5" },
  -- },
  formatting.stylua,
  -- diagnostics.yamllint,
  -- diagnostics.ansiblelint,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = sources,
  update_in_insert = true,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      -- Format on save
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        group = augroup,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 5000 } end,
      })
    end
  end,
}
