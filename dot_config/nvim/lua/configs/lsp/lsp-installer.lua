local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = server:get_default_options()
  opts.on_attach = require("configs.lsp.handlers").on_attach
  opts.capabilities = require("configs.lsp.handlers").capabilities

  local present, server_overrides = pcall(require, "configs.lsp.server-settings." .. server.name)
  if present then
    opts = vim.tbl_deep_extend("force", server_overrides, opts)
  end

  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

