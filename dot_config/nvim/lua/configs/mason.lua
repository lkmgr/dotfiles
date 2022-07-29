local M = {}

M.ensure_installed = {
  -- LSP
  "css-lsp",
  "emmet-ls",
  "eslint-lsp",
  "html-lsp",
  "json-lsp",
  "lua-language-server",
  "typescript-language-server",
  "yaml-language-server",

  -- Lint/Format
  "stylua",

  -- DAP
  "chrome-debug-adapter",
  "node-debug2-adapter",
}

function M.config()
  local status_ok, mason = pcall(require, "mason")
  if not status_ok then
    return
  end

  mason.setup()
end

return M
