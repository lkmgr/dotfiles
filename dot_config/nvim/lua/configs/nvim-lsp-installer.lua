local M = {}

function M.config()
  local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  if not status_ok then
    return
  end

  lsp_installer.setup {
    ensure_installed = {
      -- "taplo", -- fails on mac
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
