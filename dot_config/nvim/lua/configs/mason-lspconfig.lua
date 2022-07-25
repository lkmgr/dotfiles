local M = {}

function M.config()
  local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not status_ok then
    return
  end

  mason_lspconfig.setup {
    ensure_installed = {
      "cssls",
      "emmet_ls",
      "eslint",
      "html",
      "jsonls",
      "sumneko_lua",
      "tsserver",
      "yamlls",
    },
  }
end

return M
