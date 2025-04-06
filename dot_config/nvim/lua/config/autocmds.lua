-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Set formatoptions everywhere
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  desc = "Set formatoptions",
  group = augroup("formatoptions"),
  callback = function()
    vim.opt_local.formatoptions = "jncrql"
  end,
  pattern = "*",
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
vim.api.nvim_create_autocmd("LspDetach", { command = "setl foldexpr<" })
