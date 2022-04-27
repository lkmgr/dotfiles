local M = {}

function M.config()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  local sources = {}

  -- JavaScript / TypeScript
  table.insert(sources, formatting.eslint_d)
  table.insert(sources, diagnostics.eslint_d)
  table.insert(sources, code_actions.eslint_d)

  -- Lua
  table.insert(sources, formatting.stylua)

  null_ls.setup {
    debug = false,
    sources = sources,
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        -- Format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          desc = "Auto format before save",
          pattern = "<buffer>",
          callback = vim.lsp.buf.formatting_sync,
        })
      end
    end,
  }
end

return M

