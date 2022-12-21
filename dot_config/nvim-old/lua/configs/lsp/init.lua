local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not lspconfig_ok or not mason_lspconfig_ok then return end

local handlers = require "configs.lsp.handlers"
handlers.setup()

mason_lspconfig.setup_handlers {
  function(server)
    local old_on_attach = lspconfig[server].on_attach

    local opts = {
      on_attach = function(client, bufnr)
        if old_on_attach then old_on_attach(client, bufnr) end
        handlers.on_attach(client, bufnr)
      end,
      capabilities = vim.tbl_deep_extend(
        "force",
        handlers.capabilities,
        lspconfig[server].capabilities or {}
      ),
    }

    local present, server_overrides = pcall(require, "configs.lsp.server-settings." .. server)
    if present then opts = vim.tbl_deep_extend("force", server_overrides, opts) end

    lspconfig[server].setup(opts)
  end,
}
