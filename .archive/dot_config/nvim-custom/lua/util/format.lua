local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat

  vim.notify(string.format("%s format on save", M.autoformat and "Enabled" or "Disabled"), vim.log.levels.INFO)
end

function M.format()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format {
    bufnr = buf,
    timeout_ms = 5000,
    filter = function(client)
      if have_nls then return client.name == "null-ls" end
      return client.name ~= "null-ls"
    end,
  }
end

function M.setup_autocmd(client, buf)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. buf, { clear = true }),
      buffer = buf,
      callback = function()
        if M.autoformat then M.format() end
      end,
    })
  end
end

function M.setup_eslint_autocmd(_, buf)
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("EslintFormat." .. buf, { clear = true }),
    buffer = buf,
    callback = function()
      if M.autoformat then vim.cmd "EslintFixAll" end
    end,
  })
end

return M
